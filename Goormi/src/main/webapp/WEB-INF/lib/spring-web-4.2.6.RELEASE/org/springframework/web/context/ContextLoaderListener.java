// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ContextLoaderListener.java

package org.springframework.web.context;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

// Referenced classes of package org.springframework.web.context:
//            ContextLoader, ContextCleanupListener, WebApplicationContext

public class ContextLoaderListener extends ContextLoader
    implements ServletContextListener
{

    public ContextLoaderListener()
    {
    }

    public ContextLoaderListener(WebApplicationContext context)
    {
        super(context);
    }

    public void contextInitialized(ServletContextEvent event)
    {
        initWebApplicationContext(event.getServletContext());
    }

    public void contextDestroyed(ServletContextEvent event)
    {
        closeWebApplicationContext(event.getServletContext());
        ContextCleanupListener.cleanupAttributes(event.getServletContext());
    }
}
