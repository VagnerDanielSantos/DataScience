
ALTER PROCEDURE [dbo].[uspDerivadaClientesTransacoes]

AS BEGIN

-- =================================================
-- Comando para apagar a tabela                                                             =
-- Não gerar erro de existência                                                                 =
-- Não gerar erro de NÃO existência                                                          =
-- =================================================

IF OBJECT_ID ( 'DerivadaClientesTransacoes' ) IS NOT NULL
DROP TABLE [dbo].[DerivadasClientesTransacoes]

-- =================================================
-- Criação da Tabela ClientesTransações                                                             =
-- =================================================

CREATE TABLE DerivadaClientesTransacoes
(
	RowNumber INT IDENTITY,
	[Customer ID] NUMERIC, 
	City VARCHAR ( 100 ), 
	Zipcode VARCHAR ( 100 ), 
	Gender CHAR ( 1 ), 
	Age FLOAT, 
	[Order ID] VARCHAR ( 100 ), 
	[Order Date] DATE, 
	Region VARCHAR ( 100 ), 
	Rep VARCHAR ( 100 ), 
	Item VARCHAR ( 100 ), 
	Units NUMERIC, 
	[Unit Price] FLOAT
)

-- =================================================
-- Truncar a tabela para não gerar duplicidade dos dados                              =
-- =================================================

TRUNCATE TABLE [dbo].[DerivadaClientesTransacoes]

-- =================================================
-- Inserção de dados na tabela ClientesTransações                                              =
-- =================================================

INSERT INTO DerivadaClientesTransacoes
(
	[Customer ID], 
	City, 
	Zipcode, 
	Gender, 
	Age, 
	[Order ID], 
	[Order Date], 
	Region, 
	Rep, 
	Item, 
	Units, 
	[Unit Price]
)
SELECT        
	dbo.WorkClientes.[Customer ID], 
	dbo.WorkClientes.City, 
	dbo.WorkClientes.Zipcode, 
	dbo.WorkClientes.Gender, 
	dbo.WorkClientes.Age, 
	dbo.WorkTransacoes.[Order ID], 
	dbo.WorkTransacoes.[Order Date], 
	dbo.WorkTransacoes.Region, 
	dbo.WorkTransacoes.Rep, 
	dbo.WorkTransacoes.Item, 
	dbo.WorkTransacoes.Units, 
	dbo.WorkTransacoes.[Unit Price]
FROM dbo.WorkClientes 
INNER JOIN
	dbo.WorkTransacoes 
	ON 
		dbo.WorkClientes.[Customer ID] = dbo.WorkTransacoes.[Customer ID]

-- =================================================
--  Foram afetadas 43 linhas                                                                    =
-- =================================================

END