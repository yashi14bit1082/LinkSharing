package com.yashi.service;

import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.model.Resource;
import com.yashi.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public class DatabaseConnectionService implements DatabaseConnectionServiceInterface {
    @Autowired
    DatabaseConnectionDaoInterface databaseConnectionDaoInterface;
    @Override
    public List<Topic> fetchData(String search_string) {
        List<Topic> fetched_list = databaseConnectionDaoInterface.fetchData(search_string);

        return fetched_list;
    }

    @Override
    public boolean checkDataExistence(String... a) {

        boolean response = databaseConnectionDaoInterface.checkDataExistence(a[0],a[1],a[2]);
        return response;
    }


    @Override
    public List<Resource> fetchResourceList(String... a) {

        int indexOfComma = a[0].lastIndexOf(',');
        String topicName = a[0].substring(0,indexOfComma);

        List<Resource> resourceList = databaseConnectionDaoInterface.fetchResourceList(topicName,a[1]);
        System.out.println("resourceList"+resourceList);
        return resourceList;
    }
}
