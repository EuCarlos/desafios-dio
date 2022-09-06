CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(15),
    sexo CHAR(1),
    num_cpf CHAR(11) NOT NULL,
    endereco VARCHAR(45),
    CONSTRAINT unique_cpf_cliente UNIQUE (num_cpf)
);

INSERT INTO cliente (nome_completo, sexo, num_cpf, endereco) VALUES 
('Carlos Alves', 'm', '39739016006', 'Rua Araúnas 429'),
('Fernando Melo', 'm', '40439333040', 'Rua Garça 162'),
('Ana Silva', 'f', '18892624040', 'Rua Petrúcio Ferreira Lopes 233'),
('Pamela Mendes', 'f', '87959609020', 'Rua Quatorze 460'),
('André Santos', 'm', '87640205093', 'Rua Alemanha 597'),
('Maria de Jesus', 'f', '85136938048', 'Rua Doutor Murici 846');

ALTER TABLE cliente auto_increment=1;
        
CREATE TABLE produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome_do_produto VARCHAR(45) NOT NULL,
    classificacao_infantil BOOL DEFAULT false,
    categoria ENUM('Eletronico', 'Vestimenta', 'Alimentos', 'Brinquedos', 'Moveis') NOT NULL,
    avaliacao FLOAT DEFAULT 0,
    tamanho VARCHAR(10)
);

INSERT INTO produto (nome_do_produto, classificacao_infantil, categoria, avaliacao, tamanho) VALUES
('Smartphone Samsung', false, 'Eletronico','4', NULL),
('Carrinho de controle remoto', true,'Brinquedos', 3.6, NULL),
('Microfone Pro sem fio', false, 'Eletronico', 4, NULL),
('Sofa 3 lugares', false, 'Moveis', 3.2,'3x57x80'),
('Bolo de Cenoura veg', false, 'Alimentos', 4.7, NULL),
('Urso de Pelucia', true, 'Brinquedos', 4.5, NULL),
('Assistente Alexa', false, 'Eletronico', 5, NULL);

CREATE TABLE pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idPedidoCliente INT,
    status_do_pedido ENUM('Cancelado', 'Confirmado', 'Em processamento'),
    descricao_do_pedido VARCHAR(255),
    enviar_valor FLOAT DEFAULT 10,
    pagamento_em_dinheiro BOOL DEFAULT false,
    CONSTRAINT fk_pedidos_clientes FOREIGN KEY (idPedidoCliente) REFERENCES cliente(idCliente)
);


INSERT INTO pedido (idPedidoCliente, status_do_pedido, descricao_do_pedido, enviar_valor, pagamento_em_dinheiro) VALUES
(1, 'Confirmado', 'Compra via app',NULL,1),
(2, 'Em processamento', 'Compra via app',50,0),
(5, 'Confirmado', 'Compra via Web',NULL,1),
(4, 'Em processamento', 'Compra via Web',150,0),
(1, 'Confirmado','Compra via app',NULL,1),
(2, 'Cancelado','Compra via app',50,0),
(3, 'Confirmado', 'Compra via Web',NULL,1),
(2, 'Em processamento', 'Compra via app',50,0),
(4, 'Confirmado', 'Compra via Web',NULL,1),
(6, 'Cancelado', 'Compra via Web',150,0);

CREATE TABLE pagamento(
    idCliente INT,
    id_pagamento INT,
    tipo_de_pagamento ENUM('Boleto','Cartão','Dois cartões', 'Dinheiro'),
    limite_disponivel FLOAT,
    PRIMARY KEY(idCliente, id_pagamento)
);

CREATE TABLE armazenamento_produto(
    idArmazenamentoProduto INT AUTO_INCREMENT PRIMARY KEY,
    local_de_armazenamento VARCHAR(255),
    quantidade INT DEFAULT 0
);

INSERT INTO armazenamento_produto (local_de_armazenamento,quantidade) VALUES
('PE',4500),
('MG',1235),
('SP',2564),
('MS',1000),
('BA',100),
('DF',600);

CREATE TABLE fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(45) NOT NULL,
    cnpj CHAR(15) NOT NULL,
    telefone CHAR(11) NOT NULL,
    CONSTRAINT fornecedor_unico UNIQUE (cnpj)
);

INSERT INTO fornecedor (razao_social, cnpj, telefone) VALUES
('Dois irmão', 84556855000193, '11912345678'),
('C&PA Eletronicos', 61064776000160, '11912345678'),
('Casa do Bolo', 75218977000189, '11912345678'),
('Silva Vestimentas', 41254568000116, '11912345678'),
('Binquetos Tech', 41611581000185, '11912345678'),
('RM Modas', 46913996000127, '11912345678');

CREATE TABLE fornecedor_de_produtos (
    idFornecedorDeProdutos INT AUTO_INCREMENT PRIMARY KEY,
    idFDPFornecedor INT,
    idFDPProduto INT,
    quantidade INT
);

INSERT INTO fornecedor_de_produtos (idFDPFornecedor, idFDPProduto, quantidade) VALUES
(1,1,500),
(1,1,400),
(2,4,633),
(3,3,5),
(2,5,10);
                        
