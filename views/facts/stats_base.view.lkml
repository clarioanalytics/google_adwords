view: stats_base {
  extension: required

  dimension_group: _data {
    description: "Filter on this field to limit query to a specified date range."
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year
    ]
    convert_tz: no
    sql: ${_data} ;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${TABLE}._DATA_DATE = ${TABLE}._LATEST_DATE ;;
  }

  dimension: ad_network_type1 {
    hidden: yes
  }

  dimension: ad_network_type2 {
    hidden: yes
  }

  dimension: ad_network_type {
    type: string
    sql: CASE
      WHEN ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' AND ${ad_network_type2} = 'SHASTA_AD_NETWORK_TYPE_2_SEARCH'
        THEN 'Search'
      WHEN ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_SEARCH' AND ${ad_network_type2} = 'SHASTA_AD_NETWORK_TYPE_2_SEARCH_PARTNERS'
        THEN 'Search Partners'
      WHEN ${ad_network_type1} = 'SHASTA_AD_NETWORK_TYPE_1_CONTENT'
        THEN 'Content'
      ELSE 'Other'
      END
      ;;
  }

  dimension: device {
    hidden: yes
  }

  dimension: device_type {
    type: string
    sql:  CASE
      WHEN ${device} LIKE '%Desktop%' THEN "Desktop"
      WHEN ${device} LIKE '%Mobile%' THEN "Mobile"
      WHEN ${device} LIKE '%Tablet%' THEN "Tablet"
      ELSE "Unknown" END;;
  }

  dimension: cost_usd {
    type: number
    sql: (${cost} / 1000000) ;;
  }

  measure: total_cost {
    hidden: yes
    type: sum
    sql: ${cost} ;;
  }

  measure: total_cost_usd {
    label: "Cost"
    type: sum
    sql: ${cost_usd} ;;
    value_format_name: usd_0
  }

  measure: total_conversions {
    label: "Conversions"
    type: sum
    sql: ${conversions} ;;
    value_format_name: decimal_0
  }

  measure: total_impressions {
    label: "Impressions"
    type:  sum
    sql:  ${impressions} ;;
    drill_fields: [external_customer_id, total_impressions]
    value_format_name: decimal_0
  }

  measure: total_interactions {
    label: "Interactions"
    type:  sum
    sql:  ${interactions} ;;
    drill_fields: [external_customer_id, total_impressions]
    value_format_name: decimal_0
  }

  measure: total_clicks {
    label: "Clicks"
    type: sum
    sql: ${clicks} ;;
    value_format_name: decimal_0
  }

## Due the manner in which Looker compiles SQL queries, finding weighted averages in this instance is better accomplished through an aggregated measure
## rather than creating a new dimension to be aggregated over

  measure: average_interaction_rate {
    label: "Interation Rate"
    type: number
    sql: ${total_interactions}*1.0/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: average_click_rate {
    label: "Click Through Rate"
    type: number
    sql: ${total_clicks}*1.0/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: average_cost_per_conversion {
    label: "Cost per Conversion"
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_click {
    label: "Cost per Click"
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_interaction {
    label: "Cost per Interaction"
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_interactions},0) ;;
    value_format_name: usd
  }

  measure: average_cost_per_impression {
    label: "Cost per Impression"
    type: number
    sql: ${total_cost_usd}*1.0 / NULLIF(${total_impressions},0) ;;
    value_format_name: usd
  }

  measure: average_conversion_rate {
    label: "Conversion Rate"
    type: number
    sql: ${total_conversions}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: percent_2
  }
}
