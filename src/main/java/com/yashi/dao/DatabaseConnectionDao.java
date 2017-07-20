package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.*;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public class DatabaseConnectionDao implements DatabaseConnectionDaoInterface,startSession,stopSession {

    @Override
    public Object fetchData(String... a) {
        Session session = startsession();
        String queryString;
        Query query = null;

        if(a.length==3) {
            queryString = "from " + a[0] + " where " + a[1] + " = :field_value";
            query = session.createQuery(queryString);
            query.setString("field_value", a[2]);
        }
        else if(a.length==5)
        {
            queryString = "from " + a[0] + " where " + a[1] + " = :field_value1"+" AND "+a[3]+" = :field_value2";
            query = session.createQuery(queryString);
            query.setString("field_value1", a[2]);
            query.setString("field_value2",a[4]);
        }
        Object object = query.uniqueResult();
        stopsession(session);
        return object;
    }

    @Override
    public List<Topic> fetchData(String search_string) {
        Session session = startsession();
        String queryString = "select topicName,createdBy.username from Topic where topicName LIKE "+":field_value"+" AND visibility = :visibility";
        Query query = session.createQuery(queryString);
        query.setString("field_value", search_string+"%");
        query.setString("visibility","Public");
        List<Topic> object = query.list();
        stopsession(session);
        return object;
    }


    @Override
    public List<Subscription> fetchSubscribedData(String... a) {

        Session session = startsession();
        String queryString = "select topic.topicName,user.username from Subscription where topic.topicName LIKE "+":field_value"+" AND user.username = :field_value2";
        Query query = session.createQuery(queryString);
        query.setString("field_value", a[0]+"%");
        query.setString("field_value2",a[1]);
        List<Subscription> object = query.list();
        stopsession(session);
        return object;
    }

    @Override
    public List<Resource> fetchResourceList(String... a) {

        List<Resource> object = null;
        Session session = startsession();

        String queryString = "from Resource where topic.topicName =:fieldData1";
        Query query = session.createQuery(queryString);
        query.setMaxResults(2);
        query.setFirstResult(Integer.parseInt(a[1]));
        query.setString("fieldData1", a[0]);

        object = query.list();

        stopsession(session);
        return object;
    }


    @Override
    public boolean checkDataExistence(String... a) {

        Object obj = null;
        String queryString = null;
        Query query = null;
        Session session = startsession();
        if(a.length==3) {
            queryString = "from " + a[0] + " where " + a[1] + " = :fieldData";

            query = session.createQuery(queryString);
            query.setString("fieldData", a[2]);
            obj = query.uniqueResult();
        }

        else if(a.length==5)
        {
            queryString = "from " + a[0] + " where " + a[1] + " = :fieldData1 AND "+ a[3] + " =:fieldData2";

            query = session.createQuery(queryString);
            query.setString("fieldData1", a[2]);
            query.setString("fieldData2",a[4]);
            obj = query.uniqueResult();
        }

        stopsession(session);

        if(obj!=null)
            return true;
        else
            return false;
    }



    @Override
    public Integer updateTable(String... a) {
        String queryString = null;
        Query query = null;
        Integer response = 0;

        Session session = startsession();

        if(a.length==5)
        {
            queryString = "update "+ a[0] + " set "+a[1]+" = :fieldData1 where "+ a[3]+" = :fieldData2";
            query = session.createQuery(queryString);
            query.setString("fieldData1",a[2]);
            query.setString("fieldData2",a[4]);
            response = query.executeUpdate();
        }
        stopsession(session);
        return response;
    }


    @Override
    public List<Object> fetchList(String... a) {

        Session session = startsession();
        String queryString = null;
        Query query = null;
        List<Object> response = null;

        if(a.length==1)
        {
            queryString = "from "+a[0];
            query = session.createQuery(queryString);
            response = query.list();
        }
        else if(a.length==3)
        {
            queryString = "from "+a[0]+" where "+a[1]+" = :fieldData";
            query = session.createQuery(queryString);
            query.setString("fieldData",a[2]);
            response = query.list();
        }
        stopsession(session);
        return response;
    }

    @Override
    public List<Subscription> fetchSubscribedUsersFromSubscription(Topic topic1) {

        Session session = startsession();
        String queryString = "from Subscription where topic.topicName = :fieldData1 AND topic.createdBy.username = :fieldData2";
        Query query = session.createQuery(queryString);
        query.setString("fieldData1",topic1.getTopicName());
        query.setString("fieldData2",topic1.getCreatedBy().getUsername());

        List<Subscription> userList = query.list();
        stopsession(session);
        return userList;
    }


    @Override
    public List<Resource> recentShares() {
        Session session = startsession();
        String queryString = "from Resource where topic.visibility = 'Public' order by dateCreated DESC";
        Query query = session.createQuery(queryString);
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Resource> recentSharesList = query.list();
        stopsession(session);
        return recentSharesList;
    }


    @Override
    public Long fetchNumberSubscription(String username) {

        Session session =startsession();
        String queryString = "select count(user) from Subscription where user.username = :username";
        Query query = session.createQuery(queryString);
        query.setString("username",username);
        Long subsNumber = (Long)query.uniqueResult();
        stopsession(session);
        return subsNumber;
    }

    @Override
    public Long fetchNumberTopic(String username) {

        Session session =startsession();
        String queryString = "select count(topic) from Subscription where topic.createdBy.username = :username";
        Query query = session.createQuery(queryString);
        query.setString("username",username);
        Long topicNumber = (Long)query.uniqueResult();
        stopsession(session);
        return topicNumber;

    }


    @Override
    public List<ReadingItem> fetchUnreadPosts(String username,int index) {

        Session session = startsession();
        String queryString = "from ReadingItem r where r.user.username = :username AND r.isRead = false";
        Query query = session.createQuery(queryString);
        query.setFirstResult(index);
        query.setMaxResults(5);
        query.setString("username",username);
        List<ReadingItem> unreadPosts = query.list();
        System.out.println(unreadPosts+"aaya dao mein");

        return unreadPosts;
    }


    @Override
    public Long fetchMaxPostCount(String username) {


        Session session =startsession();
        String queryString = "select count(user) from ReadingItem where user.username = :username AND isRead = false";
        Query query = session.createQuery(queryString);
        query.setString("username",username);
        Long maxPostCount = (Long)query.uniqueResult();
        stopsession(session);
        return maxPostCount;

    }


    @Override
    public Integer markPostRead(int id) {

        Session session = startsession();
        String queryString = "update ReadingItem set isRead = true where id = :id";
        Query query = session.createQuery(queryString);
        query.setString("id",id+"");
        Integer response = (Integer)query.executeUpdate();
        stopsession(session);
        System.out.println("dao mein aaya"+response);
        return response;

    }

}

