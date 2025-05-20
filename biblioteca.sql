CREATE DATABASE Bibliotecas;
USE Bibliotecas;

DROP DATABASE Bibliotecas;

CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE,
    biografia TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL,
    curso VARCHAR(50),
    tipo ENUM('aluno', 'professor', 'funcionario') NOT NULL
);


CREATE TABLE Livros (
    id_livros INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50), 
    ano_publicacao INT,
    genero VARCHAR(50),
    descricao TEXT,
    edicao INT,
    disponibilidade BOOLEAN DEFAULT TRUE,
    editora VARCHAR(100),
    autor_id INT, 
    FOREIGN KEY (autor_id) REFERENCES Autores(id_autor)
);


CREATE TABLE Emprestimos (
    id_emprestimos INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    livro_id INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE,
    status ENUM('ativo', 'devolvido', 'atrasado') NOT NULL,
    multa DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (livro_id) REFERENCES Livros(id_livros)
    );

INSERT INTO Autores (nome, nacionalidade, data_nascimento, biografia) VALUES
('Carlos Silva', 'Brasileira', '1965-03-12', 'Autor renomado de romances históricos.'),
('Maria Oliveira', 'Brasileira', '1978-07-08', 'Professora universitária e escritora de psicologia.'),
('João Souza', 'Portuguesa', '1955-11-25', 'Especialista em literatura clássica.'),
('Ana Martins', 'Brasileira', '1982-01-14', 'Autora de best-sellers infantojuvenis.'),
('Luiz Fernando', 'Brasileira', '1970-04-30', 'Escreve sobre política e sociedade.'),
('Clara Mendes', 'Brasileira', '1990-09-22', 'Nova revelação da literatura contemporânea.'),
('Eduardo Lima', 'Angolana', '1968-06-17', 'Especialista em filosofia africana.'),
('Renata Pires', 'Brasileira', '1985-12-03', 'Poeta e crítica literária.'),
('Marcos Teixeira', 'Moçambicana', '1977-10-19', 'Foco em literatura de guerra.'),
('Helena Rocha', 'Brasileira', '1993-02-26', 'Autora de ficção científica.'),
-- Repetindo com variações para chegar a 40
('Guilherme Costa', 'Brasileira', '1972-05-15', 'Jornalista e autor de ensaios.'),
('Fernanda Alves', 'Brasileira', '1980-03-11', 'Escritora de contos.'),
('Ricardo Gonçalves', 'Brasileira', '1969-08-20', 'Especialista em livros técnicos.'),
('Patrícia Lima', 'Brasileira', '1988-07-30', 'Romancista contemporânea.'),
('Diego Freitas', 'Brasileira', '1991-11-01', 'Escreve sobre ficção especulativa.'),
('Letícia Borges', 'Brasileira', '1983-12-12', 'Autora premiada internacionalmente.'),
('André Nogueira', 'Brasileira', '1975-06-18', 'Autor de ficção urbana.'),
('Juliana Faria', 'Brasileira', '1987-01-09', 'Poetisa.'),
('Bruno Campos', 'Brasileira', '1992-04-24', 'Jovem autor revelação.'),
('Larissa Vieira', 'Brasileira', '1994-10-08', 'Foco em crônicas.'),
('César Tavares', 'Brasileira', '1960-02-17', 'Historiador e autor técnico.'),
('Sofia Brito', 'Brasileira', '1989-05-13', 'Especialista em didáticos.'),
('Tiago Almeida', 'Brasileira', '1971-07-21', 'Autor de política pública.'),
('Camila Neves', 'Brasileira', '1995-09-19', 'Jovem autora de romances.'),
('Fábio Monteiro', 'Brasileira', '1984-11-27', 'Literatura urbana.'),
('Adriana Lopes', 'Brasileira', '1990-06-15', 'Autora de fantasia.'),
('Paulo Henrique', 'Brasileira', '1976-08-23', 'Especialista em biografias.'),
('Tatiane Ramos', 'Brasileira', '1982-12-07', 'Foco em literatura LGBT+.'),
('Henrique Dias', 'Brasileira', '1996-03-28', 'Autor de horror psicológico.'),
('Nathalia Cruz', 'Brasileira', '1993-10-06', 'Jornalista e autora feminista.'),
('Samuel Moreira', 'Brasileira', '1981-09-02', 'Foco em literatura africana.'),
('Rafaela Coelho', 'Brasileira', '1998-07-12', 'Autora independente.'),
('Igor Ribeiro', 'Brasileira', '1986-04-04', 'Foco em filosofia e ética.'),
('Mariana Prado', 'Brasileira', '1991-01-01', 'Livros para adolescentes.'),
('Rodrigo Matos', 'Brasileira', '1979-05-09', 'Histórias realistas.'),
('Tatiana Souza', 'Brasileira', '1985-02-02', 'Obras sobre maternidade.'),
('Alexandre Fonseca', 'Brasileira', '1993-06-20', 'Crônicas urbanas.'),
('Isabela Duarte', 'Brasileira', '1997-09-25', 'Autora revelação de terror.'),
('Daniel Vasconcelos', 'Brasileira', '1980-11-18', 'Obras técnicas.'),
('Vanessa Martins', 'Brasileira', '1989-12-14', 'Poeta experimental.');

