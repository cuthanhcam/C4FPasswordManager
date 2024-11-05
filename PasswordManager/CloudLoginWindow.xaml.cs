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
using Google.Apis.Auth.OAuth2;
using Google.Cloud.Storage.V1;
using System;
using System.ComponentModel;
using System.IO;
using System.Security;
using System.Threading.Tasks;
using System.Windows;
using Microsoft.Win32;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace PasswordManager
{
    public partial class CloudLoginWindow : Window
    {
        private bool _isOtpSent = false;
        private bool _isOtpVerified = false;
        private bool _isWaiting = false;
        private StorageClient _storageClient;
        private const string BucketName = "YOUR_BUCKET_NAME"; //E.g passwordmanager.appspot.com
        private string _generatedOtp;

        public SecureString CloudToken { get; set; }
        public bool IsLoggedIn { get; private set; } = false;
        private ClientInfo ClientInfo { get; set; }

        public CloudLoginWindow(Window owner, string title, ClientInfo clientInfo)
        {
            Owner = owner;
            Title = title;
            ClientInfo = clientInfo;
            WindowStartupLocation = WindowStartupLocation.CenterOwner;
            Topmost = Properties.Settings.Default.Topmost;
            InitializeComponent();
            InitializeStorageClient();
            UpdateControls();
        }

        private void InitializeStorageClient()
        {
            try
            {
                var credential = GoogleCredential.FromFile("YOUR_SERVICE_ACCOUNT_PATH"); //E.g D:C4FPasswordManager\\service_account.json
                _storageClient = StorageClient.Create(credential);
            }
            catch (Exception ex)
            {
                ShowError($"Error initializing Google Cloud Storage: {ex.Message}");
            }
        }

        private void UpdateControls()
        {
            textBoxUsername.IsEnabled = true;
            passwordBoxUser.IsEnabled = true;
            buttonCancel.IsEnabled = true;
            buttonLogin.IsEnabled = _isOtpVerified && !string.IsNullOrEmpty(textBoxUsername.Text) && passwordBoxUser.SecurePassword.Length > 0;
            buttonUpload.IsEnabled = IsLoggedIn;
            buttonDownload.IsEnabled = IsLoggedIn;
            buttonRegister.IsEnabled = _isOtpVerified;
            buttonSendOtp.IsEnabled = !string.IsNullOrEmpty(textBoxUsername.Text); // Bật nút Send OTP nếu email có giá trị
            buttonVerifyOtp.IsEnabled = _isOtpSent;
        }

        private void ShowError(string message) => MessageBox.Show(message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);

        private async Task<bool> RegisterAccountAsync(string email, string password)
        {
            try
            {
                using var httpClient = new HttpClient();
                var payload = new { email, password, returnSecureToken = true };
                var jsonContent = new StringContent(JsonConvert.SerializeObject(payload), Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=API_KEY", jsonContent);

                if (response.IsSuccessStatusCode)
                {
                    MessageBox.Show("Registration successful!");
                    return true;
                }

                var errorResponse = await response.Content.ReadAsStringAsync();
                ShowError($"Registration failed: {errorResponse}");
                return false;
            }
            catch (Exception ex)
            {
                ShowError($"Error during registration: {ex.Message}");
                return false;
            }
        }
        private bool IsValidEmail(string email)
        {
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, emailPattern);
        }

        private async Task SendOtpEmailAsync()
        {
            _generatedOtp = new Random().Next(100000, 999999).ToString();
            string userEmail = textBoxUsername.Text;
            string sendGridApiKey = "GRID_API_KEY";  // Đảm bảo API key là hợp lệ
            if (!IsValidEmail(userEmail))
            {
                ShowError("Invalid email. Please enter a valid email address.");
                return;
            }

            try
            {
                var client = new SendGridClient(sendGridApiKey);
                var from = new EmailAddress("no-reply@example.com", "C4F Password Manager"); //no-reply@example.com is gmail account has been verified by sendgrid
                var to = new EmailAddress(userEmail);
                var subject = "OTP Verification";
                var plainTextContent = $"Your OTP is: {_generatedOtp}";
                var htmlContent = $"<strong>Your OTP is: {_generatedOtp}</strong>";
                var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
                var response = await client.SendEmailAsync(msg);

                if (response.StatusCode == System.Net.HttpStatusCode.OK ||
                    response.StatusCode == System.Net.HttpStatusCode.Accepted)
                {
                    MessageBox.Show("OTP has been sent via email.");
                    _isOtpSent = true;
                    UpdateControls();
                }
                else
                {
                    ShowError("Unable to send OTP. Please check your SendGrid API key and configuration.");
                }
            }
            catch (Exception ex)
            {
                ShowError($"Unable to send OTP via SendGrid: {ex.Message}");
            }
        }

        private void ButtonSendOtp_Click(object sender, RoutedEventArgs e)
        {
            SendOtpEmailAsync();
        }

        private bool VerifyOtp(string userOtp) => _generatedOtp == userOtp;

        private async void ButtonRegister_Click(object sender, RoutedEventArgs e)
        {
            if (_isOtpVerified)
            {
                var email = textBoxUsername.Text;
                var password = passwordBoxUser.Password;

                if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
                {
                    MessageBox.Show("Please enter full email and password.");
                    return;
                }

                await RegisterAccountAsync(email, password);
            }
            else
            {
                MessageBox.Show("Please verify OTP before registering.");
            }
        }

        private async void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            if (_isOtpVerified)
            {
                var email = textBoxUsername.Text;
                var password = passwordBoxUser.Password;

                if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
                {
                    MessageBox.Show("Please enter email and password.");
                    return;
                }

                _isWaiting = true;
                UpdateControls();

                try
                {
                    if (await FirebaseAuthenticateAsync(email, password))
                    {
                        IsLoggedIn = true;
                        MessageBox.Show("Login successful!");
                        UpdateControls();
                    }
                    else
                    {
                        ShowError("Login failed. Please check your login information.");
                    }
                }
                catch (Exception ex)
                {
                    ShowError($"Error while logging in: {ex.Message}");
                }
                finally
                {
                    _isWaiting = false;
                    UpdateControls();
                }
            }
            else
            {
                MessageBox.Show("Please verify OTP before logging in.");
            }
        }

        private async void ButtonVerifyOtp_Click(object sender, RoutedEventArgs e)
        {
            if (!_isOtpSent)
            {
                MessageBox.Show("OTP not sent yet. Please click 'Send OTP' first.");
                return;
            }

            if (VerifyOtp(otpTextBox.Text))
            {
                _isOtpVerified = true;
                MessageBox.Show("OTP authentication successful!");
                UpdateControls();
            }
            else
            {
                MessageBox.Show("OTP is incorrect. Please try again.");
            }
        }

        private async Task<bool> FirebaseAuthenticateAsync(string email, string password)
        {
            try
            {
                using var httpClient = new HttpClient();
                var payload = new { email, password, returnSecureToken = true };
                var jsonContent = new StringContent(JsonConvert.SerializeObject(payload), Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=API_KEY", jsonContent);

                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                ShowError($"Error during Firebase authentication: {ex.Message}");
                return false;
            }
        }

        private async void ButtonUpload_Click(object sender, RoutedEventArgs e)
        {
            if (!IsLoggedIn)
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

            try
            {
                await UploadFileToBucketAsync(filePath);
            }
            catch (Exception ex)
            {
                ShowError($"Error uploading file: {ex.Message}");
            }
        }

        private async void ButtonDownload_Click(object sender, RoutedEventArgs e)
        {
            if (!IsLoggedIn)
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

            try
            {
                await DownloadFileFromBucketAsync(fileNameInBucket);
            }
            catch (Exception ex)
            {
                ShowError($"Error downloading file: {ex.Message}");
            }
        }

        private async Task UploadFileToBucketAsync(string filePath)
        {
            var fileName = Path.GetFileName(filePath);
            using var fileStream = File.OpenRead(filePath);
            await _storageClient.UploadObjectAsync(BucketName, fileName, null, fileStream);
            MessageBox.Show($"File '{fileName}' uploaded to bucket '{BucketName}' successfully.");
        }


        private async Task DownloadFileFromBucketAsync(string fileNameInBucket)
        {
            var saveFileDialog = new SaveFileDialog
            {
                FileName = fileNameInBucket,
                Filter = "All files (*.*)|*.*",
                Title = "Select a location to save the file"
            };
            if (saveFileDialog.ShowDialog() == true)
            {
                using var outputFile = File.Create(saveFileDialog.FileName);
                await _storageClient.DownloadObjectAsync(BucketName, fileNameInBucket, outputFile);
                MessageBox.Show($"File '{fileNameInBucket}' downloaded successfully to '{saveFileDialog.FileName}'.");
            }
        }

        private void ButtonCancel_Click(object sender, RoutedEventArgs e)
        {
            if (!_isWaiting)
            {
                Close();
            }
        }

        private void ButtonBrowse_Click(object sender, RoutedEventArgs e)
        {
            var openFileDialog = new OpenFileDialog
            {
                Filter = "All files (*.*)|*.*",
                Title = "Select a File to Upload"
            };
            if (openFileDialog.ShowDialog() == true)
            {
                textBoxFilePath.Text = openFileDialog.FileName;
            }
        }

        private void OnChanged(object sender, RoutedEventArgs e)
        {
            UpdateControls();
        }

        private void Window_Closing(object sender, CancelEventArgs e)
        {
            if (_isWaiting)
            {
                e.Cancel = true;
            }
        }
    }
}
