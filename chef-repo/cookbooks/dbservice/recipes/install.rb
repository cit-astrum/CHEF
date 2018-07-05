package 'Install MariaDB Server' do
    package_name "mariadb-server"
    action :install
end

service 'Start MariaDB Service' do 
    service_name "mariadb"
    action [ :start, :enable ] 
end

cookbook_file 'Copy student.sql file' do
    path '/tmp/student.sql'
    source 'student.sql'
    action :create
end

execute 'Loading SQL Data' do 
    command 'mysql </tmp/student.sql'
end
