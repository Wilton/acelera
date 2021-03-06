-- aceite definition

-- Drop table

-- DROP TABLE aceite;

CREATE TABLE aceite ( -- ///////////////////////// no foreign key ///////////////////////// -- 
	id int4 NOT NULL,
	descricao text NULL,
	parecer text NULL,
	CONSTRAINT pk_aceite PRIMARY KEY (id) 
); --/////////////criada/////////////


-- acordoentidadeexterna definition

-- Drop table

-- DROP TABLE acordoentidadeexterna;

CREATE TABLE acordo_entidade_externa ( -- ///////////////////////// no foreign key ///////////////////////// -- 
	id int4 NOT NULL,
	entidade_externa_id int4 NOT NULL,
	CONSTRAINT pk_acordoentidadeexterna PRIMARY KEY (id, entidade_externa_id)
); 
--/////feito///////

-- ata definition

-- Drop table

-- DROP TABLE ata;

CREATE TABLE ata ( -- ///////////////////////// no foreign key ///////////////////////// -- 
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	assunto varchar(100) NOT NULL,
	created_at date NULL,
	updated_at date NULL
	local  varchar(100) NOT NULL,
	participante text NOT NULL,
	ponto_discutido text NOT NULL,
	decisao text NOT NULL,
	ponto_atencao text NOT NULL,
	proximo_passo text NOT NULL,
	hora_reuniao varchar(8) NOT NULL,
	CONSTRAINT pk_ata PRIMARY KEY (id)
);


-- bloqueioprojeto definition

-- Drop table

-- DROP TABLE bloqueioprojeto;

CREATE TABLE bloqueio_projeto ( -- ///////////////////////// no foreign key ///////////////////////// -- 
	id int4 NOT NULL,
	pessoa_id int4 NULL,
	data_bloqueio date NOT NULL,
	data_desbloqueio date NULL,
	justificativa text NULL,
	projeto_id int4 NOT NULL,
	CONSTRAINT pk_bloqueio PRIMARY KEY (idbloqueioprojeto)
);


-- diautil definition

-- Drop table

-- DROP TABLE diautil;

CREATE TABLE dia_util (
	id NOT NULL,
	data_util date NOT NULL,
	ano int 4 NOT NULL,
	CONSTRAINT pk_diautil PRIMARY KEY (iddiautil)
);--/////////////criada/////////////


-- elementodespesa definition

-- Drop table

-- DROP TABLE elementodespesa;

CREATE TABLE elemento_despesa (
	id int4 NOT NULL,
	oficial_id int4 NOT NULL,
	nome varchar(100) NULL,
	seq int4 NULL,
	CONSTRAINT pk_elementodespesa PRIMARY KEY (idelementodespesa)
);


-- etapa definition

-- Drop table

-- DROP TABLE etapa;

CREATE TABLE etapa (
	id int4 NOT NULL,
	descricao varchar(100) NOT NULL,
	created_at date NOT NULL,
	updated_at date NOT NULL,
	pgpassinado varchar(1) NULL,
	CONSTRAINT pk_etapa PRIMARY KEY (idetapa)
);--/////////////criada/////////////


-- evento definition

-- Drop table

-- DROP TABLE evento;

CREATE TABLE evento (
	id int4 NOT NULL,
	nome varchar(100) NULL,
	descricao text NULL,
	obs text NULL,
	responsavel_id int4 NULL,
	data_inicio date NULL,
	data_fim date NULL,
	uf varchar(2) NULL,
	CONSTRAINT pk_evento PRIMARY KEY (idevento)
);


-- feriado definition

-- Drop table

-- DROP TABLE feriado;

