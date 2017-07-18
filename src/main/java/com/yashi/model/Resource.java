package com.yashi.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by yashi on 13-07-2017.
 */

@Entity
public class Resource {

    @Id
    @GeneratedValue
    int id;
    String Description;
    @ManyToOne
    User user;
    @ManyToOne
    Topic topic;
    @Temporal(TemporalType.TIMESTAMP)
    Date dateCreated = new Date();
    @Temporal(TemporalType.TIMESTAMP)
    Date dateUpdated;

    String resource_path;
    @Enumerated(EnumType.STRING)
    Link_Doc_Resource resource_type;

    public String getResource_path() {
        return resource_path;
    }

    public void setResource_path(String resource_path) {
        this.resource_path = resource_path;
    }

    public Link_Doc_Resource getResource_type() {
        return resource_type;
    }

    public void setResource_type(Link_Doc_Resource resource_type) {
        this.resource_type = resource_type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateUpdated() {
        return dateUpdated;
    }

    public void setDateUpdated(Date dateUpdated) {
        this.dateUpdated = dateUpdated;
    }
}
