INSERT INTO public.aula (descricao) VALUES
	 ('Módulo 2'),
	 ('Da anatomia cardíaca aos princípios da eletrofisiologia');
INSERT INTO public.modulo (numero,nome,aula,concluido) VALUES
	 (1,'Anatomia cardíaca',1,NULL),
	 (2,'Fisiologia cardíaca',1,NULL),
	 (4,'Sistema de condução',1,NULL),
	 (3,'Dinâmica cardíaca',1,NULL);
INSERT INTO public.modulo_usuario (modulo,usuario,concluido) VALUES
	 (3,1,false),
	 (4,1,false),
	 (2,1,true),
	 (1,1,true);
INSERT INTO public.questao (a,b,c,d,e,resposta,modulo_id,enunciado) VALUES
	 ('Do lado estoquerdo do tórax','Centralizado','Do lado direito do tórax','N.D.A',NULL,'a',1,'Onde está localizaco o coração?'),
	 ('Tricúspide e Mitral','Aórtica e Pulmonar','Tricúspide e Pulmonar','Aórtica e Mitral',NULL,'a',1,'O coração é formado por dois átrios e dois ventrículo. Quais válvular permitem a comunicação dos átrios com os ventriculos'),
	 ('Átrio Direito','Átrio Esquerdo','Ventrículo Direito','Ventrículo Esquerdo',NULL,'a',1,'Qual estrutura do coração tem maior massa?'),
	 ('Coronárias','Cava','Jugular','Radial',NULL,'a',1,'As artérias que irrigam o coração são as:'),
	 ('C.A - Comunicação Atrial','C.I.A - Comunica Intra Atrial','C.E.A - Comunicação Endo Atrial','C.E.A - Comunicação Entre Átrios',NULL,'a',1,'A situação em que os átrios se comunicam entre si se chama:'),
	 ('C.I.V - Comunicação Intra Ventricular','C.V - Comunicação Ventricular','C.E.V - Comunicação Endo Ventricular','C.E.V - Comunicação Entre Ventrículos ',NULL,'a',1,'A situação em que os ventrículos se comunicam entre si se chama:'),
	 ('Pulmões','Diafragma','Baço','Fígado',NULL,'a',1,'O coração está apoiado sobre qual estrutura?'),
	 ('Pulmonar e Aórtica','Tricúspide e Mitral','Tricúspide e Aórtica','Mitral e Pulmonar',NULL,'a',1,' Também chamadas semilunares, as válvulas:'),
	 ('Aórtica e Pulmonar','Aórtica e Mitral','Tricúspide e Aórtica','Tricúspide e Mitral',NULL,'a',2,'Durante a sístole atrial, quais válvulas estão abertas?'),
	 ('Aórtica e Pulmonar','Aórtica e Mitral','Tricúspide e Aórtica','Tricúspide e Mitral',NULL,'a',2,'Durante a sístole ventricular, quais válvulas estão abertas?');
INSERT INTO public.questao (a,b,c,d,e,resposta,modulo_id,enunciado) VALUES
	 ('Enviar o Volume para o Átrio Direito','Enviar Volume para o Ventrículo Esquerdo','Enviar Volume para o Corpo','Enviar Volume para os Pulmões',NULL,'a',2,'Qual a função do ventrículo direito?'),
	 ('Enviar Volume para o Átrio Esquerdo','Enviar Volume para o Ventrículo Direito','Enviar Volume para o Corpo','Enviar Volume para os Pulmões',NULL,'a',2,'Qual a função do Ventrículo Esquerdo?'),
	 ('Tricúspide, Mitral, Aórtica e Pulmonar','Tricúspide, Aórtica, Mitral e Pulmonar','Mitral, Tricúspide, Aórtica e Pulmonar','Tricúspide, Pulmonar, Aórtica e Mitral',NULL,'a',1,'Qual a ordem da posição das válvulas do coração?'),
	 ('Ventrículo Esquerdo','Ventrículo Direito','Átrio Direito','Átrio Esquerdo',NULL,'a',2,'O Débito cardíaco é formado principalmente pela ejeção de volume por qual estrutura cardíaca?'),
	 ('Coronária','Jugular','Radial','Cava',NULL,'a',1,'Qual a veia desemboca todo o volume do corpo no coração'),
	 ('Aórtica e Pulmonar','Aórtica e Mitral','Tricúspide e Aórtica','Tricúspide e Mitral',NULL,'a',2,'Quais válvulas devem estar fechadas durante a sístole ventricular?'),
	 ('Aórtica e Pulmonar','Aórtica e Mitral','Aórtica e Mitral','Tricúspide e Mitral',NULL,'a',2,'Quais válvulas devem estar fechadas durante a sístole atrial?'),
	 ('Átrio Direito','Átrio Esquerdo','Ventrículo Direito','Ventrículo Esquerdo',NULL,'a',2,'Qual estrutura do coração é responsável por enviar sangue para todo o corpo?'),
	 ('Dos Pulmões','Do Corpo','Dos átrios','Dos Ventrículos',NULL,'a',2,'Do lado direito do coração o volume chega');