CREATE TABLE feriado (
	id int4 NOT NULL,
	dia int4 NOT NULL,
	mes int4 NOT NULL,
	ano int4 NOT NULL,
	tipo bpchar(1) NOT NULL,
	descricao varchar(200) NOT NULL,
	created_at date NULL DEFAULT 'now'::text::date,
	ativo bpchar(1) NOT NULL DEFAULT 'S'::bpchar,
	CONSTRAINT ckc_flaativo_fer CHECK ((flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT ckc_tipoferiado_fer CHECK ((tipoferiado = ANY (ARRAY['1'::bpchar, '2'::bpchar]))),
	CONSTRAINT pk_feriados PRIMARY KEY (diaferiado, mesferiado, anoferiado),
	CONSTRAINT feriado_idferiado_key UNIQUE (idferiado)
);--/////////////criada/////////////


-- funcionalidade definition

-- Drop table

-- DROP TABLE funcionalidade;

CREATE TABLE funcionalidade (
	id int4 NOT NULL,
	nome varchar(80) NOT NULL,
	descricao varchar(255) NOT NULL,
	CONSTRAINT pk_funcionalidade PRIMARY KEY (idfuncionalidade)

); --/////////////criada/////////////


-- licao definition

-- Drop table

-- DROP TABLE licao;

CREATE TABLE licao (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL, -- declara????o de chave estrangeira  <tabela>_<id>
	entrega_id int4 NULL,      -- declara????o de chave estrangeira  <tabela>_<id>
	resultados_obtidos text NULL,
	pontos_fortes text NULL,
	pontos_fracos text NULL,
	sugestoes text NULL,
	associada_id int4 NULL,
	CONSTRAINT fk_licao PRIMARY KEY (idlicao)
);



-- natureza definition

-- Drop table

-- DROP TABLE natureza;

CREATE TABLE natureza (
	id int4 NOT NULL,
	nome varchar(100) NOT NULL,
	ativo bpchar(1) NULL DEFAULT 's'::bpchar,
	CONSTRAINT ckc_flaativo CHECK (((flaativo IS NULL) OR ((flaativo)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT pk_natureza PRIMARY KEY (idnatureza)
);  --/////////////criada/////////////


-- origemrisco definition

-- Drop table

-- DROP TABLE origemrisco;

CREATE TABLE origem_risco (
	id int4 NOT NULL,
	descricao varchar(30) NULL,
	created_at date NULL,
	CONSTRAINT pk_origemrisco PRIMARY KEY (idorigemrisco)
);--/////////////criada/////////////


-- parteinteressadafuncao definition

-- Drop table

-- DROP TABLE parteinteressadafuncao;

CREATE TABLE parte_interessada_funcao (
	id serial4 NOT NULL,
	nome varchar(100) NOT NULL,
	ordem int4 NOT NULL DEFAULT 0,
	CONSTRAINT "PK_parteinteressadafuncao" PRIMARY KEY (idparteinteressadafuncao)
);--/////////////criada/////////////


-- perfil definition

-- Drop table

-- DROP TABLE perfil;

CREATE TABLE perfil (
	id int4 NOT NULL,
	nome varchar(50) NOT NULL,
	flag_ativo bpchar(1) NOT NULL,
	CONSTRAINT ckc_flaativo_perfi CHECK ((flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_perfil PRIMARY KEY (idperfil)
);--/////////////criada/////////////


-- programa definition

-- Drop table

-- DROP TABLE programa;

CREATE TABLE programa (
	id int4 NOT NULL,
	nome varchar(100) NOT NULL,
	descricao text NULL,
	flag_ativo bpchar(1) NOT NULL,
	responsavel_id int4 NULL,
	simpr_id int4 NULL,
#	simpreixo_id int4 NULL,
#	simprareatematica int4 NULL,
	CONSTRAINT ckc_flaativo CHECK ((flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_programa PRIMARY KEY (idprograma)
);


-- r3g definition

-- Drop table

-- DROP TABLE r3g;

CREATE TABLE r3g (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
    deteccao_data date NULL,
	planejado text NULL,
	realizado text NULL,
	causa text NULL,
	consequencia text NULL,
	contramedida text NULL,
	data_prazo_contramedida date NULL,
	data_prazo_contramedida_atraso date NULL,
	responsavel varchar(100) NULL,
	obs text NULL,
	#domtipo numeric(1) NULL,
	#domcorprazoprojeto numeric(1) NULL,
	#domstatuscontramedida numeric(1) NULL,
	flag_contramedida_efetiva numeric(1) NULL,
	CONSTRAINT cc_domcorprazoprojeto CHECK (((domcorprazoprojeto IS NULL) OR (domcorprazoprojeto = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric])))),
	CONSTRAINT cc_domstatuscontramedida CHECK (((domstatuscontramedida IS NULL) OR (domstatuscontramedida = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric, (5)::numeric, (6)::numeric])))),
	CONSTRAINT cc_domtipo CHECK (((domtipo IS NULL) OR (domtipo = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric])))),
	CONSTRAINT cc_flacontramedida CHECK (((flacontramedidaefetiva IS NULL) OR (flacontramedidaefetiva = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT pk_r3g PRIMARY KEY (idr3g)
);


-- recurso definition

-- Drop table

-- DROP TABLE recurso;

CREATE TABLE recurso (
	id int4 NOT NULL,
	ds_recurso varchar(50) NOT NULL,
	descricao varchar(300) NULL,
	CONSTRAINT pk_recurso PRIMARY KEY (idrecurso)
);


-- resposta definition

-- Drop table

-- DROP TABLE resposta;

CREATE TABLE resposta (
	id int4 NOT NULL,
	ordem numeric(2) NULL,
	flag_ativo varchar(1) NULL,
	resposta varchar(255) NULL,
	CONSTRAINT ckc_flaativo_respo CHECK (((flaativo IS NULL) OR ((flaativo)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT pk_resposta PRIMARY KEY (idresposta)
);--/////////////criada/////////////


-- resposta_pesquisa definition

-- Drop table

-- DROP TABLE resposta_pesquisa;

CREATE TABLE resposta_pesquisa (
	id int4 NOT NULL,
	descricao varchar(255) NULL,
	ordem numeric(2) NULL,
	ativo varchar(1) NULL,
	CONSTRAINT cc_flaativo CHECK (((flaativo IS NULL) OR ((flaativo)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT pk_respostapesquisa PRIMARY KEY (idrespostapesquisa)
);--/////////////criada/////////////

-- setor definition

-- Drop table

-- DROP TABLE setor;

CREATE TABLE setor (
	id int4 NOT NULL,
	nome varchar(100) NOT NULL,
	flag_ativo bpchar(1) NULL DEFAULT 'S'::bpchar,
	CONSTRAINT pk_setor PRIMARY KEY (idsetor)
);--//////////////criada//////////////

-- tipoavaliacao definition

-- Drop table

-- DROP TABLE tipoavaliacao;

CREATE TABLE tipo_avaliacao (
	id int4 NOT NULL,
	nome varchar(100) NULL,
	CONSTRAINT pk_tipoavaliacao PRIMARY KEY (idtipoavaliacao)
);--/////////////criada/////////////


-- tipocontramedida definition

-- Drop table

-- DROP TABLE tipocontramedida;

CREATE TABLE tipo_contramedida (
	id int4 NOT NULL,
	nome varchar(50) NOT NULL,
	descricao varchar(200) NULL,
	status int4 NULL,
	CONSTRAINT pk_tipocontramedida PRIMARY KEY (idtipocontramedida)
);--/////////////criada/////////////


-- tipodocumento definition

-- Drop table

-- DROP TABLE tipodocumento;

CREATE TABLE tipo_documento (
	id int4 NOT NULL,
	nome varchar(30) NULL,
	ativo varchar(1) NULL,
	CONSTRAINT pk_tipodocumento PRIMARY KEY (idtipodocumento)
);--/////////////criada/////////////


-- tipoiniciativa definition

-- Drop table

-- DROP TABLE tipoiniciativa;

CREATE TABLE tipo_iniciativa (
	id int4 NOT NULL,
	nome varchar(100) NULL,
	descricao text NULL,
	ativo bpchar(1) NOT NULL DEFAULT 'S'::bpchar,
	CONSTRAINT ckc_flaativo_perfi CHECK ((flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_tipoiniciativa PRIMARY KEY (idtipoiniciativa)
);--/////////////criada/////////////


-- tipomudanca definition

-- Drop table

-- DROP TABLE tipomudanca;

CREATE TABLE tipo_mudanca (
	id int4 NOT NULL,
	descricao varchar(50) NOT NULL,
	created_at date NOT NULL,
	CONSTRAINT pk_tipomudanca PRIMARY KEY (idtipomudanca)
);--/////////////criada/////////////


-- tiporisco definition

-- Drop table

-- DROP TABLE tiporisco;

CREATE TABLE tipo_risco (
	id int4 NOT NULL,
	descricao varchar(40) NOT NULL,
	created_at date NOT NULL,
	CONSTRAINT pk_tiporisco PRIMARY KEY (idtiporisco)
);--/////////////criada/////////////


-- tiposituacaoprojeto definition

-- Drop table

-- DROP TABLE tiposituacaoprojeto;

CREATE TABLE tipo_situacao_projeto (
	id int4 NOT NULL,
	nome bpchar(80) NOT NULL,
	descricao text NULL,
	status int4 NOT NULL,
	CONSTRAINT tiposituacaoprojeto_pkey PRIMARY KEY (idtipo)
);--/////////////criada/////////////


-- aceiteatividadecronograma definition

-- Drop table

-- DROP TABLE aceiteatividadecronograma;

CREATE TABLE aceite_atividade_cronograma (
	id int4 NOT NULL,
	entrega_id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	aceite_id int4 NOT NULL,
	marco_id int4 NULL,
	aceito bpchar(1) NOT NULL,
	pessoa_id int4 NULL,
	created_at date NULL,
	CONSTRAINT cc_aceito CHECK ((aceito = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_aceiteatividadecronograma PRIMARY KEY (idaceiteativcronograma),
	CONSTRAINT fk_aceiteativcronograma_aceite FOREIGN KEY (idaceite) REFERENCES aceite(idaceite) ON DELETE RESTRICT ON UPDATE RESTRICT
);


-- escritorio definition

-- Drop table

-- DROP TABLE escritorio;

CREATE TABLE escritorio (
	id int4 NOT NULL,
	nome varchar(100) NOT NULL,
	ativo bpchar(1) NOT NULL,
	nome varchar(100) NULL,
	desemail varchar(100) NULL,
	numfone varchar(16) NULL,
	CONSTRAINT ckc_flaativo CHECK ((flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_escritorio PRIMARY KEY (idescritorio),
	CONSTRAINT fk_escritorio_escritoriopai FOREIGN KEY (idescritoriope) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feitao//----
CREATE UNIQUE INDEX id_escritorio ON escritorio USING btree (nomescritorio2);


CREATE TABLE escritorio_responsaveis (
	id int4 NOT NULL,
	ativo bpchar(1) NOT NULL,
	responsavel_id int4 NULL,
	CONSTRAINT ckc_flaativo CHECK ((flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_escritorio PRIMARY KEY (idescritorio),
	CONSTRAINT fk_escritorio_escritoriopai FOREIGN KEY (idescritoriope) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//---
-- eventoavaliacao definition

-- Drop table

-- DROP TABLE eventoavaliacao;

CREATE TABLE evento_avaliacao (
	id int4 NOT NULL,
	evento_id int4 NOT NULL,
	destaque text NULL,
	observacao text NULL,
	avaliador_id int4 NULL,
	avaliado_id int4 NULL,
	pontualidade int4 NULL,
	ordem int4 NULL,
	respeito_chefia int4 NULL,
	respeito_colega int4 NULL,
	urbanidade int4 NULL,
	equilibrio int4 NULL,
	comprometimento int4 NULL,
	esforco int4 NULL,
	trabalho_equipe int4 NULL,
	auxiliou_equipe int4 NULL,
	aceitou_sugestao int4 NULL,
	conhecimento_norma int4 NULL,
	alternativa_problema int4 NULL,
	iniciativa int4 NULL,
	tarefa_complexa int4 NULL,
	nota_avaliador int4 NULL,
	media float8 NULL,
	media_final float8 NULL,
	total_avaliado int4 NULL,
	tipo_avaliacao_id int4 NULL,
	CONSTRAINT pk_eventoavaliacao PRIMARY KEY (ideventoavaliacao),
	CONSTRAINT fk_eventoavaliacao_evento FOREIGN KEY (idevento) REFERENCES evento(idevento) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_eventoavaliacao_tipoavaliacao FOREIGN KEY (idtipoavaliacao) REFERENCES tipoavaliacao(idtipoavaliacao) ON DELETE RESTRICT ON UPDATE RESTRICT
);--///feita///

-- frase definition

-- Drop table

-- DROP TABLE frase;

CREATE TABLE frase (
	id int4 NOT NULL,
	tipo numeric(1) NULL,
	ativo varchar(1) NULL,
	escritorio_id int4 NOT NULL,
	descricao varchar(255) NULL,
	CONSTRAINT ckc_domtipofrase_frase CHECK (((domtipofrase IS NULL) OR (domtipofrase = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric, (5)::numeric, (6)::numeric, (7)::numeric])))),
	CONSTRAINT ckc_flaativo_frase CHECK (((flaativo IS NULL) OR ((flaativo)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT pk_frase PRIMARY KEY (idfrase),
	CONSTRAINT fk_frase_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--


-- frase_pesquisa definition

-- Drop table

-- DROP TABLE frase_pesquisa;

CREATE TABLE frase_pesquisa (
	id int4 NOT NULL,
	tipo numeric(1) NULL,
	ativo varchar(1) NULL,
	escritorio_id int4 NOT NULL,
	descricao varchar(255) NOT NULL,
	CONSTRAINT cc_flaativofrase CHECK (((flaativo IS NULL) OR ((flaativo)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT ckc_domtipofrase_frase CHECK (((domtipofrase IS NULL) OR (domtipofrase = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric, (5)::numeric, (6)::numeric, (7)::numeric])))),
	CONSTRAINT pk_frasepesquisa PRIMARY KEY (idfrasepesquisa),
	CONSTRAINT fk_frasepesquisa_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--


-- modulo definition

-- Drop table

-- DROP TABLE modulo;

CREATE TABLE modulo (
	id int4 NOT NULL,
	sequencial int4 NULL,
	nome_item_menu varchar(30) NOT NULL,
	url varchar(50) NULL,
	ativo bpchar(1) NOT NULL,
	ativo bpchar(1) NOT NULL,
	CONSTRAINT pk_modulo PRIMARY KEY (idmodulo),
	CONSTRAINT fk_modulo_modulopai FOREIGN KEY (idmodulopai) REFERENCES modulo(idmodulo) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--


-- mudanca definition

-- Drop table

-- DROP TABLE mudanca;

CREATE TABLE mudanca (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	solicitante varchar(100) NULL,
	created_at date NULL,
	data_decisao date NULL,
	descricao text NULL,
	justificativa text NULL,
	parecere text NULL,
	aprovadores text NULL,
	descricao_aprovadores text NULL,
	tipo_mudanca_id int4 NOT NULL,
	aprovada bpchar(1) NULL,
	CONSTRAINT ckc_flaaprovada CHECK (((flaaprovada IS NULL) OR ((flaaprovada)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT pk_mudanca PRIMARY KEY (idmudanca),
	CONSTRAINT fk_mudanca_tipomudanca FOREIGN KEY (idtipomudanca) REFERENCES tipomudanca(idtipomudanca) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//---


-- perfilmodulo definition

-- Drop table

-- DROP TABLE perfilmodulo;

CREATE TABLE perfil_modulo (
	perfil_id int4 NOT NULL,
	modulo_id int4 NOT NULL,
	CONSTRAINT pk_perfilmodulo PRIMARY KEY (idperfil, idmodulo),
	CONSTRAINT fk_perfilmodulo_modulo FOREIGN KEY (idmodulo) REFERENCES modulo(idmodulo) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_perfilmodulo_perfil FOREIGN KEY (idperfil) REFERENCES perfil(idperfil) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//---


-- perfilpessoa definition

-- Drop table

-- DROP TABLE perfilpessoa;

CREATE TABLE perfil_pessoa (
	id int4 NOT NULL,
	pessoa_id int4 NOT NULL,
	perfil_id int4 NOT NULL,
	escritorio_id int4 NOT NULL,
	ativo bpchar(1) NOT NULL,
	CONSTRAINT ckc_flaativo CHECK ((flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_perfilpessoa PRIMARY KEY (idperfilpessoa),
	CONSTRAINT fk_perfilpessoa_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio),
	CONSTRAINT fk_pessoaperfil_perfil FOREIGN KEY (idperfil) REFERENCES perfil(idperfil) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--
CREATE UNIQUE INDEX id_perfil_pessoa ON perfilpessoa USING btree (idpessoa, idperfil, idescritorio);


-- permissao definition

-- Drop table

-- DROP TABLE permissao;

CREATE TABLE permissao (
	id int4 NOT NULL,
	recurso_id int4 NOT NULL,
	descricao varchar(200) NULL,
	nome varchar(50) NULL,
	visualizar bool NULL DEFAULT false,
	tipo bpchar(1) NULL,
	CONSTRAINT pk_permissao PRIMARY KEY (idpermissao),
	CONSTRAINT fk_recurso_permissao FOREIGN KEY (idrecurso) REFERENCES recurso(idrecurso)
);--//feita//--
CREATE UNIQUE INDEX id_recurso ON permissao USING btree (idrecurso, idpermissao);


-- permissaoperfil definition

-- Drop table

-- DROP TABLE permissaoperfil;

CREATE TABLE permissao_perfil (
	id int4 NOT NULL,
	perfil_id int4 NOT NULL,
	permissao_id int4 NOT NULL,
	CONSTRAINT pk_permissaoperfil PRIMARY KEY (idpermissaoperfil),
	CONSTRAINT fk_perfil_permissaoperfil FOREIGN KEY (idperfil) REFERENCES perfil(idperfil) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_permissao_permissaoperfil FOREIGN KEY (idpermissao) REFERENCES permissao(idpermissao)
);
-- ///////////feita //////////-----------
CREATE UNIQUE INDEX id_permissaoperfil ON permissaoperfil USING btree (idpermissaoperfil);
CREATE UNIQUE INDEX idx_permissaoperfil ON permissaoperfil USING btree (idpermissao, idperfil);

	
-- pessoa definition

-- Drop table

-- DROP TABLE pessoa;

CREATE TABLE pessoa (
	id int4 NOT NULL,
	nome varchar(100) NOT NULL,
	obvervacao text NULL,
	telefone_fixo varchar(16) NULL,
	telefone_celular varchar(16) NULL,
	email varchar(100) NULL,
	matricula int4 NULL,
	funcao varchar(50) NULL,
	unidade_id int4 NULL,
	cargo varchar(10) NOT NULL,
	servidor_id int4 NULL,
	agenda varchar(1) NULL DEFAULT 'S'::character varying,
	cpf varchar(11) NULL,
	siape int8 NULL,
	versaosistema varchar(10) NULL,
	CONSTRAINT pk_pessoa PRIMARY KEY (idpessoa),
);--///////feita/////////////-
CREATE UNIQUE INDEX idx_cpf ON pessoa USING btree (numcpf);


-- portfolio definition

-- Drop table

-- DROP TABLE portfolio;

CREATE TABLE portfolio (
	id int4 NOT NULL,
	nome varchar(100) NOT NULL,
	ativo bpchar(1) NOT NULL,
	tipo numeric(1) NOT NULL,
	responsavel_id int4 NOT NULL,
	escritorio_id int4 NOT NULL,
	CONSTRAINT ckc_ativo_portf CHECK ((ativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT ckc_tipo_portf CHECK ((tipo = ANY (ARRAY[(1)::numeric, (2)::numeric]))),
	CONSTRAINT pk_portfolio PRIMARY KEY (idportfolio),
	CONSTRAINT fk_portfolio_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_portfolio_portfoliopai FOREIGN KEY (idportfoliopai) REFERENCES portfolio(idportfolio) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--


-- portifolioprograma definition

-- Drop table

-- DROP TABLE portifolioprograma;

CREATE TABLE portfolio_programa (
	id int4 NOT NULL,
	programa_id int4 NOT NULL,
	CONSTRAINT pk_portifolioprograma PRIMARY KEY (idprograma, idportfolio),
	CONSTRAINT fk_portifolioprograma_portifolio FOREIGN KEY (idportfolio) REFERENCES portfolio(idportfolio) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_portifolioprograma_programa FOREIGN KEY (idprograma) REFERENCES programa(idprograma) ON DELETE RESTRICT ON UPDATE RESTRICT
);
-- ////feita/////----

-- processo definition

-- Drop table

-- DROP TABLE processo;

CREATE TABLE processo (
	id int4 NOT NULL,
	codigo varchar(20) NULL,
	processo varchar(100) NULL,
	setor_id int4 NULL,
	descricao text NULL,
	dono_id int4 NOT NULL,
	executor_id int4 NOT NULL,
	gestor_id int4 NOT NULL,
	consultor_id int4 NOT NULL,
	validade int4 NULL,
	updated_at date NULL,
	CONSTRAINT pk_processo PRIMARY KEY (idprocesso),
	CONSTRAINT fk_processo_setor FOREIGN KEY (idsetor) REFERENCES setor(idsetor) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feira//--


-- projetoprocesso definition

-- Drop table

-- DROP TABLE projetoprocesso;

CREATE TABLE projeto_processo (
	id int4 NOT NULL,
	processo_id int4 NOT NULL,
	ano numeric(4) NULL,
	situacao numeric(1) NULL,
	data_situacao date NULL,
	responsavel_id int4 NULL,
	descricao text NULL,
	data_inicio_previsto date NULL,
	data_termino_previsto date NULL,
	valor_orcamento int8 NOT NULL,
	CONSTRAINT ckc_domsituacao CHECK (((domsituacao IS NULL) OR (domsituacao = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric])))),
	CONSTRAINT pk_projetoprocesso PRIMARY KEY (idprojetoprocesso),
	CONSTRAINT fk_projetoprocesso_processo FOREIGN KEY (idprocesso) REFERENCES processo(idprocesso) ON DELETE RESTRICT ON UPDATE RESTRICT
);
--///feita///---

-- questionario definition

-- Drop table

-- DROP TABLE questionario;

CREATE TABLE questionario (
	id int4 NOT NULL,
	nome varchar(255) NULL,
	observacao text NULL,
	tipo numeric(1) NULL,
	escritorio_id int4 NOT NULL,
	disponivel numeric(1) NULL DEFAULT 0,
	CONSTRAINT cc_disponivel CHECK (((disponivel IS NULL) OR (disponivel = ANY (ARRAY[(0)::numeric, (1)::numeric])))),
	CONSTRAINT ckc_tipoquestionario_quest CHECK (((tipoquestionario IS NULL) OR (tipoquestionario = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT pk_questionario PRIMARY KEY (idquestionario),
	CONSTRAINT fk_questionario_escritorio FOREIGN KE	Y (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--

-- questionario_diagnostico definition

-- Drop table

-- DROP TABLE questionario_diagnostico;

CREATE TABLE questionario_diagnostico (
	id int8 NOT NULL DEFAULT nextval('sq_questionariodiagnostico'::regclass),
	nome varchar(400) NOT NULL,
	tipo bpchar(1) NOT NULL DEFAULT 1,
	observacao text NULL,
	created_at date NOT NULL,
	CONSTRAINT pk_questionario_diagnostico PRIMARY KEY (idquestionariodiagnostico),
	CONSTRAINT fk_pessoa_questionariodiagnostico FOREIGN KEY (idpescadastrador) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT
);--//feita//----
CREATE INDEX fki_pessoa_questionariodiagnostico ON questionario_diagnostico USING btree (idpescadastrador);


-- questionariofrase definition

-- Drop table

-- DROP TABLE questionariofrase;

CREATE TABLE questionario_frase (
	id,
	frase_id int4 NOT NULL,
	questionario_id int4 NOT NULL,
	num_ordem_pergunta int4 NOT NULL,
	obrigatoriedade bpchar(1) NOT NULL,
	CONSTRAINT cc_obrigatoriedade CHECK (((obrigatoriedade IS NULL) OR (obrigatoriedade = ANY (ARRAY['S'::bpchar, 'N'::bpchar])))),
	CONSTRAINT pk_questionariofrase PRIMARY KEY (idfrase, idquestionario),
	CONSTRAINT fk_questionariofrase_frase FOREIGN KEY (idfrase) REFERENCES frase(idfrase) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_questionariofrase_questionario FOREIGN KEY (idquestionario) REFERENCES questionario(idquestionario) ON DELETE RESTRICT ON UPDATE RESTRICT
);---//feita//--


-- respostafrase definition

-- Drop table

-- DROP TABLE respostafrase;

CREATE TABLE resposta_frase (
	id,
	frase_id int4 NOT NULL,
	resposta_id int4 NOT NULL,
	CONSTRAINT fk_frase_pergunta FOREIGN KEY (idfrase) REFERENCES frase(idfrase) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_pergunta_frase FOREIGN KEY (idresposta) REFERENCES resposta(idresposta) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--

-- respostafrase_pesquisa definition

-- Drop table

-- DROP TABLE respostafrase_pesquisa;

CREATE TABLE respostafrase_pesquisa (
	id
	frase_pesquisa_id int4 NOT NULL,
	resposta_pesquisa_id int4 NOT NULL,
	CONSTRAINT pk_respostafrase_pesquisa PRIMARY KEY (idfrasepesquisa, idrespostapesquisa),
	CONSTRAINT fk_fraseresultadopesquisa_frase FOREIGN KEY (idfrasepesquisa) REFERENCES frase_pesquisa(idfrasepesquisa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_fraseresultadopesquisa_resultado FOREIGN KEY (idrespostapesquisa) REFERENCES resposta_pesquisa(idrespostapesquisa) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--


-- risco definition

-- Drop table

-- DROP TABLE risco;

CREATE TABLE risco (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	origem_risco_id int4 NULL,
	etapa_id int4 NULL,
	tipo_risco_id int4 NULL,
	data_deteccao date NULL,
	descricao text NULL,
	cor_probabilidade numeric(1) NULL,
	cor_impacto numeric(1) NULL,
	cor_risco numeric(1) NULL,
	causa text NULL,
	consequencia text NULL,
	ativo numeric(1) NULL,
	data_encerramento date NULL,
	tratamento numeric(2) NULL,
	nome varchar(50) NULL,
	aprovado numeric(1) NULL,
	data_inatividade date NULL,
	CONSTRAINT cc_domcorimpacto CHECK (((domcorimpacto IS NULL) OR (domcorimpacto = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric])))),
	CONSTRAINT cc_domcorprobabilida CHECK (((domcorprobabilidade IS NULL) OR (domcorprobabilidade = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric])))),
	CONSTRAINT cc_domcorrisco CHECK (((domcorrisco IS NULL) OR (domcorrisco = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric])))),
	CONSTRAINT cc_domtratamento CHECK (((domtratamento IS NULL) OR (domtratamento = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric, (5)::numeric, (9)::numeric, (10)::numeric, (11)::numeric, (12)::numeric, (13)::numeric, (14)::numeric, (15)::numeric, (16)::numeric, (17)::numeric, (18)::numeric])))),
	CONSTRAINT cc_flaaprovado CHECK (((flaaprovado IS NULL) OR (flaaprovado = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT cc_flariscoativo CHECK (((flariscoativo IS NULL) OR (flariscoativo = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT pk_risco PRIMARY KEY (idrisco),
	CONSTRAINT fk_risco_etapa FOREIGN KEY (idetapa) REFERENCES etapa(idetapa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_risco_origemrisco FOREIGN KEY (idorigemrisco) REFERENCES origemrisco(idorigemrisco) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_risco_tiporisco FOREIGN KEY (idtiporisco) REFERENCES tiporisco(idtiporisco) ON DELETE RESTRICT ON UPDATE RESTRICT
);---////feita////---


-- secao definition

-- Drop table

-- DROP TABLE secao;

CREATE TABLE secao (
	id int8 NOT NULL,
	descricao varchar(200) NULL,
	ativa bool NOT NULL DEFAULT true,
	tipo_questionario bpchar(1) NOT NULL,
	macro_processo bool NOT NULL DEFAULT false,
	CONSTRAINT pk_secao PRIMARY KEY (id_secao),
	CONSTRAINT fk_secao_secaopai FOREIGN KEY (id_secao_pai) REFERENCES secao(id_secao) ON DELETE CASCADE
);--//feita///--


-- tipoacordo definition

-- Drop table

-- DROP TABLE tipoacordo;

CREATE TABLE tipo_acordo (
	id int4 NOT NULL,
	descricao varchar NULL,
	created_at date NULL,
	CONSTRAINT pk_tipoacordo PRIMARY KEY (idtipoacordo),
);--//feitao//--


-- tratamento definition

-- Drop table

-- DROP TABLE tratamento;

CREATE TABLE tratamento (
	id int4 NOT NULL,
	descricao varchar(40) NOT NULL,
	created_at date NOT NULL,
	tipo_risco_id int4 NULL,
	CONSTRAINT pk_tratamento PRIMARY KEY (idtratamento),
); --//feita//--


-- acao definition

-- Drop table

-- DROP TABLE acao;

CREATE TABLE acao (
	id int4 NOT NULL,
	obejtivo_id int4 NOT NULL,
	nome varchar(100) NOT NULL,
	ativo bpchar(1) NULL DEFAULT 's'::bpchar,
	descricao text NULL,
	escritorio_id int4 NULL DEFAULT 0,
	seq int4 NULL DEFAULT 0,
	CONSTRAINT pk_acao PRIMARY KEY (idacao),
	CONSTRAINT fk_acao_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT,
);--//feaita//--


-- acordoespecieinstrumento definition

-- Drop table

-- DROP TABLE acordoespecieinstrumento;

CREATE TABLE acordo_especie_instrumento (
	id int4 NOT NULL,
	nome varchar(200) NOT NULL,
	flaativo bpchar(1) NOT NULL,
	CONSTRAINT ckc_flaativo_acord CHECK ((flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_acordoespecieinstrumento PRIMARY KEY (idacordoespecieinstrumento),
); --//feita//--

-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- agenda definition

-- Drop table

-- DROP TABLE agenda;

CREATE TABLE agenda (
	id int4 NOT NULL,
	descricao varchar(100) NOT NULL,
	created_at date NULL,
	agenda text NULL,
	hora_agendada timestamp NULL,
	local varchar(30) NULL,
	email numeric(1) NULL,
	escritorio_id int4 NOT NULL,
	CONSTRAINT ckc_flaenviaemail_agend CHECK (((flaenviaemail IS NULL) OR (flaenviaemail = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT pk_agenda PRIMARY KEY (idagenda),
	CONSTRAINT fk_agenda_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT
); --//fetia //--



-- aquisicao definition

-- Drop table

-- DROP TABLE aquisicao;


CREATE TABLE aquisicao (   -- ///////////////////////// no foreign key ///////////////////////// -- 
	id int4 NOT NULL,
	aquisicao varchar(100) NULL,
	projeto_id int4 NOT NULL,
	entrega_id int4 NOT NULL,
	contrato varchar(100) NULL,
	fornecedor varchar(100) NULL,
	valor int8 NOT NULL,
	aquisicao_prazo date NULL,
	quantidade varchar(20) NULL,
	CONSTRAINT pk_aquisicao PRIMARY KEY (idaquisicao),
); --///feita///---



-- atividade definition

-- Drop table

-- DROP TABLE atividade;

CREATE TABLE atividade (
	id int4 NOT NULL,
	atividade varchar(100) NULL,
	descricao text NULL,
	responsavel_id int4 NOT NULL,
	alizacao date NULL,
	inicio date NULL,
	meta date NULL,
	real date NULL,
	continua numeric(1) NULL,
	percentual_concluido int4 NULL,
	cancelada numeric(1) NULL,
	escritorio_id int4 NOT NULL,
	CONSTRAINT ckc_flacancelada_ativi CHECK (((flacancelada IS NULL) OR (flacancelada = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT ckc_flacontinua_ativi CHECK (((flacontinua IS NULL) OR (flacontinua = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT pk_atividade PRIMARY KEY (idatividade),
	CONSTRAINT fk_atividade_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_atividade_pesresponsavel FOREIGN KEY (idresponsavel) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
); ---////feita///---

-- contramedida definition

-- Drop table

-- DROP TABLE contramedida;

CREATE TABLE contramedida (
	id int4 NOT NULL,
	risco_id int4 NULL,
	descricao text NULL,
	contramedida_prazo date NULL,
	contramedida_prazo_atraso date NULL,
	contramedida_status numeric(1) NULL,
	contramedida_efetiva numeric(1) NULL,
	responsavel_descricao varchar(100) NULL,
	contramedida_tipo_id int4 NOT NULL,
    nome varchar(100) NULL,
	CONSTRAINT cc_domstatuscontramedida CHECK (((domstatuscontramedida IS NULL) OR (domstatuscontramedida = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric, (5)::numeric, (6)::numeric])))),
	CONSTRAINT cc_flacontramedidaefetiva CHECK (((flacontramedidaefetiva IS NULL) OR (flacontramedidaefetiva = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT pk_contramedida PRIMARY KEY (idcontramedida),
	CONSTRAINT fk_contramedida_risco FOREIGN KEY (idrisco) REFERENCES risco(idrisco) ON DELETE CASCADE ON UPDATE RESTRICT
); --//feita//---


-- diagnostico definition

-- Drop table

-- DROP TABLE diagnostico;

CREATE TABLE diagnostico ( -- ///////////////////////// no foreign key ///////////////////////// -- 
	id int8 NOT NULL,
	descricao varchar(400) NOT NULL,
	unidade_principal_id int4 NOT NULL,
	created_at date NULL,
	encerramento date NULL,
	cadastro date NOT NULL,
	ativo bool NOT NULL DEFAULT true,
	diagnostico serial4 NOT NULL,
	ano int4 NULL,
	CONSTRAINT pk_diagnostico PRIMARY KEY (iddiagnostico),
); --//feita//--


-- documento definition

-- Drop table

-- DROP TABLE documento;

CREATE TABLE documento (
	id int4 NOT NULL,
	escritorio_id int4 NULL,
	nome varchar(100) NULL,
	documento_tipo_id int4 NULL,
	caminho varchar(50) NULL,
	created_at date NULL,
	observacao text NULL,
	flaativo varchar(1) NULL,
	CONSTRAINT ckc_flaativo CHECK (((flaativo)::bpchar = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_documento PRIMARY KEY (iddocumento),
	CONSTRAINT fk_documento_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_documento_tipodocumento FOREIGN KEY (idtipodocumento) REFERENCES tipodocumento(idtipodocumento) ON DELETE RESTRICT ON UPDATE RESTRICT
); --//feita//---
CREATE UNIQUE INDEX idx_escritorio ON documento USING btree (iddocumento, idescritorio);



-- DROP TABLE item_secao;

CREATE TABLE entidade_externa ( 
	id int4 NOT NULL,
	descricao varchar(200) NOT NULL,
	secao_id int4 NOT NULL,
	ativo bool NOT NULL DEFAULT true,
	questionario_diagnostico_id int4 NULL,
	CONSTRAINT pk_item PRIMARY KEY (id_item),
	CONSTRAINT fk_idquestionariodiagnostico FOREIGN KEY (idquestionariodiagnostico) REFERENCES questionario_diagnostico(idquestionariodiagnostico) ON DELETE CASCADE,
	CONSTRAINT fk_item_secao FOREIGN KEY (id_secao) REFERENCES secao(id_secao) ON DELETE CASCADE
);--//feita//---


-- marco definition

-- Drop table

-- DROP TABLE marco;

CREATE TABLE marco (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	sequencia int4 NULL,
	nome varchar(100) NULL,
	planejado date NULL,
	previsto date NULL,
	encerrado date NULL,
	responsavel_id int4 NULL DEFAULT 0,
	CONSTRAINT pk_marco PRIMARY KEY (idmarco),
	CONSTRAINT fk_marco_pesresponsavel FOREIGN KEY (idresponsavel) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
);---//feitao//--


-- objetivo definition

-- Drop table

-- DROP TABLE objetivo;

CREATE TABLE objetivo ( 
	id int4 NOT NULL,
	nome varchar(100) NOT NULL,
	ativo bpchar(1) NULL DEFAULT 's'::bpchar,
	descricao text NULL,
	codigo_escritorio int4 NULL DEFAULT 0,
	sequencia int4 NULL DEFAULT 0,
	CONSTRAINT ckc_flaativo_objet CHECK (((flaativo IS NULL) OR (flaativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar])))),
	CONSTRAINT pk_objetivo PRIMARY KEY (idobjetivo),
	CONSTRAINT fk_objetivo_escritorio FOREIGN KEY (codescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT,
);--//feira//--


-- p_acao definition

-- Drop table

-- DROP TABLE p_acao;

CREATE TABLE p_acao (
	id int4 NOT NULL,
	projeto_processo_id int4 NOT NULL,
	nome varchar(100) NULL,
	descricao text NULL,
	inicio_previsto date NULL,
	inicio_real date NULL,
	termino_previsto date NULL,
	termino_real date NULL,
	responsavel_setor_id int4 NULL DEFAULT 0,
	cancelada numeric(1) NOT NULL,
	sequencia varchar(10) NOT NULL,   ///pause
	responsavel_id int4 NULL,
	CONSTRAINT ckc_flacancelada_p_aca CHECK ((flacancelada = ANY (ARRAY[(1)::numeric, (2)::numeric]))),
	CONSTRAINT pk_p_acao PRIMARY KEY (id_p_acao),
	CONSTRAINT fk_acao_projetoprocesso FOREIGN KEY (idprojetoprocesso) REFERENCES projetoprocesso(idprojetoprocesso) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_acao_setorresponsavel FOREIGN KEY (idsetorresponsavel) REFERENCES setor(idsetor) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--


-- partediagnostico definition

-- Drop table

-- DROP TABLE partediagnostico;

CREATE TABLE parte_diagnostico (
	id int4 NOT NULL,
	diagnostico_id int4 NOT NULL,
	qualificacao varchar(1) NULL DEFAULT '1'::character varying,
	pessoa_id int4 NOT NULL,
	tppermissao varchar(1) NULL DEFAULT '1'::character varying,
	CONSTRAINT pk_partediagnostico PRIMARY KEY (idpartediagnostico),
	CONSTRAINT fk_partediagnostico_diagnostico FOREIGN KEY (iddiagnostico) REFERENCES diagnostico(iddiagnostico) ON DELETE CASCADE
);--//fetia//--


-- pergunta definition

-- Drop table

-- DROP TABLE pergunta;

CREATE TABLE pergunta (
	id int8 NOT NULL,
	descricao varchar(300) NULL,
	tipo numeric(1) NOT NULL,
	ativa bool NOT NULL DEFAULT false,
	questionario_id int8 NOT NULL,
	posicao int4 NULL,
		 int8 NOT NULL,
	tipo_registro numeric(1) NULL,
	dstitulo varchar(200) NULL,
	CONSTRAINT pk_pergunta PRIMARY KEY (idpergunta),
	CONSTRAINT fk_pergunta_secao FOREIGN KEY (id_secao) REFERENCES secao(id_secao) ON DELETE RESTRICT,
	CONSTRAINT fk_questionario_pergunta FOREIGN KEY (idquestionario) REFERENCES questionario_diagnostico(idquestionariodiagnostico) ON DELETE CASCADE
);--//feita//---


-- perm_funcionalidade definition

-- Drop table

-- DROP TABLE perm_funcionalidade;

CREATE TABLE permissao_funcionalidade (
	id,
	permissao_id int4 NOT NULL,
	funcionalidade_id int4 NOT NULL,
	principal bpchar(1) NOT NULL,
	publicada bpchar(1) NOT NULL,
	data_publicada date NOT NULL,
	CONSTRAINT cc_principal CHECK ((principal = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT cc_publicada CHECK ((publicada = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_perm_funcionalidade PRIMARY KEY (idpermissao, idfuncionalidade),
	CONSTRAINT fk_permfuncionalidade_funcionalidade FOREIGN KEY (idfuncionalidade) REFERENCES funcionalidade(idfuncionalidade) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_permfuncionalidade_permissao FOREIGN KEY (idpermissao) REFERENCES permissao(idpermissao)
);--//feita//--


-- permissaodiagnostico definition

-- Drop table

-- DROP TABLE permissaodiagnostico;

CREATE TABLE permissao_diagnostico (
	id,
	parte_diagnostico_id int4 NOT NULL,
	diagnostico_id int4 NOT NULL,
	recurso_id int4 NOT NULL,
	permissao_id int4 NOT NULL,
	pessoa_id int4 NOT NULL,
	"data" date NOT NULL,
	ativo bpchar(1) NOT NULL DEFAULT 'S'::bpchar,
	CONSTRAINT ckc_ativo_ CHECK (((ativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar])) AND ((ativo)::text = upper((ativo)::text)))),
	CONSTRAINT pk_permissaodiagnostico PRIMARY KEY (idpermissao, iddiagnostico, idpartediagnostico),
	CONSTRAINT fk_permpdiagnostico_diagnostico FOREIGN KEY (iddiagnostico) REFERENCES diagnostico(iddiagnostico) ON DELETE CASCADE ON UPDATE RESTRICT,
	CONSTRAINT fk_permpdiagnostico_partediagnostico FOREIGN KEY (idpartediagnostico) REFERENCES partediagnostico(idpartediagnostico) ON DELETE CASCADE,
	CONSTRAINT fk_permpdiagnostico_permissao FOREIGN KEY (idpermissao) REFERENCES permissao(idpermissao) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_permpdiagnostico_pesmanipula FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_permpdiagnostico_recurso FOREIGN KEY (idrecurso) REFERENCES recurso(idrecurso) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feira//---


-- pesquisa definition

-- Drop table

-- DROP TABLE pesquisa;

CREATE TABLE pesquisa (
	id int4 NOT NULL,
	situacao numeric(1) NOT NULL,
	data_publicacao timestamp NULL,
	publicacao_id int4 NULL,
	encerramento_id int4 NULL,
	questionario_id int4 NOT NULL,
	data_encerramento timestamp NULL,
	CONSTRAINT cc_situacao CHECK ((situacao = ANY (ARRAY[(1)::numeric, (2)::numeric]))),
	CONSTRAINT pk_pesquisa PRIMARY KEY (idpesquisa),
	CONSTRAINT fk_pesquisaquestionario_questionario FOREIGN KEY (idquestionario) REFERENCES questionario(idquestionario) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--


-- pessoaagenda definition

-- Drop table

-- DROP TABLE pessoa_agenda;

CREATE TABLE pessoa_agenda (
	agenda_id int4 NOT NULL,
	pessoa_id int4 NOT NULL,
	CONSTRAINT pk_pessoaagenda PRIMARY KEY (idagenda, idpessoa),
	CONSTRAINT fk_pessoaagenda_agenda FOREIGN KEY (idagenda) REFERENCES agenda(idagenda) ON DELETE RESTRICT ON UPDATE RESTRICT
);--///feita///----


-- projeto definition

-- Drop table

-- DROP TABLE projeto;

CREATE TABLE projeto (
	id int4 NOT NULL,
	codigo varchar(50) NULL,
	sigla varchar(20) NULL,
	nome varchar(100) NULL,
	setor_id int4 NULL,
	gerente_projeto_id int4 NOT NULL,
	gerente_adjunto_id int4 NULL,
	descricao text NULL,
	objetivo text NULL,
	data_inicio date NULL,
	data_fim date NULL,
	periodicidade_atualizacao int4 NULL,
	criterio_farol int4 NULL,
	tipo_projeto varchar(20) NULL,
	publicado varchar(1) NULL,
	aprovado varchar(1) NULL,
	resultados_obtidos text NULL,
	pontos_fortes text NULL,
	pontos_fracos text NULL,
	sugestoes text NULL,
	escritorio_id int4 NULL,
	alta_gestao varchar(1) NULL,
	objetivo_id int4 NULL,
	acao_id int4 NULL,
	copa varchar(1) NULL,
	natureza_id int4 NULL,
	valor_orcamento_disponivel int8 NULL DEFAULT 0::bigint,
	justificativa text NULL,
	demandante_id int4 NULL,
	patrocinador_id int4 NULL,
	data_inicio_plano date NULL,
	data_fimplano date NULL,
	escopo text NULL,
	nao_escopo text NULL,
	premissa text NULL,
	restricao text NULL,
	sequencia_projeto int4 NULL,
	ano_projeto int4 NULL,
	consideracao_final text NULL,
	programa_id int4 NULL DEFAULT 0,
	proponente varchar(100) NULL,
	status_projeto int4 NOT NULL,
	ano numeric(4) NULL,
	portfolio_id int4 NULL,
	tipo_iniciativa_id int4 NOT NULL DEFAULT 1,
	percentual_concluido numeric(5, 2) NULL DEFAULT 0,
	percentual_previsto numeric(5, 2) NULL DEFAULT 0,
	processo_sei varchar(20) NULL,
	atraso varchar(20) NULL DEFAULT 0,
	percentual_concluido_marco numeric(5, 2) NULL,
	cor_atraso varchar(10) NULL,
	qtde_atividade_iniciada numeric(5, 2) NULL DEFAULT 0,
	percentual_iniciado numeric(5, 2) NULL DEFAULT 0, 
	qtnde_atividade_nao_iniciada numeric(5, 2) NULL DEFAULT 0,
	percentualnao_iniciado numeric(5, 2) NULL DEFAULT 0,
	qtde_atividade_concluida numeric(5, 2) NULL DEFAULT 0,
	num_percentual_atividade_concluido numeric(5, 2) NULL DEFAULT 0,
	CONSTRAINT ckc_flaaltagestao CHECK (((flaaltagestao IS NULL) OR ((flaaltagestao)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT ckc_flaaprovado CHECK (((flaaprovado IS NULL) OR ((flaaprovado)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT ckc_flacopa CHECK (((flacopa IS NULL) OR ((flacopa)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT ckc_flapublicado CHECK (((flapublicado IS NULL) OR ((flapublicado)::text = ANY (ARRAY[('S'::character varying)::text, ('N'::character varying)::text])))),
	CONSTRAINT ckc_statusprojeto CHECK (((domstatusprojeto IS NULL) OR (domstatusprojeto = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8])))),
	CONSTRAINT pk_projeto PRIMARY KEY (idprojeto),

	CONSTRAINT fk_acao_projeto FOREIGN KEY (idacao) REFERENCES acao(idacao) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_pessoaadjunto FOREIGN KEY (idgerenteadjunto) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_pessoademandante FOREIGN KEY (iddemandante) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_pessoagerenteprojeto FOREIGN KEY (idgerenteprojeto) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_pessoapatrocinador FOREIGN KEY (idpatrocinador) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_projeto_natureza FOREIGN KEY (idnatureza) REFERENCES natureza(idnatureza) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_projeto_objetivo FOREIGN KEY (idobjetivo) REFERENCES objetivo(idobjetivo) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_projeto_pespatrocinador FOREIGN KEY (idpatrocinador) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_projeto_pessoagerente FOREIGN KEY (idgerenteprojeto) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_projeto_portfolio FOREIGN KEY (idportfolio) REFERENCES portfolio(idportfolio) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_projeto_programa FOREIGN KEY (idprograma) REFERENCES programa(idprograma) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_projeto_setor FOREIGN KEY (idsetor) REFERENCES setor(idsetor) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_projeto_tipoiniciativa FOREIGN KEY (idtipoiniciativa) REFERENCES tipoiniciativa(idtipoiniciativa) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--
CREATE INDEX fki_projeto_tipoiniciativa ON projeto USING btree (idtipoiniciativa);


-- questionario_pesquisa definition

-- Drop table

-- DROP TABLE questionario_pesquisa;

CREATE TABLE questionario_pesquisa (
	id int4 NOT NULL,
	pesquisa_id int4 NOT NULL,
	nome varchar(255) NULL,
	observacao text NULL,
	tipo_questionario numeric(1) NULL,
	escritorio_id int4 NOT NULL,
	CONSTRAINT cc_tipoquestionario CHECK (((tipoquestionario IS NULL) OR (tipoquestionario = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT pk_questionariopesquisa PRIMARY KEY (idquestionariopesquisa),
	CONSTRAINT fk_questionariopesquisa_escritorio FOREIGN KEY (idescritorio) REFERENCES escritorio(idescritorio) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_questionariopesquisa_pesquisa FOREIGN KEY (idpesquisa) REFERENCES pesquisa(idpesquisa) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita


-- questionariofrase_pesquisa definition

-- Drop table

-- DROP TABLE questionariofrase_pesquisa;

CREATE TABLE questionario_frase_pesquisa (
	id,
	questionario_pesquisa_id int4 NOT NULL,
	frase_pesquisa_id int4 NOT NULL,
	ordem int4 NOT NULL,
	obrigatoriedade bpchar(1) NOT NULL DEFAULT 'N'::bpchar,
	CONSTRAINT cc_obrigatoriedade CHECK ((obrigatoriedade = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_questionariofrase_pesquisa PRIMARY KEY (idquestionariopesquisa, idfrasepesquisa),
	CONSTRAINT fk_questionariofrasepesquisa_frase FOREIGN KEY (idfrasepesquisa) REFERENCES frase_pesquisa(idfrasepesquisa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_questionariofrasepesquisa_quest FOREIGN KEY (idquestionariopesquisa) REFERENCES questionario_pesquisa(idquestionariopesquisa) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feitao//--


-- resultado_pesquisa definition

-- Drop table

-- DROP TABLE resultado_pesquisa;

CREATE TABLE resultado_pesquisa (
	id int4 NOT NULL,
	resultado_id int4 NOT NULL,
	frase_pesquisa_id int4 NOT NULL,
	questionario_pesquisa_id int4 NOT NULL,
	resposta text NULL,
	cpf varchar(11) NULL,
	CONSTRAINT pk_resultadopesquisa PRIMARY KEY (id, idresultado, idfrasepesquisa, idquestionariopesquisa),
	CONSTRAINT fk_frasepesquisa_frase FOREIGN KEY (idfrasepesquisa) REFERENCES frase_pesquisa(idfrasepesquisa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_questionariopesquisa_questionario FOREIGN KEY (idquestionariopesquisa) REFERENCES questionario_pesquisa(idquestionariopesquisa) ON DELETE RESTRICT ON UPDATE RESTRICT
); --feita//--


-- statusreport definition

-- Drop table

-- DROP TABLE statusreport;

CREATE TABLE status_report (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	data_acompanhamento date NULL,
	atividade_concluida text NULL,
	atividade_andamento text NULL,
	motivo_atraso text NULL,
	irregularidade text NULL,
	marco_id int4 NULL,
	data_marco_tendencia date NULL,
	data_fim_projeto_tendencia date NULL,
	flag_aprovado numeric(1) NULL,
	cor_risco numeric(1) NULL,
	contramedida text NULL,
	risco text NULL,
	status_projeto int4 NOT NULL,
	data_provacao date NULL,
	percentual_concluido numeric(5, 2) NULL DEFAULT 0,
	percentual_previsto numeric(5, 2) NULL DEFAULT 0,
	dias_projeto int4 NULL DEFAULT 0,
	percentual_marcos numeric(5, 2) NULL DEFAULT 0,
	percentual_diferenca numeric(5, 2) NULL DEFAULT 0,
	percentual_custo_real numeric(5, 2) NULL DEFAULT 0,
	custo_real_total int8 NULL DEFAULT 0::bigint,
	responsavel_aceitacao_id int4 NULL DEFAULT 0,
	pgp_assinado varchar(1) NULL DEFAULT 'N'::character varying,
	tep_assinado varchar(1) NULL DEFAULT 'N'::character varying,
	andamento_projeto text NULL,
	percentual_concluido_marco numeric(5, 2) NULL,
	dia_atraso int4 NULL,
	cor_atraso varchar(10) NULL,
	criterio_farol int4 NULL,
	fim_projeto date NULL,
	CONSTRAINT ckc_aprovacao CHECK ((((flaaprovado = (1)::numeric) AND (dataprovacao IS NOT NULL)) OR ((flaaprovado = (2)::numeric) AND (dataprovacao IS NULL)))),
	CONSTRAINT ckc_domcorrisco CHECK (((domcorrisco IS NULL) OR (domcorrisco = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric])))),
	CONSTRAINT ckc_flaaprovado CHECK (((flaaprovado IS NULL) OR (flaaprovado = ANY (ARRAY[(1)::numeric, (2)::numeric])))),
	CONSTRAINT ckc_statusreportprojeto CHECK (((domstatusprojeto IS NULL) OR (domstatusprojeto = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8])))),
	CONSTRAINT pk_statusreport PRIMARY KEY (idstatusreport),
	CONSTRAINT fk_statusreport_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE RESTRICT ON UPDATE RESTRICT
)
WITH (
	OIDS=TRUE
);--//feita//--


-- unidade_vinculada definition

-- Drop table

-- DROP TABLE unidade_vinculada;

CREATE TABLE unidade_vinculada (
	id int4 NOT NULL,
	unidade_principal_id int4 NOT NULL,
	diagnostico_id int8 NOT NULL,
	CONSTRAINT pk_unidadevinculada PRIMARY KEY (idunidade, id_unidadeprincipal, iddiagnostico),
	CONSTRAINT fk_unidadevinculada_diagnostico FOREIGN KEY (iddiagnostico) REFERENCES diagnostico(iddiagnostico) ON DELETE CASCADE
);--//feitao//---


-- vincula_questionario definition

-- Drop table

-- DROP TABLE vincula_questionario;

CREATE TABLE vincula_questionario (
	id,
	questionario_id int8 NOT NULL,
	diagnostico_id int8 NOT NULL,
	disponivel bpchar(1) NOT NULL DEFAULT 2,
	disponibilidade date NOT NULL,
	encerrramento date NULL,
	CONSTRAINT pk_vincula_questionario PRIMARY KEY (idquestionario, iddiagnostico),
	CONSTRAINT fk_diagnostico_vinculaquestionario FOREIGN KEY (iddiagnostico) REFERENCES diagnostico(iddiagnostico) ON DELETE CASCADE,
	CONSTRAINT fk_pessoa_vinculaquestionario FOREIGN KEY (idpesdisponibiliza) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT,
	CONSTRAINT fk_pessoaencerra_vinculaquestionario FOREIGN KEY (idpesencerrou) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT,
	CONSTRAINT fk_questionario_vinculaquestionario FOREIGN KEY (idquestionario) REFERENCES questionario_diagnostico(idquestionariodiagnostico) ON DELETE CASCADE
);--///feita///---


-- acordo definition

-- Drop table

-- DROP TABLE acordo;

CREATE TABLE acordo (
	id int4 NOT NULL,
	acordo_pai_id int4 NULL,
	tipoa_cordo_id int4 NULL,
	nome varchar(100) NULL,
	responsavel_interno_id int4 NOT NULL,
	telefone_responsavel_interno varchar(30) NULL,
	setor_id int4 NOT NULL,
	fiscal_id int4 NOT NULL,
	telefone_fiscal varchar(30) NULL,
	palavra_chave varchar(100) NULL,
	objeto text NULL,
	observacao text NULL,
	assinatura date NULL,
	inicio_vigencia date NULL,
	fim_vigencia date NULL,
	prazo_vigencia int4 NULL,
	atualizacao date NULL,
	flag_rescindido bpchar(1) NULL DEFAULT 'n'::bpchar,
	flag_situacao_atual numeric(1) NULL,
	siapro varchar(25) NULL,
	contato_externo text NULL,
	fiscal2_id int4 NULL,
	fiscal3_id int4 NULL,
	acordo_especie_instrumento_id int4 NULL,
	publicacao date NULL,
	cargo_fiscal varchar(100) NULL,
	caminho varchar(100) NULL,
	CONSTRAINT ckc_flarescindido_acord CHECK (((flarescindido IS NULL) OR (flarescindido = ANY (ARRAY['S'::bpchar, 'N'::bpchar])))),
	CONSTRAINT ckc_flasituacaoatual_acord CHECK (((flasituacaoatual IS NULL) OR (flasituacaoatual = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric])))),
	CONSTRAINT pk_acordo PRIMARY KEY (idacordo),
	CONSTRAINT fk_acordo_acordoespecieinstrumento FOREIGN KEY (idacodrdoespecieinstrumento) REFERENCES acordoespecieinstrumento(idacordoespecieinstrumento) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_acordo_acordopai FOREIGN KEY (idacordopai) REFERENCES acordo(idacordo) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_acordo_pesfiscal FOREIGN KEY (idfiscal) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_acordo_pesfiscal2 FOREIGN KEY (idfiscal2) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_acordo_pesfiscal3 FOREIGN KEY (idfiscal3) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_acordo_pesresponsavelinterino FOREIGN KEY (idresponsavelinterno) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_acordo_setor FOREIGN KEY (idsetor) REFERENCES setor(idsetor) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_acordo_tipoacordo FOREIGN KEY (idtipoacordo) REFERENCES tipoacordo(idtipoacordo) ON DELETE RESTRICT ON UPDATE RESTRICT
);--///feita//--


-- assinadocumento definition

-- Drop table

-- DROP TABLE assinadocumento;

CREATE TABLE assina_documento (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	pessoa_id int4 NOT NULL,
	assinado timestamptz NOT NULL,
	tipo_doc int4 NOT NULL,
	hash_doc bpchar(100) NOT NULL,
	situacao varchar(1) NOT NULL,
	funcao varchar(300) NULL,
	aceite_id int4 NULL,
	CONSTRAINT pk_assinadocumento PRIMARY KEY (id),
	CONSTRAINT fk_assinadocumento_pessoa FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE CASCADE,
	CONSTRAINT fk_assinadocumento_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE CASCADE,
	CONSTRAINT fk_assinadocumento_termoaceite FOREIGN KEY (idaceite) REFERENCES aceite(idaceite) ON DELETE RESTRICT
);--//feita//--


-- diariobordo definition

-- Drop table

-- DROP TABLE diariobordo;

CREATE TABLE diario_bordo (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	diario_bordo date NULL,
	referencia varchar(20) NULL,
	semafaro numeric(1) NULL,
	diario_bordo text NULL,
	alterador_id int4 NULL,
	CONSTRAINT ckc_domsemafaro_diari CHECK (((domsemafaro IS NULL) OR (domsemafaro = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric])))),
	CONSTRAINT pk_diariobordo PRIMARY KEY (iddiariobordo),
	CONSTRAINT fk_alterador_diariobordo FOREIGN KEY (idalterador) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_diariobordo_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feira//--


-- hst_publicacao definition

-- Drop table

-- DROP TABLE hst_publicacao;

CREATE TABLE historico_publicacao (
	id int4 NOT NULL,
	pesquisa_id int4 NOT NULL,
	publicacao timestamp NULL,
	encerramento timestamp NULL,
	CONSTRAINT pk_hstpublicacao PRIMARY KEY (idhistoricopublicacao),
	CONSTRAINT fk_historicopesquisa_pesquisa FOREIGN KEY (idpesquisa) REFERENCES pesquisa(idpesquisa) ON DELETE RESTRICT ON UPDATE RESTRICT
);---//feita///----


-- linhatempo definition

-- Drop table

-- DROP TABLE linhatempo;

CREATE TABLE linha_tempo (
	id int4 NOT NULL,
	pessoa_id int4 NOT NULL,
	funcao_projeto varchar(300) NOT NULL,
	tp_acao bpchar(1) NOT NULL,
	dt_acao timestamptz NOT NULL,
	projeto_id int4 NOT NULL,
	recurso_id int4 NOT NULL,
	CONSTRAINT pk_linhatempo PRIMARY KEY (id),
	CONSTRAINT fk_linhatempo_pessoa FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT,
	CONSTRAINT fk_linhatempo_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE RESTRICT,
	CONSTRAINT fk_linhatempo_recurso FOREIGN KEY (idrecurso) REFERENCES recurso(idrecurso)
);--//feita	//---


-- opcao_resposta definition

-- Drop table

-- DROP TABLE opcao_resposta;

CREATE TABLE opcao_resposta (
	id,
	resposta_id int8 NOT NULL,
	pergunta_id int8 NOT NULL,
	resposta varchar(300) NULL,
	escala int4 NULL,
	ordenacao int4 NULL,
	questionario_id int8 NOT NULL,
	CONSTRAINT pk_opcao_resposta PRIMARY KEY (idresposta),
	CONSTRAINT fk_pergunta FOREIGN KEY (idpergunta) REFERENCES pergunta(idpergunta) ON DELETE CASCADE ON UPDATE RESTRICT,
	CONSTRAINT fk_questionario_opcaoresposta FOREIGN KEY (idquestionario) REFERENCES questionario_diagnostico(idquestionariodiagnostico) ON DELETE CASCADE
);--//feita///---


-- parteinteressada definition

-- Drop table

-- DROP TABLE parteinteressada;

CREATE TABLE parte_interessada (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	parte_interessada varchar(100) NULL,
	funcao varchar(300) NULL,
	telefone varchar(50) NULL,
	email varchar(50) NULL,
	nivel_influencia varchar(10) NULL,
	pessoa_interna_id int4 NULL,
	observacao bpchar(200) NULL,
	tp_permissao varchar(1) NULL DEFAULT '1'::character varying,
	status bool NOT NULL DEFAULT true,
	CONSTRAINT pk_parteinteressada PRIMARY KEY (idparteinteressada),
	CONSTRAINT fk_pessoainterna FOREIGN KEY (idpessoainterna) REFERENCES pessoa(idpessoa),
	CONSTRAINT fk_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE RESTRICT
);--///feita//--


-- parteinteressada_funcoes definition

-- Drop table

-- DROP TABLE parteinteressada_funcoes;

CREATE TABLE parte_interessada_funcoes (
	id,
	parte_interessada_id int4 NOT NULL,
	parte_interessada_funcao_id int4 NOT NULL,
	CONSTRAINT pk_parteinteressada_funcoes PRIMARY KEY (idparteinteressada, idparteinteressadafuncao),
	CONSTRAINT fk_parteinteressada_funcoes_funcao FOREIGN KEY (idparteinteressadafuncao) REFERENCES parteinteressadafuncao(idparteinteressadafuncao),
	CONSTRAINT fk_parteinteressada_funcoes_parte FOREIGN KEY (idparteinteressada) REFERENCES parteinteressada(idparteinteressada) ON DELETE RESTRICT
);--//feita//---


-- permissaoprojeto definition

-- Drop table

-- DROP TABLE permissaoprojeto;

CREATE TABLE permissao_projeto (
	id,
	parte_interessada_id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	recurso_id int4 NOT NULL,
	permissao_id int4 NOT NULL,
	pessoa_id int4 NOT NULL,
	created_at date NOT NULL,
	ativo bpchar(1) NOT NULL DEFAULT 'S'::bpchar,
	CONSTRAINT ckc_ativo_ CHECK (((ativo = ANY (ARRAY['S'::bpchar, 'N'::bpchar])) AND ((ativo)::text = upper((ativo)::text)))),
	CONSTRAINT pk_permissaoprojeto PRIMARY KEY (idpermissao, idprojeto, idparteinteressada),
	CONSTRAINT fk_permprojeto_parteinteressada FOREIGN KEY (idparteinteressada) REFERENCES parteinteressada(idparteinteressada) ON DELETE CASCADE,
	CONSTRAINT fk_permprojeto_permissao FOREIGN KEY (idpermissao) REFERENCES permissao(idpermissao) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_permprojeto_pesmanipula FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_permprojeto_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_permprojeto_recurso FOREIGN KEY (idrecurso) REFERENCES recurso(idrecurso) ON DELETE RESTRICT ON UPDATE RESTRICT
);--//feita//--


-- questionariodiagnostico_respondido definition

-- Drop table

-- DROP TABLE questionariodiagnostico_respondido;

CREATE TABLE questionario_diagnostico_respondido (
	questionario_id int8 NOT NULL,
	diagnostico_id int8 NOT NULL,
	numero int8 NOT NULL,
	dt_resposta date NOT NULL,
	pessoa_resposta_id int4 NOT NULL,
	CONSTRAINT pk_historico_questionario PRIMARY KEY (idquestionario, iddiagnostico, numero),
	CONSTRAINT fk_questionariovinculado_questionariorespondido FOREIGN KEY (idquestionario,iddiagnostico) REFERENCES vincula_questionario(idquestionario,iddiagnostico) ON DELETE CASCADE
);--//feita//---


-- questionariodiagnosticomelhoria definition

-- Drop table

-- DROP TABLE questionariodiagnosticomelhoria;

CREATE TABLE questionario_diagnostico_melhoria (
	melhoria_id int8 NOT NULL,
	data_melhoria date NOT NULL,
	melhoria text NOT NULL,
	macro_processo_trabalho_id int4 NOT NULL,
	macro_processo_melhorar_id int4 NOT NULL,
	unidade_responsavel_proposta_id int4 NOT NULL,
	flag_abrangencia char NOT NULL,
	unidade_responsave_limplantacao_id int4 NOT NULL,
	objetivo_institucional_id int4 NULL,
	acao_estrategica_id int4 NULL,
	idareamelhoria int4 NULL,
	idsituacao int4 NULL,
	iddiagnostico int8 NULL,
	idunidadeprincipal int4 NOT NULL,
	matriculaproponente int4 NULL,
	CONSTRAINT pk_questionariodiagnosticomelhoria PRIMARY KEY (idmelhoria),
	CONSTRAINT fk_acaoestrategica_questionariodiagnosticomelhoria FOREIGN KEY (idacaoestrategica) REFERENCES acao(idacao) ON DELETE RESTRICT,
	CONSTRAINT fk_diagnostico_questionariodiagnosticomelhoria FOREIGN KEY (iddiagnostico) REFERENCES diagnostico(iddiagnostico) ON DELETE CASCADE,
	CONSTRAINT fk_objetivoinstitucional_questionariodiagnosticomelhoria FOREIGN KEY (idobjetivoinstitucional) REFERENCES objetivo(idobjetivo) ON DELETE RESTRICT,
	CONSTRAINT fk_processomelhorar_questionariodiagnosticomelhoria FOREIGN KEY (idmacroprocessomelhorar) REFERENCES processo(idprocesso) ON DELETE RESTRICT,
	CONSTRAINT fk_processotrabalho_questionariodiagnosticomelhoria FOREIGN KEY (idmacroprocessotrabalho) REFERENCES processo(idprocesso) ON DELETE RESTRICT,
	CONSTRAINT fk_undiaderesponsavelimplantacao_questionariodiagnosticomelhori FOREIGN KEY (idunidaderesponsavelimplantacao,idunidadeprincipal,iddiagnostico) REFERENCES unidade_vinculada(idunidade,id_unidadeprincipal,iddiagnostico) ON DELETE RESTRICT,
	CONSTRAINT fk_unidaderesponsavelproposta_questionariodiagnosticomelhoria FOREIGN KEY (idunidaderesponsavelproposta,idunidadeprincipal,iddiagnostico) REFERENCES unidade_vinculada(idunidade,id_unidadeprincipal,iddiagnostico) ON DELETE RESTRICT
);--//feita//---
CREATE INDEX fki_acaoestrategica ON questionariodiagnosticomelhoria USING btree (idacaoestrategica);
CREATE INDEX fki_diagnostico ON questionariodiagnosticomelhoria USING btree (iddiagnostico);


-- resposta_pergunta definition

-- Drop table

-- DROP TABLE resposta_pergunta;

CREATE TABLE resposta_pergunta (
	id int8 NOT NULL,
	resposta_descritiva text NULL,
	pergunta_id int8 NOT NULL,
	resposta_id int8 NULL,
	nr_questionario int8 NOT NULL,
	questionario_id int8 NOT NULL,
	diagnostico_id int8 NOT NULL,
	CONSTRAINT pk_resposta_pergunta PRIMARY KEY (id_resposta_pergunta),
	CONSTRAINT fk_opcaoresposta_resposta_pergunta FOREIGN KEY (idresposta) REFERENCES opcao_resposta(idresposta) ON DELETE CASCADE,
	CONSTRAINT fk_pergunta_resposta_pergunta FOREIGN KEY (idpergunta) REFERENCES pergunta(idpergunta) ON DELETE CASCADE,
	CONSTRAINT fk_questionariorespondido_respostapergunta FOREIGN KEY (idquestionario,nrquestionario,iddiagnostico) REFERENCES <?>() ON DELETE CASCADE
);--//feita//---


-- resposta_questionariordiagnostico definition

-- Drop table

-- DROP TABLE resposta_questionariordiagnostico;

CREATE TABLE resposta_questionariordiagnostico (
	id_resposta_pergunta int8 NOT NULL,
	questionario_id int8 NOT NULL,
	diagnostico_id int8 NOT NULL,
	numero int8 NOT NULL,
	CONSTRAINT pk_resposta_questionariorespondido PRIMARY KEY (id_resposta_pergunta, idquestionario, iddiagnostico, numero),
	CONSTRAINT fk_questionariorespondido_respostaquestionariorespondido FOREIGN KEY (idquestionario,iddiagnostico,numero) REFERENCES questionariodiagnostico_respondido(idquestionario,iddiagnostico,numero) ON DELETE CASCADE,
	CONSTRAINT fk_respostapergunta_respostaquestionariorespondido FOREIGN KEY (id_resposta_pergunta) REFERENCES resposta_pergunta(id_resposta_pergunta) ON DELETE CASCADE
);--//feita//--


-- atividadecronograma definition

-- Drop table

-- DROP TABLE atividade_cronograma;

CREATE TABLE atividade_cronograma (
	id int8 NOT NULL,
	projeto_id int4 NOT NULL,
	grup_id int8 NULL,
	atividade_cronograma varchar(255) NOT NULL,
	tipo_atividade numeric(1) NOT NULL,
	observacao text NULL,
	marco_anterior_id int8 NULL,
	numerto_dias int4 NULL,
	valor_atividade_baseline int8 NULL DEFAULT 0::bigint,
	valor_atividade int8 NULL DEFAULT 0::bigint,
	folga int4 NULL DEFAULT 0,
	criterio_aceitacao text NULL,
	elemento_despesa_id int4 NULL,
	parte_interessada_id int4 NULL,
	data_inicio_baseline date NULL,
	data_fim_baseline date NULL,
	flag_aquisicao bpchar(1) NULL,
	flag_informatica bpchar(1) NULL,
	flag_cancelada bpchar(1) NULL,
	data_inicio date NULL,
	data_fim date NULL,
	percentual_concluido numeric(5, 2) NULL,
	dias_baseline int4 NULL,
	dias_realizados int4 NULL DEFAULT 0,
	sequencia numeric(4) NOT NULL DEFAULT 1,
	flag_ordenacao bpchar(1) NOT NULL DEFAULT 'S'::bpchar,
	responsavel_id int4 NULL,
	data_atividade_concluida date NULL,
	CONSTRAINT ckc_domtipoatividade CHECK ((domtipoatividade = ANY (ARRAY[(1)::numeric, (2)::numeric, (3)::numeric, (4)::numeric]))),
	CONSTRAINT ckc_flaordenacao CHECK ((flaordenacao = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT ckc_flashowhide CHECK ((flaordenacao = ANY (ARRAY['S'::bpchar, 'N'::bpchar]))),
	CONSTRAINT pk_atividadecronograma PRIMARY KEY (idatividadecronograma, idprojeto),
	
	CONSTRAINT fk_atividadecrono_elementodespesa FOREIGN KEY (idelementodespesa) REFERENCES elementodespesa(idelementodespesa) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_atividadecrono_marcoanterior FOREIGN KEY (idmarcoanterior,idprojeto) REFERENCES atividadecronograma(idatividadecronograma,idprojeto) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_atividadecrono_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_grupo_atividade FOREIGN KEY (idgrupo,idprojeto) REFERENCES atividadecronograma(idatividadecronograma,idprojeto) ON DELETE CASCADE ON UPDATE RESTRICT,
	CONSTRAINT fk_responsavelaceitacao_atividadecronograma FOREIGN KEY (idresponsavel) REFERENCES parteinteressada(idparteinteressada) ON DELETE SET NULL,
	CONSTRAINT fk_responsavelentrega_atividadecronograma FOREIGN KEY (idparteinteressada) REFERENCES parteinteressada(idparteinteressada) ON DELETE SET NULL
);--////feita//----
CREATE INDEX idx_codprojeto_domtipoatividade ON atividadecronograma USING btree (idprojeto, domtipoatividade);
CREATE INDEX idx_grupo ON atividadecronograma USING btree (idprojeto, idgrupo);


-- atividadecronopredecessora definition

-- Drop table

-- DROP TABLE atividadecronopredecessora;

CREATE TABLE atividade_cronograma_predecessora (
	atividade_cronograma_id int8 NOT NULL,
	id int8 NOT NULL,
	CONSTRAINT pk_atividadecronopredecessora PRIMARY KEY (idatividadecronograma, idprojetocronograma, idatividadepredecessora),
	CONSTRAINT fk_cronpredecessora_cronograma FOREIGN KEY (idatividadecronograma,idprojetocronograma) REFERENCES atividadecronograma(idatividadecronograma,idprojeto) ON DELETE CASCADE,
	CONSTRAINT fk_cronpredecessora_predecessora FOREIGN KEY (idatividadepredecessora,idprojetocronograma) REFERENCES atividadecronograma(idatividadecronograma,idprojeto) ON DELETE CASCADE
);--//feita//--


-- atividadeocultar definition

-- Drop table

-- DROP TABLE atividadeocultar;

CREATE TABLE atividade_ocultar (
	id int9 NOT NULL, 
	projeto_id int4 NOT NULL,
	atividade_cronograma_id int8 NOT NULL,
	pessoa_id int4 NOT NULL,
	data_cadastro date NULL DEFAULT 'now'::text::date,
	CONSTRAINT fk_atividade_projeto_visibilidade FOREIGN KEY (idprojeto,idatividadecronograma) REFERENCES <?>() ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT fk_pessoa_ocultar FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
); --//feita//==
CREATE INDEX idx_atividade_projeto_pessoa ON atividadeocultar USING btree (idatividadecronograma, idprojeto, idpessoa);


-- comentario definition

-- Drop table

-- DROP TABLE comentario;

CREATE TABLE comentario (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	atividade_cronograma_id int4 NOT NULL,
	comentario varchar(400) NOT NULL,
	data_comentario timestamptz NOT NULL,
	pessoa_id int4 NOT NULL,
	CONSTRAINT pk_comentario PRIMARY KEY (idcomentario),
	CONSTRAINT fk_comentario_atividadecronograma FOREIGN KEY (idatividadecronograma,idprojeto) REFERENCES atividadecronograma(idatividadecronograma,idprojeto) ON DELETE CASCADE,
	CONSTRAINT fk_comentario_pessoa FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa) ON DELETE CASCADE,
	CONSTRAINT fk_comentario_projeto FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE CASCADE
);--//feita//--
CREATE INDEX fki_comentario_pessoa ON comentario USING btree (idpessoa);


-- comunicacao definition

-- Drop table

-- DROP TABLE comunicacao;

CREATE TABLE comunicacao (
	id int4 NOT NULL,
	projeto_id int4 NOT NULL,
	informacao varchar(255) NULL,
	informado varchar(255) NULL,
	origem varchar(255) NULL,
	frequencia varchar(255) NULL,
	transmissao varchar(255) NULL,
	armazenamento varchar(255) NULL,
	responsavel varchar(100) NULL,
	responsavel_id int4 NULL,
	CONSTRAINT pk_comunicacao PRIMARY KEY (idcomunicacao),
	CONSTRAINT fk_conunicacao_parteinteressada FOREIGN KEY (idresponsavel) REFERENCES parteinteressada(idparteinteressada) ON DELETE RESTRICT
);


-- questdiagnosticopadronizamelhoria definition

-- Drop table

-- DROP TABLE questdiagnosticopadronizamelhoria;

CREATE TABLE questinario_diagnostico_padroniza_melhoria (
	id int8 NOT NULL,
	melhoria_id int8 NULL,
	revisada text NOT NULL,
	prazo_id int4 NOT NULL,
	impacto_id int4 NOT NULL,
	esforco_id int4 NOT NULL,
	pontuacao numeric(5, 2) NULL,
	incidencia numeric(5, 2) NULL,
	votacao int4 NULL,
	flag_agrupadora bool NULL,
	titulo_grupo text NULL,
	informacoes_complementares text NULL,
	melhoria_agrupadora int8 NULL,
	CONSTRAINT pk_questdiagnosticopadronizamelhoria PRIMARY KEY (idpadronizacaomelhoria),
	CONSTRAINT fk_questionariodiagnosticomelhoria_questdiagnosticopadronizamel FOREIGN KEY (idmelhoria) REFERENCES questionariodiagnosticomelhoria(idmelhoria) ON DELETE CASCADE
);
CREATE INDEX fki_questionariodiagnosticomelhoria_questdiagnosticopadronizame ON questdiagnosticopadronizamelhoria USING btree (idmelhoria); 
