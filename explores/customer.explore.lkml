include: "/views/dimensions/*.view.lkml"

explore: customer {
  hidden: yes
  conditionally_filter: {
    filters: {
      field: latest
      value: "Yes"
    }
    unless: [_data_date]
  }
}
