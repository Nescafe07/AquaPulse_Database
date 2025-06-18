CREATE TABLE tbAdministradores (
  id_adm INT AUTO_INCREMENT PRIMARY KEY,
  nome_adm VARCHAR(100),
  sobrenome_adm VARCHAR(100),
  email_adm VARCHAR(100) UNIQUE,
  cargo_adm VARCHAR(100)
);

CREATE TABLE tbUsuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nome_usuario VARCHAR(100),
  sobrenome_usuario VARCHAR(100),
  email_usuario VARCHAR(255) UNIQUE,
  senha_usuario VARCHAR(255),
  cidade_usuario VARCHAR(255),
  estado_usuario VARCHAR(255)
);

CREATE TABLE tbPedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  data_pedido DATE,
  status_pedido VARCHAR(50),
  total_pedido DECIMAL(10, 2),
  FOREIGN KEY (id_usuario) REFERENCES tbUsuarios(id_usuario)
);

CREATE TABLE tbComentarios (
  id_comentario INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  data_comentario DATE,
  conteudo_comentario VARCHAR(500),
  FOREIGN KEY (id_usuario) REFERENCES tbUsuarios(id_usuario)
);

CREATE TABLE tbMensagensSuporte (
  id_mensagem INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  data_mensagem DATE,
  conteudo_mensagem TEXT,
  FOREIGN KEY (id_usuario) REFERENCES tbUsuarios(id_usuario)
);

CREATE TABLE tbProdutos (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  nome_produto VARCHAR(100),
  descricao_produto TEXT,
  preco_produto DECIMAL(10, 2),
  estoque_produto INT
);

CREATE TABLE tbEnderecos (
  id_endereco INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  endereco VARCHAR(255),
  cidade VARCHAR(100),
  estado VARCHAR(100),
  cep VARCHAR(10),
  FOREIGN KEY (id_usuario) REFERENCES tbUsuarios(id_usuario)
);

CREATE TABLE tbPagamentos (
  id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  data_pagamento DATE,
  valor_pagamento DECIMAL(10, 2),
  metodo_pagamento VARCHAR(50),
  status_pagamento VARCHAR(50),
  FOREIGN KEY (id_pedido) REFERENCES tbPedidos(id_pedido)
);

CREATE TABLE tbCategorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nome_categoria VARCHAR(100),
  descricao_categoria TEXT
);

CREATE TABLE tbAvaliacoes (
  id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  id_produto INT,
  data_avaliacao DATE,
  nota INT CHECK (nota >= 1 AND nota <= 5),
  comentario TEXT,
  FOREIGN KEY (id_usuario) REFERENCES tbUsuarios(id_usuario),
  FOREIGN KEY (id_produto) REFERENCES tbProdutos(id_produto)
);