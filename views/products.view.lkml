view: products {
  sql_table_name: sales.products ;;

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
