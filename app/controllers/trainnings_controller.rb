class TrainningsController < ApplicationController
  # GET /trainnings
  # GET /trainnings.xml
  def index
    @trainnings = current_user.trainnings.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trainnings }
    end
  end

  # GET /trainnings/1
  # GET /trainnings/1.xml
  def show
    @trainning = Trainning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trainning }
    end
  end

  # GET /trainnings/new
  # GET /trainnings/new.xml
  def new
    @trainning = current_user.trainnings.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trainning }
    end
  end

  # GET /trainnings/1/edit
  def edit
    @trainning = Trainning.find(params[:id])
  end

  # POST /trainnings
  # POST /trainnings.xml
  def create
    @trainning = current_user.trainnings.new(params[:trainning])

    respond_to do |format|
      if @trainning.save
        session[:trainnings_size] = current_user.trainnings.size
        format.html { redirect_to(@trainning, :notice => 'Trainning was successfully created.') }
        format.xml  { render :xml => @trainning, :status => :created, :location => @trainning }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trainning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trainnings/1
  # PUT /trainnings/1.xml
  def update
    @trainning = Trainning.find(params[:id])

    respond_to do |format|
      if @trainning.update_attributes(params[:trainning])
        format.html { redirect_to(@trainning, :notice => 'Trainning was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trainning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trainnings/1
  # DELETE /trainnings/1.xml
  def destroy
    @trainning = Trainning.find(params[:id])
    @trainning.destroy
    session[:trainnings_size] = current_user.trainnings.size

    respond_to do |format|
      format.html { redirect_to(trainnings_url) }
      format.xml  { head :ok }
    end
  end
end
