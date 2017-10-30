class test{
file {"/tmp/$hostname.txt":content =>"hello world!";}
}

node 'default' {
	notify{"this is a test"}
 }
