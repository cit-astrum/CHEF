puts "#{node['hostname']}"

#DBDETAILS = search(:mariadb, "id:prod")
#DBDETAILS = data_bag('mariadb')
DBDETAILS = data_bag_item('mariadb', 'prod')

puts "#{DBDETAILS['dbuser']}"
