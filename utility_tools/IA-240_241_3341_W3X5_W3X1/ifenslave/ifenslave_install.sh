#!/bin/sh

#====================USER SPECIFIC INFORMATION=======================
#You need change below 2 iterms:

#1.Welcome message
welcom_msg="Welcome to MOXA ifenslave installer"

#2.Install/ Uninstall message and action (should be full path !)
remove_list="/bin/ifenslave"

#======================================================================

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
echo 	$welcom_msg	
echo ##################################################################

echo Press the number:
echo 1.Install the package
echo 2.Uninstall the package
echo 3.Exit or CTRL+C
read A

if [ "$A" = "1" ] ; then
	mount_readwrite
	#Change line number (=this file line no( ctrl+g)+1) ,Added by Wade ,05/07/09  
	#here will uncompress sorce file to destination
	#-C change directoy to / 
	tail -n +99 ${SCRIPT} | tar -C / -xzv -f -
	mount_readonly
fi

if [ "$A" = "2" ] ; then
	clear

	#delete files you install ...


	#print
        echo "WARNING !!!!!"
        echo "Uninstall will remove file:"
	for file in $remove_list; do 
		echo "$file" 
	done
        echo "press any key to continue or Ctrl+C to exit"
        read B
	mount_readwrite

	#delete
	for file in $remove_list; do 
		rm -r "$file" 
	done

	mount_readonly
        echo "Uninstall complete !"
        exit 0
fi

if [ "$A" = "3" ] ; then
	exit 0
fi


