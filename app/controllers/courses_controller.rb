include Pagy::Backend

class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :load_courses, only: [ :index, :show, :new ]

  JSON_REQUEST = 'https://content.osu.edu/v2/classes/search?q=cse&campus=col&p=1&term=1222&academic-career=ugrd&subject=cse'

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    @course = Course.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # reload the external api
  def reload_courses
    Course.destroy_all
    redirect_to courses_path
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy

    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:subject, :catalognumber, :sections, :coursetitle, :coursedescription, :campus, :day, :time, :instructors)
    end

  def load_courses() 
    if (Course.all.length > 0) 
      puts 'courses already loaded'
      return   
    else 
      puts 'loading course...'
      get_courses_from_api()
    end
  end

  # use httparty to access external api
  def get_courses_from_api() 
    @courses = HTTParty.get(JSON_REQUEST)['data']['courses']

    # fill the course data
    @courses.each do |course|
      sections = course['sections']

      if (course['course']['academicCareer'] == "Undergraduate") 
        puts "this course is " + course['course']['academicCareer']
        params = {
          :subject => course['course']['subject'],
          :catalognumber => course['course']['catalogNumber'],
          :coursetitle => course['course']['title'],
          :coursedescription => course['course']['description'],
          :campus => course['course']['campus'],
        }
      
        new_course = Course.create(params)

        sections.each do |section|
          meetings = section["meetings"]
          section_params = { 
            :number => section["section"], 
            :mode => section["instructionMode"], 
            :status => section["enrollmentStatus"],
            :start_time => meetings.first["startTime"],
            :end_time => meetings.first["endTime"]
          }
          new_course.sections.create(section_params)
        end
        new_course.save
      end

    end
  end
end

