DB = data_bag_item('mariadb', 'prod')
demo = {
  "name" => "#{DB['dbname']}",
  "pass" => "#{DB['dbpass']}"
}

#puts "#{a['name']}"

template "/tmp/context.xml" do
    source 'context.xml.erb'
    action :create
    variables({ demo: demo })
end


#template "/tmp/sample.txt" do 
#   source 'sample.erb'
#   action :create
  # variables demo: {
  #   'name' => 'hello'
  #}
#   variables({ demo: demo })
#end

URLS = data_bag_item('mariadb', 'url')
URL = URLS['URL']

remote_file 'Download Tomcat' do 
  path "/tmp/tomcat.tgz"
  source URL
end
