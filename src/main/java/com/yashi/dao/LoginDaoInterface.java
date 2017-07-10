package com.yashi.dao;

import com.yashi.model.User;

/**
 * Created by yashi on 10-07-2017.
 */
public interface LoginDaoInterface {

    default boolean loginUser(User user)
    {
        return false;
    }
}
