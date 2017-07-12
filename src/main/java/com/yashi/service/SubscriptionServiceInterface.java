package com.yashi.service;

import com.yashi.model.Seriousness;
import com.yashi.model.Topic;
import com.yashi.model.User;

/**
 * Created by yashi on 12-07-2017.
 */
public interface SubscriptionServiceInterface {

    default Integer addSubscription(Topic topic, User user, Seriousness seriousness)
    {
        return 0;
    }

}
