with 

source as (

    select * from {{ source('ecom', 'raw_stores') }}

),

renamed as (

    select
        -- Primary Key
        id as location_id,

        -- Details
        nullif(trim(name), '') as location_name,

        -- Numerics
        coalesce(tax_rate::number, 0) as tax_rate,

        -- Timestamps & Dates
        to_date(opened_at) as opened_date

    from source

)

select * from renamed