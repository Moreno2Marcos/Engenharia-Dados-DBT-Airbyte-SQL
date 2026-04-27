# Lab 9 - Analytics Engineering e Linhagem de Dados com Python, DBT, BigQuery e Looker Studio

with
    transacoes_agrupadas as (
        select
            v.id_cliente,
            c.nome_cliente,
            sum(v.quantidade_transacoes) as total_produtos_transacionados, --sum(v.quantidade_venda) as total_produtos_comprados,
            sum(v.valor_total_transacionado) as valor_total_gasto --sum(v.valor_total_venda) as valor_total_gasto
        from
            {{ ref('fato_transacoes') }} v
        join
            {{ ref('dim_clientes') }} c on v.id_cliente = c.id_cliente
        group by
            v.id_cliente, c.nome_cliente
    )

select * from transacoes_agrupadas
