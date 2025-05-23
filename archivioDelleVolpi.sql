PGDMP                         y            archivioDelleVolpi    13.2 (Debian 13.2-1.pgdg100+1)    13.1 %    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16386    archivioDelleVolpi    DATABASE     h   CREATE DATABASE "archivioDelleVolpi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
 $   DROP DATABASE "archivioDelleVolpi";
                postgres    false            �            1259    16387    film    TABLE     �  CREATE TABLE public.film (
    titolo character varying(100) NOT NULL,
    genere character varying(40) NOT NULL,
    descrizione character varying(5000) NOT NULL,
    pathimage character varying(50) NOT NULL,
    disponibilita boolean NOT NULL,
    annouscita character varying(20) NOT NULL,
    durata integer NOT NULL,
    regista character varying(40) NOT NULL,
    piattaforme character varying(500)
);
    DROP TABLE public.film;
       public         heap    postgres    false            �            1259    16393 	   preferiti    TABLE     �   CREATE TABLE public.preferiti (
    utente character varying(40) NOT NULL,
    titolo character varying(100) NOT NULL,
    "idPreferiti" integer NOT NULL
);
    DROP TABLE public.preferiti;
       public         heap    postgres    false            �            1259    16396    preferiti_idPreferiti_seq    SEQUENCE     �   CREATE SEQUENCE public."preferiti_idPreferiti_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."preferiti_idPreferiti_seq";
       public          postgres    false    201            �           0    0    preferiti_idPreferiti_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."preferiti_idPreferiti_seq" OWNED BY public.preferiti."idPreferiti";
          public          postgres    false    202            �            1259    16398    puntateserie    TABLE     �   CREATE TABLE public.puntateserie (
    serie character varying(100) NOT NULL,
    stagione integer NOT NULL,
    puntate integer NOT NULL,
    durata character varying(40) NOT NULL,
    id_puntate integer NOT NULL
);
     DROP TABLE public.puntateserie;
       public         heap    postgres    false            �            1259    16401    puntateSerie_id_puntate_seq    SEQUENCE     �   CREATE SEQUENCE public."puntateSerie_id_puntate_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."puntateSerie_id_puntate_seq";
       public          postgres    false    203            �           0    0    puntateSerie_id_puntate_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."puntateSerie_id_puntate_seq" OWNED BY public.puntateserie.id_puntate;
          public          postgres    false    204            �            1259    16403 
   recensioni    TABLE     �   CREATE TABLE public.recensioni (
    "idRecensione" integer NOT NULL,
    stelle integer NOT NULL,
    testo character varying(1000) NOT NULL,
    titolo character varying(100) NOT NULL,
    utente character varying(40) NOT NULL
);
    DROP TABLE public.recensioni;
       public         heap    postgres    false            �            1259    16409    recensioni_idRecensione_seq    SEQUENCE     �   CREATE SEQUENCE public."recensioni_idRecensione_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."recensioni_idRecensione_seq";
       public          postgres    false    205            �           0    0    recensioni_idRecensione_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."recensioni_idRecensione_seq" OWNED BY public.recensioni."idRecensione";
          public          postgres    false    206            �            1259    16411    serietv    TABLE     �  CREATE TABLE public.serietv (
    titolo character varying(100) NOT NULL,
    genere character varying(40) NOT NULL,
    stagioni integer NOT NULL,
    regista character varying(40) NOT NULL,
    pathimage character varying(50) NOT NULL,
    descrizione character varying(5000) NOT NULL,
    annouscita character varying(20) NOT NULL,
    disponibilita boolean NOT NULL,
    piattaforme character varying(500)
);
    DROP TABLE public.serietv;
       public         heap    postgres    false            �            1259    16417    utenti    TABLE     �   CREATE TABLE public.utenti (
    eta integer,
    email character varying(40) NOT NULL,
    nome character varying(40),
    cognome character varying(40),
    password character varying(20),
    profilo character varying(40)
);
    DROP TABLE public.utenti;
       public         heap    postgres    false                       2604    16420    preferiti idPreferiti    DEFAULT     �   ALTER TABLE ONLY public.preferiti ALTER COLUMN "idPreferiti" SET DEFAULT nextval('public."preferiti_idPreferiti_seq"'::regclass);
 F   ALTER TABLE public.preferiti ALTER COLUMN "idPreferiti" DROP DEFAULT;
       public          postgres    false    202    201                       2604    16421    puntateserie id_puntate    DEFAULT     �   ALTER TABLE ONLY public.puntateserie ALTER COLUMN id_puntate SET DEFAULT nextval('public."puntateSerie_id_puntate_seq"'::regclass);
 F   ALTER TABLE public.puntateserie ALTER COLUMN id_puntate DROP DEFAULT;
       public          postgres    false    204    203                       2604    16422    recensioni idRecensione    DEFAULT     �   ALTER TABLE ONLY public.recensioni ALTER COLUMN "idRecensione" SET DEFAULT nextval('public."recensioni_idRecensione_seq"'::regclass);
 H   ALTER TABLE public.recensioni ALTER COLUMN "idRecensione" DROP DEFAULT;
       public          postgres    false    206    205            �          0    16387    film 
   TABLE DATA              COPY public.film (titolo, genere, descrizione, pathimage, disponibilita, annouscita, durata, regista, piattaforme) FROM stdin;
    public          postgres    false    200   v-       �          0    16393 	   preferiti 
   TABLE DATA           B   COPY public.preferiti (utente, titolo, "idPreferiti") FROM stdin;
    public          postgres    false    201   �N       �          0    16398    puntateserie 
   TABLE DATA           T   COPY public.puntateserie (serie, stagione, puntate, durata, id_puntate) FROM stdin;
    public          postgres    false    203   �O       �          0    16403 
   recensioni 
   TABLE DATA           S   COPY public.recensioni ("idRecensione", stelle, testo, titolo, utente) FROM stdin;
    public          postgres    false    205   }R       �          0    16411    serietv 
   TABLE DATA           �   COPY public.serietv (titolo, genere, stagioni, regista, pathimage, descrizione, annouscita, disponibilita, piattaforme) FROM stdin;
    public          postgres    false    207    U       �          0    16417    utenti 
   TABLE DATA           N   COPY public.utenti (eta, email, nome, cognome, password, profilo) FROM stdin;
    public          postgres    false    208   �m       �           0    0    preferiti_idPreferiti_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."preferiti_idPreferiti_seq"', 68, true);
          public          postgres    false    202            �           0    0    puntateSerie_id_puntate_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."puntateSerie_id_puntate_seq"', 93, true);
          public          postgres    false    204            �           0    0    recensioni_idRecensione_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."recensioni_idRecensione_seq"', 128, true);
          public          postgres    false    206                       2606    16425    utenti Utenti_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT "Utenti_pkey" PRIMARY KEY (email);
 >   ALTER TABLE ONLY public.utenti DROP CONSTRAINT "Utenti_pkey";
       public            postgres    false    208                       2606    16427    film film_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (titolo);
 8   ALTER TABLE ONLY public.film DROP CONSTRAINT film_pkey;
       public            postgres    false    200                       2606    16429    preferiti preferiti_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.preferiti
    ADD CONSTRAINT preferiti_pkey PRIMARY KEY ("idPreferiti");
 B   ALTER TABLE ONLY public.preferiti DROP CONSTRAINT preferiti_pkey;
       public            postgres    false    201                       2606    16431    puntateserie puntateSerie_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.puntateserie
    ADD CONSTRAINT "puntateSerie_pkey" PRIMARY KEY (id_puntate);
 J   ALTER TABLE ONLY public.puntateserie DROP CONSTRAINT "puntateSerie_pkey";
       public            postgres    false    203                       2606    16433    recensioni recensioni_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT recensioni_pkey PRIMARY KEY ("idRecensione");
 D   ALTER TABLE ONLY public.recensioni DROP CONSTRAINT recensioni_pkey;
       public            postgres    false    205                       2606    16435    serietv serieTv_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.serietv
    ADD CONSTRAINT "serieTv_pkey" PRIMARY KEY (titolo);
 @   ALTER TABLE ONLY public.serietv DROP CONSTRAINT "serieTv_pkey";
       public            postgres    false    207                       2606    16436    preferiti preferiti_utente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.preferiti
    ADD CONSTRAINT preferiti_utente_fkey FOREIGN KEY (utente) REFERENCES public.utenti(email) NOT VALID;
 I   ALTER TABLE ONLY public.preferiti DROP CONSTRAINT preferiti_utente_fkey;
       public          postgres    false    201    2844    208                       2606    16441 $   puntateserie puntateserie_serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puntateserie
    ADD CONSTRAINT puntateserie_serie_fkey FOREIGN KEY (serie) REFERENCES public.serietv(titolo) NOT VALID;
 N   ALTER TABLE ONLY public.puntateserie DROP CONSTRAINT puntateserie_serie_fkey;
       public          postgres    false    207    203    2842                       2606    16446 !   recensioni recensioni_utente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recensioni
    ADD CONSTRAINT recensioni_utente_fkey FOREIGN KEY (utente) REFERENCES public.utenti(email) NOT VALID;
 K   ALTER TABLE ONLY public.recensioni DROP CONSTRAINT recensioni_utente_fkey;
       public          postgres    false    2844    205    208            �      x��\˒�Fv]���M��R�z��(Ȧ(J&%���dY�iȚPR��3��Dx5^y��9�&���D(Į���<�ܛ���]�B�S�*�c�Z=s�&����ׄ]��﯋����к��iH�X���](ݺh�ػb����?��ڿ�mQ�f�vm�S^�����?�&����)�)��µm,�)4������]��k����ռ�7>�|�=�<��5��}�z>����*Bͭ�TE�5�'���nX�ײ��[��O�����~�7�.u�����݀�������i�6`	��LZH���ܬvm���#]��{�b����N�����]r�PsQ�:�� YcAM(C�z���S� ��$����=�S�o<��mc�6N�>�ĥ����*j��b�qC[�DWz��/ց�vq���S���]r[�y]T���c�XT�ҵ���J�CW4��=�K�E���Pl&�3!�$��.D*�8���C\����ɗa����Η�QXA,N����%tsRT�x�����;��޷�/���*�=-⤄rO(_lc���,K��x���}���/de������B������$s���7���������A�X��[7!�= ���z��D�,Y�^}�����Z(o�=ֈ]���[O�t��w?���nկ>8�j����ӶJ�����c�z��_��'��o�k���n���j�&�>���au��~�d�-֌�O��T�M��7y�|U_��BF
