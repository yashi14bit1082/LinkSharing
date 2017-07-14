package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.Topic;
import com.yashi.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by yashi on 12-07-2017.
 */
public class FetchFromDatabase implements FetchFromDatabaseInterface,startSession,stopSession {

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
    public boolean checkDataExistence(String... a) {

        Session session = startsession();
        String queryString = "from "+a[0]+" where "+a[1]+" = :fieldData";
        Query query = session.createQuery(queryString);
        query.setString("fieldData",a[2]);
        Object obj = query.uniqueResult();
        stopsession(session);

        if(obj!=null)
            return true;
        else
            return false;
    }
}
