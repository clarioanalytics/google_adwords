include: "/views/*.view"

explore: ad {
  hidden: yes
  conditionally_filter: {
    filters: {
      field: latest
      value: "Yes"
    }
    unless: [_data_date]
  }
  join: ad_group {
    view_label: "Ad Group"
    sql_on: ${ad.ad_group_id} = ${ad_group.ad_group_id}  AND
      ${ad._data_raw} = ${ad_group._data_raw} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad.campaign_id} = ${campaign.campaign_id} AND
      ${ad._data_raw} = ${campaign._data_raw} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${customer.external_customer_id} = ${customer.external_customer_id} AND
      ${customer._data_raw} = ${customer._data_raw} ;;
    relationship:  many_to_one
  }
}