��maҰ#x!�ᓏ=���e����[#��P���~Y�y�K=m:��p�N��cᾇ����@rp%-S�R`�XW��_`靛�I��:����
�i�/���7�*}�s0��%=�� h�>-�A^�@K�#a�]hd���(k�`a
7����w>��歵W>�q�	bD�u&1h�|QO�a����A�S�=~�evӼ��m�%ܞz`~���� �U��"Gs�@oˀ緕ԃ���-O��<0aM�|j���m�&�hu���g�
�^���i� ���/�*?y��uU����.��u��^�I~V�q��l�v��4�ǗW4�&rs��1*�xć�B����䡞�Y ��.˱�����x�(��
�(���m]�<��E���S�-��kOet�F���}�2.��w�0 ~�:�J�!y[�%�bƿ�sƅ�fu�i�dP�L��nݸ���@揚Y�WĄ_���Y(ru��N;����j�9��@�	qF�y�ԍ�w��2�4�^+�"c��0m�V�n�u]H���md@y�̌��~���Z*���(���hGɔ�r,�Ja6_��4#w���}WRu�K?%���5D�p������H�twG��`���R��_��Gy��Lo1����Jz��c� ��kS�-$Va�D+��ͫ�qO4�&�[�ٺd������9#��9����� i��uvSe���(b6A4 su
����ś߬�	����싯Vϑ���Wl�[}���W��Lb wa��[C�����s�yP=�q-0{@"��2��� S ^����� ��R��u�Oxq���7D&�
Q�>p���*o����t��¶�F�a��W+�f�D��1� &��J�67���[�n��*�8C{�'�.J�*g�����M0�c��B�����k��#ߥ)uq�4	1�wi�����`�x��8JY����b��7D5"K<+[��N�s;��\��1q�r�J�{M�4K�d�X���k"6�l�'�^���ЪlA�����w�X"�%�, �?�7�*/���	��0Xb�-m�&�Ҿi��B-���SH�����kqIw-�-j�M=��E��1�U�n���,@�M�.�����98 �+6�X���rh�ȈO0��-�0A� 0��ai�X��{�G0{W�v���?
$���}�C����1�ĕ,?B.Ⰷ��f����w9&|a�DP�6����"�R
�RZ��Z sGP�{��a!��j���7�s��R�G�JZ;�˦N��u����[�0�����<��>���u�ђ��KDow}�ck�F��w�m��7��N�7���BTmâ&�q[�+;�b�^C9$"�w�@��}�k|�
��5�I�14���n�˝J�� ���x���!)Y܀�GV��B�1��W��֋Bv��=RrRԁ%%U4W�ȇ[+(��O�DE��1�B$�j-*�W(Ua\��i�ۑמc,���3�)�Hu��2GAH���߈˸6DRjzT��kxOW���&���|�z�}�s��u9t�t�{�W�����6��m�᱗sh��B����Ar��>ɨ�Z�uK�~�Rt LpP3V�·g�9
�8�F3_C�� XmK��Y�B�?FcB��c/eM���6��y%��A��}��<tV�\
NUAh�0 KI���	V�h2죅�V����Cr�%�"��,.'��	s`bȼ�DsY������q���P+�!�-�L���Ȥڜ>���DFaU�l"�֞�8��ͯq˨jjn����ɕ�=C�L��f/7 #��s2%����#��/�$^��2 �OP
ð�
�n�+��G~� �Z��N�oM.XcC�`?ؽ�*W�"��UO�=t���pG-�kw��W�^6ٙY�Kdw	���	����Pd~���/����u�C�D1�a|�}������af<�]�X�,&؛�j�m�"���	��{XsbA^�^�HN�����8��[v��L�y��(���t*RY|�턡G9�jr�����l6g�sH^��Q�ޓ�e:,��	�h�[��H�2��@�Ya�F����!�9�3�˅+��V�[���E�Eq�A����G�\+,��q�貀;+�!��\�Ŵ��}����:���#���δ�Iã��B$�I�՟�1�R����1�^:z��y��RyA=���0&�־r� f�x���b�#����O��C|�,0|��^*3�����Ū*�\���̑K�T#����|����E��O[�(&�f�;kA�Թ��k ���4�ӻa�&��<�hO?��Gp�W�r�Hb����sV��<�i�/�T��}�~m>��*�Y�V��
�1�يQ:ġw�(��Xs�ʮ#HbsL&tS	1d"!��I�."���W!��U�]��`�織	���5!�
�"9C�`K(̷<)g�4ڠal�u���)��QV��uh6�9����(]����|B�!���P�x����Of�q{׫Sb���ua��2��@ Ji��h��[g&R��{@ߦ`���ibSF�� B٘�#-� ىp�&�0-l�Ѹ�xœv�Ǟq˖F+P���珚^+�~ .F���*��X���K�o�җ2/�����AQDܘ�c�yh�[Ũ�b���~�(>_M;��f��u����vɲ�vMY`�iP�z�A�w;<��
üj��s�Y��%�D�Tv��>��`El
]�Hh��ܝ�W3BZ�x��0B ��)7Ar<6z!�  T���G G�{E���\�e�ٸ�'C�s*m�hE�)��8�̦�a�f��s[�^�5C�ū�*`�?:�d.�/Y��=����n'{�	8�}k4��ҡ��A���*��" E6�C����Vu�2�,LX�1���b�s�z�t�� `�Ô��.�{�_dc�w�gԸ�S�!��^�m��ʓ(� ��6�ٸH*miU|^�eӱ�����Z���!o`���<��݋��b}"��D�w�?�0���)67���&p����������ȱ���}} =ל� v�?\/�]����7���WL��t	�K�{h���]d+���V�V\e1=�L~B���0 �0�:��2E�sف�gs2�VWͷ����߬�߀������0_�d�(����T��d�ku���^d;>ޥa�JG4������@���|O�ۋr�u��v��| ���1ͷ'��~�X�ǎ�d�	��C&    ���UCU��.����q��[.�[:-.��s����g���aG�U�.BS,���nt��=��H�Xܺ�luSSv�n fN^�>-�Ҳ���|�AԞB���؛e��&⬰� &�s��U�n'��4&Q$c$D�TK�e�Sp������괞3�7��?q���s���s5���<�n�c�Պ^�&[,5���.��Z/ڿ�5�35<Sg�M>���:�Y߫Z؋�Bb{R,M���R�=�S�K���ْ���]HqA!��ܬ�:����g�5�擴n���d�m�2`�C��P9�fܹ)'28�9��.�u%L�5�&{h��f��Z��Uou�n��L�~�:����k�=?�߱��ܸ���u��aɑ-�ō�aq24�R���;��V����aa�4�\�jDtzr���nQ��ſ�o��uhwD�3�?��7�c��&yJ��^����'U��?�q�ch��;�&� G��Z��VQ�!�u���>��)��ӣ��fT��U����E�r܊ ��Y�T�}T�f$ׁ�H���g�����P^6~�ذ�/;����~PBRW����J���������.,(���|��][�k�l��?n�I tX�^�
��W��cŅ�(����0�����7��S��Rm3:�.�X��Q&#�N��%\}d�f�"�[]T�#>��+^���a��Q�? �w�l(���w2��03۹��,�d>'V�d���ddґ:v�������		Zai�fU1Զ������A��@�\^2��� 5!��)�c�f�1뚣)y�b./3ޱȆ!�:��g��t���͵��*
0���p=�j
�!n#*��i��c�2�"����(�i�4�a7�W�~�T��"x(��wg�4fS�/܌�(t�s8Aٞ<K���]7��>-��v3�h���d~|��ȣW����<�:̉���	��9MP�Ƣ�y`M��Y[����&@�d@�- ٌ�n6F_�]
bIDQ�>u-;�/C�!+-���G����ca��O��4�0qD����T�Κ4�9�͝�ObsZ�{yJ5|�� ����)��*O� ���Sll��۴��-�{X��Ytc#��A�Ch�� ��g���va�����g~�΢�[�������s�C�3QH��6��J���,2��j,h����gXu��Co�|���g��O�m��������i��yr%�1�m��ŦxAp��W-p���̻c�_Ye�<P���Y�j��_A��OC@����5�߱�"��+"3�d�>:�!Y�e1@nѳ��{��8��fQ�͹���B53:::zx������v흓0(f��E�O-@� ���>�d�AH嬡:S��ʉ�]6	���B'i����a�wm�	�s��fQbv�9P�D���
.�h�<��3K����_��C���L�W�y�d�iQh�P��I3s9�{Mj��g�l6m�Y81
Ng��@@�`q�G�F3��($Mұ|V��U�Ǭ=�l�aJ�|eu�T�ͼ���K=Y�`S�B��Έ�/ɐP����9�E�_w���_���`�k�z{=t����:��T���/�N��̚C�*��!�t���<��qCy����	"�KP���&w�QYV����L�J\L��6��� �
;��ۮ'#��_;y��Ǐ� u�5��J�d��Ə0�S�H'^���T��39Br�8O�"R`3�����Rݨ���qS�~�M���i���3���"��(�jnq�F��F���Ӥgn0�I���A�Sj}��^�lc602v�!����
Ɏ\lm|C���#�2%Ϙln��[O\�+2��:FVh!<hn�[@��j�}ob�.i$��3��OQd⍀D��٘0�l�b��1���A��˺����b\~��|���M�Ʋ	 �E_�%����,֣գG�w��*�!���^z��}���Ϻ�C}gܝ&�'�"����V��PU#�� B���I�ag��B�X�!L�'�=c������k���Z�a�WMz���|@"j	���{2D��o�^pw�u�������e"�1���~��� �z�(N�"�h�f؅��o^q�M�nʸ�ߑY��acT��������Y���9J�u��gn��x��d��.�1傱_������F(������Ʀ�4���8�m���#���$�MɎ�w��R��Yb-��{"^�f���x�������l���\�)0�B�Э..|�#���k�� <;Qs,Λ5e����4x����]���'�f��?��e�j��kF��g�A56���s��@��؜�iq!�l�r�8����5��l+Dkiz̠Sx�ȠͬMȺʞ�e��hZ'7�'�.�;]�m&��������C����(������~Rk���؟�3e�aq���w��T�w��;v�*6Sω�SkV$�e�t� ��%Cݫw{`�:���+�J�ިF!?�d����h��s7x����	�X�vؓN�KJ�4�I,�'Ӭg�֐7;T�zb�ؤI���no>�10^.�����oGS�lz�c�&Wɋ3�9� ������87e��X����;���M�S�A[P�!�B���S��q�)"�w��я���q&���]FE�Nr�aw�~Ќ��Q�F�59%`��Q�ΕI�:=K��	ˡ���4�t���@3͑OS�d;8-�V�`-�̉��G�b�?��D�m~{9���<�~���ߣ�ur�Z�5%y=5���ólv�6��^�L�	%��v�����@���8� [�p���@��Σ�q3�ߵ�Ӽ'�i���A�?��t�Y�$eބ&$;�KN�_��c&����̌G%8�h��컊������e9wԑ�{_�A`m�i��Og�W�����|2)��Ǹ[�s����싇��5�P��|@�����ΛDrw��x��@�-�����TKC����ؠ'"�S�|�gAtҚ�l���V�v;��w���0��"���Zq6ĕ����9�l��I�vB|w<4�MMwX�%�b��cKJH�;I�7Xu+8��B�v������X�/~��p��d��L&�[f�}�٥���!�̍��g�UV�T�����L6�N��,6S2-d'����1��W �eT�cP	����j�b�>�I�<r�TF�)/������p^��Pm,Si�-���8�5�M+��zSv��.;]k��4�F02/tI�
⏣q�wPI3{u\{�Ƕ,g3I��6ӧ�A�l�֎[W}"tm-��N$䮝�΍z��K��c�z�~<�m��f�4ιh����"�zp��䛶��,Ϭ��]���o]F�Z�6��X'�}��$����sz��t���s��\�z�ņ(gu�{����l,"��d4�z2����=����޴M��K�(e��U~� ka��%9S��)�͆i�@�w�/\:�nǾ��y��8	~�&���8������Q��� n��ȑf<4&dN��Ε`"3�˱k�1z��L�p.�����FNb2�b�������' 'P9��	p��N�B<��H̝@�ķ��c\q��M��8ܛ:�؟�ʆ`�oK<��j�e&y�����Cٿ�ِE4'{~-��C>Աc���#�����쫳�2�7�u�O����H��h6~�SQ0*�<�Xߨq ����sS`�J���{o'	4{��6?�L��pv��ZD޵t�M���L�$9P�ف��5d21��`�V�u�K�bz�d�ȗ/��udX����&.���\Γ��z��-��<C���s��(#�;h��%k�/>��Hn�p;�d��1L�mUw�s���Q<�;ƾ�H(W@0MV�F�h� LZ�yd �e~>(��k�*<��)��j�>5Xm�̞��N���Ɠpg��6r��Q����x6�gƛø�6P�Œ�����o�������H�N��h�8s?Sz��ұ]�m>��if�v����顷=*���<Y��o����*G�x׉P7��7�Ac��oviy�-G_�	 5  ���˛�S�n��xxFG�<�,Q����hT+fL���%N���#~��X�T���b��%�ؐ}�6I}���i�*w	"x&�hx�5��o��BX����{�Y����r4�u���I<�:y��ޭs�<�! g]��H�K}\�CZ�����r�g�Q#�����O[̿3r�:6�y�̦��1�$�Jn������<�ʻO�pTg_bE�)�����šV�?9!�V�����~���3cC��u���ֽ���ǉ��o|ڭ��e�FF����j����S���+�Y���]?����'�|����      �   �   x���=k�@����Wx����d+���g��Ip�����[�U<H���Ʉ��Vc�q4�se��ÿ�cI_�z� 3^�Js0MW�y~`�c��l}��LT�@�Y��;�ٵK�������Ul^�z�0�B)*�E�ķ�O2
��{�R�:��+�h$�[/KQ�9�7k޲Z�U{���+��/p���      �   �  x���;o�0Fg�Wp��@�|�i��(�%	2ua-�&"K�����$��2���w_��!�v���v�E����>V���2��!��`ϡ?~ׅ1���=&E��Y0� ��$H"8��f���q�Z���3�A�	5��lߦ&�R��"�P`9L�zeU
C�CM���w�[~ܷ�5��)�{�7*OŬ(�2d55��P�5����Ѐ��$��&t��4SWI���R@�8�=|l�e'�Է�D"I��(QHҚ%�����DWg�Y�8������Ė���4	��&��ɚ0uZVfKE~��Bl���еyd�\�`��˒-YX��Ʒ����(i�r�1�/�)6K[��|�r�0�4���ݏ��i"���J`4��.k�%Ɗ�
cMc�����-�-Ǝ�cOc���z:�9�5�9��i7n�p�K�3%Lk�H����OT�t�����j��h]RC�)�%ϙ�%u��+��ԯ�Qlֵd�fU-���\������o�YLh:��b"�L ^�,mE2N8=+Cӎ=���}��x�
HϽ��ں��XQ@z,�P(8o�	�:
u=��,BM�D��"����6q��o���9��9P����:|tݡ=���v�}{��G�}�'o�C�������:��WuIuqUWT����oK��]�8���?���V�i�h����/IPH�$	.I��$�s��F�      �   �  x��T�n�@=o�bz�%Duh��R�(��ĉ�Ğأ�w��:"�3����BmӜlkfޛ��dV����-�p-��P��� ��l5�(��`�'�c��i�+�Iۭ�+�qiӄ.�O����ڎfS��$�#��1r�p���v*
���n��cS_��w��@5{��l<,J,���s�sM"l,l�@��.P��'�$p�k
c��%��'LCC��V�\��/���n(vV�bL�Fo z��4�]�}J2�'c�����B��?z��
�H�>g:���AXq�8�1(�f�7>67]VW�6�ܜ}��y���͌��	c��X�1��}��O�W��s�G��|4�.M-���}cc�}cӧ�G��Z��R��h��V�umѳ�#�f�a��2fG/�B2p~犜��u��2�)�wd�B�S��������xg�*���#�)9�#��R�����.h�Z=ǄY��z�r׸���!����4x=8-ܹ��o�����2�A�!�jQ��%ڼ�����%�����p���A,�	��R��ά��h���O�a��N�mv�%�t��'�t9�ꮵ��"vQ��Q+���e���z;_�%�ng,���l�����Q^E��<ˑ|��O�<��b���G��>�F � ��      �      x��[M�G�=S�"W�mK5$��S�eI�Qk�jy<���J�9]UIgUQf�渗�s��,���������/��^d�l����M�Gfċ/"���������u�Ǐf�>��֏�e뻹{深v��wa�ܮ?��f5���M\U�vCh�6�q�&��������������э�[�q�I�q�5��nȡB�Źk<~Ý���Ԭ����-�q�s���l�V~]���r�ç>�.S+?wo}��ܽY��sw��]݄�oR���R�a]���%ק�۔�?�q�#�K�M�n�[f�V~�B����������qh񤐳b��6��?y��l��ò�?��Y�oR������X�t�|=V׳��/̾���s���P��9�ٯ�U�~�M��t����<���ut�q�qU���*�.�z�b��a�4w����m�q,���x�*���w���}|��r�6�.<l=��=-�U��v�_urk��
���p?�xX��D���w��U�]D��֚��qЛ���~
���˔a+9��hd<��ՙ�Ox��řv�l�b_sӴ-���CV(�ٮ�u|�uF @�#@1� ���vg)�F0���j���ƻN����">'vU�zz�6�h68r�f��J71�y31����'mT�i����G:,*,�1mW�*4�kwx�����#��M,z5�P���O���f2�\Q�F<�����- ���cw��?�}���W��E��]v�^�;��Y�=���3Drg���]�a޽]�!���e��%�T�a��ALc��fpٯ<M��iAA��0�'�~���� ��58,1{���1'^Ȁ���1�y�d�* ��g/��#^&X>uW�'�/��"�����7���\	�u�5��Y��u�u�D萱-<bbB�sX9Y������s�.o�U��0�: )�v��� F�Ev.�[�#X�pY4���=)��@��F�;u{���˸j�B�ۦ�%�^�o���<�r@;� ����r0.�ޤ�`;9���u`�mj�b |�c�����+^	�e4{�x�]�R\�lx)��� �����k������Zj��U�3�}��e��	��J�:qe� �f��O׌�\=�]��f-��u�	�����������~�ˑ91�_{M�5��0*(�g��+7��%ϛ�13���1�C��fᨽK�_ p?�As�:�w��`��a���O��czvU�L�9����W.Vd?ED�$���]N7f��O~��
�"彣�����`'g rX�<�Z��|�Hz��EE�ˋ=�j(~`Η>���=�������Fq������B���� �d�d���4�a�2<���;�a�:���q«���2Q�#���飃4��9oX�#�Vw�g_̾�J�w;���ɨ�}p����>`Qf����AD(��\MHG�&PK����e��-��w]�j�)���9�K�;�j���/#z���҉�E�hIn�Ra�I����5
�i,r��<hIX�a9c���ϔ8���?D�++��"#�� V������C(��f�\��"��mp1���M<��Q�^�t��LTP�f�!�ޢc[�^\�}��b��):�1PK��  a���$�tRX�`�R@�����,@b4� �d��9n��I��'\�W�a�m=��!}@�s�c6^�`��֊|E�[���P������{Q���)$j��ߋ�<ċ�>��m�gI1��؝��;ji�?g�Y	�2.BbD"3��'�!.c�$4Q�s���5 �%��ga�"v�����~)L�3YK���%�|���)�6mT��91~I�{� �K,�7d�n�6e�QR�~��>�}�=?�[�8��&E�ECO%hG^bHd�`�8��8�Rj��t���QqU L�̿����0���JJ�Ȣ���#PC��ǕI�XH�/n�hM�~���~���DlS(e�SX�Z{ �Ť�ä(�"�Ɍxq���p��{�� 1-�b��Ŷ� �F �༑o�o��xTr\���h�Z,�!�M���+Q�`�e'q���9.%d<�e)����x)�@k)�j���~+طy��B�0�lU� ��5�y����Q�P��(�i*���~�2��j�ߎ{y��2�Q�r#]ʅ�ը�&�c	2� ͐��,ܛP�lo`e�|��WTB�R�d���|�>�����^m��[��$dOGǞ�h����ࡨ]0?*��Q�i~�y������K�#����J������D���X$��'Vz�c��9�sM����*W��R1e�	�Ñkj��m�Hs�c��o�)���rp2�d�He�uP(DQ@��ؕ\jВN@EQ�K� @�q
�-��V(nN&ie�aB��r��Z3'a7\���`-!��s��j�FW+*�Fp���h&�⁶⁶��-����ޏh�� �^Q|��XB�P��0č���'`�g����_���bmvNQ��.��~�E�����5��[��᜙;IkL%H�hQ��@�� 0t��L��=�5uK#Ls=cc�dʀ�2���ڗ�^BZ[���BZ��B�+�z��BZ:�N���s���C����Xa�Bz�/���W�|�B�&���_�?ߟO��"�e����(KOHd�� �C�")'+�tni&q٬h�EP��F�� ��<d�"�_HA����u
3��&�Y��|P6���yVMcm��>���u�x����Q���X"auK;f�9c��JUF硴���ݛ�b7�@��L�H=�6������u��%D�R�gA�E=��˚2D���*5yt#u�|��i�"g��=���I�p����H7g��D����6�-��x�(����[�Й.�DLf�/�l��{��kd�wπH�/�U� eu��#Yt�/�#�
�N&�gi���ҭ���}�ٜ�D���W��%R��<���RժT|���8T:H[�Y��)ތ*��<B��}�g�N��l*���zE�� ���9��|�@�׉�0�jP����F�Y2��d�.��y�{�B�e���0GvEC���;؀e�l�[�FT�,�W+��Vvl�|�� ���ҨJ X�1s�-}�RuӌO6�(�}u����ح����rVj@�2BO����٫�+xw�|���EcY�XH���^ALב΢�"X Al�Tx��{�/yj!u�\췬s�l�ʠ@��۱��=�3�����|����@� ?^U��4���)Ȗ�xTM���e5V ��*Zá�毀�<�9�`��j�e���?|���z�+n��y�ܝi�rq�'���c���������]�՘뾾�|�=�����l��#�]-T�p�?0{��wbI��b���oj7=V|�K�,�����0d�li�;�In�fy�`X��j۽05K�|��M%UD/qQ�c}һw��	L�͞��ui��W����ҬpY{Eyc�"�H����kG������O�3�Px�$l :o�݊�&�����|�T+`$�}C)�.�4A�E\U��7ݩ~_�d��j��K6#Ym�Pj�|�oHd�)w��ū��A�k��o������q��f�Yk�6�#6�X�5�J��+#U����b��WѪI`�J��/jfP��JaQG����o(\v����Wg��#1�$����ZWM�P,��F�8�/܌��V�U~3͸�(/�����<��$��;�bkd?_B�!l���E�p��&?��	��	fe.�ǆ�Cj[O����4d�r�\ԥ��YW1���Úʽ@�V1�.��#�eQ��z��M��F&�cǑ9K�:�Z_Mw��O����,��^�!ߛ�K�DSD��vph�A��:l\l?R��WlT�U������{�?Q3��&�E�M�r�����V��N�)3����Iݽ˄��m���Q�c��Jk��U�v��ʶÞ���fw�ͼ-=��딸�:k<7�F�^P5JL@"c	1�U��� 5���L�զ�ܺ;�UҖ�� ��mx�WZM�M�1H�īٵAvR�AM�!oYNm �  �W�^8���`3��_Q�uc�u���7�H�Ί���椧
���H�5��l�%�����pi�1�����^�hg�3��g��N��t��h���T���̆TPv?���_�zc���GR�a��]p	oP�kX��+��#y��c�?�RfhX14��W����?��4$?'.�����v��<H�xz]f�i0z'�V�ʎ(P�d�^)�ؙ{D��q�o����:�H��8�D�ɯM�&��mZ���?�]��}�sd?������Q�g�w?�|=���fl�	g�i���%�&I_fWgM��%�{��C�;0�j�X�����oy"�B��?L�A�$u�o�za�i\l���Oi2���*c;+�J̴y �{�c���ԒɡbGf/3�=Ai������1�VS��0K����b���7A�-�Y��r��euC<�Cw׈��t��t
b�(��*6ʑk���vd1�v��κ�Q�e,5��7�L6P�b_iR�z��Xy�:.v���:c�)���6Y�	��ʦ;�P� �ئ�Ơ�/I�jk�|�vg��)��� ����*��y�*��֩ j����4��Z��%ۃw �a�s�kv��	�s�0�{�,#�Bj�8����a��0�c����e_�+�Qٕq�n�֯�=�>Հ��������b�4��f���m�Bܢ��f#�-;��Uܺ��=V�ɾ5���'��]6	f��zu���5-�n��y��aM��l3�b�aG��Kg���P����)�Շ��l�Y�������榒�s��C⡰��o���4:-%�t��K�B�R{����J�~����B����l8�j�m�Ҿf.aŵ[�Lex9u쁗���k�+�=��W��z�}��(�C�a�{b9�V�У�Ic�FT�+���N�����mp5>�fG�G�%�23���Ud!�s/�j�Q/�9nn!���b��iF���N���uֶ���㚝��`���%ߝM5�ݑ��@VG�F7jf�|�rqs8N�=y���Y���U��<Hc
c�%pPy�Ln�>��Od���\�Hެ9Q��X�2�����T�zk��tpf�qXg�Cq�tD�tr��SE�H�}[��㣊�%�面�	���|�m��<��i�ʡΩ����g�<�ƨ��i)xM����};N�R,G�K�8 X��� ���'RB��h�I%eq\����Ruk���?��x*�W�`SLV Y����w�7���}Qݜ�t��H*��l���ʯPl��؃Ǭ�� ��<6�OK/�o���3>Q�*�gQQ*N���H�%��rE�]jG�� ��b��K����Ȩ�:�z�C!7[��LZz�lءV���:�L��V�W��ݮ��S��WI,�j߻��N�D���pB;*ӱ�	�4aTc�4����8�[��=���X1䛸�؝Q�Է�s �lԟ<�U%���+������1�����_U%j��`�>>NQ��W�I=u&�m�G5�����!iO5~o(��6g-%~5M�%C�OKxMt%�� -	�lN��P+�1��k�F�r�"oHp�.2=�h��b5ƺ���M��.�d���Rr��A"������X(Tx�|:Q��/�n��͆�gD��U�
j��-��%��I��	2�ni�u"�иlF�$�G-� ��ٕo���9��㹝sPA,�o�\ή� g�)�15��YfZ��]B����N��������%;jֱs<ر(��1�?�1�#8���ۖ�V��_ �hh���֣<�u��G��ݴÁ�8��Q��zz?�+ILY�Z����?F��3AZ���-�/o+�V�2���Ih�E:b��vĎGQz<Ό�]Xwm���{����z:�W��/%�=Q�U�����QεJ�Ώ��ta�4���B@����ߔv��@LNKv�bٗ�z��y񊩫�?Dਗ`���6�,c��l��&v��V9���RG��
x V��>uϸ��+�Z�Z-4�d!�\=�C�~�-��!8��l�O���?�u[B��<X^[@&B��c��P�j�U�0S���b����M�rgI=XW�(�D����f��������D��������o8�U�i?�ś*����-��"��˗��B��4M�7�m�-�w�v�p���tT��z�,�����{����.��      �     x�}��n� ���S��Ҭ��[��J�sؤ]*M^C�7Q�����T!���' ;M�F��2�����Eء¯3I�������VCh�g{�{b�t�rY�zU�UY�J��כm�^�F�C��x	�u��d���<4��9kds�^#q�)
�>)SZf���|����A����ĳƹ8t�t�yx5��K��!�'�=�l�R`B#�m6f�=^U�gy��h�jp��>0;��	+&�u�Z�&��ыq�4�PE��]     