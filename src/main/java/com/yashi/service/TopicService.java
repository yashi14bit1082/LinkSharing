package com.yashi.service;

import com.yashi.dao.TopicDaoInterface;

/**
 * Created by yashi on 11-07-2017.
 */
public class TopicService implements TopicServiceInterface{

    TopicDaoInterface topicDaoInterface;
    @Override
    public Integer addTopic(String topicName, String visibility, String topicCreatedBy) {
        Integer val = topicDaoInterface.topicAddDatabase(topicName,visibility,topicCreatedBy);

        return val;
    }
}
