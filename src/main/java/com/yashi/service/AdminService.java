package com.yashi.service;

import com.yashi.dao.AdminDaoInterface;
import com.yashi.dao.DatabaseConnectionDaoInterface;
import com.yashi.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yashi on 16-07-2017.
 */
public class AdminService implements AdminServiceInterface {

    @Autowired
    DatabaseConnectionDaoInterface databaseConnectionDaoInterface;

    @Override
    public List<Object> fetchList(String... a) {

List<Object> resultList = null;
boolean b = false;
        switch(a[0])
        {
            case "User":{
                if(a[1].equals("All Users"))
                {
                    resultList = databaseConnectionDaoInterface.fetchList("User");

                }
                else
                {
                    if(a[1].equals("active"))
                    {
                        b=true;
                    }
                    else
                    {
                        b=false;
                    }
                    resultList = databaseConnectionDaoInterface.fetchList("User","active",b+"");
                }
                break;
            }
            case "Topic":{
                if(a[1].equals("All Topics"))
                {
                    resultList = databaseConnectionDaoInterface.fetchList("Topic");
                }
                else
                {
                    resultList = databaseConnectionDaoInterface.fetchList("Topic","visibility",a[1]);
                }
                break;
            }
            case "Post":{
                if(a[1].equals("All Posts"))
                {
                    resultList = databaseConnectionDaoInterface.fetchList("Resource");
                }
                else
                {
                    resultList = databaseConnectionDaoInterface.fetchList("Resource","resource_type",a[1]);
                }
                break;
            }
        }
        return resultList;
    }
}
