puts 'Hello World'
package 'Install GCC' do
   package_name 'gcc'
   action :install
end

package 'Remove GCC' do 
   package_name 'gcc'
   action :remove
end
