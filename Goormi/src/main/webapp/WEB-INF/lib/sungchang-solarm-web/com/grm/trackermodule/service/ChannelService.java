// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ChannelService.java

package com.grm.trackermodule.service;

import com.grm.sctele.model.Weather;
import com.grm.trackermodule.model.TrackerChannelGroupAttribute;
import com.grm.trackermodule.repository.TrackerChannelGroupAttributeDao;
import io.netty.channel.Channel;
import io.netty.channel.ChannelId;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ChannelService
{

    public ChannelService()
    {
        channelGroupMap = new ConcurrentHashMap();
        channelIdMap = new ConcurrentHashMap();
        channelGlobalGroup = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
        groupAttrMap = new ConcurrentHashMap();
    }

    public Channel addChannel(String trackerId, String trackerGroupId, String inverterId, Channel channel)
        throws Exception
    {
        String trackerKey = makeTrackerKey(trackerId, trackerGroupId);
        ChannelId oldChannelId = (ChannelId)channelIdMap.put(trackerKey, channel.id());
        channelGlobalGroup.add(channel);
        addChannelGroup(trackerGroupId, channel);
        channelMapLog();
        if(oldChannelId != null)
        {
            log.warn("already is channel trackerId[{}]", trackerId);
            return getChannel(oldChannelId);
        } else
        {
            return null;
        }
    }

    public void channelMapLog()
    {
        log.info("channel group map size[add] : {}, {}", Integer.valueOf(channelGroupMap.size()), channelGroupMap);
        log.info("channel globalgroup map size[add] : {}, {}", Integer.valueOf(channelGlobalGroup.size()), channelGlobalGroup);
        log.info("channel key map size[add] : {}", Integer.valueOf(channelIdMap.size()));
    }

    public void addGroupAttrMap(TrackerChannelGroupAttribute groupAttr)
    {
        String trackerGroupId = groupAttr.getTrackerGroupId();
        TrackerChannelGroupAttribute oldGroupAttr = (TrackerChannelGroupAttribute)groupAttrMap.put(trackerGroupId, groupAttr);
        log.info("groupAttrMap size[add]: {}, {}", Integer.valueOf(groupAttrMap.size()), groupAttrMap);
        if(oldGroupAttr != null)
            log.info("groupAttrMap update old[{}], new[{}]", oldGroupAttr, groupAttr);
    }

    public boolean hasGroupAttrMap(String trackerGroupId)
    {
        return groupAttrMap.containsKey(trackerGroupId);
    }

    public TrackerChannelGroupAttribute getGroupAttrMap(String trackerGroupId)
    {
        return (TrackerChannelGroupAttribute)groupAttrMap.get(trackerGroupId);
    }

    public void addChannelGroup(String trackerGroupId, Channel channel)
    {
        ChannelGroup channels;
        if(!hasGroupChannel(trackerGroupId))
        {
            channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
            channelGroupMap.put(trackerGroupId, channels);
        } else
        {
            channels = (ChannelGroup)channelGroupMap.get(trackerGroupId);
        }
        channels.add(channel);
    }

    public ChannelGroup getchannelGroup(String trackerGroupId)
    {
        if(!hasGroupChannel(trackerGroupId))
        {
            log.warn("ChannelGroup is null trackerGroupId[{}]", trackerGroupId);
            return null;
        } else
        {
            return (ChannelGroup)channelGroupMap.get(trackerGroupId);
        }
    }

    public ChannelId getChannelId(String trackerId, String trackerGroupId)
    {
        String trackerKey = makeTrackerKey(trackerId, trackerGroupId);
        if(!channelIdMap.containsKey(trackerKey))
        {
            log.warn("getchannel is null trackerId[{}]", trackerId);
            return null;
        } else
        {
            return (ChannelId)channelIdMap.get(trackerKey);
        }
    }

    public Channel getChannel(String trackerId, String trackerGroupid)
    {
        ChannelId channelId = getChannelId(trackerId, trackerGroupid);
        if(channelId == null)
        {
            log.warn("channeel does not exist trackerId[{}], trackerGroupId[{}]", trackerId, trackerGroupid);
            return null;
        } else
        {
            return getChannel(channelId);
        }
    }

    public ChannelGroup getChannelGlobalGroup()
    {
        return channelGlobalGroup;
    }

    public Channel getChannel(ChannelId channelId)
    {
        Channel channel;
        try
        {
            channel = channelGlobalGroup.find(channelId);
        }
        catch(Exception e)
        {
            log.error("channeel does not exist channelId[{}]", channelId, e);
            return null;
        }
        return channel;
    }

    public String makeTrackerKey(String trackerId, String trackerGroupId)
    {
        return (new StringBuilder()).append(trackerId).append("@").append(trackerGroupId).toString();
    }

    public boolean hasGroupChannel(String trackerGroupId)
    {
        return channelGroupMap.containsKey(trackerGroupId);
    }

    public void removeMaps(ChannelId channelId)
    {
        String trackerKey = getKeyFromValue(channelId);
        if(trackerKey == null)
        {
            log.warn((new StringBuilder()).append("removeTrackerId not trackerChannel channelId[{}]").append(channelId).toString());
            return;
        }
        channelIdMap.remove(trackerKey);
        log.info("removeTrackerId to channelIdMap success channelIdMap size[{}] ", Integer.valueOf(channelIdMap.size()));
        String trackerGroupId = trackerKey.split("@")[1];
        if(channelGlobalGroup.size() == 0)
        {
            groupAttrMap.remove(trackerGroupId);
            log.info("removeGroupAttrMap success groupAttrMap size [{}]", groupAttrMap);
        }
    }

    public String getKeyFromValue(ChannelId channelId)
    {
        for(Iterator iterator = channelIdMap.keySet().iterator(); iterator.hasNext();)
        {
            String o = (String)iterator.next();
            if(((ChannelId)channelIdMap.get(o)).equals(channelId))
                return o;
        }

        return null;
    }

    public List getChannelIdMap()
    {
        List trackerKeyList = new ArrayList();
        String o;
        for(Iterator iterator = channelIdMap.keySet().iterator(); iterator.hasNext(); trackerKeyList.add(o))
            o = (String)iterator.next();

        return trackerKeyList;
    }

    public void updateWeatherGroupAttrMap(Weather weather, String trackerGroupId)
    {
        TrackerChannelGroupAttribute groupAttr = (TrackerChannelGroupAttribute)groupAttrMap.get(trackerGroupId);
        if(groupAttr == null)
        {
            return;
        } else
        {
            groupAttr.setSkyCode(weather.getSkyCode());
            groupAttr.setUptDate(weather.getUptDate());
            groupAttr.setSnowFall(weather.getSnowFall());
            groupAttrMap.put(trackerGroupId, groupAttr);
            return;
        }
    }

    private static final Logger log = LoggerFactory.getLogger(com/grm/trackermodule/service/ChannelService);
    TrackerChannelGroupAttributeDao groupAttrDao;
    private ConcurrentHashMap channelGroupMap;
    private ConcurrentHashMap channelIdMap;
    private ChannelGroup channelGlobalGroup;
    private ConcurrentHashMap groupAttrMap;
    private static final String KEYSEPERATOR = "@";

}
