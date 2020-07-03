view: base_stats {
  extends: [base]      ## from entity base table
  extension: required

  dimension_group: date {
    hidden: yes
  }
  dimension: day_of_week {
    hidden: yes
  }
  dimension: month {
    hidden: yes
  }
  dimension: month_of_year {
    hidden: yes
  }
  dimension: quarter {
    hidden: yes
  }
  dimension: week {
    hidden: yes
  }
  dimension: year {
    hidden: yes
  }
}
