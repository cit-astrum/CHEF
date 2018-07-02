i=10
while i > 0 do
    puts "I = #{i}"
    i=i-1
end

%w(httpd httpd-devel gcc).each do |pack|
    puts "Installing Package = #{pack}"
end

packages=%w(httpd httpd-devel gcc)

packages.each do |pack|
    puts "Installing Package = #{pack}"
end
