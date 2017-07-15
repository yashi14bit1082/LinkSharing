package com.yashi.service;

import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public class DatabaseConnectionService implements DatabaseConnectionServiceInterface {
    @Autowired
    DatabaseConnectionDaoInterface databaseConnectionInterface;
    @Override
    public List<Topic> fetchData(String search_string) {
        List<Topic> fetched_list = databaseConnectionInterface.fetchData(search_string);

        return fetched_list;
    }

    @Override
    public boolean checkDataExistence(String... a) {

        boolean response = databaseConnectionInterface.checkDataExistence(a[0],a[1],a[2]);
        return response;
    }
}
