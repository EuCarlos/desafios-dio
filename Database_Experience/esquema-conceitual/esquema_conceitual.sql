CREATE TABLE `Cliente` (
  `idCliente` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `tipo_pessoa_cpf_cnpj` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `contato` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,

  PRIMARY KEY (`idCliente`)
);

CREATE TABLE `Pedido` (
  `idPedido` INT NOT NULL,
  `Status do Pedido` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Frete` FLOAT NULL,

  PRIMARY KEY (`idPedido`, `Cliente_idCliente`)
);

CREATE TABLE `Responsável` (
  `idResponsável` INT NOT NULL,
  `Nível helpdesk` INT NULL,
  `Nome` VARCHAR(45) NULL,
  `Departamento` VARCHAR(45) NULL,

  PRIMARY KEY (`idResponsável`)
);

CREATE TABLE `Ordem de Serviço` (
  `idOrdem de Serviço` INT NOT NULL,
  `dt_emissao` DATE NULL,
  `cliente` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `desc_veiculo` VARCHAR(45) NULL,
  `desc_servico` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `dt_conclusao` DATE NULL,
  `aut_cliente` TINYINT NULL,
  `Equipe Mecanico_idEquipe Mecanico` INT NOT NULL,

  PRIMARY KEY (`idOrdem de Serviço`, `Equipe Mecanico_idEquipe Mecanico`)
);

CREATE TABLE `Analise de pedido` (
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` VARCHAR(45) NOT NULL,
  `Responsável_idResponsável` INT NOT NULL,

  PRIMARY KEY (`Pedido_idPedido`, `Pedido_Cliente_idCliente`, `Responsável_idResponsável`)
);

CREATE TABLE `Produto` (
  `idProduto` INT NOT NULL,
  `categoria` VARCHAR(45) NULL,
  `descrição` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,

  PRIMARY KEY (`idProduto`)
);

CREATE TABLE `Cliente` (
  `idCliente` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `tipo_pessoa_cpf_cnpj` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `contato` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,

  PRIMARY KEY (`idCliente`)
);

CREATE TABLE `Estoque` (
  `idEstoque` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,

  PRIMARY KEY (`idEstoque`)
);

CREATE TABLE `Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `razao_social` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `contato` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,

  PRIMARY KEY (`idFornecedor`)
);

CREATE TABLE `Pedido` (
  `idPedido` INT NOT NULL,
  `Status do Pedido` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Frete` FLOAT NULL,

  PRIMARY KEY (`idPedido`, `Cliente_idCliente`)
);

CREATE TABLE `Disponibilização Produto` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,

  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`)
);

CREATE TABLE `Estoque_has_Produto` (
  `Estoque_idEstoque` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `quantidade` INT NULL,

  PRIMARY KEY (`Estoque_idEstoque`, `Produto_idProduto`)
);

CREATE TABLE `Relação de Produto/Pedido` (
  `Produto_idProduto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `quantidade` VARCHAR(45) NULL,

  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`)
);

CREATE TABLE `Vendedor_Terceirizado` (
  `idTerceiro - Vendedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `Local` VARCHAR(45) NULL,

  PRIMARY KEY (`idTerceiro - Vendedor`)
);

CREATE TABLE `Produtos por Vendedor (Terceiro)` (
  `Terceiro - Vendedor_idTerceiro - Vendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL,

  PRIMARY KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`, `Produto_idProduto`)
);

CREATE TABLE `Entrega` (
  `idEntrega` INT NOT NULL,
  `endereco_entrega` VARCHAR(45) NULL,
  `codigo_rastreio` VARCHAR(45) NULL,
  `tempo_estimado` VARCHAR(45) NULL,
  `data_entrega` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` INT NOT NULL,

  PRIMARY KEY (`idEntrega`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`)
);

CREATE TABLE `Pagamento` (
  `idPagamento` INT NOT NULL,
  `cartao_credito` VARCHAR(45) NULL,
  `cartão_debito` VARCHAR(45) NULL,
  `boleto_bancario` VARCHAR(45) NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` INT NOT NULL,

  PRIMARY KEY (`idPagamento`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`)
);

