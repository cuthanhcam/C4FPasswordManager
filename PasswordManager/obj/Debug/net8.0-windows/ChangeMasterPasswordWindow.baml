   M S B A M L   `   `   `  ����M  IC4FPasswordManager, Version=1.0.1.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:PasswordManager.PropertiesPasswordManager.Properties  5   	   0    *PasswordManager.ChangeMasterPasswordWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   :props(clr-namespace:PasswordManager.Properties     5   	   #��� ��5   	   $	��180��5	   	   $	��500��6   $	��180��6"   $	��300��62     � Icon$  Images/logo.png��6A   .��5
      � $��10,10,10,10q�6    � RowDefinitions 5   
   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*   �� 5      $��30 �6   6*    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   6.   �� 5      $��* �6   6+   .+�5   
   �� $��0��6   $��0��6   *   $PasswordManager.Properties.Resources    LABEL_OLD_MASTER_PASSWORD#��Z 6-    �� Target 6l   ��  �� ElementName$ passwordBoxOld��G� 5   
   -   5         G�Name$ passwordBoxOld��5   3   $��0��6   $��1��6#    G� 	MaxLength$ 32��6K   $��23��6Z   6f   �� 5   
   $��1��6   $��0��6       LABEL_NEW_MASTER_PASSWORD#��Z 6-    6l   �� $ passwordBoxNew��G� 5   
   -   5        $ passwordBoxNew��5   3   $��1��6   $��1��6#   $ 32��6K   $��23��6Z   6f   �� 5   
   $��2��6   $��0��6   (	   !LABEL_CONFIRM_NEW_MASTER_PASSWORD#��Z	 6-    6t   �� $ passwordBoxNewConfirm��G� 5   
   -   5        $ passwordBoxNewConfirm��5   3   $��2��6   $��1��6#   $ 32��6R   $��23��6a   6m   �� 5   
   $��3��6   $��1��6"   
 �� Orientation$
 
Horizontal=�62   $��Right=�6K   .+�5      �� -   5         ��Name$ buttonOK��5       �� 	IsDefault$
 True��6'      	BUTTON_OK#��Z 68   $��23��6g   $��80��6s   $��5,0,5,0q�6~   6�   �� 5      -   5        $ buttonCancel��5       �� IsCancel$
 True��6+      BUTTON_CANCEL#��Z 6;   $��23��6n   $��80��6z   $��5,0,0,0q�6�   6�   5      5      5       