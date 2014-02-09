@InvoiceCtrl = ($scope, invoiceServ) ->
  $scope.title = "Invoice part"
  $scope.invoices = invoiceServ
  $scope.error = "error"
  # invoices.loadInvoices()