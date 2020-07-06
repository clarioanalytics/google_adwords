include: "/views/facts/*.view.lkml"

view: master_stats {
  extends: [stats_base]

  sql_table_name:
  {% if (ad._in_query or master_stats.creative_id._in_query) %}
    @{google_ads_dataset}.AdBasicStats_@{google_ads_mcc_id}
  {% elsif (audience._in_query or master_stats.audience_criterion_id._in_query) %}
    @{google_ads_dataset}.AudienceBasicStats_@{google_ads_mcc_id}
  {% elsif (keyword._in_query or master_stats.criteria_id._in_query) %}
    @{google_ads_dataset}.KeywordBasicStats_@{google_ads_mcc_id}
  {% elsif (ad_group._in_query or master_stats.ad_group_id._in_query) %}
    {% if master_stats.hour_of_day._in_query %}
      @{google_ads_dataset}.HourlyAdGroupStats_@{google_ads_mcc_id}
    {% else %}
      @{google_ads_dataset}.AdGroupBasicStats_@{google_ads_mcc_id}
    {% endif %}
  {% elsif (campaign._in_query or master_stats.campaign_id._in_query) %}
    {% if master_stats.hour_of_day._in_query %}
      @{google_ads_dataset}.HourlyCampaignStats_@{google_ads_mcc_id}
    {% else %}
      @{google_ads_dataset}.CampaignBasicStats_@{google_ads_mcc_id}
    {% endif %}
  {% else %}
    {% if master_stats.hour_of_day._in_query %}
      @{google_ads_dataset}.HourlyAccountStats_@{google_ads_mcc_id}
    {% else %}
      @{google_ads_dataset}.AccountBasicStats_@{google_ads_mcc_id}
    {% endif %}
  {% endif %} ;;

    dimension: _data {
      sql: ${TABLE}._DATA_DATE ;;
    }

    dimension: _latest {
      sql: ${TABLE}._LATEST_DATE ;;
    }

  dimension: unique_key {
    type:  string
    hidden: yes
    sql: CONCAT(CAST(${ad_group_id} AS STRING),CAST(${criterion_id} AS STRING)) ;;
  }

    dimension: hour_of_day {
      type: number
      sql: ${TABLE}.HourOfDay ;;
    }

    dimension: audience_criterion_id {
      type: number
      sql: ${TABLE}.CriterionId ;;
    }

    dimension: active_view_impressions {
      type: number
      sql: ${TABLE}.ActiveViewImpressions ;;
    }

    dimension: active_view_measurability {
      type: number
      sql: ${TABLE}.ActiveViewMeasurability ;;
    }

    dimension: active_view_measurable_cost {
      type: number
      sql: ${TABLE}.ActiveViewMeasurableCost ;;
    }

    dimension: active_view_measurable_impressions {
      type: number
      sql: ${TABLE}.ActiveViewMeasurableImpressions ;;
    }

    dimension: active_view_viewability {
      type: number
      sql: ${TABLE}.ActiveViewViewability ;;
    }

    dimension: ad_group_id {
      type: number
      sql: ${TABLE}.AdGroupId ;;
    }

    dimension: ad_network_type1 {
      type: string
      sql: ${TABLE}.AdNetworkType1 ;;
    }

    dimension: ad_network_type2 {
      type: string
      sql: ${TABLE}.AdNetworkType2 ;;
    }

    dimension: average_position {
      type: number
      sql: ${TABLE}.AveragePosition ;;
    }

    dimension: base_ad_group_id {
      type: number
      sql: ${TABLE}.BaseAdGroupId ;;
    }

    dimension: base_campaign_id {
      type: number
      sql: ${TABLE}.BaseCampaignId ;;
    }

    dimension: campaign_id {
      type: number
      sql: ${TABLE}.CampaignId ;;
    }

    dimension: clicks {
      type: number
      sql: ${TABLE}.Clicks ;;
    }

    dimension: conversion_value {
      type: number
      sql: ${TABLE}.ConversionValue ;;
    }

    dimension: conversions {
      type: number
      sql: ${TABLE}.Conversions ;;
    }

    dimension: cost {
      type: number
      sql: ${TABLE}.Cost ;;
    }

    dimension: creative_id {
      type: number
      sql: ${TABLE}.CreativeId ;;
    }

    dimension: criterion_id {
      type: number
      sql: ${TABLE}.CriterionId ;;
    }

    dimension_group: date {
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
      sql: ${TABLE}.Date ;;
    }

  dimension: week_of_year {
    type: string
    sql: CAST(FORMAT_TIMESTAMP('%V', TIMESTAMP(${TABLE}.Date) ) AS INT64);;
  }

    dimension: device {
      type: string
      sql: ${TABLE}.Device ;;
    }

    dimension: external_customer_id {
      type: number
      sql: ${TABLE}.ExternalCustomerId ;;
    }

    dimension: impressions {
      type: number
      sql: ${TABLE}.Impressions ;;
    }

    dimension: interaction_types {
      type: string
      sql: ${TABLE}.InteractionTypes ;;
    }

    dimension: interactions {
      type: number
      sql: ${TABLE}.Interactions ;;
    }

    dimension: slot {
      type: string
      sql: ${TABLE}.Slot ;;
    }

    dimension: view_through_conversions {
      type: number
      sql: ${TABLE}.ViewThroughConversions ;;
    }

    measure: count {
      type: count
      drill_fields: []
    }

  }
