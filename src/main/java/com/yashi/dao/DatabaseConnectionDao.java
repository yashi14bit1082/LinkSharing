package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.Resource;
import com.yashi.model.Topic;
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
}
