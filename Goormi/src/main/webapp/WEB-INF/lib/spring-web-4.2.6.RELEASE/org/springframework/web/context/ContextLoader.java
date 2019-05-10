// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ContextLoader.java

package org.springframework.web.context;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.ServletContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.access.BeanFactoryLocator;
import org.springframework.beans.factory.access.BeanFactoryReference;
import org.springframework.context.*;
import org.springframework.context.access.ContextSingletonBeanFactoryLocator;
import org.springframework.core.GenericTypeResolver;
import org.springframework.core.annotation.AnnotationAwareOrderComparator;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.util.*;

// Referenced classes of package org.springframework.web.context:
//            ConfigurableWebApplicationContext, WebApplicationContext, ConfigurableWebEnvironment

public class ContextLoader
{

    public ContextLoader()
    {
        contextInitializers = new ArrayList();
    }

    public ContextLoader(WebApplicationContext context)
    {
        contextInitializers = new ArrayList();
        this.context = context;
    }

    public transient void setContextInitializers(ApplicationContextInitializer initializers[])
    {
        if(initializers != null)
        {
            ApplicationContextInitializer aapplicationcontextinitializer[] = initializers;
            int i = aapplicationcontextinitializer.length;
            for(int j = 0; j < i; j++)
            {
                ApplicationContextInitializer initializer = aapplicationcontextinitializer[j];
                contextInitializers.add(initializer);
            }

        }
    }

