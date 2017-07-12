package com.yashi.dao;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public interface FetchFromDatabaseInterface {

    default Object fetchData(String table_name,String where_field,String field_value)
    {
        return null;
    }

    default List<Object> fetchData(String table_name,String field_name,String search_string,int randomval)
    {
        return null;
    }
}
