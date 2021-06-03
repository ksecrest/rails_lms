class CoursesController < ApplicationController

    before_action :set_course, only: [:show, :edit, :update, :destroy]
    
    def index
    @courses = Course.all
    render component: 'Courses', props: {courses: @courses}
    end

    def show
        render component: 'Course', props: { course: @course}
      end
    end

    def new
      @course = Course.new
      render component: 'CourseNew', props: {course: @course }
    end

    def edit
      render component: 'CourseEdit', props: {course: @course }
    end

    def create
      @course = Course.new(course_params)
      if @course.save
        redirect_to @course
      else 
        render component: 'CourseNew', props: { course: @course }
      end
    end

    def update
      if @course.update(course_params)
        redirect_to @course
      else
        render component: "CourseEdit", props: {course: @course }
      end
    end

    def destroy
      @course.destroy
      redirect_to root_path
    end

    private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit( :name )
    end

end











end