    public WebApplicationContext initWebApplicationContext(ServletContext servletContext)
    {
        if(servletContext.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE) != null)
            throw new IllegalStateException("Cannot initialize context because there is already a root application context present - check whether you have multiple ContextLoader* definitions in your web.xml!");
        Log logger = LogFactory.getLog(org/springframework/web/context/ContextLoader);
        servletContext.log("Initializing Spring root WebApplicationContext");
        if(logger.isInfoEnabled())
            logger.info("Root WebApplicationContext: initialization started");
        long startTime = System.currentTimeMillis();
        try
        {
            if(context == null)
                context = createWebApplicationContext(servletContext);
            if(context instanceof ConfigurableWebApplicationContext)
            {
                ConfigurableWebApplicationContext cwac = (ConfigurableWebApplicationContext)context;
                if(!cwac.isActive())
                {
                    if(cwac.getParent() == null)
                    {
                        ApplicationContext parent = loadParentContext(servletContext);
                        cwac.setParent(parent);
                    }
                    configureAndRefreshWebApplicationContext(cwac, servletContext);
                }
            }
            servletContext.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, context);
            ClassLoader ccl = Thread.currentThread().getContextClassLoader();
            if(ccl == org/springframework/web/context/ContextLoader.getClassLoader())
                currentContext = context;
            else
            if(ccl != null)
                currentContextPerThread.put(ccl, context);
            if(logger.isDebugEnabled())
                logger.debug((new StringBuilder()).append("Published root WebApplicationContext as ServletContext attribute with name [").append(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE).append("]").toString());
            if(logger.isInfoEnabled())
            {
                long elapsedTime = System.currentTimeMillis() - startTime;
                logger.info((new StringBuilder()).append("Root WebApplicationContext: initialization completed in ").append(elapsedTime).append(" ms").toString());
            }
            return context;
        }
        catch(RuntimeException ex)
        {
            logger.error("Context initialization failed", ex);
            servletContext.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, ex);
            throw ex;
        }
        catch(Error err)
        {
            logger.error("Context initialization failed", err);
            servletContext.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, err);
            throw err;
        }
    }

    protected WebApplicationContext createWebApplicationContext(ServletContext sc)
    {
        Class contextClass = determineContextClass(sc);
        if(!org/springframework/web/context/ConfigurableWebApplicationContext.isAssignableFrom(contextClass))
            throw new ApplicationContextException((new StringBuilder()).append("Custom context class [").append(contextClass.getName()).append("] is not of type [").append(org/springframework/web/context/ConfigurableWebApplicationContext.getName()).append("]").toString());
        else
            return (ConfigurableWebApplicationContext)BeanUtils.instantiateClass(contextClass);
    }

    protected Class determineContextClass(ServletContext servletContext)
    {
        String contextClassName = servletContext.getInitParameter("contextClass");
        if(contextClassName != null)
            try
            {
                return ClassUtils.forName(contextClassName, ClassUtils.getDefaultClassLoader());
            }
            catch(ClassNotFoundException ex)
            {
                throw new ApplicationContextException((new StringBuilder()).append("Failed to load custom context class [").append(contextClassName).append("]").toString(), ex);
            }
        contextClassName = defaultStrategies.getProperty(org/springframework/web/context/WebApplicationContext.getName());
        try
        {
            return ClassUtils.forName(contextClassName, org/springframework/web/context/ContextLoader.getClassLoader());
        }
        catch(ClassNotFoundException ex)
        {
            throw new ApplicationContextException((new StringBuilder()).append("Failed to load default context class [").append(contextClassName).append("]").toString(), ex);
        }
    }

    protected void configureAndRefreshWebApplicationContext(ConfigurableWebApplicationContext wac, ServletContext sc)
    {
        if(ObjectUtils.identityToString(wac).equals(wac.getId()))
        {
            String idParam = sc.getInitParameter("contextId");
            if(idParam != null)
                wac.setId(idParam);
            else
                wac.setId((new StringBuilder()).append(ConfigurableWebApplicationContext.APPLICATION_CONTEXT_ID_PREFIX).append(ObjectUtils.getDisplayString(sc.getContextPath())).toString());
        }
        wac.setServletContext(sc);
        String configLocationParam = sc.getInitParameter("contextConfigLocation");
        if(configLocationParam != null)
            wac.setConfigLocation(configLocationParam);
        ConfigurableEnvironment env = wac.getEnvironment();
        if(env instanceof ConfigurableWebEnvironment)
            ((ConfigurableWebEnvironment)env).initPropertySources(sc, null);
        customizeContext(sc, wac);
        wac.refresh();
    }

    protected void customizeContext(ServletContext sc, ConfigurableWebApplicationContext wac)
    {
        List initializerClasses = determineContextInitializerClasses(sc);
        Class initializerClass;
        for(Iterator iterator = initializerClasses.iterator(); iterator.hasNext(); contextInitializers.add(BeanUtils.instantiateClass(initializerClass)))
        {
            initializerClass = (Class)iterator.next();
            Class initializerContextClass = GenericTypeResolver.resolveTypeArgument(initializerClass, org/springframework/context/ApplicationContextInitializer);
            if(initializerContextClass != null && !initializerContextClass.isInstance(wac))
                throw new ApplicationContextException(String.format("Could not apply context initializer [%s] since its generic parameter [%s] is not assignable from the type of application context used by this context loader: [%s]", new Object[] {
                    initializerClass.getName(), initializerContextClass.getName(), wac.getClass().getName()
                }));
        }

        AnnotationAwareOrderComparator.sort(contextInitializers);
        ApplicationContextInitializer initializer;
        for(Iterator iterator1 = contextInitializers.iterator(); iterator1.hasNext(); initializer.initialize(wac))
            initializer = (ApplicationContextInitializer)iterator1.next();

    }

    protected List determineContextInitializerClasses(ServletContext servletContext)
    {
        List classes = new ArrayList();
        String globalClassNames = servletContext.getInitParameter("globalInitializerClasses");
        if(globalClassNames != null)
        {
            String as[] = StringUtils.tokenizeToStringArray(globalClassNames, ",; \t\n");
            int i = as.length;
            for(int j = 0; j < i; j++)
            {
                String className = as[j];
                classes.add(loadInitializerClass(className));
            }

        }
        String localClassNames = servletContext.getInitParameter("contextInitializerClasses");
        if(localClassNames != null)
        {
            String as1[] = StringUtils.tokenizeToStringArray(localClassNames, ",; \t\n");
            int k = as1.length;
            for(int l = 0; l < k; l++)
            {
                String className = as1[l];
                classes.add(loadInitializerClass(className));
            }

        }
        return classes;
    }

    private Class loadInitializerClass(String className)
    {
        try
        {
            Class clazz = ClassUtils.forName(className, ClassUtils.getDefaultClassLoader());
            Assert.isAssignable(org/springframework/context/ApplicationContextInitializer, clazz);
            return clazz;
        }
        catch(ClassNotFoundException ex)
        {
            throw new ApplicationContextException((new StringBuilder()).append("Failed to load context initializer class [").append(className).append("]").toString(), ex);
        }
    }

    protected ApplicationContext loadParentContext(ServletContext servletContext)
    {
        ApplicationContext parentContext = null;
        String locatorFactorySelector = servletContext.getInitParameter("locatorFactorySelector");
        String parentContextKey = servletContext.getInitParameter("parentContextKey");
        if(parentContextKey != null)
        {
            BeanFactoryLocator locator = ContextSingletonBeanFactoryLocator.getInstance(locatorFactorySelector);
            Log logger = LogFactory.getLog(org/springframework/web/context/ContextLoader);
            if(logger.isDebugEnabled())
                logger.debug((new StringBuilder()).append("Getting parent context definition: using parent context key of '").append(parentContextKey).append("' with BeanFactoryLocator").toString());
            parentContextRef = locator.useBeanFactory(parentContextKey);
            parentContext = (ApplicationContext)parentContextRef.getFactory();
        }
        return parentContext;
    }

    public void closeWebApplicationContext(ServletContext servletContext)
    {
        servletContext.log("Closing Spring root WebApplicationContext");
        if(context instanceof ConfigurableWebApplicationContext)
            ((ConfigurableWebApplicationContext)context).close();
        ClassLoader ccl = Thread.currentThread().getContextClassLoader();
        if(ccl == org/springframework/web/context/ContextLoader.getClassLoader())
            currentContext = null;
        else
        if(ccl != null)
            currentContextPerThread.remove(ccl);
        servletContext.removeAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        if(parentContextRef != null)
            parentContextRef.release();
        break MISSING_BLOCK_LABEL_164;
        Exception exception;
        exception;
        ClassLoader ccl = Thread.currentThread().getContextClassLoader();
        if(ccl == org/springframework/web/context/ContextLoader.getClassLoader())
            currentContext = null;
        else
        if(ccl != null)
            currentContextPerThread.remove(ccl);
        servletContext.removeAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        if(parentContextRef != null)
            parentContextRef.release();
        throw exception;
    }

    public static WebApplicationContext getCurrentWebApplicationContext()
    {
        ClassLoader ccl = Thread.currentThread().getContextClassLoader();
        if(ccl != null)
        {
            WebApplicationContext ccpt = (WebApplicationContext)currentContextPerThread.get(ccl);
            if(ccpt != null)
                return ccpt;
        }
        return currentContext;
    }

    public static final String CONTEXT_ID_PARAM = "contextId";
    public static final String CONFIG_LOCATION_PARAM = "contextConfigLocation";
    public static final String CONTEXT_CLASS_PARAM = "contextClass";
    public static final String CONTEXT_INITIALIZER_CLASSES_PARAM = "contextInitializerClasses";
    public static final String GLOBAL_INITIALIZER_CLASSES_PARAM = "globalInitializerClasses";
    public static final String LOCATOR_FACTORY_SELECTOR_PARAM = "locatorFactorySelector";
    public static final String LOCATOR_FACTORY_KEY_PARAM = "parentContextKey";
    private static final String INIT_PARAM_DELIMITERS = ",; \t\n";
    private static final String DEFAULT_STRATEGIES_PATH = "ContextLoader.properties";
    private static final Properties defaultStrategies;
    private static final Map currentContextPerThread = new ConcurrentHashMap(1);
    private static volatile WebApplicationContext currentContext;
    private WebApplicationContext context;
    private BeanFactoryReference parentContextRef;
    private final List contextInitializers;

    static 
    {
        try
        {
            ClassPathResource resource = new ClassPathResource("ContextLoader.properties", org/springframework/web/context/ContextLoader);
            defaultStrategies = PropertiesLoaderUtils.loadProperties(resource);
        }
        catch(IOException ex)
        {
            throw new IllegalStateException((new StringBuilder()).append("Could not load 'ContextLoader.properties': ").append(ex.getMessage()).toString());
        }
    }
}
