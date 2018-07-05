default['webservice']['URL']='http://redrockdigimark.com/apachemirror/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz'
default['webservice']['tar']="#{default['webservice']['URL']}".split('/').last
default['webservice']['TAR']="/opt/#{default['webservice']['tar']}"
default['webservice']['MODJK_DIR']="#{default['webservice']['TAR']}".gsub('.tar.gz','')