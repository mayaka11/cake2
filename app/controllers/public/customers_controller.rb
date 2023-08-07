class Public::CustomersController < ApplicationController



  def show
    @customer = Customer.find(params[:id])  #情報を1件だけ取得するので、インスタンス変数名は単数形にする。
  end

  def edit
    @customer = Customer.find(params[:id])  #情報を1件だけ取得するので、インスタンス変数名は単数形にする。
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end




private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number)
  end


end