exit 0
__ARCHIVE_FOLLOWS__
� �1BN �[p�Ev_�
�I�ĀqlCX�'[	�Ā�p�`�P�:����D��$�Oq��o�k��k3G�ݒ�4M��Hs������r�9�הZv4M�t�w�8�p�����فv�i�b6��}�o�{���Z4Bs�7���y`�<���Z����e��\�W�f�[+w�g|�7-}�cqo�s���]o���	�4�XлV������r����ݠs���{׾!y�>�����#���l6���b��F_^b̃*����;g7`��݆Z�y:E�c�LB��d����)�L&
��d1>��8e��q�g3J%� �9N��**6�|�6��T� qn�3Q�~���@�ܠ���ח�¥e)}�4$�c�?%u��LG�e�l�@�*�O��9(�w�˓������s��=�)��g�\w�����E�*�"Y��;.�ϐ�/
�P;��],��E��.��u(�ٌ���[ٓ��0~�&����Eaj���Jٞ�A{�l�F�T�](;y�����������1�#(}
^+�	���v��[&��jQ�+�������1^(�|�G>2���Q_d�}� 5�h4e-z<�7áE��P����mD$�������������Y�$s �'���3�X�^�؈Ca����@8��>ш�@��=��1N�5R�7�y!��c:{�v��%�e�A���M��W6����8�)�X���y7}���sP��\����G5�O5��j82��+���jl���x�jl՘��jl�J���UTC�j�a�������$���u��[;�cg�obg�ó�L�I��]Igwrj�����w����dn��~6�7�{~����}����iK���}��~��>bi��{,�ݖv���aiG,m����Ү}�6G�`;vz
�Iؘ댓u'��E��u'?;�3�=�C�q&��X�U����u'��i��'��c�UU�ޝd�e��̡��]�2����i�=�,�C�+�i=�L�Y�[a�|�{��}��S��0ws��6���^����h���&=��������lr2�9=��&j��������������䡊��+X'�E�)�fA�A�|��!j?�-x �g�����cllH��������5��D]��/�w��`�ן���ӝ�y�l�r�f�qs�Cz�w��A�`+h:'�y4~Ь���G��M�4;AS>Mh�aм �S�t'���l@�	��?>o4�ｇ�>�ܕ�ݗcg�����!�>�p����ݪ���B�hWɹȧ.�6�B�P�|���2�e�/�V�2���ȕ|�i��A ]����S��'�����OC�pb���!C�8B�|�*������0n�����Z�!��e�tBO�lE�(�	?�{Y�,��P���N��G�ξ����=�'��,mK>���`���l����d!�,cϦd!蘰I���;9\��߬��~!b�V�Bq��4�K:=�|�uV2�<�X����\��,X�I�w�'�ސo�}u�|��w�	��l���^Y��~��������^����3Oʞ�%;;��u��-�0��?7S�W(v�<'�%����-y�J������<�ާA_��W��%1�/Kt�{%��7$h?!=pp���+���MS�{��{1t2I��7H+�*AK}���~�}l�!mq�݅��86�7�P����A��|Yj�{@�Wi��3Hf���{�R��M��ώ�lK_�얾\�M��9�G��C����)��������)�f������'��'�B�����8�?���q>�ϰ`?�>�wz���|��>ވ2��r�9	pJR{ұJ��.�4N�+r|/�Z���_(�[9�)���_��HA%��8��s��>��lP��)�,�ʼ�m���3%O��1Q��������b��5�q�hF���Yg
�D��)��A���G�@�Dي҅B�;]!J���7E.��>J��bۇz�c�C��(��`l+�Q�sT���"7�̿4m� �ꄾIس�������tnxD�]�� ��#�ӻ���'{���?&�Q���N�n����ch/Kǿ��q�_��!y{_C���!9Kk0��ń�.��9��o�e��[晃yf�3�6�C�3`� ڽ3A%N�}���#����m���čI�>��m���:��J�:.��ם��۱���:D�l�}|��n�3������/2�T(8��@�k��8�ī5��!'qb�4N�o� ��4���il�i�4�Z:�m�~݂�҂���^9����-س��݂�j��.�[-ؤ'���qګ�i/c������E�/����qh	�G����ɸ��"�d�M����l���@.�v�lN^A�3��P,�5���h�=c��	��Jȷ�������1��39}NmS?Ŷ��zc�C���.s��S��÷���P�A?�֢Y���N�A���G�C={���I��t��T���5_��ωX��e�K�W�D�yԢ&��ΝR���w��Ql�a��c��ݒ�|�F�G��l�v5�)�]�q��N�tղ��b��IF!����Q|�Q�c�rj=8���lC��2�,�~Fq?��2Fw���C��'R�]9�q�� �ɓ����"�bnܑ��\S�+\��b'�>&�5y�|R�Y��E��<����y^U� �P�BO���
.x*�t�ؕ�!�f�0��a�
ْ/g!�3��m����	K��&�/�(��E^������Ø?2G��U2g�����S�S�6_��,�R�b�®��]�l��|�u
Mh���������#j��K��M?(�Bk����TńNW/:�9��׺#_A��k��8/s��B�w(z�Oy�O>�φ_���͔��9(qJ�\���CAC{���&���l0���I%�_�^J��x$ϟ�#��%����K9M>���<�������~�I�y�'=���Y���/�'g���ʝd6�{�6r�	?x�ˀO{�/�$����c:[����ʰ���_$��$��5+r��K$^�Ļ/������
���0��.[f�����t���g��Ý.�aT9.���Z��U�Ł��Ν٩;�uϿr)��!�����y��K�{��B3�?����`�?s)}ϟ���_�=�����zե�=/�aG��GWɻ��z_E1X�=K�U{cZʗ�Nǋ#]�����c%(U�A{�[��1L�����d?�h�D��vz�x��1ȟ!��K��9L>���TZ�!��=�]�D��b�����fw�f�,�����+47��8�:x1ݮG-v�/���EaW�޹G���Z�Nc*���Vu_�d�:�5�]-ϻC�%�g��̅�e��ֳ��ma�O,gF��^\����{t�ڂBo~������zC{��Ɖh�\O��M��<�۹�b���N�=s���l��������Y�إ�`:t���l�H&��Io>;�5�Δc�]���Ky�$҃|�"�����ti�mC�ǚ���i�7�>�e�Ώ�I��{|��
�V�M6��y`�0ע�Et暹�l�ϫe{��Ϸ`̚�(sB�����(a��
�M�����K�����s���(��/ޚ]����Hg�q��~��P���"��F�c�H]�ާ\���W��5:~��O#�j����S080(N*���+�>�R�3�+�>�R�s�wJ�.�)�U���w��?��[����
��d��_�^k��v,�N~�b�Nw�]��,�H��e{��Ժu�UK>��;LA��s;�GJ��=3J��9%M��+<�?�J�׎�}rR��y֝P|�޼ߗ<�����BQ�%�~鄯������G;x4�wJ2��C��o=���|�-g����IP�H�q�ط#��C���ѽB������]���_1F��X�Œ�XҒ�]��۬�����eց����e	S���#e�V=��-zȃ>��Y[��C=ĕ� �9������JٮW��
�F��⽁��#�5$T]����
z�K;ˑ�f��C?�pffW�$��8e^��m���~}��^��j�&��YK��7���`�|K6ߝ�b��_���[`���C���)u�F�,6
*z�ôɃ�Fu�]��c9��v��N��-���(g�6�a��-�٫��c�;���>��
t(���k4c��?�]�1Fc��O������W��[ҭ������G_�y�2�y'��#)]��ة�{�c7|�����M>MVe.3�;8]�G�?�Ll�/F�}s���U��<�2�D]Sr��5`M?��əaM��F���tR�a�����I�к(�����½N���u}[�+ͷE�ֿ��3��5'��\s�YSuU��Ɏq�P�L��B�3����G��W�+�5�o�6�)g���k;����蠽jɀ��X���[�l�m��1~ctil� c��U��~�d���/!��{6�����k���u��K5^\����&=��%�L���u�yu8���bݷ�MF]��c�@��%��+yc�Җ��{K�\�{}�<����q���u?�N����je�i�N ���Ѩ�m��댦7����Z_��`e���Bz0#�hs��	pI���/����_:8/�ō���u���q.p{*�m��*���gye�7ף�@�C���7�6�����>l�bv���o3��e�@�jՃ3G����u��Mᐟ����^�c��4���x�U���7
5`�H�/0\��Q��@ȣ�s�(t�����b4G�(�a/��*?�w��M�!B ����*�}󾽾C��tkZG����e��` ��<����ZB��K���Q=��!�����;p�9�bPh����*]c(v�C�)
�}�1�l�J�4n��74�	�`�f/ܛo����W��yWs�������J��x�������Y�8_�,��hN����/_���A	�9m����91�z�*!�SX��b]�~ѣ����1��6=$�Zta�M�:ai
�X_��#q�Q�/�]<��v1YV���P<0&QT����Ȑ~�m��ۼ��K;<�u/\�Զ��؄%$u6��/^|����`,(�n��4q����c��]~XM o��j��k��Z�ę�r%����/\�A�&M��د"(���Ù��k H��/���ry!�])�*6p[�q�)�3c��$�ȡ%Gf�v��S�݈�'IJ����i��C�le&o��q�!7�z��;X��K3�n�0;cƦ����~lH�Z.�IؓK�X���G��?����.z���]�E��+��ݽ>sk�ڧ���>[.<��؜��y����?�J�\YF_��u)_D?��_;2��F���,��1��-�o�S 7�7��bFt_�9��{��9��������`�=R�	cE����}CyA������i�zۈA
�N�u����4.:$���w �)��d��9���
��0���*/�kG�����s�<��ͦ���w������v�6�"
��� +]I���8��ce)���w>���X>����'w����Kr�b$\Ѻ@�
!%HA4�(�K��.(\P��pżo~ng}J�47����~�f��{og�{o.�����n�JU��,	�,s�Y��gM�H[!�s{%	L��Oq����Ϫ�����jtsb?y����5�wq�>�oj&v�)G,�m[�6����NE��ڎ�j��q[DQ�]-���A�r�A{����H2m�W�*�6�՛0}E�ga7X�훥f�����l���K��Z�^�5���[�A���+��Ze��Kei�[�ڏ�
^�_-,�d��lnm�Z���O�������C��m�$cuk����s쌴E)\���"C���ߞXz��o��k�"�Du0�A7��9_(.g}K�_�/�E/~ɳУ&)�'8!<�-��Ri"S��>�c�RYo�|�"6՝qI����&K�����o��N���x�ר4Y߫5l�z�v[�Y�Z�Q�N=4*��Tb}L7���Q��O:��>��;��`s1!Iܱc�q��!l�=5�p�N��������wWE�douW�e��*ZA��$j�R �i��,�I�َ������x��-^maq-�n~uA�s���M!��a���#:�Nt���6�k���L���yίry��m�D���%ίsyz�)fދ~ŏ��IXp{i�D����2��_&A?�#ڽO���蛟�w��o�˜3����=�^���Q���_F}��o�~��?F�Z�Ut�	����qo��\>��m�����(� ��M�Ư��x$���u�~��}G�S�ޑ���]����{H�/�YE��3	�g�����8_ޒ�����F;�������q����o�8��������/�de\O���gϡi1����\,|��uѾ�PO��v��#/m�-��]��lVm�Ƚ�/� �^r�dW�mgؒ�~��큭Ͽf�:��U���B���_���|�q�_u*�~��k�~��Ǵ��_j5�d�����uy���>;���p�..���Yk쵂�`e +"�Iy�I����p"�CB��I��#��)����2�;r�%�3�o� ˏ��pc.��G��g��e�zQʼ|[� ���{��������A�O'�<�~����6ЕtR�ǜt�Sݺ��:�T�Ӹ��݅n�%e�2�!�8!�_C�4p���N*H�s[��;���"W�a�q�g��/k"c�0Aܗ�i���7f�.MnLcD�9e������d�s?�o�!�#p�8��E��M}̸y�\�����Q�'i���z�
g���7�pWB������Bp�4I�4I�����L$
� P  