INSERT INTO Usuarios (nome, email, telefone, data_cadastro, curso, tipo) VALUES
('João Silva', 'joao.silva@email.com', '(11) 99999-9999', '2020-03-15', 'Engenharia de Computação', 'aluno'),
('Maria Oliveira', 'maria.oliveira@email.com', '(11) 88888-8888', '2021-05-20', 'Medicina', 'aluno'),
('Carlos Souza', 'carlos.souza@email.com', '(11) 77777-7777', '2019-01-10', 'Direito', 'aluno'),
('Ana Pereira', 'ana.pereira@email.com', '(11) 66666-6666', '2022-02-28', 'Administração', 'aluno'),
('Pedro Costa', 'pedro.costa@email.com', '(11) 55555-5555', '2020-11-05', 'Arquitetura', 'aluno'),
('Lucia Ferreira', 'lucia.ferreira@email.com', '(11) 44444-4444', '2021-07-15', 'Psicologia', 'aluno'),
('Marcos Santos', 'marcos.santos@email.com', '(11) 33333-3333', '2018-09-12', 'Engenharia Civil', 'aluno'),
('Julia Martins', 'julia.martins@email.com', '(11) 22222-2222', '2022-04-01', 'Design', 'aluno'),
('Paulo Rocha', 'paulo.rocha@email.com', '(11) 11111-1111', '2019-06-18', 'Economia', 'aluno'),
('Fernanda Alves', 'fernanda.alves@email.com', '(11) 12121-2121', '2020-08-22', 'Biologia', 'aluno'),
('Ricardo Lima', 'ricardo.lima@email.com', '(11) 13131-3131', '2021-03-30', 'Física', 'aluno'),
('Patricia Gomes', 'patricia.gomes@email.com', '(11) 14141-4141', '2018-12-05', 'Química', 'aluno'),
('Roberto Nunes', 'roberto.nunes@email.com', '(11) 15151-5151', '2022-01-10', 'Matemática', 'aluno'),
('Camila Dias', 'camila.dias@email.com', '(11) 16161-6161', '2019-04-15', 'História', 'aluno'),
('Gustavo Barbosa', 'gustavo.barbosa@email.com', '(11) 17171-7171', '2020-07-20', 'Geografia', 'aluno'),
('Amanda Ribeiro', 'amanda.ribeiro@email.com', '(11) 18181-8181', '2021-09-25', 'Letras', 'aluno'),
('Daniel Cardoso', 'daniel.cardoso@email.com', '(11) 19191-9191', '2018-11-30', 'Filosofia', 'aluno'),
('Beatriz Carvalho', 'beatriz.carvalho@email.com', '(11) 20202-0202', '2022-03-05', 'Sociologia', 'aluno'),
('Eduardo Pinto', 'eduardo.pinto@email.com', '(11) 21212-1212', '2019-05-10', 'Pedagogia', 'aluno'),
('Mariana Castro', 'mariana.castro@email.com', '(11) 23232-3232', '2020-10-15', 'Enfermagem', 'aluno'),
('Prof. Antonio Mendes', 'antonio.mendes@universidade.edu', '(11) 24242-4242', '2015-02-20', 'Literatura', 'professor'),
('Prof. Luiza Fontes', 'luiza.fontes@universidade.edu', '(11) 25252-5252', '2016-04-25', 'História', 'professor'),
('Prof. Fernando Teixeira', 'fernando.teixeira@universidade.edu', '(11) 26262-6262', '2017-06-30', 'Matemática', 'professor'),
('Prof. Helena Campos', 'helena.campos@universidade.edu', '(11) 27272-7272', '2018-08-05', 'Física', 'professor'),
('Prof. Sergio Moura', 'sergio.moura@universidade.edu', '(11) 28282-8282', '2019-10-10', 'Química', 'professor'),
('Func. Marta Andrade', 'marta.andrade@universidade.edu', '(11) 29292-9292', '2014-01-15', 'Biblioteca', 'funcionario'),
('Func. Rafael Siqueira', 'rafael.siqueira@universidade.edu', '(11) 30303-0303', '2015-03-20', 'Biblioteca', 'funcionario'),
('Func. Silvia Peixoto', 'silvia.peixoto@universidade.edu', '(11) 31313-1313', '2016-05-25', 'Biblioteca', 'funcionario'),
('Func. Tiago Rios', 'tiago.rios@universidade.edu', '(11) 32323-2323', '2017-07-30', 'Biblioteca', 'funcionario'),
('Func. Leticia Moraes', 'leticia.moraes@universidade.edu', '(11) 34343-4343', '2018-09-05', 'Biblioteca', 'funcionario'),
('Aluno Exemplo', 'aluno.exemplo@email.com', '(11) 35353-5353', '2021-02-15', 'Ciência da Computação', 'aluno'),
('Pai do Aluno', 'pai.aluno@email.com', '(11) 36363-6363', '2021-03-10', NULL, 'funcionario'),
('Mãe do Aluno', 'mae.aluno@email.com', '(11) 37373-7373', '2021-03-10', NULL, 'funcionario'),
('Bruno Henrique', 'bruno.henrique@email.com', '(11) 38383-8383', '2020-09-12', 'Engenharia Elétrica', 'aluno'),
('Carolina Duarte', 'carolina.duarte@email.com', '(11) 39393-9393', '2021-01-20', 'Medicina Veterinária', 'aluno'),
('Diego Ramos', 'diego.ramos@email.com', '(11) 40404-0404', '2019-11-05', 'Engenharia Mecânica', 'aluno'),
('Elaine Costa', 'elaine.costa@email.com', '(11) 41414-1414', '2020-04-18', 'Farmácia', 'aluno'),
('Fábio Mendonça', 'fabio.mendonca@email.com', '(11) 42424-2424', '2021-07-22', 'Odontologia', 'aluno'),
('Gabriela Lopes', 'gabriela.lopes@email.com', '(11) 43434-3434', '2018-05-30', 'Nutrição', 'aluno'),
('Hugo Vieira', 'hugo.vieira@email.com', '(11) 44444-4444', '2022-02-10', 'Educação Física', 'aluno');



