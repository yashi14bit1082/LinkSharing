package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

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

    @Override
    public List<Object> fetchData(String table_name, String field_name, String search_string, int randomval) {
        Session session = startsession();
        String queryString = "from "+table_name+" where "+field_name+" LIKE "+":field_value";
        Query query = session.createQuery(queryString);
        query.setString("field_value", "\"%"+search_string+"%\"");
        List<Object> object = query.list();
        stopsession(session);
        return object;
    }
}
