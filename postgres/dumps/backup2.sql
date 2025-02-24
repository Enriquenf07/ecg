--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 17.2 (Ubuntu 17.2-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.usuario (
    login character varying(255) NOT NULL,
    id integer NOT NULL,
    senha character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO root;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO root;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public.usuario.id;


--
-- Name: aula; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.aula (
    id integer NOT NULL,
    descricao character varying
);


ALTER TABLE public.aula OWNER TO root;

--
-- Name: aula_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.aula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aula_id_seq OWNER TO root;

--
-- Name: aula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.aula_id_seq OWNED BY public.aula.id;


--
-- Name: modulo; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.modulo (
    id integer NOT NULL,
    numero integer NOT NULL,
    nome character varying(255),
    aula integer,
    concluido boolean
);


ALTER TABLE public.modulo OWNER TO root;

--
-- Name: modulo_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.modulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulo_id_seq OWNER TO root;

--
-- Name: modulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.modulo_id_seq OWNED BY public.modulo.id;


--
-- Name: modulo_usuario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.modulo_usuario (
    id integer NOT NULL,
    modulo integer,
    usuario integer,
    concluido boolean
);


ALTER TABLE public.modulo_usuario OWNER TO root;

--
-- Name: modulo_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.modulo_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulo_usuario_id_seq OWNER TO root;

--
-- Name: modulo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.modulo_usuario_id_seq OWNED BY public.modulo_usuario.id;


--
-- Name: questao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.questao (
    id integer NOT NULL,
    a character varying(255),
    b character varying(255),
    c character varying(255),
    d character varying(255),
    e character varying(255),
    resposta character varying(255),
    modulo_id integer,
    enunciado character varying
);


ALTER TABLE public.questao OWNER TO root;

--
-- Name: questao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.questao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questao_id_seq OWNER TO root;

--
-- Name: questao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.questao_id_seq OWNED BY public.questao.id;


--
-- Name: teste_usuario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.teste_usuario (
    id integer NOT NULL,
    usuario_id integer,
    data_hora timestamp without time zone,
    acertadas integer,
    em_andamento boolean,
    modulo_id integer,
    hora_encerramento timestamp without time zone
);


ALTER TABLE public.teste_usuario OWNER TO root;

--
-- Name: teste_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.teste_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teste_usuario_id_seq OWNER TO root;

--
-- Name: teste_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.teste_usuario_id_seq OWNED BY public.teste_usuario.id;


--
-- Name: teste_usuario_questao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.teste_usuario_questao (
    id integer NOT NULL,
    questao_id integer,
    teste_usuario_id integer,
    resposta character varying,
    numero integer
);


ALTER TABLE public.teste_usuario_questao OWNER TO root;

--
-- Name: teste_usuario_questao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.teste_usuario_questao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teste_usuario_questao_id_seq OWNER TO root;

--
-- Name: teste_usuario_questao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.teste_usuario_questao_id_seq OWNED BY public.teste_usuario_questao.id;


--
-- Name: user_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_seq OWNER TO root;

--
-- Name: usuario_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.usuario_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_seq OWNER TO root;

--
-- Name: aula id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.aula ALTER COLUMN id SET DEFAULT nextval('public.aula_id_seq'::regclass);


--
-- Name: modulo id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo ALTER COLUMN id SET DEFAULT nextval('public.modulo_id_seq'::regclass);


--
-- Name: modulo_usuario id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo_usuario ALTER COLUMN id SET DEFAULT nextval('public.modulo_usuario_id_seq'::regclass);


--
-- Name: questao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questao ALTER COLUMN id SET DEFAULT nextval('public.questao_id_seq'::regclass);


--
-- Name: teste_usuario id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario ALTER COLUMN id SET DEFAULT nextval('public.teste_usuario_id_seq'::regclass);


--
-- Name: teste_usuario_questao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario_questao ALTER COLUMN id SET DEFAULT nextval('public.teste_usuario_questao_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: aula; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.aula (id, descricao) FROM stdin;
2	Módulo 2
1	Da anatomia cardíaca aos princípios da eletrofisiologia
\.


--
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.modulo (id, numero, nome, aula, concluido) FROM stdin;
1	1	Anatomia cardíaca	1	\N
2	2	Fisiologia cardíaca	1	\N
4	4	Sistema de condução	1	\N
3	3	Dinâmica cardíaca	1	\N
\.


--
-- Data for Name: modulo_usuario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.modulo_usuario (id, modulo, usuario, concluido) FROM stdin;
4	3	1	f
5	4	1	f
3	2	1	t
1	1	1	t
\.


--
-- Data for Name: questao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.questao (id, a, b, c, d, e, resposta, modulo_id, enunciado) FROM stdin;
1	Do lado estoquerdo do tórax	Centralizado	Do lado direito do tórax	N.D.A	\N	a	1	Onde está localizaco o coração?
3	Tricúspide e Mitral	Aórtica e Pulmonar	Tricúspide e Pulmonar	Aórtica e Mitral	\N	a	1	O coração é formado por dois átrios e dois ventrículo. Quais válvular permitem a comunicação dos átrios com os ventriculos
5	Átrio Direito	Átrio Esquerdo	Ventrículo Direito	Ventrículo Esquerdo	\N	a	1	Qual estrutura do coração tem maior massa?
6	Coronárias	Cava	Jugular	Radial	\N	a	1	As artérias que irrigam o coração são as:
7	C.A - Comunicação Atrial	C.I.A - Comunica Intra Atrial	C.E.A - Comunicação Endo Atrial	C.E.A - Comunicação Entre Átrios	\N	a	1	A situação em que os átrios se comunicam entre si se chama:
8	C.I.V - Comunicação Intra Ventricular	C.V - Comunicação Ventricular	C.E.V - Comunicação Endo Ventricular	C.E.V - Comunicação Entre Ventrículos 	\N	a	1	A situação em que os ventrículos se comunicam entre si se chama:
9	Pulmões	Diafragma	Baço	Fígado	\N	a	1	O coração está apoiado sobre qual estrutura?
10	Pulmonar e Aórtica	Tricúspide e Mitral	Tricúspide e Aórtica	Mitral e Pulmonar	\N	a	1	 Também chamadas semilunares, as válvulas:
11	Aórtica e Pulmonar	Aórtica e Mitral	Tricúspide e Aórtica	Tricúspide e Mitral	\N	a	2	Durante a sístole atrial, quais válvulas estão abertas?
12	Aórtica e Pulmonar	Aórtica e Mitral	Tricúspide e Aórtica	Tricúspide e Mitral	\N	a	2	Durante a sístole ventricular, quais válvulas estão abertas?
13	Enviar o Volume para o Átrio Direito	Enviar Volume para o Ventrículo Esquerdo	Enviar Volume para o Corpo	Enviar Volume para os Pulmões	\N	a	2	Qual a função do ventrículo direito?
14	Enviar Volume para o Átrio Esquerdo	Enviar Volume para o Ventrículo Direito	Enviar Volume para o Corpo	Enviar Volume para os Pulmões	\N	a	2	Qual a função do Ventrículo Esquerdo?
4	Tricúspide, Mitral, Aórtica e Pulmonar	Tricúspide, Aórtica, Mitral e Pulmonar	Mitral, Tricúspide, Aórtica e Pulmonar	Tricúspide, Pulmonar, Aórtica e Mitral	\N	a	1	Qual a ordem da posição das válvulas do coração?
16	Ventrículo Esquerdo	Ventrículo Direito	Átrio Direito	Átrio Esquerdo	\N	a	2	O Débito cardíaco é formado principalmente pela ejeção de volume por qual estrutura cardíaca?
2	Coronária	Jugular	Radial	Cava	\N	a	1	Qual a veia desemboca todo o volume do corpo no coração
17	Aórtica e Pulmonar	Aórtica e Mitral	Tricúspide e Aórtica	Tricúspide e Mitral	\N	a	2	Quais válvulas devem estar fechadas durante a sístole ventricular?
18	Aórtica e Pulmonar	Aórtica e Mitral	Aórtica e Mitral	Tricúspide e Mitral	\N	a	2	Quais válvulas devem estar fechadas durante a sístole atrial?
19	Átrio Direito	Átrio Esquerdo	Ventrículo Direito	Ventrículo Esquerdo	\N	a	2	Qual estrutura do coração é responsável por enviar sangue para todo o corpo?
15	Dos Pulmões	Do Corpo	Dos átrios	Dos Ventrículos	\N	a	2	Do lado direito do coração o volume chega
\.


--
-- Data for Name: teste_usuario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.teste_usuario (id, usuario_id, data_hora, acertadas, em_andamento, modulo_id, hora_encerramento) FROM stdin;
32	1	2024-12-01 23:56:18.205046	2	f	1	2024-12-01 23:56:43.503565
33	1	2024-12-01 23:57:51.489369	2	f	1	2024-12-02 00:00:02.70851
34	1	2024-12-02 00:01:05.090886	0	f	1	2024-12-02 00:01:26.378887
35	1	2024-12-02 00:02:14.987257	0	f	1	2024-12-02 00:03:18.454803
36	1	2024-12-02 00:04:46.735123	2	f	1	2024-12-02 00:04:57.049333
37	1	2024-12-02 00:05:37.831456	2	f	1	2024-12-02 00:07:26.362219
38	1	2024-12-02 01:06:30.812973	1	f	1	2024-12-02 01:06:42.348211
39	1	2024-12-02 01:07:14.739638	1	f	1	2024-12-02 01:07:32.461309
40	1	2024-12-02 01:09:13.517206	1	f	1	2024-12-02 01:09:18.491188
41	1	2024-12-02 01:09:30.15694	2	f	1	2024-12-02 01:09:34.807595
42	1	2024-12-02 18:36:00.552875	0	f	1	2024-12-02 18:36:04.484836
47	1	2024-12-02 18:57:52.631562	0	f	1	2024-12-02 19:10:53.251259
48	1	2024-12-02 19:11:04.799457	2	f	1	2024-12-02 19:11:48.352584
50	\N	\N	0	f	\N	2024-12-13 00:21:15.950622
51	\N	\N	0	f	\N	2024-12-13 00:21:31.183905
52	\N	\N	0	f	\N	2024-12-13 00:25:10.144579
53	\N	\N	0	f	\N	2024-12-13 00:26:42.82014
24	1	2024-11-26 18:52:05.44939	0	f	1	\N
25	1	2024-11-26 18:58:00.676318	0	f	1	\N
26	1	2024-12-01 23:12:45.439549	0	f	1	\N
27	1	2024-12-01 23:12:54.528956	0	f	1	\N
28	1	2024-12-01 23:29:13.542242	0	f	1	2024-12-01 23:29:16.845157
29	1	2024-12-01 23:45:53.947053	0	f	1	2024-12-01 23:49:29.933916
30	1	2024-12-01 23:52:51.348999	0	f	1	2024-12-01 23:52:54.767106
54	\N	\N	0	f	\N	2024-12-13 00:28:02.091979
31	1	2024-12-01 23:55:41.591318	2	f	1	2024-12-01 23:55:57.423266
60	1	2024-12-13 00:34:50.78125	1	f	2	2024-12-13 00:35:26.134107
61	1	2024-12-13 00:35:50.439833	0	f	2	2024-12-13 00:36:03.752718
49	1	2024-12-12 23:58:13.654565	0	f	1	2024-12-13 00:36:39.799039
62	1	2024-12-13 00:36:58.744384	\N	t	4	\N
63	1	2024-12-13 00:38:16.112231	0	f	2	2024-12-13 00:38:21.243439
64	1	2024-12-17 18:35:32.004756	2	f	1	2024-12-17 18:35:55.018834
65	1	2024-12-17 18:37:35.803874	\N	t	1	\N
\.


--
-- Data for Name: teste_usuario_questao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.teste_usuario_questao (id, questao_id, teste_usuario_id, resposta, numero) FROM stdin;
42	1	25	a	1
41	2	25	b	2
43	1	25	a	1
44	2	25	b	2
45	2	26	c	1
46	1	26	e	2
47	1	26	e	2
48	2	26	c	1
50	2	27	a	1
49	1	27	c	2
51	1	27	c	2
52	2	27	a	1
53	1	28	b	1
54	2	28	c	2
55	1	28	b	1
56	2	28	c	2
58	2	29	c	1
57	1	29	b	2
59	2	29	c	1
60	1	29	b	2
62	1	30	e	1
61	2	30	d	2
63	1	30	e	1
64	2	30	d	2
65	1	31	e	1
66	2	31	d	2
67	2	31	d	2
68	1	31	e	1
69	2	32	d	1
70	1	32	e	2
71	2	32	d	1
72	1	32	e	2
74	2	33	d	1
73	1	33	e	2
75	1	33	e	2
76	2	33	d	1
78	2	34	e	1
77	1	34	d	2
79	2	34	e	1
38	2	24	a	1
37	1	24	a	2
39	1	24	a	2
40	2	24	a	1
80	1	34	d	2
81	1	35	a	1
82	2	35	e	2
83	1	35	a	1
84	2	35	e	2
156	9	64	a	1
85	2	36	d	1
86	1	36	e	2
87	1	37	e	1
88	2	37	d	2
89	1	38	e	1
90	2	38	a	2
91	1	39	e	1
92	2	39	a	2
94	1	40	e	1
93	2	40	a	2
96	1	41	e	1
95	2	41	d	2
97	2	42	b	1
98	1	42	d	2
99	3	47	\N	3
100	1	47	\N	2
101	2	47	\N	1
103	5	48	b	1
106	9	48	a	2
109	2	48	b	3
107	4	48	a	4
110	8	48	b	5
105	1	48	d	6
104	3	48	c	7
108	6	48	b	8
102	10	48	c	9
111	7	48	b	10
153	10	64	b	2
120	9	49	d	2
112	7	49	d	3
121	1	49	d	4
115	4	49	d	5
119	6	49	d	6
116	5	49	d	7
114	10	49	d	8
117	2	49	d	9
113	8	49	d	10
118	3	49	c	1
125	12	60	a	1
126	16	60	d	2
127	19	60	d	3
124	14	60	d	4
122	15	60	d	5
123	13	60	d	6
130	18	60	d	7
128	11	60	d	8
129	17	60	d	9
139	14	61	d	1
137	18	61	c	2
132	13	61	d	3
134	15	61	c	4
135	17	61	d	5
133	11	61	c	6
136	19	61	d	7
138	12	61	c	8
131	16	61	d	9
140	12	63	\N	3
141	15	63	\N	9
142	14	63	\N	6
143	19	63	\N	7
144	11	63	\N	5
145	18	63	\N	4
147	17	63	\N	8
148	13	63	\N	2
146	16	63	c	1
154	1	64	a	3
149	3	64	c	4
150	7	64	d	5
158	8	64	b	6
155	4	64	d	7
157	5	64	b	8
152	2	64	c	9
151	6	64	d	10
159	1	65	\N	9
160	2	65	\N	1
161	6	65	\N	6
162	10	65	\N	3
163	3	65	\N	7
164	9	65	\N	4
165	7	65	\N	2
166	4	65	\N	5
167	8	65	\N	8
168	5	65	\N	10
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.usuario (login, id, senha, email) FROM stdin;
enrique	1	$2a$12$tg5IMeMBaUcqFA02QKuwde6ytFEOCGUR2ZZe8kr1GdaEQ1vUnVY5W	teste
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- Name: aula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.aula_id_seq', 2, true);


--
-- Name: modulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.modulo_id_seq', 2, true);


--
-- Name: modulo_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.modulo_usuario_id_seq', 2, true);


--
-- Name: questao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.questao_id_seq', 2, true);


--
-- Name: teste_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.teste_usuario_id_seq', 65, true);


--
-- Name: teste_usuario_questao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.teste_usuario_questao_id_seq', 168, true);


--
-- Name: user_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_seq', 1, false);


--
-- Name: usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.usuario_seq', 1, false);


--
-- Name: usuario User_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: aula aula_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.aula
    ADD CONSTRAINT aula_pkey PRIMARY KEY (id);


--
-- Name: modulo modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT modulo_pkey PRIMARY KEY (id);


--
-- Name: modulo_usuario modulo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo_usuario
    ADD CONSTRAINT modulo_usuario_pkey PRIMARY KEY (id);


--
-- Name: questao questao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT questao_pkey PRIMARY KEY (id);


--
-- Name: teste_usuario teste_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario
    ADD CONSTRAINT teste_usuario_pkey PRIMARY KEY (id);


--
-- Name: teste_usuario_questao teste_usuario_questao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario_questao
    ADD CONSTRAINT teste_usuario_questao_pkey PRIMARY KEY (id);


--
-- Name: modulo_usuario fk_modulo; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo_usuario
    ADD CONSTRAINT fk_modulo FOREIGN KEY (modulo) REFERENCES public.modulo(id) ON DELETE CASCADE;


--
-- Name: modulo fk_modulo_aula; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT fk_modulo_aula FOREIGN KEY (aula) REFERENCES public.aula(id);


--
-- Name: modulo_usuario fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo_usuario
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- Name: questao questao_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT questao_modulo_fk FOREIGN KEY (modulo_id) REFERENCES public.modulo(id);


--
-- Name: teste_usuario teste_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario
    ADD CONSTRAINT teste_modulo_fk FOREIGN KEY (modulo_id) REFERENCES public.modulo(id);


--
-- Name: teste_usuario teste_usuario_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario
    ADD CONSTRAINT teste_usuario_usuario_fk FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: teste_usuario_questao tuq_questao_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario_questao
    ADD CONSTRAINT tuq_questao_fk FOREIGN KEY (questao_id) REFERENCES public.questao(id);


--
-- Name: teste_usuario_questao tuq_tu_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario_questao
    ADD CONSTRAINT tuq_tu_fk FOREIGN KEY (teste_usuario_id) REFERENCES public.teste_usuario(id);


--
-- PostgreSQL database dump complete
--

