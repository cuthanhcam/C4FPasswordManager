/*
C4F Password Manager
    Copyright (C) 2024 Code for food (C4F)
    Contributions by Cam Cu Thanh

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

// Tutorial:
// Add Bucket name
// In InitializeStorageClient method: Enter the JSON file path of the service account
// In FirebaseAuthenticate method: Enter Firebase APIKey

using Google.Apis.Auth.OAuth2;
using Google.Cloud.Storage.V1;
using System;
using System.ComponentModel;
using System.IO;
using System.Security;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Microsoft.Win32;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;

namespace PasswordManager
{
    public partial class CloudLoginWindow : Window
    {
        private bool waiting = false;
        private ClientInfo ClientInfo { get; set; } = null;
        public SecureString CloudToken { get; set; }
        public bool IsLoggedIn { get; private set; } = false; // Biến để kiểm tra trạng thái đăng nhập

        // Biến cho Google Cloud Storage
        private StorageClient storageClient;
        private const string bucketName = "YOUR_BUCKET_NAME"; // Thay bằng tên bucket của bạn E.g c4fpasswordmanager.appspot.com

        public CloudLoginWindow(Window owner, string title, ClientInfo clientInfo)
        {
            Owner = owner;
            Title = title;
            ClientInfo = clientInfo;
            WindowStartupLocation = WindowStartupLocation.CenterOwner;
            Topmost = Properties.Settings.Default.Topmost;
            InitializeComponent();
            textBoxUsername.Text = Properties.Settings.Default.CloudUsername;
            if (textBoxUsername.Text.Length == 0)
            {
                textBoxUsername.Focus();
            }
            else
            {
                passwordBoxUser.Focus();
            }
            UpdateControls();

            // Khởi tạo Google Cloud Storage client
            InitializeStorageClient();
        }

        // Hàm để khởi tạo StorageClient cho Google Cloud Storage
        private void InitializeStorageClient()
        {
            try
            {
                // Đọc tệp JSON của tài khoản dịch vụ
                var credential = GoogleCredential.FromFile("ENTER_THE_JSON_FILE_PATH_OF_THE_SERVICE_ACCOUNT"); // E.g D:\\C4FPasswordManager\\service_account.json
                storageClient = StorageClient.Create(credential);
                MessageBox.Show("Google Cloud Storage initialized successfully.");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error initializing Google Cloud Storage: {ex.Message}");
            }
        }

        private void UpdateControls()
        {
            textBoxUsername.IsEnabled = true;
            passwordBoxUser.IsEnabled = true;
            buttonCancel.IsEnabled = true;
            buttonLogin.IsEnabled =
                textBoxUsername.Text.Length > 0 &&
                passwordBoxUser.SecurePassword.Length > 0;
            buttonUpload.IsEnabled = IsLoggedIn; // Kích hoạt nút upload nếu đã đăng nhập
            buttonDownload.IsEnabled = IsLoggedIn; // Kích hoạt nút download nếu đã đăng nhập
        }

        private async void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            var old = Cursor;
            try
            {
                Cursor = Cursors.Wait;
                waiting = true;
                UpdateControls();

                // Firebase login implementation
                var isAuthenticated = await FirebaseAuthenticate(textBoxUsername.Text, passwordBoxUser.Password);
                if (isAuthenticated)
                {
                    IsLoggedIn = true; // Đặt trạng thái đăng nhập thành công
                    MessageBox.Show(Properties.Resources.CLOUD_LOGIN_SUCCEEDED, Title, MessageBoxButton.OK, MessageBoxImage.Information);
                    Properties.Settings.Default.CloudUsername = textBoxUsername.Text;
                    DialogResult = true;
                    Close();

                    UpdateControls(); // Gọi lại hàm để cập nhật trạng thái của các nút
                }
                else
                {
                    MessageBox.Show("Login failed. Please check your credentials.", Title, MessageBoxButton.OK, MessageBoxImage.Error);
                }

                waiting = false;
                Cursor = old;
            }
            catch (Exception ex)
            {
                CloudToken = null;
                waiting = false;
                Cursor = old;
                MessageBox.Show(string.Format(Properties.Resources.ERROR_OCCURRED_0, ex.Message), Title, MessageBoxButton.OK, MessageBoxImage.Error);
                UpdateControls();
            }
        }


        private async Task<bool> FirebaseAuthenticate(string email, string password)
        {
            try
            {
                using (var httpClient = new HttpClient())
                {
                    var payload = new
                    {
                        email = email,
                        password = password,
                        returnSecureToken = true
                    };

                    var jsonContent = new StringContent(JsonConvert.SerializeObject(payload), Encoding.UTF8, "application/json");
                    var response = await httpClient.PostAsync($"https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=YOUR_API_KEY", jsonContent);

                    return response.IsSuccessStatusCode;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error during Firebase authentication: {ex.Message}");
                return false;
            }
        }


        private void OnChanged(object sender, RoutedEventArgs e)
        {
            UpdateControls();
        }

        private void ButtonCancel_Click(object sender, RoutedEventArgs e)
        {
            if (!waiting)
            {
                Close();
            }
        }

        private void Window_Closing(object sender, CancelEventArgs e)
        {
            if (waiting)
            {
                e.Cancel = true;
            }
        }

        // Chức năng Browse file để chọn file từ máy tính
        private void ButtonBrowse_Click(object sender, RoutedEventArgs e)
        {
            var openFileDialog = new OpenFileDialog
            {
                Filter = "All files (*.*)|*.*", // Lọc các loại file
                Title = "Select a File to Upload"
            };
            if (openFileDialog.ShowDialog() == true)
            {
                textBoxFilePath.Text = openFileDialog.FileName; // Đặt đường dẫn file đã chọn
            }
        }

        // Chức năng Upload file lên Google Cloud Storage
        private async void ButtonUpload_Click(object sender, RoutedEventArgs e)
        {
            if (!IsLoggedIn) // Kiểm tra nếu chưa đăng nhập
            {
                MessageBox.Show("You must be logged in to upload files.", Title, MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            string filePath = textBoxFilePath.Text;
            if (string.IsNullOrWhiteSpace(filePath))
            {
                MessageBox.Show("Please select a file to upload.", Title, MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Gọi hàm tải file lên
            await UploadFileToBucket(filePath);
        }

        // Hàm để upload file lên bucket trên Google Cloud Storage
        private async Task UploadFileToBucket(string filePath)
        {
            try
            {
                var fileName = Path.GetFileName(filePath); // Lấy tên file
                using (var fileStream = File.OpenRead(filePath))
                {
                    // Tải file lên bucket
                    await storageClient.UploadObjectAsync(bucketName, fileName, null, fileStream);
                    MessageBox.Show($"File '{fileName}' uploaded to bucket '{bucketName}' successfully.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error uploading file: {ex.Message}");
            }
        }

        // Sự kiện khi nhấn nút Download
        private async void ButtonDownload_Click(object sender, RoutedEventArgs e)
        {
            if (!IsLoggedIn) // Kiểm tra nếu chưa đăng nhập
            {
                MessageBox.Show("You must be logged in to download files.", Title, MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            string fileNameInBucket = textBoxFileNameInBucket.Text;
            if (string.IsNullOrWhiteSpace(fileNameInBucket))
            {
                MessageBox.Show("Please enter the file name in the bucket to download.", Title, MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Gọi hàm tải file từ bucket
            await DownloadFileFromBucket(fileNameInBucket);
        }

        // Hàm để tải tệp từ bucket trên Google Cloud Storage
        private async Task DownloadFileFromBucket(string fileNameInBucket)
        {
            try
            {
                // Đặt vị trí lưu file sau khi tải xuống
                var saveFileDialog = new SaveFileDialog
                {
                    FileName = fileNameInBucket, // Đặt tên file mặc định
                    Filter = "All files (*.*)|*.*",
                    Title = "Select a location to save the file"
                };
                if (saveFileDialog.ShowDialog() == true)
                {
                    // Tạo stream cho tệp tải xuống
                    using (var outputFile = File.Create(saveFileDialog.FileName))
                    {
                        // Tải tệp từ bucket
                        await storageClient.DownloadObjectAsync(bucketName, fileNameInBucket, outputFile);
                        MessageBox.Show($"File '{fileNameInBucket}' downloaded successfully to '{saveFileDialog.FileName}'.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error downloading file: {ex.Message}");
            }
        }
    }
}
