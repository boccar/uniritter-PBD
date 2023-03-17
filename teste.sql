CREATE TABLE clientes (
  id INTEGER,
  nome VARCHAR(10) NOT NULL,
  sobrenome VARCHAR(10) NOT NULL,
  data_nasicmento DATE,
  telefone VARCHAR(12),
  CONSTRAINT pk_clientes PRIMARY KEY
);

CREATE TABLE produtos(
  id INTEGER,
  nome VARCHAR(30) NOT NULL,
  descricao VARCHAR(50) NOT NULL,
  preco NUMBER(5, 2),
  id_tipos_podutos INTEGER,
  CONSTRAINT pk_produtos PRIMARY KEY,
);

CREATE TABLE compras (
  id_produto INTEGER,
  id_cliente INTEGER,
  quantidade INTEGER,
  CONSTRAINT fk_compras_produtos REFERENCES produtos(id),
  CONSTRAINT fk_compras_clientes REFERENCES clientes(d),
  CONSTRAINT pk_compras PRIMARY KEY (id_produto, id_cliente)
);