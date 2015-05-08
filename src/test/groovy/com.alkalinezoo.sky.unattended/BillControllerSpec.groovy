package com.alkalinezoo.sky.unattended

import grails.test.mixin.TestFor
import org.apache.commons.lang.RandomStringUtils
import grails.test.mixin.Mock
import spock.lang.Specification

/**
 * Unit test that exercises the controller.
 */
@TestFor(BillController)
@Mock(BillService)
class BillControllerSpec extends Specification {


    static final String FROM_DATE = '2015-01-01'
    static final String TO_DATE = '2015-02-02'
    static final String DUE_DATE = '2015-03-03'
    static final BigDecimal TOTAL = 100.00
    static final String PACKAGE = RandomStringUtils.randomAlphanumeric(10)
    static final String CALL_CHARGES = RandomStringUtils.randomAlphanumeric(10)
    static final String SKY_STORE = RandomStringUtils.randomAlphanumeric(10)

    void "Test viewBill returnds the correct data for the view"() {

        given: 'A mocked service'
        def billService = Mock(BillService)
        billService.metaClass.fetchBill = { ->
            [
                    statement  : [due   : DUE_DATE,
                                  period: [from: FROM_DATE, to: TO_DATE]],
                    total      : TOTAL,
                    package    : PACKAGE,
                    callCharges: CALL_CHARGES,
                    skyStore   : SKY_STORE
            ]
        }
        controller.billService = billService

        when: 'The controller action viewBill() is executed'
        def model = controller.viewBill()

        then: 'The model returned from the method is in the correct structure'
        model.statement == [due   : DUE_DATE,
                            period: [from: FROM_DATE, to: TO_DATE]]
        model.total == TOTAL
        model.skyPackage == PACKAGE
        model.callCharges == CALL_CHARGES
        model.skyStore == SKY_STORE
    }
}