package com.alkalinezoo.sky.unattended

/**
 * Controller to support the viewing of bill data.
 */
class BillController {

    public static final String DATE_FORMAT = 'yyyy-MM-dd'

    BillService billService

    /**
     * Calls the {@link BillService} to retrieve bill data. The structure is 'flattened' to make it easier
     * to handle in the view.
     *
     * @return Map of bill data.
     */
    def viewBill() {

        def bill = billService.fetchBill()

        [statement: bill.statement,
         fromDate: Date.parse(DATE_FORMAT, bill.statement.period.from),
         toDate: Date.parse(DATE_FORMAT, bill.statement.period.to),
         dueDate: Date.parse(DATE_FORMAT, bill.statement.due),
         total: bill.total,
         skyPackage: bill.package,
         callCharges: bill.callCharges,
         skyStore: bill.skyStore]
    }

}
