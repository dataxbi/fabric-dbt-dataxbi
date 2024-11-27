with ventas as (

    select * from {{ source('mediamartdw','raw_Ventas') }}

),
productos as (

    select * from {{ ref('stg_Productos') }}

),
clientes as (

    select * from {{ ref('stg_Clientes') }}

),
tiendas as (

    select * from {{ ref('stg_Tiendas') }}

),
vendedores as (

    select * from {{ ref('stg_Vendedores') }}

),


final as (

select
    ventas.[Fecha Pedido] as Fecha_Pedido,
    ventas.[Fecha Envio] as Fecha_Envio,
    ventas.[Fecha Factura] as Fecha_Factura,
    productos.ID_Producto,
    clientes.ID_Cliente,
    tiendas.ID_Tienda,
    vendedores.ID_Vendedor,
    ventas.[Precio Unitario] as Precio_Unitario,
    ventas.[Coste Unitario] as Coste_Unitario,
    ventas.Cantidad

from ventas

left join productos on
    ventas.[Codigo Producto] = productos.Codigo_Producto

left join clientes on
    ventas.[Codigo Cliente] = clientes.Codigo_Cliente

left join tiendas on
    ventas.[Codigo Tienda] = tiendas.Codigo_Tienda

left join vendedores on
    ventas.[Codigo Vendedor] = vendedores.Codigo_Vendedor

)


select * from final
