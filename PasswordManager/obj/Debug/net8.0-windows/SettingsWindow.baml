   M S B A M L   `   `   `  ����M  IC4FPasswordManager, Version=1.0.1.0, Culture=neutral, PublicKeyToken=null1clr-namespace:PasswordManagerPasswordManager  5   	   G(clr-namespace:PasswordManager.PropertiesPasswordManager.Properties  5   	   $    PasswordManager.SettingsWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:PasswordManager     5   	   :props(clr-namespace:PasswordManager.Properties     5   	   #��� ��5	   	   $	��350��5
   	   $	��500��6   $	��290��6"   $	��500��62     � Icon$  Images/logo.png��6A   .��5      � $��5,5,5,5q�6    � RowDefinitions 5   
   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��0��6   $��0��6   *   $PasswordManager.Properties.Resources   LABEL_CLOUD_URL#��Z 6-    �� Target 6b   ��  �� ElementName$ textBoxCloudUrl���� 5   
   -   5         ��Name$ textBoxCloudUrl��5      $��0��6+   $��1��68   $��23��6H   $��Stretch=�6T    �� 	MaxLength$	 255��6r   6�   �� 5   
   $��1��6   $��0��6      LABEL_LANGUAGE#��Z 6-    6a   �� $ comboBoxLanguage���� 5    
   -   5        	 ��Name$	 comboBoxLanguage��5       $��1��6-   $��1��6=   $��21��6J   $
��Auto��6V   $
��Left=�6c   6~   �� 5!   
   $��2��6   $��0��6   !
   LABEL_AUTO_CLEAR_CLIPBOARD#��Z
 6-    6m   �� $ textBoxAutoClearClipboard���� 5"   
   -   5        $ textBoxAutoClearClipboard��5"      $��2��65   $��1��6B   $��23��6R   $��50��6^   $
��Left=�6i   $ 5��6�   6�   �� 5#   
   $��3��6   $��0��6      LABEL_AUTO_HIDE_PASSWORD#��Z 6-    6k   �� $ textBoxAutoHidePassword���� 5$   
   -   5        $ textBoxAutoHidePassword��5$      $��3��63   $��1��6@   $��23��6P   $��50��6\   $
��Left=�6g   $ 5��6�   6�   �� 5%   
   $��4��6   $��0��6      LABEL_REENTER_PASSWORD#��Z 6-    6i   �� $ textBoxReenterPassword���� 5&   
   -   5        $ textBoxReenterPassword��5&      $��4��62   $��1��6?   $��23��6O   $��50��6[   $
��Left=�6f   $ 5��6�   6�   �� 5'   
   -   5         ��Name$ checkBoxTopmost��5'   $   $��4,7,0,0q�6   $��5��6=   $��0��6J      LABEL_TOPMOST#��Z 6Z   6�   �� 5(   
   -   5        $ checkBoxLock��5(   $   $��4,7,0,0q�6   $��6��6:   $��0��6G      LABEL_AUTOLOCK#��Z 6W   6�   �� 5)   
   -   5        $ checkBoxMinimize��5)   %   $��24,7,0,0q�6   $��7��6?   $��0��6L      LABEL_AUTOMINIMIZE#��Z 6\   6�   �� 5*   
   -	   5         ��Name$ labelRestartRequired��5*      $��8��6.   $��0��6;   $��2��6K   �� 5+   
   $��9��6   $��0��6"   $��2��62    �� Orientation$ 
Horizontal=�6F   $��Right=�6_   .+�5,      �� -
   5         ��Name$ buttonOK��5,       �� 	IsDefault$
 True��6'      	BUTTON_OK#��Z 68   $��23��6g   $��80��6s   $��5,0,5,0q�6~   6�   �� 5-      -   5        $ buttonCancel��5-       �� IsCancel$
 True��6+      BUTTON_CANCEL#��Z 6;   $��23��6n   $��80��6z   $��5,0,5,0q�6�   5.      5/      50      