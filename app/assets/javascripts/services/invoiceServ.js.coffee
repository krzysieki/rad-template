angular.module('ControlPanel').factory('invoiceServ', ['$http', ($http) ->

  invoices =
      invoices: [
                  {
                    "id": 0,
                    "file": "file.pdf",
                    "date": "01/06/2013",
                    "status": "info"
                  },
                  {
                    "id": 1,
                    "file": "file.pdf",
                    "date": "01/06/2013",
                    "status": "error"
                  },
                  {
                    "id": 2,
                    "file": "file.pdf",
                    "date": "20/03/2013",
                    "status": "payed"
                  }
                ]

  return invoices
])

