package com.yashi.dao;

import com.yashi.model.*;
import org.hibernate.annotations.Fetch;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public interface DatabaseConnectionDaoInterface {

    default Object fetchData(String... a)
    {
        return null;
    }

    default List<Topic> fetchData(String search_string)
    {
        return null;
    }

    default boolean checkDataExistence(String... a)
    {
        return false;
    }
    default Integer updateTable(String... a)
    {
        return 0;
    }

    default List<Resource> fetchResourceList(String... a)
    {
        return null;
    }

    default List<Object> fetchList(String... a)
    {
        return null;
    }

    default List<Subscription> fetchSubscribedData(String... a)
    {
        return null;
    }

    default List<Subscription> fetchSubscribedUsersFromSubscription (Topic topic)
    {
        return null;
    }

    default List<Resource> recentShares()
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

    default List<ReadingItem> fetchUnreadPosts(String username, int index)
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

    default Integer updateProfile(User user,String username)
    {
        return null;
    }

    default void saveAdmin(User user)
    {

    }
}
