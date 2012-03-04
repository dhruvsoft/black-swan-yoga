class YogaSessionsController < ApplicationController
  # GET /yoga_sessions
  # GET /yoga_sessions.json
  def index
    @today = Time.now.strftime("%A")
    if params[:all]
      @yoga_sessions = YogaSession.all
    elsif params[:day]
      @yoga_sessions = YogaSession.where(day: params[:day])
    else
      @yoga_sessions = YogaSession.where(day: Time.now.strftime("%A"))    
    end 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yoga_sessions }
    end
  end
  
  # GET /yoga_sessions/monday
  # GET /yoga_sessions/monday.json
  def day
    @today = params[:day].capitalize
    @yoga_sessions = YogaSession.where(day: @today)
    
    respond_to do |format|
      format.html render :show
      format.json { render json: @yoga_session }
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
    @yoga_session.start_time = Chronic.parse params[:yoga_session][:start_time]
    @yoga_session.end_time = Chronic.parse params[:yoga_session][:end_time]

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
