package com.yashi.service;

/**
 * Created by yashi on 12-07-2017.
 */

public interface CheckUniquenessInterface {

    default Boolean checkTopicUniqueness(String topicName)
    {
        return false;
    }
}
