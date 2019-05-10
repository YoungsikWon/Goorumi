// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TrackerServerConfiguration.java

package com.grm.trackermodule.configuration;

import io.netty.channel.nio.NioEventLoopGroup;
import java.net.InetSocketAddress;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

public class TrackerServerConfiguration
{

    public TrackerServerConfiguration()
    {
    }

    public InetSocketAddress tcpPort()
    {
        return new InetSocketAddress(tcpPort);
    }

    public static PropertySourcesPlaceholderConfigurer peopertyPlaceholderConfiguration()
    {
        return new PropertySourcesPlaceholderConfigurer();
    }

    public NioEventLoopGroup nioBossGroup()
    {
        return new NioEventLoopGroup(bossCount);
    }

    public NioEventLoopGroup nioWorkerGroup()
    {
        NioEventLoopGroup nioEventLoopGroup;
        if(workerCount == 0)
            nioEventLoopGroup = new NioEventLoopGroup();
        else
            nioEventLoopGroup = new NioEventLoopGroup(workerCount);
        return nioEventLoopGroup;
    }

    private int bossCount;
    private int workerCount;
    private int tcpPort;
}
