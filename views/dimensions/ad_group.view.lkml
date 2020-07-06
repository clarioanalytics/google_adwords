include: "/views/dimensions/dimension_base.view.lkml"

view: ad_group {
  extends: [dimension_base]
  sql_table_name: @{google_ads_dataset}.AdGroup_@{google_ads_mcc_id} ;;

  dimension: _data {
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension: _latest {
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: ad_group_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: bidding_strategy_id {
    type: number
    sql: ${TABLE}.BiddingStrategyId ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: cpc_bid {
    hidden: yes
    type: string
    sql: ${TABLE}.CpcBid ;;
  }

  dimension: cpv_bid {
    hidden: yes
    type: string
    sql: ${TABLE}.CpvBid ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: ad_group_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupDesktopBidModifier ;;
  }

  dimension: ad_group_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupMobileBidModifier ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.AdGroupName ;;
  }

  dimension: ad_group_status {
    type: string
    sql: ${TABLE}.AdGroupStatus ;;
  }

  dimension: ad_group_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupTabletBidModifier ;;
  }

  dimension: ad_group_type {
    type: string
    sql: ${TABLE}.AdGroupType ;;
  }

  dimension: ad_rotation_mode {
    type: string
    sql: ${TABLE}.AdRotationMode ;;
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

  dimension: content_bid_criterion_type_group {
    type: string
    sql: ${TABLE}.ContentBidCriterionTypeGroup ;;
  }

  dimension: cpm_bid_str {
    type: string
    sql: ${TABLE}.CpmBidStr ;;
  }

  dimension: effective_target_roas {
    type: number
    sql: ${TABLE}.EffectiveTargetRoas ;;
  }

  dimension: effective_target_roas_source {
    type: string
    sql: ${TABLE}.EffectiveTargetRoasSource ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpcEnabled ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: target_cpa {
    hidden: yes
    type: number
    sql: ${TABLE}.TargetCpa ;;
  }

  dimension: target_cpa_bid_source {
    type: string
    sql: ${TABLE}.TargetCpaBidSource ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
  }

  dimension: cpc_bid_usd {
    type: number
    sql: (${cpc_bid} / 1000000)  ;;
  }

  dimension: cpv_bid_usd {
    type: number
    sql: (${cpv_bid} / 1000000) ;;
  }

  dimension: target_cpa_usd {
    type: number
    sql: (${target_cpa} / 1000000) ;;
  }

  measure: count {
    type: count_distinct
    sql: ${ad_group_id} ;;
    drill_fields: [detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [ad_group_id, ad_group_name, ad_group_status, cpc_bid, ad.count, keyword.count]
  }
}
