with vendedores as (

    select * from {{ ref('stg_Vendedores') }}

),


final as (

select
    ID_Vendedor,
    Vendedor,
    Foto,
    Territorio

from vendedores

)

select * from final
