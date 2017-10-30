class test{
file {"/tmp/$hostname.txt":content =>"hello world!";}
}

node docker01.gbnc.om {
	include nginx
}

node apache01.gbnc.com{
	include httpd
}

node 'default' {
	notify{"this is a test"}
 }
