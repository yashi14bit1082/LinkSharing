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
    int id;


    private Seriousness seriousness ;
    @Temporal(TemporalType.DATE)
    private Date dateCreated = new Date();
    
}
