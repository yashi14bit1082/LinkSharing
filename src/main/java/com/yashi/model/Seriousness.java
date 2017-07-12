package com.yashi.model;

/**
 * Created by yashi on 12-07-2017.
 */
public enum Seriousness {
    SERIOUS("serious"),
    VERY_SERIOUS("very_serious"),
    CASUAL("casual");

    private final String value;

    Seriousness(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
