# simpleipholder - POC
A simple ip holder through a single jsp page

Using application level caching


Build as eclipse project 

Set IP via 
	http://localhost:8080/simpleipholder/operate.jsp?operation=setip&ip=127.0.0.1&jobid=211
	
retrieve from
		http://localhost:8080/simpleipholder/operate.jsp?operation=getip&jobid=211
		
Use on bash as

result=$(wget -qO- http://localhost:8080/simpleipholder/operate.jsp?operation=setip&ip=127.0.0.1&jobid=211)
   
echo "$result"
