class SectionsController < ApplicationController
    def create
        @course = Course.find(params[:course_id])
        @section = @course.sections.create(section_params)
        redirect_to course_path(@course)
    end

    def show
        @course = Course.find(params[:course_id])
        @section = @course.sections.find(params[:id])
        @graders = Grader.all
        puts @section.num_graders
    end

      # DELETE /courses/1 or /courses/1.json
    def destroy
        @course = Course.find(params[:course_id])
        @section = @course.sections.find(params[:id])
        @section.destroy
        redirect_to course_path(@course), status: 303
    end

    #         # GET /sections
    #     def index
    #         @pagy, @sections = pagy(Section.all)
    #     end

    #     # GET /courses/1 or /courses/1.json
    #     def show
    #         @course = Course.find(params[:id])
    #     end

    # GET /sections/new
    def new
        @course = Course.find(params[:course_id])
        @section = @course.sections.new
    end

    # GET /sections/1/edit
    def edit
        @course = Course.find(params[:course_id])
        @section = @course.sections.find(params[:id])
    end

    # PATCH/PUT /courses/1 or /courses/1.json
    def update
        @course = Course.find(params[:course_id])
        @section = @course.sections.find(params[:id])

        respond_to do |format|
            if @section.update(section_params)
                course_section_path(course_id: @section.course, id: @section.id)
            else
                render :edit, status: :unprocessable_entity
            end
        end
    end



    private
        def section_params
            params.require(:section).permit(:number, :mode, :status, :graders_needed, :num_graders, :start_time, :end_time)
        end
end
