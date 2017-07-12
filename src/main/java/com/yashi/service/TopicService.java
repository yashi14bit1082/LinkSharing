package com.yashi.service;

import com.yashi.dao.TopicDaoInterface;
import com.yashi.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yashi on 11-07-2017.
 */
public class TopicService implements TopicServiceInterface,CheckUniquenessInterface {
        @Autowired
        TopicDaoInterface topicDaoInterface;

    @Override
    public Integer addTopic(Topic topic, String topicCreatedBy) {
        Integer val = topicDaoInterface.topicAddDatabase(topic,topicCreatedBy);

        return val;
    }

}
