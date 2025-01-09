--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 17.2 (Ubuntu 17.2-1.pgdg20.04+1)

-- Started on 2025-01-09 00:34:17 -03

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
-- TOC entry 215 (class 1259 OID 16391)
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
-- TOC entry 214 (class 1259 OID 16390)
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
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 214
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public.usuario.id;


--
-- TOC entry 227 (class 1259 OID 16501)
-- Name: aula; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.aula (
    id integer NOT NULL,
    descricao character varying
);


ALTER TABLE public.aula OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 16500)
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
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 226
-- Name: aula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.aula_id_seq OWNED BY public.aula.id;


--
-- TOC entry 219 (class 1259 OID 16422)
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
-- TOC entry 218 (class 1259 OID 16421)
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
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 218
-- Name: modulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.modulo_id_seq OWNED BY public.modulo.id;


--
-- TOC entry 229 (class 1259 OID 16522)
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
-- TOC entry 228 (class 1259 OID 16521)
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
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 228
-- Name: modulo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.modulo_usuario_id_seq OWNED BY public.modulo_usuario.id;


--
-- TOC entry 223 (class 1259 OID 16458)
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
-- TOC entry 222 (class 1259 OID 16457)
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
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 222
-- Name: questao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.questao_id_seq OWNED BY public.questao.id;


--
-- TOC entry 221 (class 1259 OID 16441)
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
-- TOC entry 220 (class 1259 OID 16440)
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
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 220
-- Name: teste_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.teste_usuario_id_seq OWNED BY public.teste_usuario.id;


--
-- TOC entry 225 (class 1259 OID 16472)
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
-- TOC entry 224 (class 1259 OID 16471)
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
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 224
-- Name: teste_usuario_questao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.teste_usuario_questao_id_seq OWNED BY public.teste_usuario_questao.id;


