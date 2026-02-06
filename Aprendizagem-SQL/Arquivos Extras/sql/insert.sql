
-- =========================
-- PAÍS
-- =========================
INSERT INTO pais (idpais, nome, sigla) VALUES
(1, 'Brasil', 'BR');

-- =========================
-- ESTADOS 
-- =========================
INSERT INTO estado (idestado, nome, sigla, idpais) VALUES
(10, 'Paraná', 'PR', 1),
(11, 'Santa Catarina', 'SC', 1);

-- =========================
-- CIDADES 
-- =========================
INSERT INTO cidade (idcidade, nome, inscricaoestadual, idestado) VALUES
(100, 'Cascavel',  90715420, 10),
(101, 'Foz do Iguaçu',  62148037, 10),
(102, 'Joinville',  38492015, 11);

-- =========================
-- USUÁRIOS 
-- =========================
INSERT INTO usuario (idusuario, nome, email) VALUES
(1000, 'Walter White',    'walterwhite@gmail.com'),
(1001, 'Jesse Pinkman',   'jessepinkman@gmail.com'),
(1002, 'Saul Goodman',    'saulgoodman@gmail.com'),
(1003, 'Gustavo Fring',   'gustavofring@gmail.com'); 

-- =========================
-- PARCEIROS 
-- =========================
INSERT INTO parceiro (idparceiro, nome, nomefantasia, documento) VALUES
(2000, 'Los Pollos Hermanos Alimentos LTDA', 'Los Pollos Hermanos', '27.418.506/0001-93'),
(2001, 'A1A Lavagem e Estetica Automotiva LTDA', 'A1A Car Wash', '41.930.772/0001-08'),
(2002, 'Vamonos Pest Controle Ambiental LTDA', 'Vamonos Pest', '10.684.395/0001-70');

-- =========================
-- ENDEREÇOS 
-- =========================
INSERT INTO endereco (idendereco, logradouro, numero, cep, complemento, idcidade, idusuario, idparceiro) VALUES
(3000, 'Rua Paraná',          '1450', '85810-010', 'Apto 402', 100, 1000, NULL),
(3001, 'Av. Brasil',          '2876', '85812-000', 'Casa',     100, 1001, NULL),
(3002, 'Rua Rio de Janeiro',  ' 920', '85814-120', 'Sala 12',  100, 1002, NULL),

(3100, 'Av. Tancredo Neves',  ' 455', '85805-000', 'Loja 03',  100, NULL, 2000),
(3101, 'Rua Curitiba',        '  88', '85807-110', 'Galpão B', 100, NULL, 2001),
(3102, 'Rua Souza Naves',     '3010', '85806-300', 'Fundos',   100, NULL, 2002);

-- =========================
-- TELEFONES 

-- =========================
INSERT INTO telefone (idtelefone, numero, idusuario, idparceiro) VALUES
(4000, '45 99914-7823', 1000, NULL),
(4001, '45 99802-1139', 1001, NULL),

(4100, '45 3225-9011', NULL, 2000),
(4101, '45 3035-7744', NULL, 2001),
(4102, '45 99973-5502', NULL, 2002);

-- =========================
-- PRODUTOS 
-- =========================
INSERT INTO produto (idproduto, codigo, nome, peso) VALUES
(5000, 'AZ-HEIS-01', 'Kit Vidraria 500ml (Heisenberg Lab)', 1.20),
(5001, 'AZ-HEIS-02', 'Balança Digital de Precisão 0.01g',    0.45),
(5002, 'AZ-HEIS-03', 'Máscara Respiratória com Filtro',       0.30),
(5003, 'AZ-HEIS-04', 'Luvas Nitrílicas Caixa 100un',          0.65),
(5004, 'AZ-HEIS-05', 'Galão Plástico Reforçado 20L',          2.10),
(5005, 'AZ-HEIS-06', 'Carrinho Dobrável de Carga',            12.80);

-- =========================
-- TABELA DE PREÇO
-- idnativo: 0 = ativa, 1 = inativa 
-- =========================
INSERT INTO tabelapreco (idtabelapreco, nome, idnativo) VALUES
(6000, 'Tabela Sul - Ativa', 0),
(6001, 'Tabela Antiga - Desativada', 1);

-- =========================
-- CONDIÇÃO DE PAGAMENTO
-- =========================
INSERT INTO condicaopagamento (idcondicaopagamento, nome) VALUES
(7000, 'PIX (imediato)'),
(7001, 'Cartão 2x'),
(7002, 'Boleto 14 dias');

-- =========================
-- PREÇOS POR TABELA
-- =========================
INSERT INTO tabelaprecoproduto (idtabelaprecoproduto, idtabelapreco, idproduto, preco) VALUES
(8000, 6000, 5000, 189.90),
(8001, 6000, 5001, 129.50),
(8002, 6000, 5002,  79.90),
(8003, 6000, 5003,  54.90),
(8004, 6000, 5004, 119.00),
(8005, 6000, 5005, 499.00);

-- =========================
-- PEDIDOS
-- =========================
INSERT INTO pedido (idpedido, datapedido, valortotal, quantidadeprodutos, idusuario, idparceiro, idtabelapreco, idcondicaopagamento) VALUES
(9000, CURRENT_DATE,       319.40, 2, 1000, 2000, 6000, 7000),
(9001, CURRENT_DATE - 1,   578.90, 3, 1001, 2001, 6000, 7001),
(9002, CURRENT_DATE,       119.00, 1, 1002, 2002, 6000, 7002);

-- =========================
-- ITENS DO PEDIDO
-- =========================
INSERT INTO pedidoproduto (idpedidoproduto, idpedido, idproduto, valorvenda) VALUES
(9500, 9000, 5000, 189.90),
(9501, 9000, 5002,  79.90),

(9502, 9001, 5005, 499.00),
(9503, 9001, 5003,  54.90),
(9504, 9001, 5002,  79.00),

(9505, 9002, 5004, 119.00);
