package com.yashi.service;

/**
 * Created by yashi on 13-07-2017.
 */
public interface ResourceServiceInterface {
    default Integer saveLinkResourceService(String link, String desc, String topic)
    {
        return 0;
    }

}
