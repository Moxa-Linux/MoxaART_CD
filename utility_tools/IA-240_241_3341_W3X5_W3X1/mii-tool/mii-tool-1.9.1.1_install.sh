#!/bin/sh

#You need change following items:
#1.Welcome message
#2.Uninstall message/action  
WELCOMEMSG="Welcome to MOXA  IA-240_241_W-3X5_W3X1 7112PLUS  mii-tool auto installer"

SCRIPT="$0"
case "${SCRIPT}" in
/*)
	;;
*)
	if [ -f "${SCRIPT}" ]
	then
		SCRIPT="`pwd`/${SCRIPT}"
	else
		SCRIPT="`which ${SCRIPT}`"
	fi
	;;
esac

if [ ! -f "${SCRIPT}" ]
then
	echo "Cannot find the location of the install script ($SCRIPT) ?"
	exit 1
fi

mount_readwrite() {
	[ -f /etc/init.d/apache ] && /etc/init.d/apache stop
	[ -f /etc/init.d/pcmcia ] && /etc/init.d/pcmcia stop
	mount -o remount,rw /dev/mtdblock2 /
}

mount_readonly() {
	umount /
	[ -f /etc/init.d/pcmcia ] && /etc/init.d/pcmcia start
	[ -f /etc/init.d/apache ] && /etc/init.d/apache start
}

clear
echo #################################################################
echo 	$WELCOMEMSG	
echo ##################################################################

echo Press the number:
echo 1.Install the package
echo 2.Uninstall the package
echo 3.Exit or CTRL+C

read A

if [ "$A" = "1" ] ; then
	mount_readwrite
	#Change line number (=this file line no( ctrl+g)+1) ,Added by Wade ,05/07/09  
	tail -n +80 ${SCRIPT} | tar -C / -xzv -f -
	mount_readonly
fi

#Change you re-install msg and action
if [ "$A" = "2" ] ; then
	clear
        echo "WARNING !!!!!"
        echo "Uninstall tool-chain will remove file:"
        echo "/usr/sbin/mii-tool"
        echo "press any key to continue or Ctrl+C to exit"
        read B
	mount_readwrite
        rm -rf /usr/sbin/mii-tool 
	mount_readonly
        echo "Uninstall complete !"
        exit 0
fi

if [ "$A" = "3" ] ; then
	exit 0
fi

exit 0
__ARCHIVE_FOLLOWS__
� ��J �ZpT�u��Z���̏e����J�~@�����F`	�8�j�	mX���>��h��.k���:C;$u:�M=����Sں5vb�C��]��g���u`��{�jq��83����{�=��s�=�ܻｾHx)�������V`�l,�.W���,_�̵�).�zy�_�aT�"�'�9k��y|����h���G���/3����*˫j����jWn�� ej�{��
]�_����U��jj�ֿ͌+_�-�������-�l6�'M�Y��e���}�FuΦ����,�j%�1	�  p�`P�&��l&�2(�����6�m6�0��N3��e!�M�y���1�P��)�3	��4��Z�U����ʈVY��G��lX�n��L)`hv�n��f?ɔJL�B��a��ӎ���6vsq��/��Y��"����&=��70߬�:|p3��U��ð�R�]0n|���n��Mz`r�����lF��q>+��'�^lҫ
�!����� ��$���ٌ�7{ل���
�N��6��z6c/�� �N�n�������O�����ޝ��|�0�A�^D������&��B��^*7�#�;�f�{����&;��=��,����!fҳ�w�_{�����ތ�~B:A���?N�ٛ���F,������2�ӽ=�0�k^=�"zX��0ۢ�ZH�h�-��ͺ��u5�XH2A6�"U10{�[XD�nU��D�E�ӥ�u�
�����zt��}D���5�z{CL�oe��	��^�EvD�R����-����������:HN�kA���aΚGa���苨>0��;�H�;z=� �	�A�h��nY�HcGU�8��ǟ�R�}o{�i�=��?��~�L�s��?�T��\,l	�|�, E�0��b�X�2�H8�G
a$��Hu���$�D�&��D4Fri!�D�JF�Fr�D���0��0��0�Ma$� a�T�0�N	��0� a$�A�H�C��Pg���V\v��$�3�q��}<��sy�d,0�Qc���g8ƢF��l������vg�5YtY� �vfю,���7ӟd�Y��Y��,�L=�E�Ȣg�����,ZϢ{���YtkݔE�e��Y4Ϣ�f�G)�ƒvv��L��X�e'��������f*�� '��j��>��FqW\ni�L���X[R<[�v}�`|?��'��P�I0eȘ=��?V��J�JmJ,ɔ��t �7��Řc���F:G��=ٓ���<u�`�ܨi~'�;�3�܂X�ɛ�p�L�����������w_v�=�#���8���8I��ɵ���$x/��g�`�9�V��6&ǰC���W&^{+~Jy+>l��9�,#����s�G��8�#����Ku�ԕ�8�gr%���Z�.���$^�i0��(�?�N�?�O�>E)}z�3�tT��C�Ix��1>���}��l)�:3����1�u�2 � �|mz��0l�V�vƒ�!`w,9d;�Q>lYk�����JLc���N��N6R��!����;�2�O��sO�ݔ:�{��.c����4�K�s	��`��|��N�׌����ߘ��z�ر��buN���#H��6w{�T�	��9��}k��|s1��0֝�CŇ>���-lژ�6O��4��OÎ"��G+.7~�6Q�6lΘ�
��:�i,��1��9��Җt�/�S��{���x�?Y��hݝ��Q�y�H=K��/����'�����D>d��D���`��q�n���TH:��'
�a��rV��W�B�������ǑQ��1��f�&�b�����n����\a#�����K���l�c�$��=������^��h'�ݚ�r��9'_�A1)�0���T����+9��!��J���୙8n��q��|,^�qv\�����X��ʋ�������16ˌ�u��q�3q7�ֽ������%f�g%RܞH)y��v�96l8���Q��
�����F�����O����?.�}�kQ��wF{�|�O}Q���f+�c��|:{�wӺtڣ�p�+���QJ�h[@����d��y,V�wC�E�9/o4ץ}��>����>�~�?=�T�����|v�xAǫL�OlQ���O�]D�I�?D��P� �wQ�@}��Q_����P��~��_G��kP�!�*?�a]�b��z��J=?��9�p�7f�Y�}�}��o��1���d��G��ln�"�g�_{�C뫀O�쓫��4�__O}���E|Q�N8��h�립���xa� ~ڇ��q%�{�6A��y}P��A.<����w}��s�qs������8Op��=A2����1�����E��E���̧��r���+��S �<�ܾ�h9*s]'0�^�I@��p�Q`p@��q�� ��0��]I46z C�c�Q��y��%���s���. .�w�k��ys�["�������	:s(�������<)κՉw��|�u��	=9�A��ct���Ϡ�������o�I~:,�Vb��e�+GE^i�D�����я�hi�S
���i3�$q�ٿ�����|����TĆ�-z�8��~0�����n�p��<u�'=C7��@��}]�Ab����K�ugy,y�?/r���-�+�t�{�2{�A?t�]����%?���o�q>���p��#m/l�.�+�4�$u�d�Y�v�i;��B+8��	��( 8(G[�1���crmO�>:{�!Z�Urmq��6ז֕����J<e���GN���Y��$o��uy�P�P�ˠ���~$�#�Cq��2�7��Y1r�=����l��2�<���g���k�p3�E��'W����k�^������\��2���6�3�����}	�� O���cՔob�B'�e��R��P�Ε�w��l�E���C�
wܐ����6m�ǲ�GG�/
�����O@_=@�����q&=c�-�2��k".��;�>��WF��M��w�G� �h�,�<"N WH�{���^#J}�S�9�%��B�h�l��IS��WE��g��=�X+-"����7&�lN|��O�%��;���Ms�,4����/.4�+�E��mv쟢qy9e�y��m��9Jw�S�=Iy��l����C��A<��/�v�6K~��p���g��y��<��w���
��	ڿ*���Sh�������(>���wM�Oi]莊�$_��)�
q����[,�뻠�!����N2v)��s4a�k	��^A��Ơ6���yG�1��sb�_��Ǔd3�?a�>��kN���Cto���Ȍ	��o���D�1ԃ|X�' O��t5�/�ގ��_˳�mt�3�o�Ӛ�7�9���c�I�+�2�.�3�v�o��Y�L��w����5�t��]W@���wi=�Pj�I��6�������P��a_�Y��|2]�9=�cK"|IMeM���K:R(��.�^���B��\�s�N�k׬�z��xU�65�Ca5�������׬yyC�Kq��=o���Иnbk����+Wo�z��u7���.ODmgM�m~��˛֮�,c+�����W��(��.�������V�NY_�X��	����x]Umm-kQ���hP�-��W,W��X�"�u��'��Z��j��=��	�����e�\�Զ����U7�����u���*W��<>8@�GT�tka/�P�FO�z(HX��@��G��z��ݣ{{�ޣBdGۚGW÷�W��Z�<���T_�\���9���*��2�U�.�~�c�W�D�X����	>ޫ��	�^�_>	��/�܏�f�;�m��jA=,�.�ԋ8���ZPݢ�~�/-�1�nW}�k<������\�J}TE̅�ϫs�[����A��K������W�a���xX�TYL���f̻��1"���&��/0�BV�g䱒z�o�b̺J�þ�zB�.?�ǯF�DD[:L��-�Z�ML3� 	�a�V{5]���:��ǌ'���>U��j����������G��G����B]�V""Z���V���t>H�s�[����b۷6?�N�>��{�tl�>����~pQ|�6c�ɕ��E���X����4�v7E}_ĳE�*�b���큧Pk�1[%|�W��$z��n�W��z�� ���弢�ܖ����GB�����L�o3�iwg��j�o�K��C}���z��E��<��]ch�AuJ:lJ�{o��Y��N�"��2p���XkZo�2��ܢF�TH��-
8���{��%
G����|�2���TL�ϯeV,�]�``�%�Ӕ�U�Ad])m1B�fbOx{���Q(��T�+�ִh���N��:�Ӗ�av��48���{�>��遌�)Y�����C����m�?�8W��%>&��Bf�����nd��a�������nu�|->vD� b�Gī&v��Aw���Ł�F�ӍJ/wU��U��,Uj�V�qE��]V���2:}��9� ��97.8L�o(?L�F��mm�ic�{�Y����!;���_= �r5|��j{؉C�4�s�y\�;�.ﲷ.�J�yn�aEG2��l.��t�����G2s��^f�� �Bӻ�:����z;��B?�n-)��;&�������Eл���Xe�|��2߭���o3߃3�.�
}P�H��&�|oO��w�v�����-}S@����TJ�-��ȎI�ݷ1����S�o)�et�����z^�z݆xue5}����TFz����U��b�A�ĕ����=[Xe�'��*};����aV�%�W���Y��� ��J(��f?��j?�w�@���������;��U�~O���*����}�Kcj�tE@��{�"�~�5�����ژq�.�դ��&��&�&sN���?�w-�&ŲB��e�GI[s�9����KV�v)kc��l��s1.���!�B�}�ej�G�\E�XƵ�@�&큁|9�Tژ���h˗{�:�K�-|��N�˽�0��SM���i��v��;i��>ר��n�#�j��1��ٷ�����r̉��<����Lз!g�wm��|�6�hM�U��[�v[��#'�/����t��6�'�Œ�a�[���-�~����l}Q�w��n��W>z[��������rm���FY&�����M%������Y�޽͸?b7�E|ͷ�75W�����m�r%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%Wr%W~S�_� k- P  