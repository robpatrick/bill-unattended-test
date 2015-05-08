package com.alkalinezoo.sky.unattended

import grails.transaction.Transactional
import groovy.json.JsonSlurper

/**
 * Simple service that consumes a json endpoint and uses {@link JsonSlurper} to parse the content
 * into a data structures such as maps, lists and primitive types like Integer, Double, Boolean and String.
 * The class will convert dates but only if the json is in the format 'yyyy-MM-dd’T’HH:mm:ssZ'.
 */
@Transactional
class BillService {

    def fetchBill() {
        new JsonSlurper().parseText( new URL( 'http://safe-plains-5453.herokuapp.com/bill.json' ).text )
    }
}
