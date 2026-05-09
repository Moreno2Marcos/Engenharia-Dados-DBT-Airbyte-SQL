select
    id_veiculo as veiculo_id,
    placa as veiculo_placa,
    tipo_veiculo,
    capacidade_kg as veiculo_capacidade_kg,
    capacidade_m3 as veiculo_capacidade_m3,
    status as veiculo_status,
    date(criado_em) as veiculo_criado_em
from
    {{ ref('stg_veiculos') }}
order by veiculo_id asc
