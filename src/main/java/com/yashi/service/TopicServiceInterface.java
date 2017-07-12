package com.yashi.service;

import com.yashi.model.Topic;

/**
 * Created by yashi on 11-07-2017.
 */
public interface TopicServiceInterface {

    default Integer addTopic(Topic topic, String topicCreatedBy)
    {
        return 0;
    }
}
