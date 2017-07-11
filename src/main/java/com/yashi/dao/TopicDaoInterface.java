package com.yashi.dao;

/**
 * Created by yashi on 11-07-2017.
 */
public interface TopicDaoInterface {
    default Integer topicAddDatabase(String topicName, String visibility, String topicCreatedBy)
    {
        return 0;
    }
}
