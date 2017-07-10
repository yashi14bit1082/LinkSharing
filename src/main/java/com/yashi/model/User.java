package com.yashi.model;

import javassist.bytecode.ByteArray;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by yashi on 10-07-2017.
 */

@Entity
public class User {

    @Id
    @GeneratedValue (strategy = GenerationType.TABLE)
    private Integer id;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String email;
    @Temporal(TemporalType.DATE)
    private Date dateCreated = new Date();
    @Temporal(TemporalType.DATE)
    private Date dateUpdated = new Date();
    private boolean admin = false;
    private boolean active = true;
    @Lob
    private byte[] photo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public boolean getAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "username "+ username;
    }
}
