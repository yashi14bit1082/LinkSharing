package com.yashi.model;

/**
 * Created by yashi on 11-07-2017.
 */
public enum Visibility {

    Private("Private"),
    Public("Public");

    private final String value;

    Visibility(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}

