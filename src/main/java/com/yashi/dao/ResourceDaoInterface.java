package com.yashi.dao;

import com.yashi.model.Topic;
import com.yashi.model.User;

/**
 * Created by yashi on 13-07-2017.
 */
public interface ResourceDaoInterface {
    default Integer saveLinkResourceDao(String link, String desc, Topic topic, User user)
    {
        return 0;
    }

    default Integer saveDocxResourceDao(String attachedFile, String desc, Topic topic, User user)
    {
        return 0;
    }
}
