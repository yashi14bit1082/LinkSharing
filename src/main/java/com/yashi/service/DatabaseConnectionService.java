package com.yashi.service;

import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.model.Resource;
import com.yashi.model.Subscription;
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
    public List<Subscription> fetchSubscribedList(String... a) {

        List<Subscription> subscriptionList = databaseConnectionDaoInterface.fetchSubscribedData(a[0],a[1]);
        return subscriptionList;
    }

    @Override
    public boolean checkDataExistence(String... a) {

        boolean response = databaseConnectionDaoInterface.checkDataExistence(a[0],a[1],a[2]);
        return response;
    }


    @Override
    public List<Resource> fetchResourceList(String... a) {

        List<Resource> resourceList = databaseConnectionDaoInterface.fetchResourceList(a[0],a[1]);
        System.out.println("resourceList"+resourceList);
        return resourceList;
    }

    @Override
    public List<Resource> recentShares() {
       List<Resource> recentSharesList =  databaseConnectionDaoInterface.recentShares();
        return recentSharesList;
    }
}