INSERT INTO public.teste_usuario (usuario_id,data_hora,acertadas,em_andamento,modulo_id,hora_encerramento) VALUES
	 (1,'2024-12-01 23:56:18.205046',2,false,1,'2024-12-01 23:56:43.503565'),
	 (1,'2024-12-01 23:57:51.489369',2,false,1,'2024-12-02 00:00:02.70851'),
	 (1,'2024-12-02 00:01:05.090886',0,false,1,'2024-12-02 00:01:26.378887'),
	 (1,'2024-12-02 00:02:14.987257',0,false,1,'2024-12-02 00:03:18.454803'),
	 (1,'2024-12-02 00:04:46.735123',2,false,1,'2024-12-02 00:04:57.049333'),
	 (1,'2024-12-02 00:05:37.831456',2,false,1,'2024-12-02 00:07:26.362219'),
	 (1,'2024-12-02 01:06:30.812973',1,false,1,'2024-12-02 01:06:42.348211'),
	 (1,'2024-12-02 01:07:14.739638',1,false,1,'2024-12-02 01:07:32.461309'),
	 (1,'2024-12-02 01:09:13.517206',1,false,1,'2024-12-02 01:09:18.491188'),
	 (1,'2024-12-02 01:09:30.15694',2,false,1,'2024-12-02 01:09:34.807595');
INSERT INTO public.teste_usuario (usuario_id,data_hora,acertadas,em_andamento,modulo_id,hora_encerramento) VALUES
	 (1,'2024-12-02 18:36:00.552875',0,false,1,'2024-12-02 18:36:04.484836'),
	 (1,'2024-12-02 18:57:52.631562',0,false,1,'2024-12-02 19:10:53.251259'),
	 (1,'2024-12-02 19:11:04.799457',2,false,1,'2024-12-02 19:11:48.352584'),
	 (NULL,NULL,0,false,NULL,'2024-12-13 00:21:15.950622'),
	 (NULL,NULL,0,false,NULL,'2024-12-13 00:21:31.183905'),
	 (NULL,NULL,0,false,NULL,'2024-12-13 00:25:10.144579'),
	 (NULL,NULL,0,false,NULL,'2024-12-13 00:26:42.82014'),
	 (1,'2024-11-26 18:52:05.44939',0,false,1,NULL),
	 (1,'2024-11-26 18:58:00.676318',0,false,1,NULL),
	 (1,'2024-12-01 23:12:45.439549',0,false,1,NULL);
INSERT INTO public.teste_usuario (usuario_id,data_hora,acertadas,em_andamento,modulo_id,hora_encerramento) VALUES
	 (1,'2024-12-01 23:12:54.528956',0,false,1,NULL),
	 (1,'2024-12-01 23:29:13.542242',0,false,1,'2024-12-01 23:29:16.845157'),
	 (1,'2024-12-01 23:45:53.947053',0,false,1,'2024-12-01 23:49:29.933916'),
	 (1,'2024-12-01 23:52:51.348999',0,false,1,'2024-12-01 23:52:54.767106'),
	 (NULL,NULL,0,false,NULL,'2024-12-13 00:28:02.091979'),
	 (1,'2024-12-01 23:55:41.591318',2,false,1,'2024-12-01 23:55:57.423266'),
	 (1,'2024-12-13 00:34:50.78125',1,false,2,'2024-12-13 00:35:26.134107'),
	 (1,'2024-12-13 00:35:50.439833',0,false,2,'2024-12-13 00:36:03.752718'),
	 (1,'2024-12-12 23:58:13.654565',0,false,1,'2024-12-13 00:36:39.799039'),
	 (1,'2024-12-13 00:36:58.744384',NULL,true,4,NULL);
