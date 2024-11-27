with tiendas as (

    select * from {{ ref('stg_Tiendas') }}

),


final as (

select

    ID_Tienda,
    Tienda,
    CCAA,
    Provincia,
    Municipio

from tiendas

)

select * from final
