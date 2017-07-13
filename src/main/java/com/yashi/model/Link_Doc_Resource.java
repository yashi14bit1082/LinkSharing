package com.yashi.model;

/**
 * Created by yashi on 13-07-2017.
 */
public enum Link_Doc_Resource {
    Link("Link"),
    Document("Document");

    private final String value;
    Link_Doc_Resource(String value)
    {
        this.value=value;
    }
    public String getValue()
    {
        return value;
    }
}
