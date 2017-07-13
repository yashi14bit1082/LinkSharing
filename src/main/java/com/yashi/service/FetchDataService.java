package com.yashi.service;

import com.yashi.dao.FetchFromDatabaseInterface;
import com.yashi.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public class FetchDataService implements FetchDataServiceInterface {
    @Autowired
    FetchFromDatabaseInterface fetchFromDatabaseInterface;
    @Override
    public List<Topic> fetchData(String search_string) {
        List<Topic> fetched_list = fetchFromDatabaseInterface.fetchData(search_string);

        return fetched_list;
    }
}
