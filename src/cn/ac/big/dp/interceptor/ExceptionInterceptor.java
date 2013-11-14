package cn.ac.big.dp.interceptor;

import java.io.PrintWriter;
import java.io.StringWriter;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ExceptionInterceptor extends AbstractInterceptor  
{  
  
    private static final long serialVersionUID = -973363922210992103L;  
  
    public static final String EXCEPTION = "commonErrorPage";  
  
    @Override  
    public String intercept(ActionInvocation invocation) throws Exception  
    {  
        try  
        {  
            return invocation.invoke();  
        }  
        catch (Exception e)  
        {  
            ActionContext context = invocation.getInvocationContext();
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            context.put("tipCourse", invocation.getInvocationContext().getName()); 
            context.put("tipMessage", sw.toString());
            e.printStackTrace();
            return EXCEPTION;
        }  
  
    }  
}  