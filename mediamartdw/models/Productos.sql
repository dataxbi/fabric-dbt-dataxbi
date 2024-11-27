with productos as (

    select * from {{ ref('stg_Productos') }}

),

final as (

select
    ID_Producto,
    Producto,
    Precio,
    Subcategoria,
    Categoria

from productos
)

select * from final
