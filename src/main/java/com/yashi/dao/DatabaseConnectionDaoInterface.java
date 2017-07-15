package com.yashi.dao;

import com.yashi.model.Topic;

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
}
