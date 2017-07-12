package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.Seriousness;
import com.yashi.model.Subscription;
import com.yashi.model.Topic;
import com.yashi.model.User;
import org.hibernate.Session;

/**
 * Created by yashi on 12-07-2017.
 */
public class SubscriptionDao implements SubscriptionDaoInterface,startSession,stopSession {

    @Override
    public Integer addSubscriptionDB(Topic topic, User user,Seriousness seriousness) {
        Session session = startsession();

        Subscription subscription = new Subscription();
        subscription.setTopic(topic);
        subscription.setUser(user);
        subscription.setSeriousness(seriousness);

        session.save(subscription);
        stopsession(session);

        return null;
    }
}