INSERT INTO Livros (titulo, ano_publicacao, genero, descricao, edicao, editora, autor_id) VALUES
('O Segredo da Montanha', 2010, 'Aventura', 'Uma expedição misteriosa nas montanhas andinas.', 1, 'Editora Bravura', 1),
('A Última Página', 2012, 'Drama', 'História de um escritor em crise criativa.', 2, 'Literarte', 2),
('Sombras do Passado', 2015, 'Suspense', 'Mistérios familiares que voltam à tona.', 3, 'Editora Escarlate', 3),
('O Código Perdido', 2018, 'Ficção Científica', 'Um mundo onde a linguagem é a chave da sobrevivência.', 1, 'Nova Era', 4),
('Noites Tropicais', 2005, 'Romance', 'Paixões e intrigas no coração da Amazônia.', 5, 'Alvorada', 5),
('Fragmentos de Nós', 2020, 'Drama', 'Relatos entrelaçados de vidas urbanas.', 1, 'Editora Pulsar', 6),
('Céu de Chumbo', 1999, 'História', 'Narrativa sobre a ditadura militar.', 2, 'Contexto Atual', 7),
('Além do Véu', 2022, 'Fantasia', 'Uma jovem descobre um mundo mágico paralelo.', 1, 'Fantasia Brasil', 8),
('O Último Sol', 2017, 'Ficção Científica', 'A Terra à beira do colapso solar.', 4, 'Cosmos Publicações', 9),
('Entre Linhas', 2011, 'Romance', 'Amores nascidos entre páginas de livros.', 2, 'Amor & Letras', 10),

