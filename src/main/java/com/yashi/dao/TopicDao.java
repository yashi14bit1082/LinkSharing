package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.Topic;
import com.yashi.model.User;
import com.yashi.model.Visibility;
import com.yashi.service.TopicServiceInterface;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.ManyToOne;


/**
 * Created by yashi on 11-07-2017.
 */
public class TopicDao implements TopicDaoInterface,startSession,stopSession {

    @Autowired
    DatabaseConnectionDaoInterface databaseConnectionDaoInterface;

    @Override
    public Integer topicAddDatabase(Topic topic, String topicCreatedBy) {

        Session session = startsession();
        User user = (User)databaseConnectionDaoInterface.fetchData("User","username",topicCreatedBy);

        topic.setCreatedBy(user);
        Integer topicAdded = (Integer) session.save(topic);
        stopsession(session);
        return topicAdded;
    }
}
