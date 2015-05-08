<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <title>Sky Billing - unattended test</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet href="application.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">

    <h1>Bills &amp; payments</h1>

    <div role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#current" aria-controls="home" role="tab"
                                                      data-toggle="tab">Current Bill</a></li>
            <li role="presentation"><a href="#previous" aria-controls="previous" role="tab"
                                       data-toggle="tab">Previous Bills</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="current">
                <div>
                    <h2>From <g:formatDate date="${fromDate}" format="dd/MM/yy"/> to <g:formatDate date="${toDate}"
                                                                                                   format="dd/MM/yy"/></h2>
                </div>

                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-primary">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                   aria-expanded="true"
                                   aria-controls="collapseOne">
                                    Package <span id="total"><g:formatNumber number="${skyPackage.total}"
                                                                             type="currency" currencyCode="GBP"
                                                                             currencySymbol="£"/></span>
                                </a>
                            </h4>
                        </div>

                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <div class="panel-body">

                                <g:each var="subscription" in="${skyPackage.subscriptions}">
                                    <table class="table table-striped">
                                        <tr>
                                            <th class="col-md-2">${subscription.type.toUpperCase()}</th>
                                            <th class="col-md-2">Cost</th>
                                        </tr>

                                        <tr>
                                            <td class="col-md-2">${subscription.name}</td>
                                            <td class="col-md-2"><g:formatNumber number="${subscription.cost}"
                                                                                 type="currency"
                                                                                 currencyCode="GBP"
                                                                                 currencySymbol="£"/></td>
                                        </tr>
                                    </table>
                                </g:each>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-primary">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                                   aria-expanded="false" aria-controls="collapseTwo">
                                    Sky Store <span id="total"><g:formatNumber number="${skyStore.total}"
                                                                               type="currency" currencyCode="GBP"
                                                                               currencySymbol="£"/></span>
                                </a>
                            </h4>
                        </div>

                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <div class="panel-body">

                                <table class="table table-striped">
                                    <tr>
                                        <th class="col-md-2">Rentals</th>
                                        <th class="col-md-2">Cost</th>
                                    </tr>
                                    <g:each var="rentals" in="${skyStore.rentals}">
                                        <tr>
                                            <td class="col-md-2">${rentals.title}</td>
                                            <td class="col-md-2"><g:formatNumber number="${rentals.cost}"
                                                                                 type="currency"
                                                                                 currencyCode="GBP"
                                                                                 currencySymbol="£"/></td>
                                        </tr>
                                    </g:each>

                                </table>


                                <table class="table table-striped">
                                    <tr>
                                        <th class="col-md-2">Buy and Keep</th>
                                        <th class="col-md-2">Cost</th>
                                    </tr>
                                    <g:each var="buyAndKeep" in="${skyStore.buyAndKeep}">
                                        <tr>
                                            <td class="col-md-2">${buyAndKeep.title}</td>
                                            <td class="col-md-2"><g:formatNumber number="${buyAndKeep.cost}"
                                                                                 type="currency"
                                                                                 currencyCode="GBP"
                                                                                 currencySymbol="£"/></td>
                                        </tr>
                                    </g:each>

                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-primary">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapseThree"
                                   aria-expanded="false" aria-controls="collapseThree">
                                    Call Charges <span id="total"><g:formatNumber number="${callCharges.total}"
                                                                                  type="currency"
                                                                                  currencyCode="GBP"
                                                                                  currencySymbol="£"/></span>
                                </a>
                            </h4>
                        </div>

                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="headingThree">
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Number Called</th>
                                        <th>Call Duration</th>
                                        <th>Cost</th>
                                    </tr>
                                    <g:each var="call" in="${callCharges.calls}">
                                        <tr>
                                            <td>${call.called}</td>
                                            <td>${call.duration}</td>
                                            <td><g:formatNumber number="${call.cost}"
                                                                type="currency"
                                                                currencyCode="GBP"
                                                                currencySymbol="£"/></td>
                                        </tr>
                                    </g:each>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <h2>Payment due on <g:formatDate date="${dueDate}" format="dd/MM/yy"/> <span
                            id="total"><g:formatNumber
                                number="${total}" type="currency" currencyCode="GBP"
                                currencySymbol="£"/></span>

                        <h2>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane" id="previous">
                Previous Bills Here
            </div>
        </div>
    </div>
</div>
</body>
</html>