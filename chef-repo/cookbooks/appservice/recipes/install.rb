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

ruby_block 'Finding files and directories' do
    block do
      WEBAPPS=Dir["#{node['appservice']['TAR_PATH']}/webapps/*"]
    end
    action :run
end

Dir["#{node['appservice']['TAR_PATH']}/webapps/*"].each  do |app|
    log 'some messahe' do 
        message "#{app}"
        level :fatal
    end
end