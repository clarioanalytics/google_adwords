include: "entity_base.view.lkml"

view: customer {
  extends: [entity_base]
  sql_table_name: google_adwords_NTE_SG.Customer_3152229625 ;;

  dimension: _data {
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension: _latest {
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: account_currency_code {
    type: string
    sql: ${TABLE}.AccountCurrencyCode ;;
  }

  dimension: account_descriptive_name {
    type: string
    sql: ${TABLE}.AccountDescriptiveName ;;
  }

  dimension: account_time_zone {
    type: string
    sql: ${TABLE}.AccountTimeZone ;;
  }

  dimension: can_manage_clients {
    type: yesno
    sql: ${TABLE}.CanManageClients ;;
  }

  dimension: customer_descriptive_name {
    type: string
    sql: ${TABLE}.CustomerDescriptiveName ;;
    link: {
      label: "Account Dashboard"
      url: "/dashboards/google_adwords::account_performance?Customer%20Name={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: is_auto_tagging_enabled {
    type: yesno
    sql: ${TABLE}.IsAutoTaggingEnabled ;;
  }

  dimension: is_test_account {
    type: yesno
    sql: ${TABLE}.IsTestAccount ;;
  }

  measure: count {
    type: count_distinct
    sql: ${external_customer_id} ;;
    drill_fields: [detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [external_customer_id, account_descriptive_name]
  }
}
