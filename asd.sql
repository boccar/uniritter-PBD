CREATE TABLE clientes(
    id BIGINT NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone NUMERIC(10, 5) NOT NULL,
    uf char(2) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE clientes_pjs(
    id BIGINT NOT NULL UNIQUE,
    razao_social VARCHAR(150),
    cnpj VARCHAR(20) UNIQUE,
    FOREIGN KEY (id) REFERENCES clientes (id)
);
CREATE TABLE clientes_pfs(
    id BIGINT NOT NULL UNIQUE,
    nome VARCHAR(150),
    cpf VARCHAR(20) UNIQUE,
    FOREIGN KEY (id) REFERENCES clientes (id)
);
CREATE TABLE tipos_quartos(
    id BIGINT NOT NULL,
    descricao VARCHAR(40) NOT NULL,
    valor NUMERIC(10, 5) NOT NULL,
    capacidade NUMERIC(10, 5) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE quartos(
    id BIGINT NOT NULL,
    id_tipo BIGINT NOT NULL,
    andar CHAR(20),
    status CHAR(20) NOT NULL,
    numero NUMERIC(10, 5) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tipo) REFERENCES tipos_quartos (id)
);
CREATE TABLE funcionarios(
    id BIGINT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    salario NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE servicos(
    id BIGINT NOT NULL,
    descricao VARCHAR(60) NOT NULL,
    valor NUMERIC(10, 5) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE produtos(
    id BIGINT NOT NULL,
    produtos VARCHAR(60) NOT NULL,
    descricao VARCHAR(60) NOT NULL,
    valor NUMERIC(10, 5) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE reservas(
    id BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_quarto BIGINT NOT NULL,
    id_responsavel BIGINT NOT NULL,
    data_reserva DATE NOT NULL,
    diarias INTEGER NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    status CHAR(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_quarto) REFERENCES quartos(id),
    FOREIGN KEY (id_responsavel) REFERENCES clientes(id)
);
CREATE TABLE locais_hospedagem (
    id BIGINT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE hospedagens(
    id BIGINT NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_quarto BIGINT NOT NULL,
    id_locais_hospedagem BIGINT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE,
    status CHAR(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_quarto) REFERENCES quartos (id),
    FOREIGN KEY (id_locais_hospedagem) REFERENCES locais_hospedagem (id)
);
CREATE TABLE vendas(
    id BIGINT NOT NULL,
    id_produtos BIGINT NOT NULL,
    id_hospedagem BIGINT NOT NULL,
    id_funcionario BIGINT NOT NULL,
    quantidade int,
    data_venda DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_produtos) REFERENCES produtos (id),
    FOREIGN KEY (id_hospedagem) REFERENCES hospedagens (id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id)
);
CREATE TABLE atendimentos(
    id BIGINT NOT NULL,
    id_servico BIGINT NOT NULL,
    id_hospedagem BIGINT NOT NULL,
    id_funcionario BIGINT NOT NULL,
    data_servico DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_servico) REFERENCES servicos (id),
    FOREIGN KEY (id_hospedagem) REFERENCES hospedagens (id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id)
);
CREATE SEQUENCE clientes_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE tipos_quartos_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE quartos_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE servicos_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE reservas_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE hospedagens_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE atendimentos_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE produtos_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE vendas_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE funcionarios_id_seq INCREMENT 1 START 1 CACHE 1;
CREATE SEQUENCE locais_hospedagem_id_seq INCREMENT 1 START 1 CACHE 1;
ALTER TABLE clientes
ALTER COLUMN id
SET DEFAULT NEXTVAL('clientes_id_seq');
ALTER TABLE tipos_quartos
ALTER COLUMN id
SET DEFAULT NEXTVAL('tipos_quartos_id_seq');
ALTER TABLE quartos
ALTER COLUMN id
SET DEFAULT NEXTVAL('quartos_id_seq');
ALTER TABLE servicos
ALTER COLUMN id
SET DEFAULT NEXTVAL('servicos_id_seq');
ALTER TABLE reservas
ALTER COLUMN id
SET DEFAULT NEXTVAL('reservas_id_seq');
ALTER TABLE hospedagens
ALTER COLUMN id
SET DEFAULT NEXTVAL('hospedagens_id_seq');
ALTER TABLE atendimentos
ALTER COLUMN id
SET DEFAULT NEXTVAL('atendimentos_id_seq');
ALTER TABLE produtos
ALTER COLUMN id
SET DEFAULT NEXTVAL('produtos_id_seq');
ALTER TABLE vendas
ALTER COLUMN id
SET DEFAULT NEXTVAL('vendas_id_seq');
ALTER TABLE funcionarios
ALTER COLUMN id
SET DEFAULT NEXTVAL('funcionarios_id_seq');
ALTER TABLE locais_hospedagem
ALTER COLUMN id
SET DEFAULT NEXTVAL('locais_hospedagem_id_seq');