# Bill Unattended Test

## Task

[Bill Unattended Test](https://github.com/ldabiralai/bill-unattended-test/blob/master/README.md)

## Details 

### Framework

Grails 3.0.1 Application.

### Application Structure

The application consists of a simple service, controller and view.

### Tests

Includes the following types of Spock based tests:

* Service - integration
* Controller - unit
* View - functional using Geb

Uses CDN served bootstrap components in the view. Design based (loosely) on this [page](http://help.sky.com/articles/manage-your-sky-bills-and-payments) 

### Install grails

Installation instructions for grails 3 can be found [here](https://grails.org/single-page-documentation.html)

I'd recommend using [gvm](https://http://gvmtool.net)

### To test

`grails test-app`

### To run:

`grails run-app`

Navigate to `http://localhost:8080/bill/viewBill`