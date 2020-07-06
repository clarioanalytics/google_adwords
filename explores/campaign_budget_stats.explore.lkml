include: "/views/facts/campaign_budget_stats.view"
include: "/views/dimensions/campaign.view"
include: "/views/dimensions/customer.view"

explore: campaign_budget_stats {
  hidden: yes
  persist_for: "24 hours"
  label: "Campaign Budget Stats"
  view_label: "Campaign Budget Stats"

  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_budget_stats.campaign_id} = ${campaign.campaign_id}  AND
      ${campaign_budget_stats._data_raw} = ${campaign._data_raw} ;;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${campaign_budget_stats.external_customer_id} = ${customer.external_customer_id} AND
      ${campaign_budget_stats._data_raw} = ${customer._data_raw} ;;
    relationship: many_to_one
  }
}
