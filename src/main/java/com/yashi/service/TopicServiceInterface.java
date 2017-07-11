package com.yashi.service;

/**
 * Created by yashi on 11-07-2017.
 */
public interface TopicServiceInterface {

    default Integer addTopic(String topicName,String visibility,String topicCreatedBy)
    {
        return 0;
    }
}
