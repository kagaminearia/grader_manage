class GradersController < ApplicationController
  before_action :set_grader, only: %i[ show edit update destroy ]

  JSON_REQUEST = 'https://content.osu.edu/v2/classes/search?q=cse&campus=col&p=1&term=1222'

  # GET /graders or /graders.json
  def index
    @graders = Grader.all
  end

  # GET /graders/1 or /graders/1.json
  def show
  end

  # GET /graders/new
  def new
    @grader = Grader.new
    @courses = Course.all
  end

  # GET /graders/1/edit
  def edit
    @courses = Course.all
  end

  # POST /graders or /graders.json
  def create
    # @user = User.find(params[:current_user.id)
    @user = User.find(current_user.id)
    # @user = User.find_by(email: 'Lifo')
    # @grader = @user.grader.create(grader_params)
    @grader = @user.create_grader(grader_params)
    # current_user.grader = Grader.new({})
    # @grader = Grader.new(grader_params)
    @courses = Course.all

    respond_to do |format|
      if @grader.save
        format.html { redirect_to grader_url(@grader), notice: "Grader was successfully created." }
        format.json { render :show, status: :created, location: @grader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grader.errors, status: :unprocessable_entity }
      end
    end
  end

  # def create
  #   @recommendation = Recommendation.find(params[:recommendation_id])
  #   # @grader = @recommendation.grader.create(grader_params)
  #   @grader = Grader.new(grader_params)

  #   respond_to do |format|
  #     if @grader.save
  #       format.html { redirect_to grader_url(@grader), notice: "Grader was successfully created." }
  #       format.json { render :show, status: :created, location: @grader }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @grader.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /graders/1 or /graders/1.json
  def update
    # assign grader and increment section assignee count
    if params[:grader] && params[:grader].length == 1
      @grader.section_id = params[:grader][0]
      @grader.save
      @section = Section.find(@grader.section_id)
      @section.num_graders += 1
      @section.save
      grader_path(@grader)
    else
      respond_to do |format|
        if @grader.update(grader_params)
          format.html { redirect_to grader_url(@grader), notice: "Grader was successfully updated." }
          format.json { render :show, status: :ok, location: @grader }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @grader.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /graders/1 or /graders/1.json
  def destroy
    @grader.destroy

    respond_to do |format|
      format.html { redirect_to graders_url, notice: "Grader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grader
      @grader = Grader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grader_params
      params.require(:grader).permit(:first_name, :last_name, :email, classes: [], available_times: [])
    end
end
