package com.yashi.model;

import javax.persistence.*;

/**
 * Created by yashi on 17-07-2017.
 */
@Entity
public class ReadingItem {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    int id;
    @ManyToOne
    Resource resource;
    @ManyToOne
    User user;
    Boolean isRead = false;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getRead() {
        return isRead;
    }

    public void setRead(Boolean read) {
        isRead = read;
    }
}
