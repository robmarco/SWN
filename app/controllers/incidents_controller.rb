class IncidentsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /incidents
  # GET /incidents.xml
  def index
    @incidents = current_user.incidents.order("date_incident DESC").paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incidents }
    end
  end

  # GET /incidents/new
  # GET /incidents/new.xml
  def new
    @incident = current_user.incidents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident }
    end
  end

  # GET /incidents/1/edit
  def edit
    @incident = current_user.incidents.find(params[:id])
  end

  # POST /incidents
  # POST /incidents.xml
  def create
    @incident = current_user.incidents.new(params[:incident])

    respond_to do |format|
      if @incident.save
        session[:incidents_size] = current_user.incidents.size  # Update incidents size
                
        format.html { redirect_to(incidents_url, :notice => 'Incident was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /incidents/1
  # PUT /incidents/1.xml
  def update
    @incident = current_user.incidents.find(params[:id])

    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html { redirect_to(incidents_url, :notice => 'Incident was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.xml
  def destroy
    @incident = current_user.incidents.find(params[:id])
    @incident.destroy
    session[:incidents_size] = current_user.incidents.size  # Update incidents size
        
    respond_to do |format|
      format.html { redirect_to(incidents_url) }
      format.xml  { head :ok }
    end
  end
end
