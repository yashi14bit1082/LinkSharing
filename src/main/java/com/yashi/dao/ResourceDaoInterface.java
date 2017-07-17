package com.yashi.dao;

import com.yashi.model.Resource;
import com.yashi.model.Topic;
import com.yashi.model.User;

import java.util.List;

/**
 * Created by yashi on 13-07-2017.
 */
public interface ResourceDaoInterface {
    default Resource saveLinkResourceDao(String link, String desc, Topic topic, User user, String resourceType)
    {
        return null;
    }

    default void setPostReadUnread(Resource resource, List<User> userList)
    {

    }
}
