   M S B A M L   `   `   `  ����M  IC4FPasswordManager, Version=1.0.1.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:PasswordManager.PropertiesPasswordManager.Properties  5   	   &     PasswordManager.CloudLoginWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   :props(clr-namespace:PasswordManager.Properties     5   	   -   5        #��� ��5	   	   $	��270��5
   	   $	��600��6     � Icon$  Images/logo.png��6"    � 
ResizeMode$ NoResize=�69   .��5      � $��10,10,10,10q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   *   $PasswordManager.Properties.Resources   LABEL_LOGIN#��Z 6    $��Center=�6�    �� Target 6Q   ��  �� ElementName$ textBoxUsername��6�   �� 5    
   -   5         ��Name$ textBoxUsername��5       $��0��6   $��23��68    �� 	MaxLength$	 100��6D   $��3��6l   $��	121,1,5,2q�6�   �� 5#   
   $��1��6   $��0��6   	   LABEL_PASSWORD#��Z	 6-   $��Center=�6�    6a   �� $ passwordBoxUser��6�   G� 5$   
   -   5        
 G�Name$
 passwordBoxUser��5$       G� 	MaxLength$	 100��6/   $��23��6?   $��3��6g   $��
121,4,5,97q�6{   $��1��6�   $��3��6�   �� 5'   
   $��3��6   $��0��6   $��
File Path:��6-   $	��Top=�6B   $��0,64,0,0q�6Z   �� 5(   
   -   5        $ textBoxFilePath��5(      $��3��6   $��23��68   $	 255��6D   $��3��6T   $��121,68,126,7q�6h   �� 5+   
   $��3��6   $��0��6   $��File Name on Bucket:��6-   $	��Top=�6L   $��0,97,0,0q�6d   $��2��6v   �� 5,   
   -   5        $ textBoxFileNameInBucket��5,      $��4��6   $��23��6@   $	 255��6L   $��3��6\   $��121,3,90,31q�6p   �� 5-   
   -   5         ��Name$ buttonDownload��5-   .   $��4��6   $��2��6   $��Download��6F   $��23��6Y   $��80��6e   $��	85,4,5,32q�6�   �� 5.   
   $��3��6   $��1��6"    �� Orientation$ 
Horizontal=�62   $
��Left=�6K   $��
125,7,0,67q�6f   $��2��6z   �� 5/   
   -   5        $ buttonCancel��5/       �� IsCancel$
 True��6'      BUTTON_CANCEL#��Z 67   $��
85,39,5,-2q�6�   $��2��6�   $��4��6�    J� RenderTransformOrigin$ 0.54,-0.731&�6�   �� 50   
   -   5        $ buttonLogin��50       �� 	IsDefault$
 True��6&      BUTTON_LOGIN#��Z 67   $��121,38,210,36q�6�   $��3��6�   $ 0.328,0.443&�6�   $��2��6�   �� 51   
   -	   5        $ buttonUpload��51      $��Upload��6'   $��	85,68,5,7q�6S   $��2��6f   $��3��6v   �� 52   
   -
   5        $ buttonBrowse��52      $	��...��6'   $��
49,68,90,7q�6P   $��2��6d   $��3��6t   �� 54   
   $��3��6   $��0��6   $
��OTP:��6-   $	��Top=�6<   $��0,5,0,0q�6T   �� 55   
   -   5        $ 
otpTextBox��55      $��23��6&   $ 6��62   $��3��6@   $��
121,8,4,67q�6M   $��2��6a   �� 56   
   -   5        $ buttonSendOtp��56      $��Send OTP��6(   $��3��6W   $��2��6d   $��	1,8,90,67q�6t   �� 57   
   -   5        $ buttonVerifyOtp��57      $��
Verify OTP��6*   $��3��6]   $��2��6j   $��	85,8,5,67q�6z   �� 58   
   -   5        $ buttonRegister��58      $��Register��6)   $��3��6Y   $��1��6f   $��91,38,113,36q�6v   5;      5<      