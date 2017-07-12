package com.yashi.dao;

/**
 * Created by yashi on 12-07-2017.
 */
public interface FetchFromDatabaseInterface {

    default Object fetchData(String table_name,String where_field,String field_value)
    {
        return null;
    }
}
