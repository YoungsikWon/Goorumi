// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   RequestContextListener.java

package org.springframework.web.context.request;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.context.i18n.LocaleContextHolder;

// Referenced classes of package org.springframework.web.context.request:
//            ServletRequestAttributes, RequestAttributes, RequestContextHolder

public class RequestContextListener
    implements ServletRequestListener
{

    public RequestContextListener()
    {
    }

    public void requestInitialized(ServletRequestEvent requestEvent)
    {
        if(!(requestEvent.getServletRequest() instanceof HttpServletRequest))
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Request is not an HttpServletRequest: ").append(requestEvent.getServletRequest()).toString());
        } else
        {
            HttpServletRequest request = (HttpServletRequest)requestEvent.getServletRequest();
            ServletRequestAttributes attributes = new ServletRequestAttributes(request);
            request.setAttribute(REQUEST_ATTRIBUTES_ATTRIBUTE, attributes);
            LocaleContextHolder.setLocale(request.getLocale());
            RequestContextHolder.setRequestAttributes(attributes);
            return;
        }
    }

    public void requestDestroyed(ServletRequestEvent requestEvent)
    {
        ServletRequestAttributes attributes = null;
        Object reqAttr = requestEvent.getServletRequest().getAttribute(REQUEST_ATTRIBUTES_ATTRIBUTE);
        if(reqAttr instanceof ServletRequestAttributes)
            attributes = (ServletRequestAttributes)reqAttr;
        RequestAttributes threadAttributes = RequestContextHolder.getRequestAttributes();
        if(threadAttributes != null)
        {
            LocaleContextHolder.resetLocaleContext();
            RequestContextHolder.resetRequestAttributes();
            if(attributes == null && (threadAttributes instanceof ServletRequestAttributes))
                attributes = (ServletRequestAttributes)threadAttributes;
        }
        if(attributes != null)
            attributes.requestCompleted();
    }

    private static final String REQUEST_ATTRIBUTES_ATTRIBUTE = (new StringBuilder()).append(org/springframework/web/context/request/RequestContextListener.getName()).append(".REQUEST_ATTRIBUTES").toString();

}
