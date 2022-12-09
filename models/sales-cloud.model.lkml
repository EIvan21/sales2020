connection: "sales"

# include all the views
include: "/views/**/*.view"

datagroup: sales_cloud_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sales_cloud_default_datagroup

explore: customers {}

explore: date {}

explore: markets {}

explore: products {}

explore: transactions {
  join: customers {
    sql_on: ${transactions.customer_code} = ${customers.customer_code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: markets {
    sql_on: ${transactions.market_code} = ${markets.markets_code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: products {
    sql_on: ${transactions.product_code} = ${products.product_code} ;;
    type: left_outer
    relationship: many_to_one
  }
}