CREATE TABLE `Cartão de Credito` (
  `idCartão de Credito` INT NOT NULL,
  `nome_titular` VARCHAR(45) NULL,
  `numero_cartao` VARCHAR(45) NULL,
  `data_vencimento` VARCHAR(45) NULL,
  `cvv` VARCHAR(45) NULL,
  `Pagamento_idPagamento` INT NOT NULL,

  PRIMARY KEY (`idCartão de Credito`, `Pagamento_idPagamento`)
);

CREATE TABLE `Cartão de Debito` (
  `idCartão de Debito` INT NOT NULL,
  `nome_titular` VARCHAR(45) NULL,
  `numero_cartao` VARCHAR(45) NULL,
  `data_vencimento` VARCHAR(45) NULL,
  `cvv` VARCHAR(45) NULL,
  `Pagamento_idPagamento` INT NOT NULL,

  PRIMARY KEY (`idCartão de Debito`, `Pagamento_idPagamento`)
);

CREATE TABLE `Boleto Bancario` (
  `idBoleto` INT NOT NULL,
  `codigo_barras` VARCHAR(45) NULL,
  `vencimento` VARCHAR(45) NULL,
  `Pagamento_idPagamento` INT NOT NULL,

  PRIMARY KEY (`idBoleto`, `Pagamento_idPagamento`)
);

CREATE TABLE `Equipe Mecanico` (
  `idEquipe Mecanico` INT NOT NULL,
  `nome_equipe` VARCHAR(45) NULL,

  PRIMARY KEY (`idEquipe Mecanico`)
);

CREATE TABLE `Ordem de Serviço` (
  `idOrdem de Serviço` INT NOT NULL,
  `dt_emissao` DATE NULL,
  `cliente` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `desc_veiculo` VARCHAR(45) NULL,
  `desc_servico` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `dt_conclusao` DATE NULL,
  `aut_cliente` TINYINT NULL,
  `Equipe Mecanico_idEquipe Mecanico` INT NOT NULL,

  PRIMARY KEY (`idOrdem de Serviço`, `Equipe Mecanico_idEquipe Mecanico`)
);

CREATE TABLE `Dados Cliente` (
  `idOficina` INT NOT NULL,
  `cliente` VARCHAR(45) NULL,
  `tipo_pessoa_cpf_cnpj` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `cor` VARCHAR(45) NULL,
  `modelo_veiculo` VARCHAR(45) NULL,
  `ano_fabricacao` VARCHAR(45) NULL,
  `placa` VARCHAR(45) NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  `Ordem de Serviço_Equipe Mecanico_idEquipe Mecanico` INT NOT NULL,

  PRIMARY KEY (`idOficina`, `Ordem de Serviço_idOrdem de Serviço`, `Ordem de Serviço_Equipe Mecanico_idEquipe Mecanico`)
);

CREATE TABLE `Mecanico` (
  `idMecanico` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `especialidade` VARCHAR(45) NULL,

  PRIMARY KEY (`idMecanico`)
);

CREATE TABLE `Serviços` (
  `idServiços` INT NOT NULL,
  `desc_servicos` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,

  PRIMARY KEY (`idServiços`)
);

CREATE TABLE `Peças` (
  `idPeças` INT NOT NULL,
  `desc_peça` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,

  PRIMARY KEY (`idPeças`)
);

CREATE TABLE `Equipe Mecanico_has_Mecanico` (
  `Equipe Mecanico_idEquipe Mecanico` INT NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,

  PRIMARY KEY (`Equipe Mecanico_idEquipe Mecanico`, `Mecanico_idMecanico`)
);

CREATE TABLE `Ordem de Serviço_has_Serviços` (
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  `Serviços_idServiços` INT NOT NULL,

  PRIMARY KEY (`Ordem de Serviço_idOrdem de Serviço`, `Serviços_idServiços`)
);

CREATE TABLE `Ordem de Serviço_has_Peças` (
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  `Peças_idPeças` INT NOT NULL,

  PRIMARY KEY (`Ordem de Serviço_idOrdem de Serviço`, `Peças_idPeças`)
);
