with productos as (

    select * from {{ source('mediamartdw','raw_Productos') }}

),
subcategorias as (

    select * from {{ source('mediamartdw','raw_Subcategorias') }}

),
categorias as (

    select * from {{ source('mediamartdw','raw_Categorias') }}

),


renombrada as (

select
    productos.[Codigo Producto] as Codigo_Producto,
    productos.Producto,
    productos.Precio,
    subcategorias.Subcategoria,
    categorias.Categoria

from productos

left join subcategorias on
    productos.SubcategoriaID = subcategorias.SubcategoriaID

left join categorias on
    subcategorias.CategoriaID = categorias.CategoriaID

),


final as (

select
    {{ dbt_utils.generate_surrogate_key(['Codigo_Producto'])}} as ID_Producto,
    *

from renombrada

)

select * from final