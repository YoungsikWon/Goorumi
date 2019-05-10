// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ConfigurableWebApplicationContext.java

package org.springframework.web.context;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import org.springframework.context.ConfigurableApplicationContext;

// Referenced classes of package org.springframework.web.context:
//            WebApplicationContext

public interface ConfigurableWebApplicationContext
    extends WebApplicationContext, ConfigurableApplicationContext
{

    public abstract void setServletContext(ServletContext servletcontext);

    public abstract void setServletConfig(ServletConfig servletconfig);

    public abstract ServletConfig getServletConfig();

    public abstract void setNamespace(String s);

    public abstract String getNamespace();

    public abstract void setConfigLocation(String s);

    public transient abstract void setConfigLocations(String as[]);

    public abstract String[] getConfigLocations();

    public static final String APPLICATION_CONTEXT_ID_PREFIX = (new StringBuilder()).append(org/springframework/web/context/WebApplicationContext.getName()).append(":").toString();
    public static final String SERVLET_CONFIG_BEAN_NAME = "servletConfig";

}
