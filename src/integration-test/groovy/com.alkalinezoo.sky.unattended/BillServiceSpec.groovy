package com.alkalinezoo.sky.unattended

import grails.test.mixin.integration.Integration
import grails.transaction.*
import org.springframework.beans.factory.annotation.Autowired
import spock.lang.*

/**
 * Integration test to exercise the {@link BillService}
 */
@Integration
@Rollback
class BillServiceSpec extends Specification {

    @Autowired
    BillService billService


    void "Test fetchBill returns the correct json structure"() {
        when:"The service is called"
        def bill = billService.fetchBill()

        then:"The main nodes exist"
        bill.statement
        bill.total
        bill.package
        bill.callCharges
        bill.skyStore
    }

}