('O Homem de Gelo', 2009, 'Thriller', 'Crimes em meio ao Ártico.', 1, 'Polar Editora', 1),
('A Garota da Janela', 2016, 'Suspense', 'Uma testemunha improvável observa um crime.', 3, 'Mistério Atual', 2),
('Reflexos', 2013, 'Filosofia', 'Ensaios sobre identidade e consciência.', 1, 'Pensar Editora', 3),
('Canção das Estrelas', 2014, 'Ficção Científica', 'Viagem intergaláctica guiada por música.', 1, 'Harmonia Books', 4),
('Tempo Partido', 2018, 'Drama', 'Reencontros e desencontros ao longo da vida.', 2, 'Vértice Editorial', 5),
('Sob a Pele', 2019, 'Suspense', 'O mistério de uma identidade falsa.', 3, 'Escarlate', 6),
('Diário de Outono', 2007, 'Romance', 'Um amor vivido nas estações do tempo.', 4, 'Estação Brasil', 7),
('A Ilha do Silêncio', 2003, 'Terror', 'Um arquipélago onde ninguém volta vivo.', 2, 'TerrorSul', 8),
('O Labirinto das Palavras', 2016, 'Literatura', 'Uma metáfora sobre linguagem e loucura.', 1, 'Editora Letra', 9),
('Fendas na Realidade', 2021, 'Fantasia', 'Universos que se cruzam por portais secretos.', 1, 'Multiverso Livros', 10),

('Contos de uma Cidade Morta', 1995, 'Terror', 'Lendas urbanas de uma cidade abandonada.', 1, 'DarkPress', 1),
('O Assassino do Relógio', 2001, 'Policial', 'Um serial killer que mata pontualmente.', 2, 'Crime & Cia', 2),
('Verão Sem Fim', 2006, 'Romance', 'A história de um casal que vive o mesmo verão eternamente.', 1, 'Doce Leitura', 3),
('Sobre Viver', 2011, 'Autoajuda', 'Reflexões de um sobrevivente da guerra.', 1, 'SuperAção', 4),
('Mundo Sem Voz', 2020, 'Distopia', 'Uma sociedade onde a fala é proibida.', 1, 'Nova Ordem', 5),
('Além da Aurora', 2017, 'Ficção Científica', 'Colonização de um planeta gelado.', 1, 'Cosmos', 6),
('Ponto de Fuga', 2013, 'Suspense', 'Um arquiteto envolvido em uma conspiração.', 3, 'Perspectiva', 7),
('Do Lado de Dentro', 2019, 'Drama', 'Diário de um detento inocente.', 1, 'Fronteiras Editora', 8),
('O Relógio de Areia', 2002, 'Fantasia', 'Um objeto mágico que controla o tempo.', 2, 'Mística', 9),
('A Última Batalha', 2021, 'Aventura', 'Heróis improváveis em um reino dividido.', 1, 'Épico', 10),

('Versos de Guerra', 2015, 'Poesia', 'Poemas escritos em trincheiras.', 1, 'Letras do Front', 1),
('A Coragem de Lúcia', 2016, 'Biografia', 'História real de superação.', 1, 'Vida & Obra', 2),
('O Livro Proibido', 2018, 'Mistério', 'Investigações sobre um manuscrito antigo.', 2, 'Segredo Editorial', 3),
('Sombras do Leste', 2012, 'História', 'Guerras medievais no leste europeu.', 1, 'História Viva', 4),
('Os Olhos da Noite', 2009, 'Suspense', 'Segredos revelados ao escurecer.', 2, 'Mistério Central', 5),
('A Caverna', 2020, 'Ficção Científica', 'Humanos presos no fundo de Marte.', 1, 'Fronteira Cósmica', 6),
('A Filha do Mar', 2014, 'Romance', 'Amor e lenda em uma vila costeira.', 1, 'Oceano Editorial', 7),
('Memórias de um Cacto', 2011, 'Comédia', 'Reflexões filosóficas de uma planta.', 1, 'Humor Verde', 8),
('Cartas do Fim', 2013, 'Drama', 'Cartas trocadas em um hospital terminal.', 1, 'Vida & Palavra', 9),
('A Máquina dos Sonhos', 2017, 'Fantasia', 'Invenção capaz de manipular sonhos.', 2, 'Engrenagem Literária', 10);