--
-- TOC entry 217 (class 1259 OID 16407)
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
-- TOC entry 216 (class 1259 OID 16406)
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
-- TOC entry 3233 (class 2604 OID 16504)
-- Name: aula id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.aula ALTER COLUMN id SET DEFAULT nextval('public.aula_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16425)
-- Name: modulo id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo ALTER COLUMN id SET DEFAULT nextval('public.modulo_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 16525)
-- Name: modulo_usuario id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo_usuario ALTER COLUMN id SET DEFAULT nextval('public.modulo_usuario_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 16461)
-- Name: questao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questao ALTER COLUMN id SET DEFAULT nextval('public.questao_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 16444)
-- Name: teste_usuario id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario ALTER COLUMN id SET DEFAULT nextval('public.teste_usuario_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 16475)
-- Name: teste_usuario_questao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario_questao ALTER COLUMN id SET DEFAULT nextval('public.teste_usuario_questao_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16394)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- TOC entry 3412 (class 0 OID 16501)
-- Dependencies: 227
-- Data for Name: aula; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.aula VALUES (2, 'Módulo 2');
INSERT INTO public.aula VALUES (1, 'Da anatomia cardíaca aos princípios da eletrofisiologia');


--
-- TOC entry 3404 (class 0 OID 16422)
-- Dependencies: 219
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.modulo VALUES (1, 1, 'Anatomia cardíaca', 1, NULL);
INSERT INTO public.modulo VALUES (2, 2, 'Fisiologia cardíaca', 1, NULL);
INSERT INTO public.modulo VALUES (4, 4, 'Sistema de condução', 1, NULL);
INSERT INTO public.modulo VALUES (3, 3, 'Dinâmica cardíaca', 1, NULL);


--
-- TOC entry 3414 (class 0 OID 16522)
-- Dependencies: 229
-- Data for Name: modulo_usuario; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.modulo_usuario VALUES (4, 3, 1, false);
INSERT INTO public.modulo_usuario VALUES (5, 4, 1, false);
INSERT INTO public.modulo_usuario VALUES (3, 2, 1, true);
INSERT INTO public.modulo_usuario VALUES (1, 1, 1, true);


--
-- TOC entry 3408 (class 0 OID 16458)
-- Dependencies: 223
-- Data for Name: questao; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.questao VALUES (1, 'Do lado estoquerdo do tórax', 'Centralizado', 'Do lado direito do tórax', 'N.D.A', NULL, 'a', 1, 'Onde está localizaco o coração?');
INSERT INTO public.questao VALUES (3, 'Tricúspide e Mitral', 'Aórtica e Pulmonar', 'Tricúspide e Pulmonar', 'Aórtica e Mitral', NULL, 'a', 1, 'O coração é formado por dois átrios e dois ventrículo. Quais válvular permitem a comunicação dos átrios com os ventriculos');
INSERT INTO public.questao VALUES (5, 'Átrio Direito', 'Átrio Esquerdo', 'Ventrículo Direito', 'Ventrículo Esquerdo', NULL, 'a', 1, 'Qual estrutura do coração tem maior massa?');
INSERT INTO public.questao VALUES (6, 'Coronárias', 'Cava', 'Jugular', 'Radial', NULL, 'a', 1, 'As artérias que irrigam o coração são as:');
INSERT INTO public.questao VALUES (7, 'C.A - Comunicação Atrial', 'C.I.A - Comunica Intra Atrial', 'C.E.A - Comunicação Endo Atrial', 'C.E.A - Comunicação Entre Átrios', NULL, 'a', 1, 'A situação em que os átrios se comunicam entre si se chama:');
INSERT INTO public.questao VALUES (8, 'C.I.V - Comunicação Intra Ventricular', 'C.V - Comunicação Ventricular', 'C.E.V - Comunicação Endo Ventricular', 'C.E.V - Comunicação Entre Ventrículos ', NULL, 'a', 1, 'A situação em que os ventrículos se comunicam entre si se chama:');
INSERT INTO public.questao VALUES (9, 'Pulmões', 'Diafragma', 'Baço', 'Fígado', NULL, 'a', 1, 'O coração está apoiado sobre qual estrutura?');
INSERT INTO public.questao VALUES (10, 'Pulmonar e Aórtica', 'Tricúspide e Mitral', 'Tricúspide e Aórtica', 'Mitral e Pulmonar', NULL, 'a', 1, ' Também chamadas semilunares, as válvulas:');
INSERT INTO public.questao VALUES (11, 'Aórtica e Pulmonar', 'Aórtica e Mitral', 'Tricúspide e Aórtica', 'Tricúspide e Mitral', NULL, 'a', 2, 'Durante a sístole atrial, quais válvulas estão abertas?');
INSERT INTO public.questao VALUES (12, 'Aórtica e Pulmonar', 'Aórtica e Mitral', 'Tricúspide e Aórtica', 'Tricúspide e Mitral', NULL, 'a', 2, 'Durante a sístole ventricular, quais válvulas estão abertas?');
INSERT INTO public.questao VALUES (13, 'Enviar o Volume para o Átrio Direito', 'Enviar Volume para o Ventrículo Esquerdo', 'Enviar Volume para o Corpo', 'Enviar Volume para os Pulmões', NULL, 'a', 2, 'Qual a função do ventrículo direito?');
INSERT INTO public.questao VALUES (14, 'Enviar Volume para o Átrio Esquerdo', 'Enviar Volume para o Ventrículo Direito', 'Enviar Volume para o Corpo', 'Enviar Volume para os Pulmões', NULL, 'a', 2, 'Qual a função do Ventrículo Esquerdo?');
INSERT INTO public.questao VALUES (4, 'Tricúspide, Mitral, Aórtica e Pulmonar', 'Tricúspide, Aórtica, Mitral e Pulmonar', 'Mitral, Tricúspide, Aórtica e Pulmonar', 'Tricúspide, Pulmonar, Aórtica e Mitral', NULL, 'a', 1, 'Qual a ordem da posição das válvulas do coração?');
INSERT INTO public.questao VALUES (16, 'Ventrículo Esquerdo', 'Ventrículo Direito', 'Átrio Direito', 'Átrio Esquerdo', NULL, 'a', 2, 'O Débito cardíaco é formado principalmente pela ejeção de volume por qual estrutura cardíaca?');
INSERT INTO public.questao VALUES (2, 'Coronária', 'Jugular', 'Radial', 'Cava', NULL, 'a', 1, 'Qual a veia desemboca todo o volume do corpo no coração');
INSERT INTO public.questao VALUES (17, 'Aórtica e Pulmonar', 'Aórtica e Mitral', 'Tricúspide e Aórtica', 'Tricúspide e Mitral', NULL, 'a', 2, 'Quais válvulas devem estar fechadas durante a sístole ventricular?');
INSERT INTO public.questao VALUES (18, 'Aórtica e Pulmonar', 'Aórtica e Mitral', 'Aórtica e Mitral', 'Tricúspide e Mitral', NULL, 'a', 2, 'Quais válvulas devem estar fechadas durante a sístole atrial?');
INSERT INTO public.questao VALUES (19, 'Átrio Direito', 'Átrio Esquerdo', 'Ventrículo Direito', 'Ventrículo Esquerdo', NULL, 'a', 2, 'Qual estrutura do coração é responsável por enviar sangue para todo o corpo?');
INSERT INTO public.questao VALUES (15, 'Dos Pulmões', 'Do Corpo', 'Dos átrios', 'Dos Ventrículos', NULL, 'a', 2, 'Do lado direito do coração o volume chega');


--
-- TOC entry 3406 (class 0 OID 16441)
-- Dependencies: 221
-- Data for Name: teste_usuario; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.teste_usuario VALUES (32, 1, '2024-12-01 23:56:18.205046', 2, false, 1, '2024-12-01 23:56:43.503565');
INSERT INTO public.teste_usuario VALUES (33, 1, '2024-12-01 23:57:51.489369', 2, false, 1, '2024-12-02 00:00:02.70851');
INSERT INTO public.teste_usuario VALUES (34, 1, '2024-12-02 00:01:05.090886', 0, false, 1, '2024-12-02 00:01:26.378887');
INSERT INTO public.teste_usuario VALUES (35, 1, '2024-12-02 00:02:14.987257', 0, false, 1, '2024-12-02 00:03:18.454803');
INSERT INTO public.teste_usuario VALUES (36, 1, '2024-12-02 00:04:46.735123', 2, false, 1, '2024-12-02 00:04:57.049333');
INSERT INTO public.teste_usuario VALUES (37, 1, '2024-12-02 00:05:37.831456', 2, false, 1, '2024-12-02 00:07:26.362219');
INSERT INTO public.teste_usuario VALUES (38, 1, '2024-12-02 01:06:30.812973', 1, false, 1, '2024-12-02 01:06:42.348211');
INSERT INTO public.teste_usuario VALUES (39, 1, '2024-12-02 01:07:14.739638', 1, false, 1, '2024-12-02 01:07:32.461309');
INSERT INTO public.teste_usuario VALUES (40, 1, '2024-12-02 01:09:13.517206', 1, false, 1, '2024-12-02 01:09:18.491188');
INSERT INTO public.teste_usuario VALUES (41, 1, '2024-12-02 01:09:30.15694', 2, false, 1, '2024-12-02 01:09:34.807595');
INSERT INTO public.teste_usuario VALUES (42, 1, '2024-12-02 18:36:00.552875', 0, false, 1, '2024-12-02 18:36:04.484836');
INSERT INTO public.teste_usuario VALUES (47, 1, '2024-12-02 18:57:52.631562', 0, false, 1, '2024-12-02 19:10:53.251259');
INSERT INTO public.teste_usuario VALUES (48, 1, '2024-12-02 19:11:04.799457', 2, false, 1, '2024-12-02 19:11:48.352584');
INSERT INTO public.teste_usuario VALUES (50, NULL, NULL, 0, false, NULL, '2024-12-13 00:21:15.950622');
INSERT INTO public.teste_usuario VALUES (51, NULL, NULL, 0, false, NULL, '2024-12-13 00:21:31.183905');
INSERT INTO public.teste_usuario VALUES (52, NULL, NULL, 0, false, NULL, '2024-12-13 00:25:10.144579');
INSERT INTO public.teste_usuario VALUES (53, NULL, NULL, 0, false, NULL, '2024-12-13 00:26:42.82014');
INSERT INTO public.teste_usuario VALUES (24, 1, '2024-11-26 18:52:05.44939', 0, false, 1, NULL);
INSERT INTO public.teste_usuario VALUES (25, 1, '2024-11-26 18:58:00.676318', 0, false, 1, NULL);
INSERT INTO public.teste_usuario VALUES (26, 1, '2024-12-01 23:12:45.439549', 0, false, 1, NULL);
INSERT INTO public.teste_usuario VALUES (27, 1, '2024-12-01 23:12:54.528956', 0, false, 1, NULL);
INSERT INTO public.teste_usuario VALUES (28, 1, '2024-12-01 23:29:13.542242', 0, false, 1, '2024-12-01 23:29:16.845157');
INSERT INTO public.teste_usuario VALUES (29, 1, '2024-12-01 23:45:53.947053', 0, false, 1, '2024-12-01 23:49:29.933916');
INSERT INTO public.teste_usuario VALUES (30, 1, '2024-12-01 23:52:51.348999', 0, false, 1, '2024-12-01 23:52:54.767106');
INSERT INTO public.teste_usuario VALUES (54, NULL, NULL, 0, false, NULL, '2024-12-13 00:28:02.091979');
INSERT INTO public.teste_usuario VALUES (31, 1, '2024-12-01 23:55:41.591318', 2, false, 1, '2024-12-01 23:55:57.423266');
INSERT INTO public.teste_usuario VALUES (60, 1, '2024-12-13 00:34:50.78125', 1, false, 2, '2024-12-13 00:35:26.134107');
INSERT INTO public.teste_usuario VALUES (61, 1, '2024-12-13 00:35:50.439833', 0, false, 2, '2024-12-13 00:36:03.752718');
INSERT INTO public.teste_usuario VALUES (49, 1, '2024-12-12 23:58:13.654565', 0, false, 1, '2024-12-13 00:36:39.799039');
INSERT INTO public.teste_usuario VALUES (62, 1, '2024-12-13 00:36:58.744384', NULL, true, 4, NULL);
INSERT INTO public.teste_usuario VALUES (63, 1, '2024-12-13 00:38:16.112231', 0, false, 2, '2024-12-13 00:38:21.243439');
INSERT INTO public.teste_usuario VALUES (64, 1, '2024-12-17 18:35:32.004756', 2, false, 1, '2024-12-17 18:35:55.018834');
INSERT INTO public.teste_usuario VALUES (65, 1, '2024-12-17 18:37:35.803874', NULL, true, 1, NULL);


--
-- TOC entry 3410 (class 0 OID 16472)
-- Dependencies: 225
-- Data for Name: teste_usuario_questao; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.teste_usuario_questao VALUES (42, 1, 25, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (41, 2, 25, 'b', 2);
INSERT INTO public.teste_usuario_questao VALUES (43, 1, 25, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (44, 2, 25, 'b', 2);
INSERT INTO public.teste_usuario_questao VALUES (45, 2, 26, 'c', 1);
INSERT INTO public.teste_usuario_questao VALUES (46, 1, 26, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (47, 1, 26, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (48, 2, 26, 'c', 1);
INSERT INTO public.teste_usuario_questao VALUES (50, 2, 27, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (49, 1, 27, 'c', 2);
INSERT INTO public.teste_usuario_questao VALUES (51, 1, 27, 'c', 2);
INSERT INTO public.teste_usuario_questao VALUES (52, 2, 27, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (53, 1, 28, 'b', 1);
INSERT INTO public.teste_usuario_questao VALUES (54, 2, 28, 'c', 2);
INSERT INTO public.teste_usuario_questao VALUES (55, 1, 28, 'b', 1);
INSERT INTO public.teste_usuario_questao VALUES (56, 2, 28, 'c', 2);
INSERT INTO public.teste_usuario_questao VALUES (58, 2, 29, 'c', 1);
INSERT INTO public.teste_usuario_questao VALUES (57, 1, 29, 'b', 2);
INSERT INTO public.teste_usuario_questao VALUES (59, 2, 29, 'c', 1);
INSERT INTO public.teste_usuario_questao VALUES (60, 1, 29, 'b', 2);
INSERT INTO public.teste_usuario_questao VALUES (62, 1, 30, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (61, 2, 30, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (63, 1, 30, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (64, 2, 30, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (65, 1, 31, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (66, 2, 31, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (67, 2, 31, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (68, 1, 31, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (69, 2, 32, 'd', 1);
INSERT INTO public.teste_usuario_questao VALUES (70, 1, 32, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (71, 2, 32, 'd', 1);
INSERT INTO public.teste_usuario_questao VALUES (72, 1, 32, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (74, 2, 33, 'd', 1);
INSERT INTO public.teste_usuario_questao VALUES (73, 1, 33, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (75, 1, 33, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (76, 2, 33, 'd', 1);
INSERT INTO public.teste_usuario_questao VALUES (78, 2, 34, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (77, 1, 34, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (79, 2, 34, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (38, 2, 24, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (37, 1, 24, 'a', 2);
INSERT INTO public.teste_usuario_questao VALUES (39, 1, 24, 'a', 2);
INSERT INTO public.teste_usuario_questao VALUES (40, 2, 24, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (80, 1, 34, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (81, 1, 35, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (82, 2, 35, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (83, 1, 35, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (84, 2, 35, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (156, 9, 64, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (85, 2, 36, 'd', 1);
INSERT INTO public.teste_usuario_questao VALUES (86, 1, 36, 'e', 2);
INSERT INTO public.teste_usuario_questao VALUES (87, 1, 37, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (88, 2, 37, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (89, 1, 38, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (90, 2, 38, 'a', 2);
INSERT INTO public.teste_usuario_questao VALUES (91, 1, 39, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (92, 2, 39, 'a', 2);
INSERT INTO public.teste_usuario_questao VALUES (94, 1, 40, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (93, 2, 40, 'a', 2);
INSERT INTO public.teste_usuario_questao VALUES (96, 1, 41, 'e', 1);
INSERT INTO public.teste_usuario_questao VALUES (95, 2, 41, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (97, 2, 42, 'b', 1);
INSERT INTO public.teste_usuario_questao VALUES (98, 1, 42, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (99, 3, 47, NULL, 3);
INSERT INTO public.teste_usuario_questao VALUES (100, 1, 47, NULL, 2);
INSERT INTO public.teste_usuario_questao VALUES (101, 2, 47, NULL, 1);
INSERT INTO public.teste_usuario_questao VALUES (103, 5, 48, 'b', 1);
INSERT INTO public.teste_usuario_questao VALUES (106, 9, 48, 'a', 2);
INSERT INTO public.teste_usuario_questao VALUES (109, 2, 48, 'b', 3);
INSERT INTO public.teste_usuario_questao VALUES (107, 4, 48, 'a', 4);
INSERT INTO public.teste_usuario_questao VALUES (110, 8, 48, 'b', 5);
INSERT INTO public.teste_usuario_questao VALUES (105, 1, 48, 'd', 6);
INSERT INTO public.teste_usuario_questao VALUES (104, 3, 48, 'c', 7);
INSERT INTO public.teste_usuario_questao VALUES (108, 6, 48, 'b', 8);
INSERT INTO public.teste_usuario_questao VALUES (102, 10, 48, 'c', 9);
INSERT INTO public.teste_usuario_questao VALUES (111, 7, 48, 'b', 10);
INSERT INTO public.teste_usuario_questao VALUES (153, 10, 64, 'b', 2);
INSERT INTO public.teste_usuario_questao VALUES (120, 9, 49, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (112, 7, 49, 'd', 3);
INSERT INTO public.teste_usuario_questao VALUES (121, 1, 49, 'd', 4);
INSERT INTO public.teste_usuario_questao VALUES (115, 4, 49, 'd', 5);
INSERT INTO public.teste_usuario_questao VALUES (119, 6, 49, 'd', 6);
INSERT INTO public.teste_usuario_questao VALUES (116, 5, 49, 'd', 7);
INSERT INTO public.teste_usuario_questao VALUES (114, 10, 49, 'd', 8);
INSERT INTO public.teste_usuario_questao VALUES (117, 2, 49, 'd', 9);
INSERT INTO public.teste_usuario_questao VALUES (113, 8, 49, 'd', 10);
INSERT INTO public.teste_usuario_questao VALUES (118, 3, 49, 'c', 1);
INSERT INTO public.teste_usuario_questao VALUES (125, 12, 60, 'a', 1);
INSERT INTO public.teste_usuario_questao VALUES (126, 16, 60, 'd', 2);
INSERT INTO public.teste_usuario_questao VALUES (127, 19, 60, 'd', 3);
INSERT INTO public.teste_usuario_questao VALUES (124, 14, 60, 'd', 4);
INSERT INTO public.teste_usuario_questao VALUES (122, 15, 60, 'd', 5);
INSERT INTO public.teste_usuario_questao VALUES (123, 13, 60, 'd', 6);
INSERT INTO public.teste_usuario_questao VALUES (130, 18, 60, 'd', 7);
INSERT INTO public.teste_usuario_questao VALUES (128, 11, 60, 'd', 8);
INSERT INTO public.teste_usuario_questao VALUES (129, 17, 60, 'd', 9);
INSERT INTO public.teste_usuario_questao VALUES (139, 14, 61, 'd', 1);
INSERT INTO public.teste_usuario_questao VALUES (137, 18, 61, 'c', 2);
INSERT INTO public.teste_usuario_questao VALUES (132, 13, 61, 'd', 3);
INSERT INTO public.teste_usuario_questao VALUES (134, 15, 61, 'c', 4);
INSERT INTO public.teste_usuario_questao VALUES (135, 17, 61, 'd', 5);
INSERT INTO public.teste_usuario_questao VALUES (133, 11, 61, 'c', 6);
INSERT INTO public.teste_usuario_questao VALUES (136, 19, 61, 'd', 7);
INSERT INTO public.teste_usuario_questao VALUES (138, 12, 61, 'c', 8);
INSERT INTO public.teste_usuario_questao VALUES (131, 16, 61, 'd', 9);
INSERT INTO public.teste_usuario_questao VALUES (140, 12, 63, NULL, 3);
INSERT INTO public.teste_usuario_questao VALUES (141, 15, 63, NULL, 9);
INSERT INTO public.teste_usuario_questao VALUES (142, 14, 63, NULL, 6);
INSERT INTO public.teste_usuario_questao VALUES (143, 19, 63, NULL, 7);
INSERT INTO public.teste_usuario_questao VALUES (144, 11, 63, NULL, 5);
INSERT INTO public.teste_usuario_questao VALUES (145, 18, 63, NULL, 4);
INSERT INTO public.teste_usuario_questao VALUES (147, 17, 63, NULL, 8);
INSERT INTO public.teste_usuario_questao VALUES (148, 13, 63, NULL, 2);
INSERT INTO public.teste_usuario_questao VALUES (146, 16, 63, 'c', 1);
INSERT INTO public.teste_usuario_questao VALUES (154, 1, 64, 'a', 3);
INSERT INTO public.teste_usuario_questao VALUES (149, 3, 64, 'c', 4);
INSERT INTO public.teste_usuario_questao VALUES (150, 7, 64, 'd', 5);
INSERT INTO public.teste_usuario_questao VALUES (158, 8, 64, 'b', 6);
INSERT INTO public.teste_usuario_questao VALUES (155, 4, 64, 'd', 7);
INSERT INTO public.teste_usuario_questao VALUES (157, 5, 64, 'b', 8);
INSERT INTO public.teste_usuario_questao VALUES (152, 2, 64, 'c', 9);
INSERT INTO public.teste_usuario_questao VALUES (151, 6, 64, 'd', 10);
INSERT INTO public.teste_usuario_questao VALUES (159, 1, 65, NULL, 9);
INSERT INTO public.teste_usuario_questao VALUES (160, 2, 65, NULL, 1);
INSERT INTO public.teste_usuario_questao VALUES (161, 6, 65, NULL, 6);
INSERT INTO public.teste_usuario_questao VALUES (162, 10, 65, NULL, 3);
INSERT INTO public.teste_usuario_questao VALUES (163, 3, 65, NULL, 7);
INSERT INTO public.teste_usuario_questao VALUES (164, 9, 65, NULL, 4);
INSERT INTO public.teste_usuario_questao VALUES (165, 7, 65, NULL, 2);
INSERT INTO public.teste_usuario_questao VALUES (166, 4, 65, NULL, 5);
INSERT INTO public.teste_usuario_questao VALUES (167, 8, 65, NULL, 8);
INSERT INTO public.teste_usuario_questao VALUES (168, 5, 65, NULL, 10);


--
-- TOC entry 3400 (class 0 OID 16391)
-- Dependencies: 215
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.usuario VALUES ('enrique', 1, '$2a$12$tg5IMeMBaUcqFA02QKuwde6ytFEOCGUR2ZZe8kr1GdaEQ1vUnVY5W', 'teste');


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 214
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 226
-- Name: aula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.aula_id_seq', 2, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 218
-- Name: modulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.modulo_id_seq', 2, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 228
-- Name: modulo_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.modulo_usuario_id_seq', 2, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 222
-- Name: questao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.questao_id_seq', 2, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 220
-- Name: teste_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.teste_usuario_id_seq', 65, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 224
-- Name: teste_usuario_questao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.teste_usuario_questao_id_seq', 168, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_seq', 1, false);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.usuario_seq', 1, false);


--
-- TOC entry 3236 (class 2606 OID 16398)
-- Name: usuario User_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 16508)
-- Name: aula aula_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.aula
    ADD CONSTRAINT aula_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 16427)
-- Name: modulo modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT modulo_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 16527)
-- Name: modulo_usuario modulo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo_usuario
    ADD CONSTRAINT modulo_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 16465)
-- Name: questao questao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT questao_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 16446)
-- Name: teste_usuario teste_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario
    ADD CONSTRAINT teste_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 16479)
-- Name: teste_usuario_questao teste_usuario_questao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario_questao
    ADD CONSTRAINT teste_usuario_questao_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 16528)
-- Name: modulo_usuario fk_modulo; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo_usuario
    ADD CONSTRAINT fk_modulo FOREIGN KEY (modulo) REFERENCES public.modulo(id) ON DELETE CASCADE;


--
-- TOC entry 3249 (class 2606 OID 16509)
-- Name: modulo fk_modulo_aula; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT fk_modulo_aula FOREIGN KEY (aula) REFERENCES public.aula(id);


--
-- TOC entry 3256 (class 2606 OID 16533)
-- Name: modulo_usuario fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modulo_usuario
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 3252 (class 2606 OID 16490)
-- Name: questao questao_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT questao_modulo_fk FOREIGN KEY (modulo_id) REFERENCES public.modulo(id);


--
-- TOC entry 3250 (class 2606 OID 16495)
-- Name: teste_usuario teste_modulo_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario
    ADD CONSTRAINT teste_modulo_fk FOREIGN KEY (modulo_id) REFERENCES public.modulo(id);


--
-- TOC entry 3251 (class 2606 OID 16447)
-- Name: teste_usuario teste_usuario_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario
    ADD CONSTRAINT teste_usuario_usuario_fk FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 3253 (class 2606 OID 16485)
-- Name: teste_usuario_questao tuq_questao_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario_questao
    ADD CONSTRAINT tuq_questao_fk FOREIGN KEY (questao_id) REFERENCES public.questao(id);


--
-- TOC entry 3254 (class 2606 OID 16480)
-- Name: teste_usuario_questao tuq_tu_fk; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.teste_usuario_questao
    ADD CONSTRAINT tuq_tu_fk FOREIGN KEY (teste_usuario_id) REFERENCES public.teste_usuario(id);


-- Completed on 2025-01-09 00:34:17 -03

--
-- PostgreSQL database dump complete
--

