package com.alkalinezoo.sky.unattended

import grails.test.mixin.integration.Integration
import grails.transaction.*

import spock.lang.*
import geb.spock.*

/**
 * Functional test that exercises the view bill gsp.
 */
@Integration
@Rollback
class ViewBillSpec extends GebSpec {

    void "Test the View Bill Title."() {

        when:"The bill page is visited"
            go '/bill/viewBill'

        then:"The title is correct"
        	$('title').text() == "Sky Billing - unattended test"
    }

    void "The Current Bill Tab is the Active Tab on entry"() {

        when:"The bill page is visited"
        go '/bill/viewBill'

        then:"The current bill tab is active"
        $('#current').classes().contains('active')

        and: "The previous bill tab is inactive"
        !$('#previous').classes().contains('active')
    }


    void "The Package Panel should be open on entry"() {

        when:"The bill page is visited"
        go '/bill/viewBill'

        then:"The first (Package) panel is open"
        $('#collapseOne').classes().contains('in')

        and:"The second (Sky Store) panel is closed"
        !$('#collapseTwo').classes().contains('in')

        and:"The third (Call Charges) panel is closed"
        !$('#collapseThree').classes().contains('in')
    }

    void "The Package panel is open on entry"() {

        when:"The bill page is visited"
        go '/bill/viewBill'

        then:"The Package panel is open"
        $('#headingOne a[aria-expanded="true"]')

        and:"The Sky Store panel is closed"
        $('#headingTwo a[aria-expanded="false"]')


        and:"The Call Charges panel is closed"
        $('#headingThree a[aria-expanded="false"]')
    }

}
