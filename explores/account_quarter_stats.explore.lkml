include: "/views/*.view"

explore: account_quarter_stats {
  hidden: yes
  persist_for: "24 hours"
  label: "Account Quarter Stats"
  view_label: "Account Quarter Stats"

  join: last_account_quarter_stats {
    from: account_quarter_stats
    view_label: "Last Quarter Account Stats"
    sql_on: ${account_quarter_stats.external_customer_id} = ${last_account_quarter_stats.external_customer_id} AND
      ${account_quarter_stats._data_last_quarter} = ${last_account_quarter_stats._data_quarter} ;;
    relationship: one_to_one
  }
  join:  customer {
    view_label: "Customer"
    sql_on: ${account_quarter_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${customer._latest} = ${customer._data_raw} ;;
    relationship: many_to_one
  }
}
