package com.yashi.service;

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

    default boolean checkDataExistence(String... a)
    {
        return false;
    }
}
