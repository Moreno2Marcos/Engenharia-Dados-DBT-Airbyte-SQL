select
    row_number() over (
        order by
            cidade_origem,
            uf_origem,
            cidade_destino,
            uf_destino
    ) as rota_id,
    cidade_origem as rota_cidade_origem,
    uf_origem as rota_uf_origem,
    cidade_destino as rota_cidade_destino,
    uf_destino as rota_uf_destino
from (
    select distinct
        cidade_origem,
        uf_origem,
        cidade_destino,
        uf_destino
    from
        {{ ref('stg_pedidos') }}
) r
order by rota_id asc
