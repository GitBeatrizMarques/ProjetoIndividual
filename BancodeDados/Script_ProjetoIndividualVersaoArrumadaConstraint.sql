create  DATABASE site;

USE site;

CREATE TABLE usuario 
(
id int primary key auto_increment,
nome varchar(45),
email varchar(100),
gender varchar(45),
CONSTRAINT check_gender CHECK (LOWER(gender) IN ('feminino', 'masculino', 'outros')),
idade int,
uf varchar(60),
senha varchar(45)
);

INSERT INTO usuario (nome, email, gender, idade, uf, senha) VALUES ('${nome}', '${email}', '${gender}', '${date}','${uf}' '${senha}');

CREATE TABLE pesquisa
(
idPesquisa int primary key auto_increment
);

CREATE TABLE quiz
(
idQuiz int primary key auto_increment,
acertos int,
tentativas int,
fkUsuario int, 
constraint fkUser FOREIGN KEY (fkUsuario)
	REFERENCES usuario (id)
);

-- MEDIA DE IDADES
SELECT AVG(idade) AS media_idade FROM usuario;

-- PERCENTUAL DE ACERTOS NO QUIZ
SELECT (SUM(acertos) / SUM(totalperguntas)) * 100 AS percentualAcertos FROM quiz;


-- QUANTIDADE DE USUARIOS POR ESTADO
SELECT uf, COUNT(*) AS quantidadeUsuarios
FROM usuario
GROUP BY uf;

-- QUANTIDADE DE PESSOAS POR GENERO
SELECT
    gender,
    COUNT(*) AS total
FROM
    usuario
GROUP BY
    gender;

-- TOTAL DE USUÁRIOS CADASTRADOS
SELECT COUNT(*) AS totalUsuarios FROM usuario;

SELECT
            COUNT(id) as totalUsuarios,
            SUM(CASE WHEN gender = 'Masculino' THEN 1 ELSE 0 END) as totalMasculino,
            SUM(CASE WHEN gender = 'Feminino' THEN 1 ELSE 0 END) as totalFeminino,
            AVG(idade) as mediaIdade,
            uf,
            COUNT(DISTINCT uf) as totalEstados,
            COUNT(id) / COUNT(DISTINCT uf) as mediaUsuariosPorEstado
        FROM usuario
        GROUP BY uf;
        
        SELECT
            COUNT(id) as totalUsuarios,
            SUM(CASE WHEN gender = 'Masculino' THEN 1 ELSE 0 END) as totalMasculino,
            SUM(CASE WHEN gender = 'Feminino' THEN 1 ELSE 0 END) as totalFeminino,
            AVG(idade) as mediaIdade
        FROM usuario;
        
        SELECT
    COUNT(id) as totalUsuarios,
    SUM(CASE WHEN gender = 'Masculino' THEN 1 ELSE 0 END) as totalMasculino,
    SUM(CASE WHEN gender = 'Feminino' THEN 1 ELSE 0 END) as totalFeminino,
    AVG(idade) as mediaIdade,
    (SELECT COUNT(DISTINCT uf) FROM usuario) as totalEstados
FROM usuario;

         SELECT
            COUNT(id) as totalUsuarios,
            SUM(CASE WHEN gender = 'Masculino' THEN 1 ELSE 0 END) as totalMasculino,
            SUM(CASE WHEN gender = 'Feminino' THEN 1 ELSE 0 END) as totalFeminino,
            AVG(idade) as mediaIdade,
            uf,
            COUNT(DISTINCT uf) as totalEstados,
            COUNT(id) / COUNT(DISTINCT uf) as mediaUsuariosPorEstado
        FROM usuario
        GROUP BY uf WITH ROLLUP;

-- ALTERAÇÕES
ALTER TABLE quiz DROP COLUMN erros;
DESCRIBE quiz;
ALTER TABLE quiz ADD COLUMN totalPerguntas INT;
ALTER TABLE quiz DROP COLUMN totalPerguntas;

ALTER TABLE usuario MODIFY COLUMN uf CHAR(2);
DELETE FROM usuario WHERE id = 7;
SELECT * FROM usuario;
SELECT * FROM quiz;

ALTER TABLE usuario
ADD CONSTRAINT check_gender CHECK (LOWER(gender) IN ('feminino', 'masculino', 'outros'));

TRUNCATE TABLE usuario;

drop table usuario;
drop table quiz;
drop table questionario;

delete from usuario where id = 11;

describe usuario;
ALTER TABLE quiz DROP column fkQuestionario;

ALTER TABLE quiz ADD COLUMN tentativas INT;
