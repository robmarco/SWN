class CompetitionsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /competitions
  def index
    @competitions = current_user.competitions.order("date_competition DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.pdf do      
        html = render_to_string(:layout => "pdf", :action => "pdf/competitions.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css" 
        send_data kit.to_pdf, :filename =>  "qs_competiciones.pdf", 
                              :type => 'application/pdf',
                              disposition: "inline"
      end
    end
  end

  # GET /competitions/1
  def show
    @competition = current_user.competitions.find(params[:id])
    @competition_results = @competition.competition_results.joins(:swimmer).order("secname ASC, name ASC")
    
    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        html = render_to_string(:layout => "pdf", :action => "pdf/competition.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css" 
        send_data kit.to_pdf, :filename =>  "qs_competicion_#{@competition.id}.pdf", 
                              :type => 'application/pdf',
                              disposition: "inline"
      end
    end
  end

  # GET /competitions/new
  def new
    @competition = current_user.competitions.new
    @categories = Category.all
    @competition_sets = CompetitionSet.all
    
    # Result built when try to add a new competition
    @competition_result = @competition.competition_results.build    

    respond_to do |format|
      format.html # new.html.erb
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
  def create
    @competition = current_user.competitions.new(params[:competition])    
    @categories = Category.all
    @competition_sets = CompetitionSet.all

    respond_to do |format|
      if @competition.save
        session[:competitions_size] = current_user.competitions.size  # Update competitions size
        
        format.html { redirect_to(@competition, :notice => t('controllers.successfully_created', :model => Competition.model_name.human) ) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /competitions/1
  def update
    @competition = current_user.competitions.find(params[:id])
    @competition_sets = CompetitionSet.all 
    
    #Array de Categorías ordenado con el seleccionado primero
    @categories = []
    Category.all.each {|c| c.name==@competition.category ? @aux=c : @categories << c }
    @categories.insert(0,@aux)
    
    respond_to do |format|
      if @competition.update_attributes(params[:competition]) and @competition.errors.blank?
        format.html { redirect_to(@competition, :notice => t('controllers.successfully_updated', :model => Competition.model_name.human) ) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /competitions/1
  def destroy
    @competition = current_user.competitions.find(params[:id])
    @competition.destroy
    session[:competitions_size] = current_user.competitions.size  # Update competitions size
        
    respond_to do |format|
      format.html { redirect_to(competitions_url) }
    end
  end
end
