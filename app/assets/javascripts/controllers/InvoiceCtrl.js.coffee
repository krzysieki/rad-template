@InvoiceCtrl = ($scope, invoiceService) ->
  $scope.title = "Invoice part"
  $scope.invoices = invoiceService
  $scope.error = "error"