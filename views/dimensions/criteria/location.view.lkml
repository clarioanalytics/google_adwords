view: location_based_campaign_criterion_3152229625 {
  sql_table_name: `vendor-sources-5958.google_adwords_NTE_SG.LocationBasedCampaignCriterion_3152229625`
    ;;

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: bid_modifier {
    type: number
    sql: ${TABLE}.BidModifier ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: criterion_id {
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: is_negative {
    type: yesno
    sql: ${TABLE}.IsNegative ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
