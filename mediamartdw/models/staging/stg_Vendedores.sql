with vendedores as (

    select * from {{ source('raw','raw_Vendedores') }}

),


final as (

select
    {{ dbt_utils.generate_surrogate_key(['Codigo_Vendedor'])}} as ID_Vendedor,
    *

from vendedores

)


select * from final
