package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.*;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.Date;
import java.util.List;

/**
 * Created by yashi on 13-07-2017.
 */
public class ResourceDao implements ResourceDaoInterface, startSession,stopSession {

    public Resource setUpSaveFun(String link, String desc, Topic topic, User user)
    {
        Resource resource = new Resource();
        resource.setDescription(desc);
        resource.setTopic(topic);
        resource.setUser(user);
        resource.setDateUpdated(new Date());
        resource.setResource_path(link);

        return resource;
    }
    @Override
    public Resource saveLinkResourceDao(String link, String desc, Topic topic, User user,String resourceType) {

        Session session = startsession();

        Resource resource = setUpSaveFun(link,desc,topic,user);

        if(resourceType.equalsIgnoreCase("link"))
        resource.setResource_type(Link_Doc_Resource.Link);
        else
            resource.setResource_type(Link_Doc_Resource.Document);

           session.save(resource);
            stopsession(session);

        return resource;
    }


    @Override
    public void setPostReadUnread(Resource resource, List<User> userList) {

        for(User u:userList)
        {
            Session session = startsession();
            ReadingItem readingItem = new ReadingItem();
            readingItem.setResource(resource);
            readingItem.setRead(true);
            readingItem.setUser(u);
            session.save(readingItem);
            stopsession(session);
        }

    }
}
