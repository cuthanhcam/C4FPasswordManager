   M S B A M L   `   `   `  ����M  IC4FPasswordManager, Version=1.0.1.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:PasswordManager.PropertiesPasswordManager.Properties  5   	   #    PasswordManager.PrepareWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   :props(clr-namespace:PasswordManager.Properties     5   	   #��� ��5   	   $	��290��5	   	   $	��600��6   $	��290��6"   $	��300��62     � Icon$  Images/logo.png��6A   .��5
      � $��10,10,10,10q�6    � RowDefinitions 5   
   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*   �� 5      $��* �6   6)   �� 5      $��30 �6   6*    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   6.   �� 5      $��* �6   6+   .+�5   
   �� $��0��6   $��0��6   *   $PasswordManager.Properties.Resources   
LABEL_NAME#��Z 6-    �� Target 6]   ��  �� ElementName$ textBoxName���� 5   
   -   5         ��Name$ textBoxName��5      $��0��6'   $��1��64   $��23��6D   6P   �� 5   
   $��1��6   $��0��6      LABEL_MASTER_PASSWORD#��Z 6-    6h   �� $ passwordBox��G� 5   
   -   5         G�Name$ passwordBox��5   3   $��1��6   $��1��6#   	 G� 	MaxLength$	 32��6H   $��23��6W   6c   �� 5   
   $��2��6   $��0��6   $
   LABEL_CONFIRM_MASTER_PASSWORD#��Z
 6-    6p   �� $ passwordBoxConfirm��G� 5   
   -   5        $ passwordBoxConfirm��5   3   $��2��6   $��1��6#   $	 32��6O   $��23��6^   6j   �� 5   
   $��3��6   $��0��6      LABEL_KEY_DIRECTORY#��Z 6-    6f   �� $ textBoxKeyDirectory��� 5   
   $��3��6   $��1��6    5      �� 5       $��* �6#   �� 5!      $��40 �6#   .+�5#      �� -   5        $ textBoxKeyDirectory��5#   &   $��0��6   $��23��6C   6O   �� 5$      -   5        $��1��5$      $	��...��6%   $��23��63   $��30��6?   $��Right=�6J   6f   5%      �� 5&   
   $��4��6   $��0��6      LABEL_DESCRIPTION#��Z 6-    6d   �� $ textBoxDescription���� 5'   
   -   5        $ textBoxDescription��5'      $��4��6.   $��1��6;   $��0,3,0,3q�6K    �� 	MaxLength$
 1024��6\    �� AcceptsReturn$
 True��6m   " �� VerticalScrollBarVisibility$
 Auto=�6�   $ �� HorizontalScrollBarVisibility$
 Auto=�6�   6�   �� 5(   
   $��5��6   $��1��6"    �� Orientation$ 
Horizontal=�62   $��Right=�6K   .+�5)      �� -   5         ��Name$ buttonOK��5)       �� 	IsDefault$
 True��6'      	BUTTON_OK#��Z 68   $��23��6g   $��80��6s   $��5,0,5,0q�6~   6�   �� 5*      -   5        $ buttonCancel��5*       �� IsCancel$
 True��6+      BUTTON_CANCEL#��Z 6;   $��23��6n   $��80��6z   $��5,0,0,0q�6�   6�   5+      5,      5-      