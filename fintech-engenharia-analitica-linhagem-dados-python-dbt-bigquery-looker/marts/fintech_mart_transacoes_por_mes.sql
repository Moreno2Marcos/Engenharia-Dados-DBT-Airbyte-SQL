# Lab 9 - Analytics Engineering e Linhagem de Dados com Python, DBT, BigQuery e Looker Studio

with
    transacoes_mensais as (
        select
            d.mes_calendario,
            d.ano_calendario,
            d.trimestre_calendario,
            sum(v.quantidade_transacoes) as total_transacoes_mensal, -- sum(v.quantidade_venda) as total_vendas_mensal,
            sum(v.valor_total_transacionado) as valor_total_mensal
        from
            {{ ref('fato_transacoes') }} v
        join
            {{ ref('dim_data') }} d on v.id_data = d.id_data
        group by
            d.mes_calendario, d.ano_calendario, d.trimestre_calendario
    )

select * from transacoes_mensais
