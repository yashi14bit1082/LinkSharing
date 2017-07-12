package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * Created by yashi on 12-07-2017.
 */
public class FetchFromDatabase implements FetchFromDatabaseInterface,startSession,stopSession {

    @Override
    public Object fetchData(String table_name, String where_field,String field_value) {
        Session session = startsession();
        String queryString = "from "+table_name+" where "+where_field+" = :field_value";
        Query query = session.createQuery(queryString);
        query.setString("field_value", field_value);
        Object object = query.uniqueResult();
        stopsession(session);
        return object;
    }
}
