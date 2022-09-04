CREATE TABLE cliente (
    idCliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    identifacacao VARCHAR(45),

    PRIMARY KEY (idCliente)
);

CREATE TABLE fornecedor (
    idFornecedor INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(45),
    cnpj VARCHAR(45),

    PRIMARY KEY (idFornecedor)
);

CREATE TABLE produto (
    idProduto INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(45),
    descricao VARCHAR(45),
    valor VARCHAR(45),

    PRIMARY KEY (idProduto)
);

CREATE TABLE pedido (
    idPedido INT NOT NULL AUTO_INCREMENT,
    status_do_pedido VARCHAR(45),
    descricao VARCHAR(45),
    frete FLOAT,
    pedido_idPedido INT,

    PRIMARY KEY (idPedido)
);

CREATE TABLE disponibilizando_um_produto (
    fornecedor_idFornecedor INT NOT NULL,
    produto_idProduto INT NOT NULL
);

ALTER TABLE disponibilizando_um_produto ADD CONSTRAINT fk_produto FOREIGN KEY (produto_idProduto) REFERENCES produto (idProduto);

ALTER TABLE disponibilizando_um_produto ADD CONSTRAINT fk_fornecedor FOREIGN KEY (fornecedor_idFornecedor) REFERENCES fornecedor (idFornecedor);

CREATE TABLE estoque (
    idEstoque INT NOT NULL AUTO_INCREMENT,
    local VARCHAR(45),

    PRIMARY KEY (idEstoque)
);

CREATE TABLE produto_has_estoque (
    produto_idProduto INT NOT NULL,
    estoque_idEstoque INT NOT NULL,
    quantidade INT
);

ALTER TABLE produto_has_estoque ADD CONSTRAINT fk_produto FOREIGN KEY (produto_idProduto) REFERENCES produto (idProduto);

ALTER TABLE produto_has_estoque ADD CONSTRAINT fk_fornecedor FOREIGN KEY (estoque_idEstoque) REFERENCES estoque (idEstoque);

ALTER TABLE cliente ADD CONSTRAINT fk_cliente_pedido FOREIGN KEY (idCliente) REFERENCES pedido (pedido_idPedido);

CREATE TABLE relacao_produto_pedido (
    produto_idProduto INT NOT NULL,
    pedido_idPedido INT NOT NULL,
    quantidade VARCHAR(45)
);

ALTER TABLE relacao_produto_pedido ADD CONSTRAINT fk_relacao_produto FOREIGN KEY (produto_idProduto) REFERENCES produto (idProduto);

ALTER TABLE relacao_produto_pedido ADD CONSTRAINT fk_relacao_pedido FOREIGN KEY (pedido_idPedido) REFERENCES pedido (idPedido);

CREATE TABLE terceiro_vendedor (
    idTerceiro_Vendedor INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(45),
    local VARCHAR(45),

    PRIMARY KEY (idTerceiro_Vendedor)
);

CREATE TABLE produto_por_vendedor (
    idTerceiro_Vendedor INT NOT NULL,
    produto_idProduto INT NOT NULL,
    quantidade INT
);

ALTER TABLE produto_por_vendedor ADD CONSTRAINT fk_ppv_terceirot_vendedor FOREIGN KEY (idTerceiro_Vendedor) REFERENCES terceiro_vendedor (idTerceiro_Vendedor);

ALTER TABLE produto_por_vendedor ADD CONSTRAINT fk_ppv_produto FOREIGN KEY (produto_idProduto) REFERENCES produto (idProduto);

CREATE TABLE conta_pj (
    idContaPJ INT NOT NULL AUTO_INCREMENT,
    num_CNPJ VARCHAR(18),
    cliente_idCliente INT,

    PRIMARY KEY (idContaPJ)
);

CREATE TABLE conta_pf (
    idContaPF INT NOT NULL AUTO_INCREMENT,
    num_CPF VARCHAR(15),
    cliente_idCliente INT,

    PRIMARY KEY (idContaPF)
);

ALTER TABLE cliente ADD CONSTRAINT fk_tipo_de_conta FOREIGN KEY (idCliente) REFERENCES conta_pj (idContaPJ);

ALTER TABLE cliente ADD CONSTRAINT fk_tipo_de_conta FOREIGN KEY (idCliente) REFERENCES conta_pf (idContaPF);

CREATE TABLE pagamento (
    idPagamento INT NOT NULL AUTO_INCREMENT,
    forma_de_pagamento VARCHAR(45),
    descricao VARCHAR(45),

    PRIMARY KEY (idPagamento)
);

ALTER TABLE pagamento ADD CONSTRAINT fk_forma_de_pagamento FOREIGN KEY (idPagamento) REFERENCES cliente (idCliente);

CREATE TABLE entrega (
    idEntrega INT NOT NULL AUTO_INCREMENT,
    status_de_entrega VARCHAR(45),
    codigo_de_rastreio VARCHAR(45),
    data_prevista_de_entrega DATETIME,
    data_de_saida_do_pedido DATETIME,

    PRIMARY KEY (idEntrega)
);

ALTER TABLE entrega ADD CONSTRAINT fk_entrega FOREIGN KEY (idEntrega) REFERENCES cliente (idCliente);