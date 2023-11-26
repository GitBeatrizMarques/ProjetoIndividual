create  DATABASE site;

USE site;

CREATE TABLE usuario 
(
id int primary key auto_increment,
nome varchar(45),
email varchar(100),
gender varchar(45),
idade int,
uf varchar(60),
senha varchar(45)
);

INSERT INTO usuario (nome, email, gender, idade, uf, senha) VALUES ('${nome}', '${email}', '${gender}', '${date}','${uf}' '${senha}');

CREATE TABLE questionario
(
idQuestionario int primary key auto_increment,
casaEscolhida varchar(45)
);
CREATE TABLE quiz
(
idQuiz int primary key auto_increment,
erros int,
acertos int,
fkUsuario int, 
constraint fkUser FOREIGN KEY (fkUsuario)
	REFERENCES usuario (id),
fkQuestionario int,
constraint fkQuest FOREIGN KEY (fkQuestionario)
	REFERENCES questionario (idQuestionario)
);



select * from usuario;

describe usuario;