GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�1      U      -��`�0��x�5�[,   res://GDNet/GDNetClient/GDNetClient.gd.remap�A      8       �B!Zх�u �%ׇ�`(   res://GDNet/GDNetClient/GDNetClient.gdc �      �      �k~��}�m+ƗwW�S(   res://GDNet/GDNetClient/GDNetClient.tscn�
            C�:�L���X���O((   res://GDNet/GDNetLib/Connection.gd.remap�A      4       ��Y�t�6�h� O4$   res://GDNet/GDNetLib/Connection.gdc �      1      ����*�J�����l�$   res://GDNet/GDNetLib/Connection.tscn0      P      ����ϡ%��^c�7�0   res://GDNet/GDNetNode/ApiRest/ApiRest.gd.remap  B      :       �3��ٕ:��k3��Q,   res://GDNet/GDNetNode/ApiRest/ApiRest.gdc   �      �
      �*�JRv,\��ܓ��(   res://GDNet/GDNetNode/GDNetNode.gd.remapPB      4       �8ϩ�>u�U���#�$   res://GDNet/GDNetNode/GDNetNode.gdc !      �      �ff#X��'29��F$   res://GDNet/GDNetNode/GDNetNode.tscn�#      �      攑#e>~k1�{t�@   res://GDNet/GDNetNode/Singletone/GDNetNodeKeyManager.gd.remap   �B      I       �%iT�Ħ%�#Uk�B8   res://GDNet/GDNetNode/Singletone/GDNetNodeKeyManager.gdcp%      �      Kx��BAY%6�!��Zv,   res://GDNet/GDNetServer/GDNetServer.gd.remap�B      8       k�S�@�ˢB��1ֻ�(   res://GDNet/GDNetServer/GDNetServer.gdc `*      �       �Lcc����XJ��
��V(   res://GDNet/GDNetServer/GDNetServer.tscnP+      B      �x5C��M[fv�@G��@0   res://GDNet/GDNetServer/PlayerManager.gd.remap   C      :       j������k~e��?,   res://GDNet/GDNetServer/PlayerManager.gdc   �,      ~      �$���+Na���Cp�   res://Main.gd.remap `C             �(@Er�#��K�F�[   res://Main.gdc   /      1      �%((��^��{~ꀝ��   res://Main.tscn `0      �       ӗ���K� ���~}�U   res://default_env.tres   1      �       um�`�N��<*ỳ�8   res://icon.png  �C      �      G1?��z�c��vN��   res://icon.png.import   ?      �      �����%��(#AB�   res://project.binarypP      �      ��[��w󳕬�B�    GDSC            `      ���Ӷ���   ��������������ض   �����϶�   �������Ӷ���   ������ٶ   ���Ӷ���   �������������Ķ�   ���������ض�   ����������������Ķ��$   ����������������������������������Ҷ   ���ٶ���   ������ض   �������������Ķ�   ���������ض�    ����������������������������Ҷ��             GDNet         Jon    �      	   127.0.0.1      9        Success       Login accepted                           	                  (      )   	   3   
   4      ;      C      H      R      S      Y      ^      3YY;�  YY0�  PQV�  �  P�  Q�  ;�  N�  �  R�  �S  P�  RR�  QOY�  W�  T�  P�  R�  QYY0�	  P�
  QV�  &�
  T�  �  V�  �?  P�  Q�  W�  T�  T�  P�
  QYY0�  PQV�  �?  P�  QY`    [gd_scene load_steps=3 format=2]

[ext_resource path="res://GDNet/GDNetClient/GDNetClient.gd" type="Script" id=1]
[ext_resource path="res://GDNet/GDNetLib/Connection.tscn" type="PackedScene" id=2]

[node name="GDNet" type="Node"]
script = ExtResource( 1 )

[node name="Connection" parent="." instance=ExtResource( 2 )]
[connection signal="login_accepted" from="Connection" to="." method="_on_Connection_login_accepted"]
[connection signal="server_info_received" from="Connection" to="." method="_on_Connection_server_info_received"]
           GDSC         /        ���Ӷ���   �������������������Ҷ���   ���ٶ���   �������������Ҷ�   �������������Ķ�   ������������Ķ��   �������������ض�   ������������Ķ��   �����������   �����������   ���Ķ���   �����������������������¶���   ����   ����������ƶ   �������Ӷ���   �����������Ķ���   ����������������Ķ��   ��������涶�   ������������¶��   �����϶�   ������¶   �������������������Ҷ���   �Ҷ�   �����Ҷ�   ����������������������Ҷ   �������������������������Ҷ�   ��������������������Ҷ��   ����������������������Ҷ   ����������ٶ   ����������ڶ             *         network_peer_connected        _on_player_connected      network_peer_disconnected         _on_player_disconnected       connected_to_server       _on_connection_established        connection_failed         _on_connection_failed         server_disconnected       _on_server_disconnected       server_info       version       Player connected:         Player disconnected:          Failed connection:        Server disconnected       server_info_received                   	                                 	      
   '      0      9      @      H      I      R      [      d      l      m      s      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *     +     ,     -     .     /   3YYB�  P�  QYB�  PQYY5;�  W�  YY;�  VYY0�  P�  R�	  QV�  ;�
  �  T�  PQ�  �
  T�  P�  R�	  Q�  �
  T�  P�  Q�  �  PQT�  �
  YY0�  P�  R�  QV�  ;�
  �  T�  PQ�  �
  T�  P�  R�  Q�  �  PQT�  �
  �  Y0�  PQV�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�	  Q�  �  PQT�  P�
  RR�  Q�  Y0�  P�  QV�  �  P�  R�  RN�  V�  OQ�  �?  P�  R�  Q�  Y0�  P�  QV�  �?  P�  R�  Q�  Y0�  PQV�  �?  P�  Q�  Y0�  PQV�  �?  P�  Q�  Y0�  P�  QV�  �?  P�  QYYD0�  P�  V�  QV�  �  P�  R�  QYY`               [gd_scene load_steps=3 format=2]

[ext_resource path="res://GDNet/GDNetLib/Connection.gd" type="Script" id=1]
[ext_resource path="res://GDNet/GDNetServer/PlayerManager.gd" type="Script" id=2]



[node name="Connection" type="Node"]
script = ExtResource( 1 )

[node name="PlayerManager" type="Node" parent="."]
script = ExtResource( 2 )
GDSC   .      A   �     ���Ӷ���   ��������������������Ҷ��   ��ƶ   ���¶���   ��϶   ���ⶶ��   �����Ķ�   ���������Ķ�   �����¶�   ������������涶�   ����¶��   ����   �����ض�   ����   ����������Ŷ   �������Ŷ���   ����׶��   ����������������������Ӷ   ��������������ض   �������������������¶���   ���������Ŷ�   ���������������򶶶�   ����Ŷ��   ������������������Ŷ   �����Ķ�   ������Ў������Ѷ   ��Ѷ   ����¶��   ����������޶   ����������Ӷ   �����Ķ�   ������¶   ���Ӷ���   ������������¶��   ���¶���   ���Ҷ���   ������������������Ķ   �����������϶���   ����������ڶ   �������������������¶���   ���¶���   ������������Ŷ��   ����Ҷ��   ��ж   �������׶���   �������߶���   �                                         GET       /                      Error, game is required             Error, port is required       exec         ��        Error, port number error      \         .         No seas listo...      exec_request_received      !   Error, no se que quieres de mi...         HTTP/1.1 200 OK       Content-Type: text/html       
                                                    %   	   &   
   ,      4      ?      D      G      J      M      N      W      _      g      h      s      w      x      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &     '     (     )   "  *   '  +   G  ,   L  -   O  .   X  /   ]  0   h  1   k  2   p  3   v  4   w  5   �  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A   3YYB�  P�  R�  R�  QYY:�  VYY5;�  V�  �  Y5;�  V�	  �  YY0�
  PQV�  �  �  T�  PQ�  &�  T�  P�  Q�  V�  �  P�  Q�  (V�  .�  �  .�  YY0�  P�  V�  QV�  &�  T�  PQV�  �  �  T�  PQY�  &�  �  T�  PQV�  �  �  Y�  &�  �  T�  PQ�	  T�  V�  ;�  �  T�  PQ�  &�  �  V�  ;�  V�  �  T�  P�  Q�  ;�  �  T�  P�  Q�  &�  T�  P�  QV�  �  P�  L�  MT�  P�  QT�  P�  QQYY0�  P�  V�  QV�  &�  T�   PQ	�  �  L�  M�	  V�  �!  P�
  Q�  '�  T�   PQ	�  �  L�  M�	  V�  �!  P�  Q�  '�  L�  M�  V�  ;�  �  L�  M�  ;�"  �  P�  L�  MQ�  &�"  	�  �"  �  V�  �!  P�  Q�  '�  T�#  P�  Q�  �  T�#  P�  Q�  �  T�#  P�  Q�  V�  �!  P�  Q�  (V�  ;�  �$  T�%  PQ�  �!  P�  Q�  �&  P�  R�  R�"  R�  Q�  (V�  �!  P�  Q�  �  T�'  PQYY0�!  P�(  V�  QV�  �)  P�  Q�  �*  P�(  QYY0�)  P�+  V�  QV�  �*  P�  Q�  �*  P�  QY�  �*  P�	  QYY0�*  P�(  V�  QV�  �  T�,  PP�(  �  QT�-  PQQY`          GDSC            ]      ���Ӷ���   ��������   �������¶���   ������¶   �����϶�   ����¶��$   ��������������������������������Ҷ��   �������Ӷ���   ���¶���   ��϶   ���������Ӷ�   �嶶   ������Ӷ      /home/godot/current-peekabooh/        Api rest is listening...      /      
   Executed:                             	      
                           	   $   
   %      6      B      I      N      Q      X      [      3YY:�  VYY5;�  VW�  YY0�  PQV�  �?  P�  Q�  �  T�  PQYY0�  P�  V�  R�  V�  R�	  V�  QV�  ;�
  V�  �  �  �  �  �?  P�  R�
  Q�  �  T�  P�  �
  R�  L�  R�	  MR�  �  QY`[gd_scene load_steps=3 format=2]

[ext_resource path="res://GDNet/GDNetNode/ApiRest/ApiRest.gd" type="Script" id=1]
[ext_resource path="res://GDNet/GDNetNode/GDNetNode.gd" type="Script" id=2]

[node name="GDNetNode" type="Node"]
script = ExtResource( 2 )

[node name="ApiRest" type="Node" parent="."]
script = ExtResource( 1 )
[connection signal="exec_request_received" from="ApiRest" to="." method="_on_ApiRest_exec_request_received"]
            GDSC         $   �      ���Ӷ���   �����������󶶶�   ���Ŷ���   ����Ķ��   ����Ķ��   �����������϶���   ��϶   ߶��   ��Ŷ   �����Ҷ�   �嶶   �������������������Ŷ���   ��������϶��   ݶ��   ����������¶   ��Ҷ   ���Ӷ���   ����Ӷ��   �����϶�   ����   �������¶���   ��������Ӷ��   ������¶   ��������Ҷ��   ����¶��   <                          0         key       time          Key erased:              timeout       _on_timeout                    	      
                           	       
   &      /      <      =      I      ^      a      b      k      z      }      ~      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   3YY:�  VYY5;�  LMYY;�  V�  YY0�  PQX�  V�  ;�  V�  �  )�  �K  P�  QV�  �  �<  P�&  PQ�  �  Q�  �  &�  T�  P�  QV�  PQ�  (V�  T�	  PN�  V�  R�  V�
  T�  PQOQ�  .�  YY0�  P�  V�  QV�  )�  �  V&�  T�  �  V.�  �  .�  YY0�  PQV�  ;�  �
  T�  PQ�  �  )�  �  V�  &�  T�  	�  V�  �?  P�  R�  Q�  �  T�  P�  QYY0�  PQV�  �  �  T�  PQ�  �  T�  �	  �  �  T�  �  �  T�  P�
  RR�  Q�  �  P�  Q�  �  T�  PQY` GDSC                  ���Ӷ���   �����϶�   �������Ӷ���   ���������ض�   ������������Ķ��      GDNet      9                           	                  3YY0�  PQV�  �  PQ�  W�  T�  P�  R�  QY`          [gd_scene load_steps=3 format=2]

[ext_resource path="res://GDNet/GDNetLib/Connection.tscn" type="PackedScene" id=1]
[ext_resource path="res://GDNet/GDNetServer/GDNetServer.gd" type="Script" id=2]




[node name="GDNet" type="Node"]
script = ExtResource( 2 )

[node name="Connection" parent="." instance=ExtResource( 1 )]
              GDSC            N      ���Ӷ���   �������������Ķ�   ���������¶�   ���������ض�   ���ٶ���   �����Ҷ�   �������Ӷ���   ��������������������Ҷ��   ��������������������������Ҷ   �Ҷ�   ���������������������Ҷ�   ����������ڶ            _server_send_login_received       _client_login_accepted        Login received        login_accepted                                       &      '      1   	   8   
   =      >      E      L      3YY5;�  �  PQ�  Y0�  P�  V�  QV�  �  PR�  R�  PQT�  PQR�  Q�  YD0�  P�	  R�  QV�  �  P�	  R�  Q�  �?  P�  QYYD0�
  PQV�  �  T�  P�  QY`  GDSC            "      ���Ӷ���   �����϶�   ��������Ҷ��   �������Ӷ���   (   res://GDNet/GDNetClient/GDNetClient.tscn                                                 	   	   
   
                                        3YYYYYYYYY0�  PQV�  �  P�L  PQT�  PQQYYYYY`               [gd_scene load_steps=2 format=2]

[ext_resource path="res://Main.gd" type="Script" id=1]

[node name="Main" type="Node"]
script = ExtResource( 1 )
             [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://GDNet/GDNetClient/GDNetClient.gdc"
        [remap]

path="res://GDNet/GDNetLib/Connection.gdc"
            [remap]

path="res://GDNet/GDNetNode/ApiRest/ApiRest.gdc"
      [remap]

path="res://GDNet/GDNetNode/GDNetNode.gdc"
            [remap]

path="res://GDNet/GDNetNode/Singletone/GDNetNodeKeyManager.gdc"
       [remap]

path="res://GDNet/GDNetServer/GDNetServer.gdc"
        [remap]

path="res://GDNet/GDNetServer/PlayerManager.gdc"
      [remap]

path="res://Main.gdc"
 �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         GDNet      application/run/main_scene         res://Main.tscn    application/config/icon         res://icon.png     autoload/GdNetNodeKeyManager@      8   *res://GDNet/GDNetNode/Singletone/GDNetNodeKeyManager.gd)   rendering/environment/default_environment          res://default_env.tres     