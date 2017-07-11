package com.yashi.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by yashi on 11-07-2017.
 */
@Entity
public class Topic {
    @Id
    @GeneratedValue (strategy = GenerationType.TABLE)
   private int id;
   private String topicName;
    @ManyToOne
   private User createdBy;
    @Temporal(TemporalType.DATE)
   private Date dateCreated = new Date();
    @Temporal(TemporalType.DATE)
   private Date lastUpdated = new Date();
  private Visibility visibility;

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
        return "topicName"+topicName;
    }
}
