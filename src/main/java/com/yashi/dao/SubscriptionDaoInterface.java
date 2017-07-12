package com.yashi.dao;

import com.yashi.model.Seriousness;
import com.yashi.model.Topic;
import com.yashi.model.User;

/**
 * Created by yashi on 12-07-2017.
 */
public interface SubscriptionDaoInterface {

    default Integer addSubscriptionDB(Topic topic, User user, Seriousness seriousness)
    {
        return 0;
    }
}
