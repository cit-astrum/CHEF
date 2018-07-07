#
# Cookbook:: demo1
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'demo1::default'
log 'Demo2 Message' do 
	message 'DEmo2 Message'
 	level :fatal
end

package 'vim' 
