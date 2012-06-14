class SwimmersController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /swimmers
  # GET /swimmers.xml
  def index
    @swimmers = current_user.swimmers.all
    
    # Nadadores filtrados por estado para los render del index
<<<<<<< HEAD
    @swimmers_fed = current_user.swimmers.federado
    @swimmers_nofed = current_user.swimmers.no_federado
    @swimmers_baja = current_user.swimmers.baja
=======
    @swimmers_fed = current_user.swimmers.where("state='Federado'")
    @swimmers_nofed = current_user.swimmers.where("state='No Federado'")
    @swimmers_baja = current_user.swimmers.where("state='Baja'")
>>>>>>> origin/master

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @swimmers }
    end
  end

  # GET /swimmers/1
  # GET /swimmers/1.xml
  def show
    @swimmer = current_user.swimmers.find(params[:id])
<<<<<<< HEAD
    @swimmer_competition_results = @swimmer.competition_results
    @swimmer_trial_results = @swimmer.trial_results
=======
>>>>>>> origin/master

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @swimmer }
    end
  end

  # GET /swimmers/new
  # GET /swimmers/new.xml
  def new
    @swimmer = current_user.swimmers.new
    
    @categories = Category.all
    @states = State.all
    @countries = Country.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @swimmer }
    end
  end

  # GET /swimmers/1/edit
  def edit
    @swimmer = current_user.swimmers.find(params[:id])
    
    #Array de Categorías ordenado con el seleccionado primero
    @categories = []
    Category.all.each {|c| c.name==@swimmer.category ? @aux=c : @categories << c }
    @categories.insert(0,@aux)
    
    #Array de Estado ordenado con el seleccionado primero
    @states = []
    State.all.each {|s| s.name==@swimmer.state ? @aux=s : @states << s}
    @states.insert(0,@aux)
    
    #Array de Estado ordenado con el seleccionado primero
    @countries = []
    Country.all.each {|s| s.name==@swimmer.country ? @aux=s : @countries << s}
    @countries.insert(0,@aux)
    
  end

  # POST /swimmers
  # POST /swimmers.xml
  def create
    @swimmer = current_user.swimmers.new(params[:swimmer])
    
    @categories = Category.all
    @states = State.all
    @countries = Country.all
    
    respond_to do |format|
      if @swimmer.save
        session[:swimmers_size] = current_user.swimmers.size

        format.html { redirect_to(@swimmer, :notice => 'Swimmer was successfully created.') }
        format.xml  { render :xml => @swimmer, :status => :created, :location => @swimmer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @swimmer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /swimmers/1
  # PUT /swimmers/1.xml
  def update
    @swimmer = current_user.swimmers.find(params[:id])
    
    #Array de Categorías ordenado con el seleccionado primero
    @categories = []
    Category.all.each {|c| c.name==@swimmer.category ? @aux=c : @categories << c }
    @categories.insert(0,@aux)
    
    #Array de Estado ordenado con el seleccionado primero
    @states = []
    State.all.each {|s| s.name==@swimmer.state ? @aux=s : @states << s}
    @states.insert(0,@aux)
    
    #Array de Estado ordenado con el seleccionado primero
    @countries = []
    Country.all.each {|s| s.name==@swimmer.country ? @aux=s : @countries << s}
    @countries.insert(0,@aux)
    
    respond_to do |format|
      if @swimmer.update_attributes(params[:swimmer])
        format.html { redirect_to(@swimmer, :notice => 'Swimmer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @swimmer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /swimmers/1
  # DELETE /swimmers/1.xml
  def destroy
    @swimmer = current_user.swimmers.find(params[:id])
    @swimmer.destroy
    session[:swimmers_size] = current_user.swimmers.size
                                        
    respond_to do |format|
      format.html { redirect_to(swimmers_url) }
      format.xml  { head :ok }
    end
  end
end
