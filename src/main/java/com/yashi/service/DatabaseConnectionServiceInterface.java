package com.yashi.service;

import com.yashi.model.ReadingItem;
import com.yashi.model.Resource;
import com.yashi.model.Subscription;
import com.yashi.model.Topic;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public interface DatabaseConnectionServiceInterface {
    default List<Topic> fetchData(String search_string)
    {
        return null;
    }

    default List<Subscription> fetchSubscribedList(String... a){return null;}

    default boolean checkDataExistence(String... a)
    {
        return false;
    }

    default List<Resource> fetchResourceList(String... a)
    {
        return null;
    }

    default List<Resource> recentShares()
    {
        return null;
    }

    default Object fetchObject(String... a)
    {
        return null;
    }

    default Long fetchNumberSubscription(String username)
    {
        return null;
    }

    default Long fetchNumberTopic(String username)
    {
        return null;
    }

    default List<ReadingItem> fetchUnreadPosts(String username,int index)
    {
        return null;
    }

    default Long fetchMaxPostCount(String username)
    {
        return null;
    }

    default Integer markPostRead(int id)
    {
        return null;
    }

    default Long fetchMaxPostCountForTopicShow(String topicName)
    {
        return null;
    }


    default Long topicSubscriptionCount(String topicName,String username)
    {
        return null;
    }

    default Long topicPostCount(String topicName,String username)
    {
        return null;
    }
}
