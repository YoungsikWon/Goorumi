// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ConfigurableWebEnvironment.java

package org.springframework.web.context;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import org.springframework.core.env.ConfigurableEnvironment;

public interface ConfigurableWebEnvironment
    extends ConfigurableEnvironment
{

    public abstract void initPropertySources(ServletContext servletcontext, ServletConfig servletconfig);
}
