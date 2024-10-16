PGDMP  '            	    	    |            todos    16.1    16.4 *    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    49272    todos    DATABASE     y   CREATE DATABASE todos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE todos;
                postgres    false                        3079    49344 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    49290    task_priorities    TABLE     j   CREATE TABLE public.task_priorities (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);
 #   DROP TABLE public.task_priorities;
       public         heap    postgres    false            �            1259    49289    task_priorities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.task_priorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.task_priorities_id_seq;
       public          postgres    false    219            �           0    0    task_priorities_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.task_priorities_id_seq OWNED BY public.task_priorities.id;
          public          postgres    false    218            �            1259    49299    task_statuses    TABLE     h   CREATE TABLE public.task_statuses (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);
 !   DROP TABLE public.task_statuses;
       public         heap    postgres    false            �            1259    49298    task_statuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.task_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.task_statuses_id_seq;
       public          postgres    false    221            �           0    0    task_statuses_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.task_statuses_id_seq OWNED BY public.task_statuses.id;
          public          postgres    false    220            �            1259    49308    tasks    TABLE     �  CREATE TABLE public.tasks (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    due_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    priority_id integer NOT NULL,
    status_id integer NOT NULL,
    creator_id integer NOT NULL,
    assignee_id integer
);
    DROP TABLE public.tasks;
       public         heap    postgres    false            �            1259    49307    tasks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tasks_id_seq;
       public          postgres    false    223            �           0    0    tasks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;
          public          postgres    false    222            �            1259    49274    users    TABLE     $  CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    middle_name character varying(100),
    login character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    supervisor_id integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    49273    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            +           2604    49293    task_priorities id    DEFAULT     x   ALTER TABLE ONLY public.task_priorities ALTER COLUMN id SET DEFAULT nextval('public.task_priorities_id_seq'::regclass);
 A   ALTER TABLE public.task_priorities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            ,           2604    49302    task_statuses id    DEFAULT     t   ALTER TABLE ONLY public.task_statuses ALTER COLUMN id SET DEFAULT nextval('public.task_statuses_id_seq'::regclass);
 ?   ALTER TABLE public.task_statuses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            -           2604    49311    tasks id    DEFAULT     d   ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 7   ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            *           2604    49277    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �          0    49290    task_priorities 
   TABLE DATA           3   COPY public.task_priorities (id, name) FROM stdin;
    public          postgres    false    219   �/       �          0    49299    task_statuses 
   TABLE DATA           1   COPY public.task_statuses (id, name) FROM stdin;
    public          postgres    false    221   0       �          0    49308    tasks 
   TABLE DATA           �   COPY public.tasks (id, title, description, due_date, created_at, updated_at, priority_id, status_id, creator_id, assignee_id) FROM stdin;
    public          postgres    false    223   u0       �          0    49274    users 
   TABLE DATA           l   COPY public.users (id, first_name, last_name, middle_name, login, password_hash, supervisor_id) FROM stdin;
    public          postgres    false    217   �3       �           0    0    task_priorities_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.task_priorities_id_seq', 1, false);
          public          postgres    false    218            �           0    0    task_statuses_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.task_statuses_id_seq', 1, false);
          public          postgres    false    220            �           0    0    tasks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tasks_id_seq', 30, true);
          public          postgres    false    222            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 18, true);
          public          postgres    false    216            5           2606    49297 (   task_priorities task_priorities_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.task_priorities
    ADD CONSTRAINT task_priorities_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.task_priorities DROP CONSTRAINT task_priorities_name_key;
       public            postgres    false    219            7           2606    49295 $   task_priorities task_priorities_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.task_priorities
    ADD CONSTRAINT task_priorities_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.task_priorities DROP CONSTRAINT task_priorities_pkey;
       public            postgres    false    219            9           2606    49306 $   task_statuses task_statuses_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.task_statuses
    ADD CONSTRAINT task_statuses_name_key UNIQUE (name);
 N   ALTER TABLE ONLY public.task_statuses DROP CONSTRAINT task_statuses_name_key;
       public            postgres    false    221            ;           2606    49304     task_statuses task_statuses_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.task_statuses
    ADD CONSTRAINT task_statuses_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.task_statuses DROP CONSTRAINT task_statuses_pkey;
       public            postgres    false    221            =           2606    49317    tasks tasks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_pkey;
       public            postgres    false    223            1           2606    49283    users users_login_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_login_key;
       public            postgres    false    217            3           2606    49281    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            ?           2606    49333    tasks tasks_assignee_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_assignee_id_fkey FOREIGN KEY (assignee_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_assignee_id_fkey;
       public          postgres    false    217    223    4659            @           2606    49328    tasks tasks_creator_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(id);
 E   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_creator_id_fkey;
       public          postgres    false    223    217    4659            A           2606    49318    tasks tasks_priority_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.task_priorities(id);
 F   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_priority_id_fkey;
       public          postgres    false    4663    223    219            B           2606    49323    tasks tasks_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.task_statuses(id);
 D   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_status_id_fkey;
       public          postgres    false    4667    223    221            >           2606    49284    users users_supervisor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_supervisor_id_fkey FOREIGN KEY (supervisor_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.users DROP CONSTRAINT users_supervisor_id_fkey;
       public          postgres    false    217    4659    217            �   7   x�3漰��/��;��8/6^l������N.C��.v_l���"F��� �CR      �   G   x�3ἰ�bӅ=�^����9/l��}a��}v��P/�_�z��b��~.C��04������� ��<(      �     x��Vmj�@��:�.�egf?�{�� L#C���`�P�^���+���Ph{�͍:�o��&T�e�};3��ؕ�?����B���P��_�/�m9��8(L�����r�B�L��e����|��_��׋z��f�~�}��<~�_����l�@��J��5��)Ac��	���I�S�6/8��C}������p=���C�q�R)��]��n}�ލ/1�9fF
$V��f[�ILL�s��u>��\�Y.���q�x��^�E)�,�3U�2�d<26�w\N<}|���UԇzsؤK�I+/[)<vNko�`PZ��.Tb�V\Gޢ�:�;�O�'*@ZP1� �O����/0C�c�>9�,,�Yo4R�H�XGLˤά�&����ui�����)�x�ǻ�O�%�hy|��Я�ʾ!۵<4c�B��c�%PP.���� tҠ %Ri	aZa���@fJ�F�
�4�c�Xp�*���@%�,�;�����1�\
�(�3�S�,phx�.X��n׼��U���]��䌒���\����Xu��G�����T<"�vj�&��7C�b����jp���vJIp*���~Il�Brq��Rv?cVj�8��-�
��BVL��Hy�ώ��CͨX�����y�������J]��!��v�źo�вp�����j�V�j�S呁g���:��y۵�gxН uMQ ���Y��H�V3E�ϑj���]�H9R?'=�~������)����?�f,�:T�O{%�@�Mt&�����#r      �   �  x�m�ۮ�Z���9�5�A�K�GE���&+ ��A��&Mڋ�Lw���ݧW�7��^v�f�������Ƙ�g�P���������~��/7�����щ/]��~�|�VE<��T�5��0�{޽�_�����x��=��.ɠ(��C���i!(������[�xX�x=�j4�%}�F!�3��2H2��b]7n�C'�3�S��G<#�'|��w���jy�ɂ
�W�����LJ�I��|!����� E'����W���k�"�������*� �Z�t�kpU�;z�� �[<�kKUظ�|1�bG�`ß�~~��k/�:��`#�eL�W����M��/��b�މ.iѨI�b�/>*��q�"��=�e�c�"6|���.T�E�p˱����x�P�D�3�����%����*^������7�X�vpjY��Gp����B>@����I�Μ��i�������|��^2���cIQCe+�$��qg�	!'3��&��X��d��XrX��/lu8�w����\%�L�#�,��k��l���V)�ׅXX��!ш�ɈG���	���b�����G�$@8��&F��GdoGlO����Jʅ���7�"���g?qy=���*��[��M���R����P
��̀RgƑ�7
O8W,�Iq(sD�ƿ+���&��
���lWI~/G�7�7�� ),x�V�!��t�����TF�:#��-��%
�z� �]2͗ǸS��_�)��e�%�QsdG6�0��"
M<n�I$3�d,ٝ&��D����n}��w��ڝ]�L�(��'Į�Q�È;6�41@9�YF���vp8�ͪ?�u�C����˻�G�j�^�u������={O�"Ҙ6L�	�<P�$'h��)1?pG���S���j�:��wVJu+GB(��X�g7�>A���������E';q��Њ͖@[���MDS;����jB*���G�^����"N�U���^�_���     