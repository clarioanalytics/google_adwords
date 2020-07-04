connection: "nte-smg-vendor-sources"

# include all the views
include: "/views/dimensions/*.view.lkml"
include: "/views/dimensions/criteria/*.view.lkml"
include: "/views/facts/*.view.lkml"

# include all the explores
include: "/explores/*.explore.lkml"

# include all the dashboards
# include: "/dashboards/*.dashboard"
