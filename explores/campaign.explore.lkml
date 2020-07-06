include: "/views/dimensions/*.view.lkml"

explore: campaign {
  hidden: yes
  conditionally_filter: {
    filters: {
      field: latest
      value: "Yes"
    }
    unless: [_data_date]
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign.external_customer_id} = ${customer.external_customer_id} AND
      ${campaign._data_raw} = ${customer._data_raw} ;;
    relationship:  many_to_one
  }
}
