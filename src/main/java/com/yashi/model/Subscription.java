package com.yashi.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by yashi on 12-07-2017.
 */
@Entity
public class Subscription {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
   private int id;
    @ManyToOne
   private Topic topic;
    @ManyToOne
    private User user;
    @Enumerated(EnumType.STRING)
    private Seriousness seriousness;
    @Temporal(TemporalType.DATE)
    private Date dateCreated = new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Seriousness getSeriousness() {
        return seriousness;
    }

    public void setSeriousness(Seriousness seriousness) {
        this.seriousness = seriousness;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }
}
