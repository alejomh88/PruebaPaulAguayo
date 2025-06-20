package com.pichincha;

import com.intuit.karate.junit5.Karate;

class MarvelApiTest {
    
    @Karate.Test
    Karate testMarvelCharactersApi() {
        return Karate.run("classpath:com/pichincha/features/marvel_characters_api")
                .tags("~@ignore")
                .relativeTo(getClass());
    }
}
