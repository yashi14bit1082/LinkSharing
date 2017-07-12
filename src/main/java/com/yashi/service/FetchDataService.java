package com.yashi.service;

import com.yashi.dao.FetchFromDatabaseInterface;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public class FetchDataService implements FetchDataServiceInterface {
    @Autowired
    FetchFromDatabaseInterface fetchFromDatabaseInterface;
    @Override
    public List<Object> fetchData(String table_name,String field_name,String search_string,int randonval) {
        List<Object> fetched_list = fetchFromDatabaseInterface.fetchData(table_name,field_name,search_string,1);

        return fetched_list;
    }
}
