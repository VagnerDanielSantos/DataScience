

ALTER PROCEDURE [dbo].[uspWorkTransacoes]

AS BEGIN

IF OBJECT_ID ( 'WorkTransacoes ' ) IS NOT NULL
DROP TABLE WorkTransacoes

-- =================================================
-- Comando para apagar a tabela                                                             =
-- Não gerar erro de existência                                                                 =
-- Não gerar erro de NÃO existência                                                          =
-- =================================================

CREATE TABLE WorkTransacoes
(
	   [RowNumber] INT IDENTITY,
       [Order ID] VARCHAR ( 100),
       [Order Date] DATE,
       [Customer ID] NUMERIC,
       [Region] VARCHAR ( 100),
       [Rep] VARCHAR ( 100),
       [Item] VARCHAR ( 100),
       [Units] NUMERIC,
       [Unit Price] FLOAT,
)

-- =================================================
-- Truncar a tabela para não gerar duplicidade dos dados                              =
-- =================================================

TRUNCATE TABLE WorkTransacoes

-- =================================================
-- Inserção de dados na tabela WorkTransacoes                                              =
-- =================================================

INSERT INTO WorkTransacoes
(
       [Order ID],
       [Order Date],
       [Customer ID],
       [Region],
       [Rep],
       [Item],
       [Units],
      [Unit Price]
)
SELECT
		[Order ID],
		[Order Date],
	    RIGHT ( '0000000' + [Customer ID], 7 ),
		[Region],
		[Rep],
		[Item],
		[Units],
		[Unit Price]
  FROM [Udemy - Data Science].[dbo].[RAW_Transacoes_20180104]

-- =================================================
--  Foram afetadas 43 linhas                                                                    =
-- =================================================

END