class CompetitionsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /competitions
  # GET /competitions.xml
  def index
    @competitions = current_user.competitions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @competitions }
    end
  end

  # GET /competitions/1
  # GET /competitions/1.xml
  def show
    @competition = current_user.competitions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @competition }
    end
  end

  # GET /competitions/new
  # GET /competitions/new.xml
  def new
    @competition = current_user.competitions.new
    @categories = Category.all
    @competition_sets = CompetitionSet.all
    
    # Result built when try to add a new competition
    @competition_result = @competition.competition_results.build    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @competition }
    end
  end

  # GET /competitions/1/edit
  def edit
    @competition = current_user.competitions.find(params[:id])
    
    #Array de Categorías ordenado con el seleccionado primero
    @categories = []
    Category.all.each {|c| c.name==@competition.category ? @aux=c : @categories << c }
    @categories.insert(0,@aux)
    
    @competition_sets = CompetitionSet.all    
  end

  # POST /competitions
  # POST /competitions.xml
  def create
    @competition = current_user.competitions.new(params[:competition])    
    @categories = Category.all
    @competition_sets = CompetitionSet.all

    respond_to do |format|
      if @competition.save
        session[:competitions_size] = current_user.competitions.size  # Update competitions size
        
        # Add competition to recent_activities
        current_user.recent_activities.create!( :action => "create", :assoc_class => "Competition", 
                                            :assoc_id => @competition.id, :date_activity => @competition.date_competition)
        
        format.html { redirect_to(@competition, :notice => 'Competition was successfully created.') }
        format.xml  { render :xml => @competition, :status => :created, :location => @competition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @competition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /competitions/1
  # PUT /competitions/1.xml
  def update
    @competition = current_user.competitions.find(params[:id])
    @competition_sets = CompetitionSet.all 
    
    #Array de Categorías ordenado con el seleccionado primero
    @categories = []
    Category.all.each {|c| c.name==@competition.category ? @aux=c : @categories << c }
    @categories.insert(0,@aux)
    
    respond_to do |format|
      if @competition.update_attributes(params[:competition]) and @competition.errors.blank?
        format.html { redirect_to(@competition, :notice => 'Competition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @competition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.xml
  def destroy
    @competition = current_user.competitions.find(params[:id])
    @competition.destroy
    session[:competitions_size] = current_user.competitions.size  # Update competitions size
    
    # Add competition to recent_activities
    current_user.recent_activities.create!( :action => "destroy", :assoc_class => "Competition", 
                                        :assoc_id => @competition.id, :date_activity => @competition.date_competition)
    
    respond_to do |format|
      format.html { redirect_to(competitions_url) }
      format.xml  { head :ok }
    end
  end
end
