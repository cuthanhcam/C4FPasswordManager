   M S B A M L   `   `   `  ����M  IC4FPasswordManager, Version=1.0.1.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:PasswordManager.PropertiesPasswordManager.Properties  5   	   !    PasswordManager.LoginWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   :props(clr-namespace:PasswordManager.Properties     5   	   #��� ��5   	   $	��220��5	   	   $	��600��6     � Icon$  Images/logo.png��6"    � 
ResizeMode$ NoResize=�69   .��5
      � $��10,10,10,10q�6    � RowDefinitions 5   
   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   6.   �� 5      $��* �6   6+   .+�5   
   �� -   5         ��Name$ labelDescription��5      *   $PasswordManager.Properties.Resources(   !LABEL_ENTER_MASTER_PASSWORD_FOR_0#��Z 6*   $��0��6q   $��0��6~   $��2��6�   �� 5   
   $��1��6   $��0��6      LABEL_PASSWORD#��Z 6-    �� Target 6a   ��  �� ElementName$ passwordBox��G� 5   
   -   5        	 G�Name$	 passwordBox��5   3   $��1��6   $��1��6#   
 G� 	MaxLength$
 32��6H   $��23��6W   6c   �� 5   
   $��2��6   $��0��6      	LABEL_KEY#��Z 6-   �� 5   
   -   5         ��Name$ 
textBoxKey��5   A   $��2��6   $��1��6    �� 
IsReadOnly$
 True��6/   $��23��6U   �� 5   
   $��3��6   $��0��6      LABEL_KEY_DIRECTORY#��Z 6-    6f   �� $ textBoxKeyDirectory��� 5   
   $��3��6   $��1��6    5      �� 5      $��* �6#   �� 5      $��40 �6#   .+�5!      �� -   5        $ textBoxKeyDirectory��5!   &   $��0��6   $��23��6C   6O   �� 5"      -   5        $��1��5"      $	��...��6%   $��23��63   $��30��6?   $��Right=�6J   6f   5#      �� 5$   
   $��4��6   $��1��6"    �� Orientation$ 
Horizontal=�62   $��Right=�6K   .+�5%      �� -   5         ��Name$ buttonOK��5%       �� 	IsDefault$
 True��6'      	BUTTON_OK#��Z 68   $��23��6g   $��80��6s   $��5,0,5,0q�6~   6�   �� 5&      -   5        $ buttonCancel��5&       �� IsCancel$
 True��6+      BUTTON_CANCEL#��Z 6;   $��23��6n   $��80��6z   $��5,0,0,0q�6�   6�   5'      5(      5)      