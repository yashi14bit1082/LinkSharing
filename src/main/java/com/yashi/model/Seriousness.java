package com.yashi.model;

/**
 * Created by yashi on 12-07-2017.
 */
public
enum Seriousness {
    SERIOUS("SERIOUS"),
    VERY_SERIOUS("VERY_SERIOUS"),
    CASUAL("CASUAL");

    private final String value;

    Seriousness(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
