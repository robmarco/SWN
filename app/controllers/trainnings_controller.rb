class TrainningsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /trainnings
  # GET /trainnings.xml
  def index
    @trainnings = current_user.trainnings.order(:date_trainning)
    @last_trainning = current_user.trainnings.last
    
    #@last_12_trainnings = current_user.trainnings.where('date_trainning < ?', current_user.trainnings.maximum("date_trainning")+1).limit(12).reverse_order
    #@last_12_trainnings = @trainnings.take_while {|i| i.date_trainning < (@trainnings.last.date_trainning)+1}.last(12)
    @last_12_trainnings = @trainnings.last(12).map(&:date_trainning).uniq
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trainnings }
    end
  end

  # GET /trainnings/1
  # GET /trainnings/1.xml
  def show
    @trainning = current_user.trainnings.find(params[:id])
    @trainning_exercises = @trainning.trainning_exercises

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trainning }
    end
  end

  # GET /trainnings/new
  # GET /trainnings/new.xml
  def new
    @trainning = current_user.trainnings.new
    
    # Exercise built when try to add a new trainning session
    @trainning_exercise = @trainning.trainning_exercises.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trainning }
    end
  end

  # GET /trainnings/1/edit
  def edit
    @trainning = current_user.trainnings.find(params[:id])
  end

  # POST /trainnings
  # POST /trainnings.xml
  def create
    @trainning = current_user.trainnings.new(params[:trainning])

    respond_to do |format|
      if @trainning.save
        session[:trainnings_size] = current_user.trainnings.size
        
        # Add trainning to recent_activities
        current_user.recent_activities.create!( :action => "create", :assoc_class => "Trainning", 
                                            :assoc_id => @trainning.id,
                                            :description => "Entrenamiento micro #{@trainning.micro} / macro #{@trainning.macro}")
        
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
    @trainning = current_user.trainnings.find(params[:id])

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
    @trainning = current_user.trainnings.find(params[:id])
    @trainning.destroy
    session[:trainnings_size] = current_user.trainnings.size

    # Add swimmer to recent_activities
    current_user.recent_activities.create!( :action => "destroy", :assoc_class => "Trainning", 
                                        :assoc_id => @trainning.id, 
                                        :description => "Entrenamiento micro #{@trainning.micro} / macro #{@trainning.macro}")
    
    respond_to do |format|
      format.html { redirect_to(trainnings_url) }
      format.xml  { head :ok }
    end
  end
end
