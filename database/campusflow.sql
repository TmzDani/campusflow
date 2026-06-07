
--Criar database
CREATE DATABASE campusflow;


--Criar tabelas
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil ENUM('admin', 'atendente') DEFAULT 'atendente',
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE pessoas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    status ENUM('ativo','inativo') DEFAULT 'ativo'
);


CREATE TABLE tipos_atendimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    status ENUM('ativo','inativo') DEFAULT 'ativo'
);

CREATE TABLE atendimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pessoa_id INT NOT NULL,
    tipo_atendimento_id INT NOT NULL,
    usuario_id INT NOT NULL,
    descricao TEXT NOT NULL,
    status ENUM('aberto','em_andamento','concluido') DEFAULT 'aberto',

    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id),
    FOREIGN KEY (tipo_atendimento_id) REFERENCES tipos_atendimentos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);


--Registros de teste

INSERT INTO pessoas(nome,email)
VALUES ('Maria Silva','maria@email.com');

INSERT INTO tipos_atendimentos(nome)
VALUES ('Dúvida Acadêmica');