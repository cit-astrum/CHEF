name "app"
description "App Stack"
run_list "recipe[appservice::install]", "recipe[webservice::install]", "recipe[dbservice::install]"
default_attributes "appservice" => { "DBIP" => "dbserver" }
