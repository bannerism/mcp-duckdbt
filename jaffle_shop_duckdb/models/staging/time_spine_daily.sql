{{
    config(
        materialized = 'table',
    )
}}

with date_spine as (

  {{ dbt.date_spine(
      start_date="make_date('2020','01','01')",
      datepart="day",
      end_date="make_date('2050','12','31')"
     )
  }}
)

select * from date_spine