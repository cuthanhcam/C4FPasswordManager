   M S B A M L   `   `   `  ����M  IC4FPasswordManager, Version=1.0.1.0, Culture=neutral, PublicKeyToken=null1clr-namespace:PasswordManagerPasswordManager  5   	   G(clr-namespace:PasswordManager.PropertiesPasswordManager.Properties  5   	        PasswordManager.EditWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .selfclr-namespace:PasswordManager     5   	   :props(clr-namespace:PasswordManager.Properties     5   	   #��� ��5	   	   $	��330��5
   	   $	��450��6   $	��290��6"   $	��300��62     � Icon$  Images/logo.png��6A    � 	Resources 5         ImageEnabled �� 
TargetType �� Triggers P� Property P� Value �� Property �� Value   BooleanToVisibilityConverter��%�   &	        &	 �     �� 5   
   " ��6%    5      P� 5       � {�$ False��6/   . �5      ��  �@J�Opacity$
 0.25Q�60   6?   5      5      �� 5   
   6'   5       J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5        	   Command$#	 self:CustomCommands.CopyLogin��5      6a     5   
   -   5        $&	  self:CustomCommands.CopyPassword��5      6d     5   
   -   5        $!	 self:CustomCommands.OpenURL��5      6_     5   
   -   5        $*	 $self:CustomCommands.GeneratePassword��5      6h   .��5      � $��5,5,5,5q�6   
 � RowDefinitions
 5   
   �� 5      $��30 �6   �� 5      $��30 �6   �� 5      $��30 �6   �� 5       $��30 �6   �� 5!      $��30 �6   �� 5"      $��* �6   �� 5#      $��30 �6   �� 5$      $��30 �6    � ColumnDefinitions 5&   
   �� 5'      $
��Auto �6   �� 5(      $��* �6   �� 5)      $
��Auto �6   �� 5*      $
��Auto �6   .+�5,   
   �� $��0��6   $��0��6   *   $PasswordManager.Properties.Resources   
LABEL_NAME#��Z 6-    �� Target 6]   ��  �� ElementName$ textBoxName���� 5-   
   -   5         ��Name$ textBoxName��5-   /   $��0��6   $��1��6   $��23��6D   $��0,0,5,0q�6P    �� 	MaxLength$	 100��6a   6q   �� 5.   
   $��1��6   $��0��6      LABEL_LOGIN#��Z 6-    6^   �� $ textBoxLogin���� 5/   
   -   5        $ textBoxLogin��5/   /   $��1��6   $��1��6   $��23��6E   $��0,0,5,0q�6Q   $	 100��6b   6r   �� 50   
   $��2��6   $��0��6      LABEL_PASSWORD#��Z 6-    6a   �� $ passwordBox��G� 51   
   -   5         G�Name$ passwordBox��51   3   $��2��6   $��1��6#   $��23��6H   $��0,0,5,0q�6T    G� 	MaxLength$	 100��6e   6u   �� 52   
   $��3��6   $��0��6      LABEL_CONFIRM_PASSWORD#��Z 6-    6i   �� $ passwordBoxConfirmed��G� 53   
   -   5        $ passwordBoxConfirmed��53   3   $��3��6   $��1��6#   $��23��6Q   $��0,0,5,0q�6]   $	 100��6n   �� 54   
   $��4��6   $��0��6      	LABEL_URL#��Z 6-    6\   �� $ 
textBoxUrl���� 55   
   -	   5        $ 
textBoxUrl��55   /   $��4��6   $��1��6   $��23��6C   $��0,0,5,0q�6O   $	 100��6`   6p   �� 56   
   $��5��6   $��0��6      LABEL_DESCRIPTION#��Z 6-    6d   �� $ textBoxDescription���� 57   
   -
   5        $ textBoxDescription��57   /   $��5��6   $��1��6   $��0,4,5,3q�6K   $
 1024��6\    �� AcceptsReturn$
 True��6m   " �� VerticalScrollBarVisibility$
 Auto=�6�   $ �� HorizontalScrollBarVisibility$
 Auto=�6�   6�   �� 58   
   $��7��6   $��1��6"   $��3��62    �� Orientation$ 
Horizontal=�6F   $��Right=�6_   .+�59      �� -   5         ��Name$ buttonOK��59       �� 	IsDefault$
 True��6'      	BUTTON_OK#��Z 68   $��23��6g   $��80��6s   $��5,0,5,0q�6~   6�   �� 5:      -   5        $ buttonCancel��5:       �� IsCancel$
 True��6+       BUTTON_CANCEL#��Z  6;   $��23��6n   $��80��6z   $��5,0,5,0q�6�   5;      �� 5<   
   $#��self:CustomCommands.CopyLogin��6   $��1��69   $��2��6F   !   TOOLTIP_COPY_LOGIN" � ToolTip#" Z! 6V   $��20��6�   $��20��6�   .��5=      �� $"��Images/16x16/edit-copy-7.png��6   $��16��6:   $��16��6E   #��[  6Q   5>      �� 5?   
   $&�� self:CustomCommands.CopyPassword��6   $��2��6<   $��2��6I   #   TOOLTIP_COPY_PASSWORD#" Z# 6Y   $��20��6�   $��20��6�   .��5@      �� $"��Images/16x16/edit-copy-7.png��6   $��16��6:   $��16��6E   #��[  6Q   5A      �� 5B   
   $*��$self:CustomCommands.GeneratePassword��6   $��5,0,0,0q�6@   $��2��6Q   $��3��6^    $   TOOLTIP_GENERATE_PASSWORD#" Z$ 6n   $��20��6�   $��20��6�   .��5C      �� $ ��Images/16x16/kgpg_info.png��6   $��16��68   $��16��6C   #��[  6O   5D      �� 5E   
   $!��self:CustomCommands.OpenURL��6   $��4��67   $��2��6D   %   TOOLTIP_OPEN_URL#" Z% 6T   $��20��6�   $��20��6�   .��5F      �� $��Images/16x16/homepage.png��6   $��16��67   $��16��6B   #��[  6N   5G      5H      5I      