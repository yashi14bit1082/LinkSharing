package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.Topic;
import com.yashi.model.User;
import com.yashi.model.Visibility;
import com.yashi.service.TopicServiceInterface;
import org.hibernate.Query;
import org.hibernate.Session;

import javax.persistence.ManyToOne;


/**
 * Created by yashi on 11-07-2017.
 */
public class TopicDao implements TopicDaoInterface,startSession,stopSession {
    @Override
    public Integer topicAddDatabase(Topic topic, String topicCreatedBy) {

        Session session = startsession();

        String queryString = "from User where username = :username";

        Query query = session.createQuery(queryString);
        query.setString("username", topicCreatedBy );
        Object queryResult = query.uniqueResult();
        User user1 = (User)queryResult;

        topic.setCreatedBy(user1);
        /*topic.setTopicName(topicName);

        if(visibility.equalsIgnoreCase("public"))
        topic.setVisibility(Visibility.PUBLIC);
        else
            topic.setVisibility(Visibility.PRIVATE);*/

        Integer topicAdded = (Integer) session.save(topic);
        stopsession(session);
        return topicAdded;
    }
}