CREATE TABLE vendendor (
    idVendendor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(45) NOT NULL,
    cnpj CHAR (15) ,
    estado VARCHAR (255),
    telefone CHAR(11) NOT NULL,
    CONSTRAINT cnpj_unico_do_vendendor UNIQUE (cnpj)
);

INSERT INTO vendendor (razao_social, cnpj, estado, telefone) VALUES
('Dois irmão', '84556855000193', 'SP', '11912345678'),
('C&PA Eletronicos', '61064776000160', 'BA', '11912345678'),
('Casa do Bolo', '75218977000189', 'PE', '11912345678');
                        
CREATE TABLE produto_vendendor (
    idProdutoVendendor INT,
    idProduto INT,
    quantidade INT NOT NULL DEFAULT 1,
    PRIMARY KEY (idProdutoVendendor, idProduto),
    CONSTRAINT fk_product_seller FOREIGN KEY (idProdutoVendendor) REFERENCES vendendor(idVendendor),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduto) REFERENCES produto(idProduto)
);

INSERT INTO produto_vendendor (idProdutoVendendor, idProduto, quantidade) VALUES
(1,6,80),
(2,7,10);

CREATE TABLE pedido_produto (
    idPedidoProduto INT,
    idPedidoProdutoPedido INT,
    produto_pedido_quantidade INT NOT NULL DEFAULT 1,
    status_do_produto ENUM('Disponivel', 'Sem estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (idPedidoProduto, idPedidoProdutoPedido),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPedidoProduto) REFERENCES produto(idProduto),
    CONSTRAINT fk_product_product FOREIGN KEY (idPedidoProdutoPedido) REFERENCES pedido(idPedido)
);

INSERT INTO pedido_produto (idPedidoProduto, idPedidoProdutoPedido, produto_pedido_quantidade, status_do_produto) VALUES
(1,1,2,NULL),
(2,1,1,NULL),
(3,2,1,NULL);

CREATE TABLE endereco_de_armazenamento (
    idEDAProduto INT,
    idEDAArmazenamento INT,
    endereco VARCHAR(45) NOT NULL,
    PRIMARY KEY (idEDAProduto, idEDAArmazenamento),
    CONSTRAINT fk_product_seller FOREIGN KEY (idEDAProduto) REFERENCES produto(idProduto),
    CONSTRAINT fk_product_product FOREIGN KEY (idEDAArmazenamento) REFERENCES pedido(idPedido)
);

INSERT INTO endereco_de_armazenamento (idEDAProduto, idEDAArmazenamento, endereco) VALUES
(1,2,'PE'),
(2,6,'SP');

-----------------------------------------------------------------------------------------------
---------------------------------------- CONSULTAS SQL ----------------------------------------
-----------------------------------------------------------------------------------------------


-- Lista até 10 pedidos de clientes
SELECT * FROM cliente c, pedido p 
WHERE c.idCliente = idPedidoCliente
LIMIT 10;

-- Lista até pedidos de clientes em que o envior do valor não seja nulo e que o pagamento não seja em dinheiro
SELECT
	nome_completo AS cliente,
    num_cpf,
    endereco,
    status_do_pedido,
    enviar_valor
FROM cliente c, pedido p 
WHERE c.idCliente = idPedidoCliente
AND enviar_valor IS NOT NULL
AND pagamento_em_dinheiro = false
ORDER BY nome_completo
LIMIT 10;

-- Lista até 10 pedidos de clientes em que haja o envior do valor e que o pagamento seja em dinheiro
SELECT
	nome_completo AS cliente,
    num_cpf,
    endereco,
    status_do_pedido,
    IFNULL(enviar_valor, 'Pagamento em dinheiro') AS enviar_valor
FROM cliente c, pedido p 
WHERE c.idCliente = idPedidoCliente
AND enviar_valor IS NULL
AND pagamento_em_dinheiro = true
ORDER BY nome_completo
LIMIT 10;

-- Lista até 10 pedidos
SELECT 
    nome_completo AS cliente,
    idpedidocliente, 
    status_do_pedido 
FROM cliente c, pedido o 
WHERE c.idCliente = idpedidocliente
LIMIT 10;

-- Apresenta quantidade de pedidos agrupados pelo status do pedido
SELECT 
	status_do_pedido,
    COUNT(status_do_pedido) AS quantidade_de_pedidos
FROM cliente c, pedido o 
WHERE c.idCliente = idpedidocliente
GROUP BY status_do_pedido

-- Apresenta a quantidade de pedidor por genero e status do produto que o status não seja nulo
SELECT
	status_do_pedido,
	sexo,
	COUNT(sexo) AS quantidade_de_pedido_por_genero
FROM cliente c, pedido o 
WHERE c.idCliente = idpedidocliente
GROUP BY sexo, status_do_pedido
HAVING status_do_pedido IS NOT NULL

-- Apresenta a quantidade de pedidos feitos por clientes
SELECT 
    nome_completo as cliente, 
    CONCAT(
      COUNT(nome_completo), ' Pedidos' 
    ) AS quantidade_de_pedidos_por_cliente
FROM cliente c, pedido p 
WHERE c.idCliente = idpedidocliente
GROUP BY nome_completo
					