CREATE DATABASE sealSolutions;

USE sealSolutions;

CREATE TABLE tipo_usuario (
idTipo INT PRIMARY KEY auto_increment,
tipo CHAR(8)
);

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY auto_increment,
    nome VARCHAR(100) NOT NULL,
    sexo CHAR (3) NOT NULL,
    CONSTRAINT chkSexo CHECK (sexo IN ('MAS', 'FEM')),
    dtNasc DATE NOT NULL,
    CPF CHAR (11) NOT NULL,
    RG VARCHAR (9) NOT NULL,
    telefone_1 VARCHAR(20) NOT NULL,
    telefone_2 VARCHAR(20),
    email VARCHAR(100) NOT NULL,
    senha VARCHAR (100) NOT NULL,
    fkTipo INT,
    foreign key (fkTipo) REFERENCES tipo(idTipo)
);

CREATE TABLE CEP (
idCEP INT primary KEY auto_increment,
CEP INT,
endereço VARCHAR(45),
estado CHAR(2),
fkUsuario INT,
FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
);


CREATE TABLE remessaTomates (
idTomates INT PRIMARY KEY auto_increment,
qnt_unidade INT,
qnt_caixas INT,
qnt_quilos INT,
fkUsuario INT,
foreign key (fkUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE motorista (
idMotorista INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
idade INT,
cpf CHAR(11),
cnh CHAR(12)
);

CREATE TABLE trajeto (
idTrajeto INT primary key auto_increment,
localPartida VARCHAR(45),
destino VARCHAR(45),
distancia INT
);


CREATE TABLE caminhão (
idCaminhão INT primary key auto_increment,
marca VARCHAR(45),
cor varchar(45),
placa CHAR(7),
fkMotorista INT,
FOREIGN KEY (fkMotorista) REFERENCES motorista(idMotorista),
fkRemessaTomate INT,
FOREIGN KEY (fkRemessaTomate) REFERENCES remessaTomates(idTomates),
fkTrajeto INT,
FOREIGN KEY (fkTrajeto) REFERENCES trajeto(idTrajeto)
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipo CHAR(4),
fkCaminhão INT,
FOREIGN KEY (fkCaminhão) REFERENCES caminhão(idCaminhão)
);


CREATE TABLE dadosSensor (
idDadosSensor INT PRIMARY KEY auto_increment,
dtHora DATETIME,
temperatura FLOAT,
umidade INT,
fkSensor INT,
FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);