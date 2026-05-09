select
    e.id_entrega as entrega_id,
    e.id_pedido as pedido_id,
    p.id_cliente as cliente_id,
    e.id_motorista as motorista_id,
    e.id_veiculo as veiculo_id,
    r.rota_id,
    date(p.data_pedido) as pedido_data,
    date(e.data_coleta_prevista) as coleta_prevista_data,
    date(e.data_entrega_prevista) as entrega_prevista_data,
    date(e.data_coleta_real) as coleta_real_data,
    date(e.data_entrega_real) as entrega_real_data,
    p.status as pedido_status,
    e.status as entrega_status,
    p.peso_total_kg,
    p.volume_total_m3,
    p.valor_frete,
    datediff('hour', e.data_coleta_real, e.data_entrega_real) as tempo_entrega_horas,
    case
        when e.data_entrega_real is not null
            and e.data_entrega_prevista is not null
            and e.data_entrega_real <= e.data_entrega_prevista
        then 1
        else 0
    end as entrega_no_prazo
from
    {{ ref('stg_entregas') }} e
    left join {{ ref('stg_pedidos') }} p on e.id_pedido = p.id_pedido
    left join {{ ref('dim_rota') }} r
        on p.cidade_origem = r.rota_cidade_origem
        and p.uf_origem = r.rota_uf_origem
        and p.cidade_destino = r.rota_cidade_destino
        and p.uf_destino = r.rota_uf_destino
order by entrega_id asc
