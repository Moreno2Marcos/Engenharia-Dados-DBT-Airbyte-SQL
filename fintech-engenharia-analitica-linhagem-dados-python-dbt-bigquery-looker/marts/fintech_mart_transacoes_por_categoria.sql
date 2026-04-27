# Lab 9 - Analytics Engineering e Linhagem de Dados com Python, DBT, BigQuery e Looker Studio

with
    transacoes_por_categoria as (
        select
            p.categoria_produto,
            sum(v.quantidade_transacoes) as quantidade_transacionada, --sum(v.quantidade_venda) as quantidade_vendida,
            round(sum(v.valor_total_transacionado), 2) as valor_total_transacoes --round(sum(v.valor_total_venda), 2) as valor_total_vendas
        from
            {{ ref('fato_transacoes') }} v
        join
            {{ ref('dim_produtos') }} p on v.id_produto = p.id_produto
        group by
            p.categoria_produto
    )

select * from transacoes_por_categoria
