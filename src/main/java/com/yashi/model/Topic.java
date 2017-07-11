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
    int id;
    String topicName;
    @ManyToOne
    User createdBy;
    @Temporal(TemporalType.DATE)
    Date dateCreated;
    @Temporal(TemporalType.DATE)
    Date lastUpdated;

    public enum Visibility {

        PRIVATE("private"),
        PUBLIC("public");

        private final String value;

         Visibility(String value) {
            this.value = value;
        }

        public String getValue() {
            return this.value;
        }
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
