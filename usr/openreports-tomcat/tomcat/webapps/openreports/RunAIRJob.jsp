<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

import java.io.InputStreamReader;
import java.io.BufferedReader;
 
public class RunCommand
{
    public static String execute(String[] cmd)
    {
		String output = null;
 
        try
        {
			String line;
			StringBuffer buffer = new StringBuffer();
 
            Runtime rt = Runtime.getRuntime();
            Process process = rt.exec(cmd);
 
			InputStreamReader isr = new InputStreamReader( process.getInputStream() );
            BufferedReader br = new BufferedReader( isr );
 
            while( ( line = br.readLine() ) != null )
            {
				buffer.append( line );
	   		}
 
            int exitValue = process.waitFor();
            System.out.println( "ExitValue: " + exitValue );
 
            output = buffer.toString();
        }
        catch (Throwable t)
        {
        	t.printStackTrace();
        }
 
        return output;
    }
 
	/**
	 *	Usage:
	 *
	 *	public static void main(String s[])
	 *	{
	 *		String cmd[] = new String[1];
	 *		cmd[0] = s[0];
	 *
	 *		System.out.println( RunCommand.execute( cmd ) );
 	 *	}
	 */
}
 


Deploy the class in WEB-INF/classes directory and within the JSP, use 
<jsp:useBean id="rc" scope="session" class="RunCommand"/>

<% 
String cmd[] = String[1];
cmd[0] = "dir"
%>
<% RunCommand.execute( cmd ); %>