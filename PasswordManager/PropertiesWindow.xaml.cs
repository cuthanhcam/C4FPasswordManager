﻿/*
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
using PasswordManager.Repository;
using System.Windows;
using System.Windows.Controls;

namespace PasswordManager
{
    /// <summary>
    /// Logical interaction for PropertiesWindow.xaml
    /// Logic tương tác 
    /// </summary>
    public partial class PropertiesWindow : Window
    {
        private KeyDirectoryCache keyDirCache;
        private PasswordRepository repository;

        public PropertiesWindow(Window owner, string title, KeyDirectoryCache keyDirCache, PasswordRepository repository, string filename)
        {
            Owner = owner;
            Title = title;
            WindowStartupLocation = WindowStartupLocation.CenterOwner;
            Topmost = Properties.Settings.Default.Topmost;
            this.keyDirCache = keyDirCache;
            this.repository = repository;
            InitializeComponent();
            textBoxName.Text = repository.Name;
            textBoxDescription.Text = repository.Description;
            textBoxPasswordFile.Text = filename;
            textBoxKeyDirectory.Text = keyDirCache.Get(repository.Id);
            textBoxKey.Text = repository.Id;
            textBoxName.Focus();
        }

        private void UpdateControls()
        {
            buttonOK.IsEnabled = !string.Equals(textBoxName.Text, repository.Name) ||
                !string.Equals(textBoxDescription.Text, repository.Description);
        }
 
        private void ButtonOK_Click(object sender, RoutedEventArgs e)
        {
            repository.Name = textBoxName.Text;
            repository.Description = textBoxDescription.Text;
            DialogResult = true;
            Close();
        }

        private void TextBox_Changed(object sender, TextChangedEventArgs e)
        {
            UpdateControls();
        }
    }
}
