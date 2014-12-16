class YogaSessionsController < ApplicationController
  before_action :set_yoga_session, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: [:create, :edit, :update, :destroy]

  # GET /yoga_sessions/schedule
  def schedule
    @yoga_sessions = YogaSession.where(session_date: Date.today..1.week.from_now).order(:session_date)
  end
  
  # GET /yoga_sessions
  # GET /yoga_sessions.json
  def index
    @yoga_sessions = YogaSession.all
  end

  # GET /yoga_sessions/1
  # GET /yoga_sessions/1.json
  def show
  end

  # GET /yoga_sessions/new
  def new
    @yoga_session = YogaSession.new
  end

  # GET /yoga_sessions/1/edit
  def edit
  end

  # POST /yoga_sessions
  # POST /yoga_sessions.json
  def create
    @yoga_session = YogaSession.new(yoga_session_params)

    respond_to do |format|
      if @yoga_session.save
        format.html { redirect_to @yoga_session, notice: 'Yoga session was successfully created.' }
        format.json { render :show, status: :created, location: @yoga_session }
      else
        format.html { render :new }
        format.json { render json: @yoga_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yoga_sessions/1
  # PATCH/PUT /yoga_sessions/1.json
  def update
    respond_to do |format|
      if @yoga_session.update(yoga_session_params)
        format.html { redirect_to @yoga_session, notice: 'Yoga session was successfully updated.' }
        format.json { render :show, status: :ok, location: @yoga_session }
      else
        format.html { render :edit }
        format.json { render json: @yoga_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yoga_sessions/1
  # DELETE /yoga_sessions/1.json
  def destroy
    @yoga_session.destroy
    respond_to do |format|
      format.html { redirect_to yoga_sessions_url, notice: 'Yoga session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yoga_session
      @yoga_session = YogaSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yoga_session_params
      params.require(:yoga_session).permit(:session_date, :session_time, :yoga_class_id)
    end
end
