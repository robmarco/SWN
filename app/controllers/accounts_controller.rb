class AccountsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @account = current_user.account.create(params[:account])
    @country = Country.all
  end
  
  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    @country = Country.all        
  end

  # PUT /accounts/1
  def update
    @account = Account.find(params[:id])
    @country = Country.all

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to( edit_account_url, :notice => t('controllers.successfully_updated', :model => Account.model_name.human) ) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /accounts/1
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
    end
  end
end
