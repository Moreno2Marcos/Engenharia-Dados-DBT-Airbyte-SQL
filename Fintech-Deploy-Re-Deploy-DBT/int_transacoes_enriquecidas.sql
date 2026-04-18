{{ config(materialized='view') }}  

SELECT
    t.id_transacao,
    t.id_conta,
    ct.id_cliente,
    c.nome,
    c.email,
    ct.tipo_conta,
    t.tipo_transacao,
    CASE
        WHEN t.tipo_transacao IN ('deposito', 'pix_recebido') THEN 'entrada'
        WHEN t.tipo_transacao IN ('pix_enviado', 'saque', 'pagamento_boleto', 'compra_cartao') THEN 'saida'
        ELSE 'nao_classificado'
    END AS natureza_movimentacao,
    t.valor,
    t.data_transacao,
    CAST(t.data_transacao AS DATE) AS data_movimento,
	CAST(strftime('%Y', t.data_transacao) AS INTEGER) AS ano_transacao,
    CAST(strftime('%m', t.data_transacao) AS INTEGER) AS mes_transacao,
    CAST(strftime('%d', t.data_transacao) AS INTEGER) AS dia_transacao
FROM transacoes t
INNER JOIN contas ct
    ON t.id_conta = ct.id_conta
INNER JOIN clientes c
    ON ct.id_cliente = c.id_cliente