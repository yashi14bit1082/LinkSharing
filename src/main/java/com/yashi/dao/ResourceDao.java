package com.yashi.dao;

import com.yashi.Handlers.startSession;
import com.yashi.Handlers.stopSession;
import com.yashi.model.Link_Doc_Resource;
import com.yashi.model.Resource;
import com.yashi.model.Topic;
import com.yashi.model.User;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.Date;

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
    public Integer saveLinkResourceDao(String link, String desc, Topic topic, User user) {

        Session session = startsession();

        Resource resource = setUpSaveFun(link,desc,topic,user);
        resource.setResource_type(Link_Doc_Resource.Link);
        Integer result = (Integer)session.save(resource);
       stopsession(session);

        return result;
    }

    @Override
    public Integer saveDocxResourceDao(String attachedFile, String desc, Topic topic, User user) {
        Session session = startsession();

        Resource resource = setUpSaveFun(attachedFile,desc,topic,user);
        resource.setResource_type(Link_Doc_Resource.Document);

        Integer result = (Integer)session.save(resource);
        stopsession(session);

        return result;
    }
}
