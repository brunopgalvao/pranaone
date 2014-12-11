class YogaClassesController < ApplicationController
  before_action :set_yoga_class, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: [:create, :edit, :update, :destroy]

  # GET /yoga_classes
  # GET /yoga_classes.json
  def index
    @yoga_classes = YogaClass.all
  end

  # GET /yoga_classes/1
  # GET /yoga_classes/1.json
  def show
  end

  # GET /yoga_classes/new
  def new
    @yoga_class = YogaClass.new
  end

  # GET /yoga_classes/1/edit
  def edit
  end

  # POST /yoga_classes
  # POST /yoga_classes.json
  def create
    @yoga_class = YogaClass.new(yoga_class_params)

    respond_to do |format|
      if @yoga_class.save
        format.html { redirect_to @yoga_class, notice: 'Yoga class was successfully created.' }
        format.json { render :show, status: :created, location: @yoga_class }
      else
        format.html { render :new }
        format.json { render json: @yoga_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yoga_classes/1
  # PATCH/PUT /yoga_classes/1.json
  def update
    respond_to do |format|
      if @yoga_class.update(yoga_class_params)
        format.html { redirect_to @yoga_class, notice: 'Yoga class was successfully updated.' }
        format.json { render :show, status: :ok, location: @yoga_class }
      else
        format.html { render :edit }
        format.json { render json: @yoga_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yoga_classes/1
  # DELETE /yoga_classes/1.json
  def destroy
    @yoga_class.destroy
    respond_to do |format|
      format.html { redirect_to yoga_classes_url, notice: 'Yoga class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yoga_class
      @yoga_class = YogaClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yoga_class_params
      params.require(:yoga_class).permit(:name, :description, :user_id)
    end
end