INSERT INTO public.teste_usuario (usuario_id,data_hora,acertadas,em_andamento,modulo_id,hora_encerramento) VALUES
	 (1,'2024-12-13 00:38:16.112231',0,false,2,'2024-12-13 00:38:21.243439'),
	 (1,'2024-12-17 18:35:32.004756',2,false,1,'2024-12-17 18:35:55.018834'),
	 (1,'2024-12-17 18:37:35.803874',NULL,true,1,NULL);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (1,25,'a',1),
	 (2,25,'b',2),
	 (1,25,'a',1),
	 (2,25,'b',2),
	 (2,26,'c',1),
	 (1,26,'e',2),
	 (1,26,'e',2),
	 (2,26,'c',1),
	 (2,27,'a',1),
	 (1,27,'c',2);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (1,27,'c',2),
	 (2,27,'a',1),
	 (1,28,'b',1),
	 (2,28,'c',2),
	 (1,28,'b',1),
	 (2,28,'c',2),
	 (2,29,'c',1),
	 (1,29,'b',2),
	 (2,29,'c',1),
	 (1,29,'b',2);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (1,30,'e',1),
	 (2,30,'d',2),
	 (1,30,'e',1),
	 (2,30,'d',2),
	 (1,31,'e',1),
	 (2,31,'d',2),
	 (2,31,'d',2),
	 (1,31,'e',1),
	 (2,32,'d',1),
	 (1,32,'e',2);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (2,32,'d',1),
	 (1,32,'e',2),
	 (2,33,'d',1),
	 (1,33,'e',2),
	 (1,33,'e',2),
	 (2,33,'d',1),
	 (2,34,'e',1),
	 (1,34,'d',2),
	 (2,34,'e',1),
	 (2,24,'a',1);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (1,24,'a',2),
	 (1,24,'a',2),
	 (2,24,'a',1),
	 (1,34,'d',2),
	 (1,35,'a',1),
	 (2,35,'e',2),
	 (1,35,'a',1),
	 (2,35,'e',2),
	 (9,64,'a',1),
	 (2,36,'d',1);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (1,36,'e',2),
	 (1,37,'e',1),
	 (2,37,'d',2),
	 (1,38,'e',1),
	 (2,38,'a',2),
	 (1,39,'e',1),
	 (2,39,'a',2),
	 (1,40,'e',1),
	 (2,40,'a',2),
	 (1,41,'e',1);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (2,41,'d',2),
	 (2,42,'b',1),
	 (1,42,'d',2),
	 (3,47,NULL,3),
	 (1,47,NULL,2),
	 (2,47,NULL,1),
	 (5,48,'b',1),
	 (9,48,'a',2),
	 (2,48,'b',3),
	 (4,48,'a',4);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (8,48,'b',5),
	 (1,48,'d',6),
	 (3,48,'c',7),
	 (6,48,'b',8),
	 (10,48,'c',9),
	 (7,48,'b',10),
	 (10,64,'b',2),
	 (9,49,'d',2),
	 (7,49,'d',3),
	 (1,49,'d',4);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (4,49,'d',5),
	 (6,49,'d',6),
	 (5,49,'d',7),
	 (10,49,'d',8),
	 (2,49,'d',9),
	 (8,49,'d',10),
	 (3,49,'c',1),
	 (12,60,'a',1),
	 (16,60,'d',2),
	 (19,60,'d',3);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (14,60,'d',4),
	 (15,60,'d',5),
	 (13,60,'d',6),
	 (18,60,'d',7),
	 (11,60,'d',8),
	 (17,60,'d',9),
	 (14,61,'d',1),
	 (18,61,'c',2),
	 (13,61,'d',3),
	 (15,61,'c',4);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (17,61,'d',5),
	 (11,61,'c',6),
	 (19,61,'d',7),
	 (12,61,'c',8),
	 (16,61,'d',9),
	 (12,63,NULL,3),
	 (15,63,NULL,9),
	 (14,63,NULL,6),
	 (19,63,NULL,7),
	 (11,63,NULL,5);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (18,63,NULL,4),
	 (17,63,NULL,8),
	 (13,63,NULL,2),
	 (16,63,'c',1),
	 (1,64,'a',3),
	 (3,64,'c',4),
	 (7,64,'d',5),
	 (8,64,'b',6),
	 (4,64,'d',7),
	 (5,64,'b',8);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (2,64,'c',9),
	 (6,64,'d',10),
	 (1,65,NULL,9),
	 (2,65,NULL,1),
	 (6,65,NULL,6),
	 (10,65,NULL,3),
	 (3,65,NULL,7),
	 (9,65,NULL,4),
	 (7,65,NULL,2),
	 (4,65,NULL,5);
INSERT INTO public.teste_usuario_questao (questao_id,teste_usuario_id,resposta,numero) VALUES
	 (8,65,NULL,8),
	 (5,65,NULL,10);
INSERT INTO public.usuario (login,senha,email) VALUES
	 ('enrique','$2a$12$tg5IMeMBaUcqFA02QKuwde6ytFEOCGUR2ZZe8kr1GdaEQ1vUnVY5W','teste');
