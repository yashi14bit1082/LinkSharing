package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.Topic;
import com.yashi.model.User;
import com.yashi.service.CheckUniquenessInterface;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * Created by yashi on 12-07-2017.
 */
public class CheckUniqueDao implements CheckUniqueDaoInterface,startSession,stopSession {

    Boolean result;
    @Override
    public Boolean checkUniqueTopic(String topicName, String currentUser) {

        Session session = startsession();
        String queryString = "from Topic where topicName = :topicName AND createdBy IN (select id from User where username = :currentUser)";

        Query query = session.createQuery(queryString);
        query.setString("topicName", topicName);
        query.setString("currentUser",currentUser);
        Object queryResult = query.uniqueResult();
        Topic topic = (Topic)queryResult;

        if(topic!=null)
            result = true;

        else
            result = false;

        return result;
    }
}