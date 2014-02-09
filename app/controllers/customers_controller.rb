class CustomersController < ApplicationController
  respond_to :json

  def index
    customers = Customer.all

    respond_with(customers) do |format|
      format.json { render :json => customers.as_json }
    end
  end

  def show
    customer = Customer.find(params[:id])

    respond_with(customers) do |format|
      format.json { render :json => customer.as_json }
    end
  end
end