INSERT INTO Emprestimos (usuario_id, livro_id, data_emprestimo, data_devolucao_prevista, data_devolucao_real, status, multa) VALUES
(1, 5, '2023-01-01', '2023-01-10', '2023-01-09', 'devolvido', 0.00),
(2, 8, '2023-01-03', '2023-01-13', '2023-01-15', 'atrasado', 3.00),
(3, 12, '2023-01-05', '2023-01-15', '2023-01-14', 'devolvido', 0.00),
(4, 15, '2023-01-08', '2023-01-18', NULL, 'ativo', 0.00),
(5, 20, '2023-01-10', '2023-01-20', '2023-01-25', 'atrasado', 5.00),
(6, 1, '2023-01-11', '2023-01-21', NULL, 'ativo', 0.00),
(7, 3, '2023-01-12', '2023-01-22', '2023-01-20', 'devolvido', 0.00),
(8, 6, '2023-01-15', '2023-01-25', NULL, 'ativo', 0.00),
(9, 9, '2023-01-17', '2023-01-27', NULL, 'ativo', 0.00),
(10, 14, '2023-01-19', '2023-01-29', '2023-01-30', 'atrasado', 2.00),

(11, 17, '2023-02-01', '2023-02-10', '2023-02-09', 'devolvido', 0.00),
(12, 18, '2023-02-03', '2023-02-13', '2023-02-14', 'atrasado', 1.50),
(13, 19, '2023-02-05', '2023-02-15', NULL, 'ativo', 0.00),
(14, 22, '2023-02-07', '2023-02-17', NULL, 'ativo', 0.00),
(15, 25, '2023-02-10', '2023-02-20', NULL, 'ativo', 0.00),
(16, 28, '2023-02-12', '2023-02-22', '2023-02-22', 'devolvido', 0.00),
(17, 30, '2023-02-13', '2023-02-23', NULL, 'ativo', 0.00),
(18, 32, '2023-02-15', '2023-02-25', '2023-03-01', 'atrasado', 4.00),
(19, 34, '2023-02-17', '2023-02-27', NULL, 'ativo', 0.00),
(20, 36, '2023-02-18', '2023-02-28', '2023-02-26', 'devolvido', 0.00),

(1, 37, '2023-03-01', '2023-03-10', NULL, 'ativo', 0.00),
(2, 38, '2023-03-02', '2023-03-12', '2023-03-15', 'atrasado', 2.50),
(3, 39, '2023-03-04', '2023-03-14', NULL, 'ativo', 0.00),
(4, 40, '2023-03-05', '2023-03-15', NULL, 'ativo', 0.00),
(5, 2, '2023-03-07', '2023-03-17', '2023-03-17', 'devolvido', 0.00),
(6, 4, '2023-03-09', '2023-03-19', NULL, 'ativo', 0.00),
(7, 7, '2023-03-10', '2023-03-20', NULL, 'ativo', 0.00),
(8, 10, '2023-03-12', '2023-03-22', '2023-03-23', 'atrasado', 1.00),
(9, 11, '2023-03-14', '2023-03-24', NULL, 'ativo', 0.00),
(10, 13, '2023-03-15', '2023-03-25', NULL, 'ativo', 0.00),

(11, 16, '2023-03-17', '2023-03-27', NULL, 'ativo', 0.00),
(12, 21, '2023-03-18', '2023-03-28', NULL, 'ativo', 0.00),
(13, 23, '2023-03-20', '2023-03-30', '2023-03-31', 'atrasado', 2.00),
(14, 24, '2023-03-21', '2023-03-31', NULL, 'ativo', 0.00),
(15, 26, '2023-03-23', '2023-04-02', NULL, 'ativo', 0.00),
(16, 27, '2023-03-24', '2023-04-03', '2023-04-05', 'atrasado', 3.00),
(17, 29, '2023-03-26', '2023-04-05', NULL, 'ativo', 0.00),
(18, 31, '2023-03-28', '2023-04-07', '2023-04-06', 'devolvido', 0.00),
(19, 33, '2023-03-30', '2023-04-09', NULL, 'ativo', 0.00),
(20, 35, '2023-03-31', '2023-04-10', NULL, 'ativo', 0.00);





