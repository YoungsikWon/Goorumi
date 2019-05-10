// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TrackerServer.java

package com.grm.trackermodule;

import com.grm.trackermodule.initialize.TrackerChannelInitializer;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import java.net.InetSocketAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TrackerServer
{

    public TrackerServer()
    {
    }

    public void run()
    {
        bossGroup = nioBossGroup;
        workerGroup = nioWorkerGroup;
        try
        {
            ServerBootstrap serverBootstrap = new ServerBootstrap();
            ((ServerBootstrap)((ServerBootstrap)serverBootstrap.group(bossGroup, workerGroup).channel(io/netty/channel/socket/nio/NioServerSocketChannel)).handler(new LoggingHandler(LogLevel.valueOf(bootStrapLogLevel)))).childHandler(trackerChannelInitializer);
            ChannelFuture future = serverBootstrap.bind(port).sync();
            channel = future.channel();
        }
        catch(InterruptedException e)
        {
            log.error("NettyServer Bootstrap error", e);
        }
        break MISSING_BLOCK_LABEL_117;
        Exception exception;
        exception;
        throw exception;
    }

    public void stop()
    {
        channel.close();
        bossGroup.shutdownGracefully();
        workerGroup.shutdownGracefully();
    }

    private static final Logger log = LoggerFactory.getLogger(com/grm/trackermodule/TrackerServer);
    private InetSocketAddress port;
    private NioEventLoopGroup nioBossGroup;
    private NioEventLoopGroup nioWorkerGroup;
    private String bootStrapLogLevel;
    private TrackerChannelInitializer trackerChannelInitializer;
    private Channel channel;
    private EventLoopGroup bossGroup;
    private EventLoopGroup workerGroup;

}
