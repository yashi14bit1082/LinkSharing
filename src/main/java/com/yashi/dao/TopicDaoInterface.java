package com.yashi.dao;

import com.yashi.model.Topic;

/**
 * Created by yashi on 11-07-2017.
 */
public interface TopicDaoInterface {
    default Integer topicAddDatabase(Topic topic, String topicCreatedBy)
    {
        return 0;
    }
}
