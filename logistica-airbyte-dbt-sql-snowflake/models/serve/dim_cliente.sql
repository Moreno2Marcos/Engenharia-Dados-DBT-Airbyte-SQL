select
    id_cliente as cliente_id,
    nome_razao_social as cliente_nome_razao_social,
    tipo_pessoa as cliente_tipo_pessoa,
    documento as cliente_documento,
    email as cliente_email,
    telefone as cliente_telefone,
    cidade as cliente_cidade,
    uf as cliente_uf,
    ativo as cliente_ativo,
    date(criado_em) as cliente_criado_em
from
    {{ ref('stg_clientes') }}
order by cliente_id asc
