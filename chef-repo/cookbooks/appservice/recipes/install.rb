package 'Installing Java' do 
    package_name "java"
    action :install 
end

remote_file 'Downloading Tomcat' do 
    path "#{node['appservice']['TAR_PATH']}"
    source "#{node['appservice']['URL']}"
end

execute "Extracting tomcat tar file" do 
    command "tar -xf #{node['appservice']['TAR_PATH']}"
    cwd "/opt"
end


Dir["#{node['appservice']['TOMCAT_DIR']}/webapps/*"].each do |loc|
    if File.file?("#{loc}")
        file "Removing File #{loc}" do
            path "#{loc}"
            action :delete
        end
    elsif File.directory?("#{loc}") 
        directory "Removing Directory #{loc}" do
            path "#{loc}"
            recursive true
            action :delete
        end
    end
end 

remote_file 'Downloading Student War file' do 
    path "#{node['appservice']['TOMCAT_DIR']}/webapps/student.war"
    source "#{node['appservice']['WAR']}"
end

remote_file 'Downloading JDBC jar file' do 
    path "#{node['appservice']['TOMCAT_DIR']}/lib/mysql-connector-java-5.1.40.jar"
    source "#{node['appservice']['JDBC_JAR']}"
    not_if "ls -l #{node['appservice']['TOMCAT_DIR']}/lib/mysql-connector-java-5.1.40.jar"
end

template "#{node['appservice']['TOMCAT_DIR']}/conf/context.xml" do
    source 'context.xml.erb'
    action :create
end

if `ps -ef | grep #{node['appservice']['TOMCAT_DIR']} | grep -v grep` != ""
    execute 'Stop Tomcat' do
        command "#{node['appservice']['TOMCAT_DIR']}/bin/shutdown.sh"
    end
    execute 'Stop Tomcat' do
        command "#{node['appservice']['TOMCAT_DIR']}/bin/startup.sh"
    end
else
    execute 'Stop Tomcat' do
        command "#{node['appservice']['TOMCAT_DIR']}/bin/startup.sh"
    end
end