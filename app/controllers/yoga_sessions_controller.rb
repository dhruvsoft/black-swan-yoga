class YogaSessionsController < ApplicationController
  # GET /yoga_sessions
  # GET /yoga_sessions.json
  def index
    if params[:all]
      @today = Time.now.strftime("%A")
      @yoga_sessions = YogaSession.all.order(:start_time)
    elsif params[:day]
      @today = params[:day].capitalize
      @yoga_sessions = YogaSession.where(day: params[:day].capitalize).order(:start_time)
    else
      @today = "Today"
      @yoga_sessions = YogaSession.where(day: Time.now.strftime("%A")).order(:start_time)
      @yoga_sessions.select! {|s| Time.now.strftime("%H") <= s.start_time.strftime("%H") } 
    end 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yoga_sessions }
    end
  end
  
  # GET /schedule/monday
  # GET /schedule/monday.json
  def day
    @yoga_sessions = YogaSession.where(day: params[:day].capitalize)
    
    respond_to do |format|
      format.html render :index
      format.json { render json: @yoga_sessions }
    end
  end 

  # GET /yoga_sessions/1
  # GET /yoga_sessions/1.json
  def show
    @yoga_session = YogaSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yoga_session }
    end
  end

  # GET /yoga_sessions/new
  # GET /yoga_sessions/new.json
  def new
    @yoga_session = YogaSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yoga_session }
    end
  end

  # GET /yoga_sessions/1/edit
  def edit
    @yoga_session = YogaSession.find(params[:id])
  end

  # POST /yoga_sessions
  # POST /yoga_sessions.json
  def create
    @yoga_session = YogaSession.new(params[:yoga_session])

    respond_to do |format|
      if @yoga_session.save
        format.html { redirect_to @yoga_session, notice: 'Yoga session was successfully created.' }
        format.json { render json: @yoga_session, status: :created, location: @yoga_session }
      else
        format.html { render action: "new" }
        format.json { render json: @yoga_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yoga_sessions/1
  # PUT /yoga_sessions/1.json
  def update
    @yoga_session = YogaSession.find(params[:id])

    respond_to do |format|
      if @yoga_session.update_attributes(params[:yoga_session])
        format.html { redirect_to @yoga_session, notice: 'Yoga session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yoga_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yoga_sessions/1
  # DELETE /yoga_sessions/1.json
  def destroy
    @yoga_session = YogaSession.find(params[:id])
    @yoga_session.destroy

    respond_to do |format|
      format.html { redirect_to yoga_sessions_url }
      format.json { head :no_content }
    end
  end
end
