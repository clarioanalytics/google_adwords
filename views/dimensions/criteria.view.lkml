include: "/views/dimensions/dimension_base.view.lkml"

view: criteria {
  extends: [dimension_base]
  sql_table_name: @{google_ads_dataset}.Criteria_@{google_ads_mcc_id} ;;

  # ----- Extend _data and _latest from dimension_base ------
  dimension: _data {
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension: _latest {
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: unique_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(CAST(${ad_group_id} AS STRING),CAST(${criterion_id} AS STRING)) ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: approval_status {
    type: string
    sql: ${TABLE}.ApprovalStatus ;;
  }

  dimension: base_ad_group_id {
    type: number
    sql: ${TABLE}.BaseAdGroupId ;;
  }

  dimension: base_campaign_id {
    type: number
    sql: ${TABLE}.BaseCampaignId ;;
  }

  dimension: bid_modifier {
    type: number
    sql: ${TABLE}.BidModifier ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: cpc_bid {
    type: string
    sql: ${TABLE}.CpcBid ;;
  }

  dimension: cpc_bid_source {
    type: string
    sql: ${TABLE}.CpcBidSource ;;
  }

  dimension: cpm_bid_str {
    type: string
    sql: ${TABLE}.CpmBidStr ;;
  }

  dimension: cpv_bid {
    type: string
    sql: ${TABLE}.CpvBid ;;
  }

  dimension: cpv_bid_source {
    type: string
    sql: ${TABLE}.CpvBidSource ;;
  }

  dimension: creative_quality_score {
    type: string
    sql: ${TABLE}.CreativeQualityScore ;;
  }

  dimension: criteria {
    type: string
    sql: ${TABLE}.Criteria ;;
  }

  dimension: criteria_destination_url {
    type: string
    sql: ${TABLE}.CriteriaDestinationUrl ;;
  }

  dimension: criteria_type {
    type: string
    sql: ${TABLE}.CriteriaType ;;
  }

  dimension: criterion_id {
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.DisplayName ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpcEnabled ;;
  }

  dimension: estimated_add_clicks_at_first_position_cpc {
    type: number
    sql: ${TABLE}.EstimatedAddClicksAtFirstPositionCpc ;;
  }

  dimension: estimated_add_cost_at_first_position_cpc {
    type: number
    sql: ${TABLE}.EstimatedAddCostAtFirstPositionCpc ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: final_app_urls {
    type: string
    sql: ${TABLE}.FinalAppUrls ;;
  }

  dimension: final_mobile_urls {
    type: string
    sql: ${TABLE}.FinalMobileUrls ;;
  }

  dimension: final_urls {
    type: string
    sql: ${TABLE}.FinalUrls ;;
  }

  dimension: first_page_cpc {
    type: string
    sql: ${TABLE}.FirstPageCpc ;;
  }

  dimension: first_position_cpc {
    type: string
    sql: ${TABLE}.FirstPositionCpc ;;
  }

  dimension: has_quality_score {
    type: yesno
    sql: ${TABLE}.HasQualityScore ;;
  }

  dimension: is_negative {
    type: yesno
    sql: ${TABLE}.IsNegative ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: parameter {
    type: string
    sql: ${TABLE}.Parameter ;;
  }

  dimension: post_click_quality_score {
    type: string
    sql: ${TABLE}.PostClickQualityScore ;;
  }

  dimension: quality_score {
    type: number
    sql: ${TABLE}.QualityScore ;;
  }

  dimension: search_predicted_ctr {
    type: string
    sql: ${TABLE}.SearchPredictedCtr ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: system_serving_status {
    type: string
    sql: ${TABLE}.SystemServingStatus ;;
  }

  dimension: top_of_page_cpc {
    type: string
    sql: ${TABLE}.TopOfPageCpc ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
  }

  dimension: vertical_id {
    type: number
    sql: ${TABLE}.VerticalId ;;
  }

  measure: count {
    type: count_distinct
    sql:  ${criterion_id} ;;
    drill_fields: [detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [criteria]
  }
}
