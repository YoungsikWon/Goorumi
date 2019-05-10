// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   WebApplicationContext.java

package org.springframework.web.context;

import javax.servlet.ServletContext;
import org.springframework.context.ApplicationContext;

public interface WebApplicationContext
    extends ApplicationContext
{

    public abstract ServletContext getServletContext();

    public static final String ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE = (new StringBuilder()).append(org/springframework/web/context/WebApplicationContext.getName()).append(".ROOT").toString();
    public static final String SCOPE_REQUEST = "request";
    public static final String SCOPE_SESSION = "session";
    public static final String SCOPE_GLOBAL_SESSION = "globalSession";
    public static final String SCOPE_APPLICATION = "application";
    public static final String SERVLET_CONTEXT_BEAN_NAME = "servletContext";
    public static final String CONTEXT_PARAMETERS_BEAN_NAME = "contextParameters";
    public static final String CONTEXT_ATTRIBUTES_BEAN_NAME = "contextAttributes";

}
