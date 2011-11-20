class AccountsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    @country = Country.all
    
    if params[:photo]
      uploaded_io = params[:account][:photo]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
        file.write(uploaded_io.read)
      end
    end
    
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])
    @country = Country.all

    uploaded_io = params[:account][:photo]

    
    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to( dashboard_url, :notice => 'Account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
  
  def upload
    uploaded_io = params[:account][:photo]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
  end
end
