include: "/views/*.view"

explore: campaign_quarter_stats {
  hidden: yes
  persist_for: "24 hours"
  label: "Campaign Quarter Stats"
  view_label: "Campaign Quarter Stats"

  join: last_campaign_quarter_stats {
    from: campaign_quarter_stats
    view_label: "Last Quarter Campaign Stats"
    sql_on: ${campaign_quarter_stats.campaign_id} = ${last_campaign_quarter_stats.campaign_id} AND
      ${campaign_quarter_stats._data_last_quarter} = ${last_campaign_quarter_stats._data_quarter} ;;
    relationship: one_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_quarter_stats.campaign_id} = ${campaign.campaign_id}  AND
      ${campaign_quarter_stats._data_raw} = ${campaign._data_raw} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign_quarter_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${campaign_quarter_stats._data_raw} = ${customer._data_raw} ;;
    relationship: many_to_one
  }
}
