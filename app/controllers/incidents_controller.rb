class IncidentsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /incidents
  def index
    if params[:tag].present?
      @incidents = current_user.incidents.tagged_with(params[:tag]).order("date_incident DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @incidents = current_user.incidents.order("date_incident DESC").paginate(:page => params[:page], :per_page => 10)
    end
    
    @tags = current_user.incidents.tag_counts

    respond_to do |format|
      format.html # index.html.erb
      format.pdf do
        html = render_to_string(:layout => "pdf", :action => "pdf/incidents.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css" 
        send_data kit.to_pdf, :filename =>  "qs_diario.pdf", 
                              :type => 'application/pdf',
                              disposition: "inline"
      end
    end
  end

  # GET /incidents/new
  def new
    @incident = current_user.incidents.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /incidents/1/edit
  def edit
    @incident = current_user.incidents.find(params[:id])
  end

  # POST /incidents
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
  def update
    @incident = current_user.incidents.find(params[:id])

    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html { redirect_to(incidents_url, :notice => 'Incident was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /incidents/1
  def destroy
    @incident = current_user.incidents.find(params[:id])
    @incident.destroy
    session[:incidents_size] = current_user.incidents.size  # Update incidents size
        
    respond_to do |format|
      format.html { redirect_to(incidents_url) }
    end
  end

  def tagged
    if params[:tag].present?
      
    else
      @incidents = current_user.incidents.order("date_incident DESC").paginate(:page => params[:page], :per_page => 10)
    end
  end
end
