-- Tabela: Usuários
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(15),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultimo_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foto_perfil VARCHAR(255)
);

-- Tabela: Dispositivos
CREATE TABLE dispositivos (
    id_dispositivo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    nome_dispositivo VARCHAR(255) NOT NULL,
    tipo VARCHAR(50),
    modelo VARCHAR(50),
    numero_serie VARCHAR(50) UNIQUE NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela: Dados de Atividade
CREATE TABLE dados_atividade (
    id_atividade INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_dispositivo INT,
    data_atividade TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo_atividade VARCHAR(50),
    duracao INT,  -- Duração em minutos
    calorias DECIMAL(10, 2),
    passos INT,
    distancia DECIMAL(10, 2),  -- Distância em metros ou quilômetros
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_dispositivo) REFERENCES dispositivos(id_dispositivo)
);

-- Tabela: Medições de Saúde
CREATE TABLE medicoes_saude (
    id_medicao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_medicao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo_medicao VARCHAR(50),
    valor DECIMAL(10, 2),
    unidade VARCHAR(20),
    status VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela: Notificações
CREATE TABLE notificacoes (
    id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    titulo VARCHAR(255),
    mensagem TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    visualizada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela: Configurações do App
CREATE TABLE configuracoes_app (
    id_configuracao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    notificacoes_ativas BOOLEAN DEFAULT TRUE,
    unidades_medidas VARCHAR(50) DEFAULT 'Métrico',
    idioma VARCHAR(20) DEFAULT 'pt-br',
    modo_noturno BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela: Relatórios
CREATE TABLE relatorios (
    id_relatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tipo_relatorio VARCHAR(50),
    data_inicio TIMESTAMP,
    data_fim TIMESTAMP,
    detalhes TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela: Histórico de Sincronização
CREATE TABLE historico_sincronizacao (
    id_sincronizacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_dispositivo INT,
    data_sincronizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    detalhes TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_dispositivo) REFERENCES dispositivos(id_dispositivo)
);

-- Tabela: Logs de Atividade
CREATE TABLE logs_atividade (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    descricao TEXT,
    data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
