
--DROP TABLE [dbo].[WorkClientes]

--DROP PROCEDURE uspWorkClientes

ALTER PROCEDURE [dbo].[uspWorkClientes]

AS BEGIN

-- =================================================
-- Comando para apagar a tabela                                                             =
-- Não gerar erro de existência                                                                 =
-- Não gerar erro de NÃO existência                                                          =
-- =================================================

IF OBJECT_ID ( 'WorkClientes' ) IS NOT NULL
DROP TABLE [dbo].[WorkClientes]

-- =================================================
-- Criação da Tabela WorkClientes                                                             =
-- =================================================

CREATE TABLE WorkClientes
(
	RowNumber INT IDENTITY,
	[Customer ID] NUMERIC,
	City VARCHAR ( 100 ),
	Zipcode VARCHAR ( 100 ),
	Gender CHAR ( 1 ),
	Age FLOAT
)

-- =================================================
-- Truncar a tabela para não gerar duplicidade dos dados                              =
-- =================================================

TRUNCATE TABLE [dbo].[WorkClientes]

-- =================================================
-- Inserção de dados na tabela WorkClientes                                              =
-- =================================================

INSERT INTO WorkClientes
(
	[Customer ID],
    City,
    Zipcode,
    Gender,
    Age
)
SELECT 
	RIGHT ('0000000' + [Customer ID], 7 ),
    City,
    ZipCode,
    Gender,
    Age
  FROM 
	[Udemy - Data Science].[dbo].[RAW_Clientes_20180104]

-- =================================================
--  Foram afetadas 43 linhas                                                                    =
-- =================================================

END