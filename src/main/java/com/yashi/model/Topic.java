package com.yashi.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by yashi on 11-07-2017.
 */
@Entity
public class Topic {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
   private int id;
   private String topicName;
    @ManyToOne
   private User createdBy;
    @Temporal(TemporalType.DATE)
   private Date dateCreated = new Date();
    @Temporal(TemporalType.DATE)
   private Date lastUpdated = new Date();
    @Enumerated(EnumType.STRING)
  private Visibility visibility;

    @OneToMany(mappedBy = "topic")
  private Collection<Subscription> topic = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    private Collection<Subscription> user = new ArrayList<>();

    public Visibility getVisibility() {
        return visibility;
    }

    public void setVisibility(Visibility visibility) {
        this.visibility = visibility;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    @Override
    public String toString() {
        return "topicName"+topicName+"username"+createdBy.getUsername();
    }
}
