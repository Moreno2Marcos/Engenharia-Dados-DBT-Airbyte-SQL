select
    id_motorista as motorista_id,
    nome as motorista_nome,
    cpf as motorista_cpf,
    cnh_numero as motorista_cnh_numero,
    categoria_cnh as motorista_categoria_cnh,
    telefone as motorista_telefone,
    status as motorista_status,
    date(criado_em) as motorista_criado_em
from
    {{ ref('stg_motoristas') }}
order by motorista_id asc
