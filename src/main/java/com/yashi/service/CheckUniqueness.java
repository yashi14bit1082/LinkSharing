package com.yashi.service;

import com.yashi.dao.CheckUniqueDaoInterface;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by yashi on 12-07-2017.
 */
public class CheckUniqueness implements CheckUniquenessInterface {

    @Autowired
    CheckUniqueDaoInterface checkUniqueDaoInterface;

    @Override
    public Boolean checkTopicUniqueness(String topicName) {

       Boolean response = checkUniqueDaoInterface.checkUniqueTopic(topicName);
        return response;
    }
}
