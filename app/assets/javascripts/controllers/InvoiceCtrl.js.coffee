@InvoiceCtrl = ($scope, invoiceServ) ->
  $scope.title = "Invoice part"
  $scope.invoices = invoiceServ

  # invoices.loadInvoices()