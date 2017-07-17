package com.yashi.service;

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
}
