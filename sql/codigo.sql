-- Comandos da questão 1:
CREATE DATABASE LIVRARIASONHADORES;
USE LIVRARIASONHADORES;

-- Comandos da questão 2:
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);
SELECT * FROM Cliente;



CREATE TABLE Categoria (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL
);
SELECT * FROM Categoria;



CREATE TABLE Autor (
    idAutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);
SELECT * FROM Autor;



CREATE TABLE Editora (
    idEditora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);
SELECT * FROM Editora;



CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    idCategoria INT,
    idAutor INT,
    idEditora INT,
    titulo VARCHAR(150) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidadeEstoque INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria),
    FOREIGN KEY (idAutor) REFERENCES Autor(idAutor),
    FOREIGN KEY (idEditora) REFERENCES Editora(idEditora)
);
SELECT * FROM Produto;



CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT,
    dataPedido DATE,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
SELECT * FROM Pedido;



CREATE TABLE ItemPedido (
    idPedido INT,
    idProduto INT,
    quantidade INT NOT NULL,
    precoUnitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (idPedido, idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
SELECT * FROM ItemPedido;



CREATE TABLE Funcionario (
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL
);
SELECT * FROM Funcionario;



CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);
SELECT * FROM Fornecedor;



CREATE TABLE EntregaExpressa (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    prazo INT NOT NULL
);
SELECT * FROM EntregaExpressa;



CREATE TABLE Embalagem (
    idEmbalagem INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);
SELECT * FROM Embalagem;



CREATE TABLE Sacola (
    idSacola INT PRIMARY KEY AUTO_INCREMENT,
    material VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);
SELECT * FROM Sacola;



CREATE TABLE Encomenda (
    idEncomenda INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
SELECT * FROM Encomenda;




CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    idPedido INT NOT NULL,
    formaPagamento VARCHAR(50) NOT NULL,
    valorTotal DECIMAL(10,2),
    dataPagamento DATE,
    bonus DECIMAL(10,2),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);
SELECT * FROM Pagamento;



CREATE TABLE Servico (
    idServico INT PRIMARY KEY AUTO_INCREMENT,
    idPedido INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,       
    descricao VARCHAR(100),          
    quantidade INT,
    preco DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);
SELECT * FROM Servico;



-- Comandos da questão 3:

-- Clientes
INSERT INTO Cliente (nome, cpf, email, telefone, endereco) VALUES
('Ana Souza', '12345678901', 'ana@email.com', '41999999999', 'Rua das Flores, 123'),
('Bruna Lima', '23456789012', 'bruna@email.com', '41988888888', 'Av. Brasil, 45'),
('Carlos Silva', '34567890123', 'carlos@email.com', '41977777777', 'Rua Central, 90'),
('Daniela Castro', '45678901234', 'daniela@email.com', '41966666666', 'Rua Primavera, 10'),
('Eduardo Alves', '56789012345', 'eduardo@email.com', '41955555555', 'Rua das Oliveiras, 22');

-- Categorias
INSERT INTO Categoria (descricao) VALUES
('Romance'), ('Ficção Científica'), ('Fantasia'), ('Autoajuda'), ('História');

-- Autores
INSERT INTO Autor (nome) VALUES
('Clarice Lispector'), ('Machado de Assis'), ('Neil Gaiman'), ('J.K. Rowling'), ('Yuval Harari');

-- Editoras
INSERT INTO Editora (nome) VALUES
('Moderna'), ('Rocco'), ('Intrínseca'), ('Companhia das Letras'), ('HarperCollins');

-- Produtos
INSERT INTO Produto (idCategoria, idAutor, idEditora, titulo, preco, quantidadeEstoque) VALUES
(1, 1, 4, 'A Hora da Estrela', 39.90, 12),
(2, 2, 3, 'Memórias Póstumas de Brás Cubas', 49.90, 8),
(3, 3, 5, 'Coraline', 59.90, 5),
(3, 4, 2, 'Harry Potter e a Pedra Filosofal', 79.90, 3),
(5, 5, 1, 'Sapiens: Uma Breve História da Humanidade', 89.90, 10);

-- Pedidos
INSERT INTO Pedido (idCliente, dataPedido) VALUES
(1,'2025-10-15'),
(2,'2025-10-15'),
(3,'2025-10-16'),
(4,'2025-10-16'),
(5,'2025-10-17');

-- Itens de pedido
INSERT INTO ItemPedido (idPedido, idProduto, quantidade, precoUnitario) VALUES
(1, 1, 1, 39.90),
(1, 3, 1, 59.90),
(2, 4, 2, 79.90),
(3, 2, 1, 49.90),
(5, 5, 1, 89.90);

-- Funcionários
INSERT INTO Funcionario (nome, cargo, login, senha) VALUES
('João Pereira', 'Gerente', 'joaop', '123'),
('Maria Santos', 'Atendente', 'marias', '123'),
('Lucas Almeida', 'Caixa', 'lucasa', '123'),
('Paula Nunes', 'Estoquista', 'paulan', '123'),
('Roberta Reis', 'Vendedora', 'robertar', '123');

-- Fornecedores
INSERT INTO Fornecedor (nome, cnpj, telefone) VALUES
('Distribuidora Moderna', '12345678000199', '41999999999'),
('Livros & Cia', '23456789000188', '41988888888'),
('Mundo Literário', '34567890000177', '41977777777'),
('Editora Brasil', '45678901000166', '41966666666'),
('BookSupreme', '56789012000155', '41955555555');

-- Entregas
INSERT INTO EntregaExpressa (tipo, valor, prazo) VALUES
('Rápida', 25.00, 1),
('Normal', 15.00, 3),
('Econômica', 10.00, 5),
('Prioritária', 35.00, 1),
('Internacional', 50.00, 7);

-- Embalagens
INSERT INTO Embalagem (tipo, preco) VALUES
('Presente Padrão', 5.00),
('Luxo', 10.00),
('Sustentável', 7.50),
('Com Tema Literário', 12.00),
('Simples', 3.00);

-- Sacolas
INSERT INTO Sacola (material, preco) VALUES
('Papel Reciclado', 2.00),
('Tecido', 5.00),
('Plástico Biodegradável', 3.00),
('Lona', 7.00),
('Algodão', 4.00);

-- Encomendas
INSERT INTO Encomenda (idCliente, estado) VALUES
(1, 'Aguardando fornecedor'),
(2, 'Confirmada'),
(3, 'Enviada'),
(4, 'Cancelada'),
(5, 'Entregue');

-- Pagamentos
INSERT INTO Pagamento (idPedido, formaPagamento, valorTotal, dataPagamento, bonus) VALUES
(1, 'Cartão de Crédito', 99.80, '2025-10-01', 0),
(2, 'Dinheiro', 159.80, '2025-10-03', 5.00),
(3, 'Cartão de Débito', 49.90, '2025-10-05', 0),
(4, 'Cartão de Crédito', 0.00, NULL, 0),
(5, 'Pix', 89.90, '2025-10-07', 10.00);

-- Serviços
INSERT INTO Servico (idPedido, tipo, descricao, quantidade, preco) VALUES
(1, 'Embalagem', 'Presente Padrão', 1, 5.00),
(2, 'Entrega Expressa', 'Entrega Rápida', 1, 25.00),
(3, 'Sacola', 'Sacola Sustentável', 1, 7.50),
(4, 'Embalagem', 'Luxo', 1, 10.00),
(5, 'Entrega Expressa', 'Entrega Normal', 1, 15.00);


-- Comandos da questão 4:                                                                                                                                       
-- Necessidade 1:  Listar o nome e e-mail de todos os clientes cadastrados, em ordem alfabética.
SELECT nome, email FROM Cliente ORDER BY nome ASC;

-- Necessidade 2:  Mostrar todos os produtos da categoria “Romance” e seus respectivos autores.
SELECT P.titulo, A.nome AS Autor
FROM Produto P
INNER JOIN Autor A ON P.idAutor = A.idAutor
INNER JOIN Categoria C ON P.idCategoria = C.idCategoria
WHERE C.descricao = 'Romance';

-- Necessidade 3: Atualizar o preço de todos os produtos da Editora “Moderna” em 10%.
UPDATE Produto
SET preco = preco * 1.10
WHERE idEditora IN (SELECT idEditora FROM Editora WHERE nome = 'Moderna');

-- Necessidade 4: Remover funcionários atendentes do sistema.
DELETE FROM Funcionario
WHERE cargo = 'Atendente';

-- Necessidade 5: Listar o total de vendas (soma do valor total pago) por forma de pagamento.
SELECT formaPagamento, SUM(valorTotal) AS TotalVendas
FROM Pagamento
GROUP BY formaPagamento
ORDER BY TotalVendas DESC;

-- Necessidade 6:  Listar o nome dos clientes e o valor total de seus pedidos.
SELECT C.nome, SUM(Pg.valorTotal) AS ValorTotalGasto
FROM Cliente C
INNER JOIN Pedido Pd ON C.idCliente = Pd.idCliente
INNER JOIN Pagamento Pg ON Pg.idPedido = Pd.idPedido
GROUP BY C.nome
ORDER BY ValorTotalGasto DESC;

-- Necessidade 7:  Listar os produtos que estão com estoque abaixo de 5 unidades.
SELECT titulo, quantidadeEstoque
FROM Produto
WHERE quantidadeEstoque < 5
ORDER BY quantidadeEstoque ASC;

-- Necessidade 8: Mostrar o nome dos funcionários e a quantidade de pedidos atendidos.
SELECT F.nome, COUNT(P.idPedido) AS PedidosAtendidos
FROM Funcionario F
LEFT JOIN Pedido P ON F.idFuncionario = P.idCliente
GROUP BY F.nome;

-- Necessidade 9:  Calcular a média, o menor e o maior valor das entregas expressas.
SELECT AVG(valor) AS MediaValor, MIN(valor) AS MenorValor, MAX(valor) AS MaiorValor
FROM EntregaExpressa;

-- Necessidade 10:  Mostrar os 3 produtos mais caros da livraria.
SELECT titulo, preco
FROM Produto
ORDER BY preco DESC
LIMIT 3;
