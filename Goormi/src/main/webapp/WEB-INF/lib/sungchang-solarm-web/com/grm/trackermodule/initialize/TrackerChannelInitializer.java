// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   TrackerChannelInitializer.java

package com.grm.trackermodule.initialize;

import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.grm.trackermodule.codec.MapCodecDecoder;
import com.grm.trackermodule.codec.MapCodecEncoder;
import com.grm.trackermodule.handler.TrackerChannelHandler;
import io.netty.buffer.Unpooled;
import io.netty.channel.*;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import io.netty.handler.timeout.ReadTimeoutHandler;

public class TrackerChannelInitializer extends ChannelInitializer
{

    public TrackerChannelInitializer()
    {
    }

    protected void initChannel(Channel channel)
        throws Exception
    {
        ChannelPipeline channelPipeline = channel.pipeline();
        ByteArrayBuilder byteArr = new ByteArrayBuilder();
        byteArr.append(12);
        byteArr.append(9);
        channelPipeline.addLast(new ChannelHandler[] {
            new LoggingHandler(LogLevel.valueOf(pipelineLogLevel))
        }).addLast("readTimeoutHandler", new ReadTimeoutHandler(timeoutSecond)).addLast(new ChannelHandler[] {
            new DelimiterBasedFrameDecoder(1024, Unpooled.wrappedBuffer(byteArr.toByteArray()))
        }).addLast(new ChannelHandler[] {
            mapCodecDecoder
        }).addLast(new ChannelHandler[] {
            mapCodecEncoder
        }).addLast(new ChannelHandler[] {
            trackerChannelHandler
        });
    }

    private String pipelineLogLevel;
    private int timeoutSecond;
    private TrackerChannelHandler trackerChannelHandler;
    private MapCodecDecoder mapCodecDecoder;
    private MapCodecEncoder mapCodecEncoder;
}
