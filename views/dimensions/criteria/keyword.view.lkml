include: "/views/dimensions/dimension_base.view.lkml"

view: keyword {
  extends: [dimension_base]
  sql_table_name: @{google_ads_dataset}.Keyword_@{google_ads_mcc_id} ;;

  dimension: _data {
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  dimension: _latest {
    sql: TIMESTAMP(${TABLE}._LATEST_DATE) ;;
  }

  dimension: unique_key {
    type:  string
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

  dimension: bidding_strategy_id {
    type: number
    sql: ${TABLE}.BiddingStrategyId ;;
  }

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.BiddingStrategyName ;;
  }

  dimension: bidding_strategy_source {
    type: string
    sql: ${TABLE}.BiddingStrategySource ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BiddingStrategyType ;;
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

  dimension: criterion_id {
    type: number
    sql: ${TABLE}.CriterionId ;;
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

  dimension: final_url_suffix {
    type: string
    sql: ${TABLE}.FinalUrlSuffix ;;
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

  dimension: keyword_match_type {
    type: string
    sql: ${TABLE}.KeywordMatchType ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
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
    sql: ${criterion_id} ;;
    drill_fields: [detail*, ad_group.detail*]
  }

  dimension: cpc_bid_usd {
    type: number
    sql: coalesce((${cpc_bid} / 1000000), ${ad_group.cpc_bid_usd}) ;;
  }

  # ----- Detail ------
  set: detail {
    fields: [criterion_id, criteria, status, quality_score, post_click_quality_score, cpc_bid]
  }
}
