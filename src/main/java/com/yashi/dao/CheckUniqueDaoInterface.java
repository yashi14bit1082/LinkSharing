package com.yashi.dao;

/**
 * Created by yashi on 12-07-2017.
 */
public interface CheckUniqueDaoInterface {

    default Boolean checkUniqueTopic(String topicName, String currentUser)
    {
        return false;
    }
}
