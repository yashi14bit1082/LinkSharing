package com.yashi.service;

import com.yashi.model.Topic;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public interface FetchDataServiceInterface {
    default List<Object> fetchData(String table_name,String field_name,String search_string,int randomval)
    {
        return null;
    }
}
