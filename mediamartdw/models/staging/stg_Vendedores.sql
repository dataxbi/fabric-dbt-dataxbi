with vendedores as (

    select * from {{ source('mediamartdw','raw_Vendedores') }}

),


renombrada as (

select
    [Codigo Vendedor] as Codigo_Vendedor,
    Vendedor,
    Foto,
    Territorio

from vendedores

),

final as (

select
    {{ dbt_utils.generate_surrogate_key(['Codigo_Vendedor'])}} as ID_Vendedor,
    *

from renombrada

)


select * from final
