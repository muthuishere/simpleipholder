<%@page import="java.util.ArrayList" %>
<%!

private static class Applist {
	
	public ArrayList<Appdata> items = new ArrayList();
	
	public Appdata getAppdata(String jobid){

		for(int i=0;i<items.size();i++){
			
			if(items.get(i).getJobid().equals(jobid))
				return items.get(i);
		}
		return null;
	}
	
	public void removeAppdata(String jobid){

		for(int i=0;i<items.size();i++){
			
			if(items.get(i).getJobid().equals(jobid)){
				items.remove(i);
				break;
			}
		}
		
	}
	
}
private static class Appdata {
  private  String ip = null;
  private  String fea = null;
  private  String jobid = null;
  
  public String getJobid() {
	    return jobid;
	  }
	  public void setJobid(String jobid) {
		    this.jobid=jobid;
		  }
	  

		  
  public String getIp() {
    return ip;
  }
  public void setIp(String ip) {
	    this.ip=ip;
	  }
  
}
%>
<%

Applist applist=new Applist();

if(null == application.getAttribute("applist") ){
	
	application.setAttribute("applist" , applist);
}else{
	
	applist = (Applist)application.getAttribute("applist");
}


//applist


//application.setAttribute("applist" , new Applist());

//Applist applist = (Applist)application.getAttribute("applist");

String operation=request.getParameter("operation");
String jobid=request.getParameter("jobid");

if (jobid == null) {
    out.println("jobid cannot be empty");
    return;
}




Appdata appdata=applist.getAppdata(jobid);

if(null == appdata){
	appdata=new Appdata();
	appdata.setJobid(jobid);
	applist.items.add(appdata);
	appdata=applist.getAppdata(jobid);
}


if (operation == null) {
    out.println("Operation cannot be empty");
    return;
} else if (operation.equals("setip")  ) {
	
	String ip=request.getParameter("ip");
	
	if (null == ip){
		 out.println("ERROR:Set ip requires IP parameter");
		 return;
		}else{
			appdata.setIp(ip);
			application.setAttribute("applist" , applist);
			out.println("SUCCESS");
		}
	}else if (operation.equals("getip")  ) {
		
	
		
		
				 out.println(appdata.getIp());
			
		
		}
		
	
 



%>