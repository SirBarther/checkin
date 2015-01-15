module Admin
  class StudentsController < ApplicationController
  	before_filter :authenticate_user!
    before_filter do
      if !current_user
        flash[:error] = "You are not authorized to view that page"
        render "dashboards/index"
      end
    end

    def index
      @students = Student.all
    end

    def new
      @new_student = Student.new
    end

    def create
      @new_student = Student.new(student_params)
      if @new_student.save
        flash[:notice] = "A new student has been created"
        redirect_to root_path
      else
        flash[:notice] = "There was an error with your request"
        render "admin/students/new"
      end
    end

    def destroy
      student = Student.find(params[:id])
      if student.destroy
        flash[:notice] = "Successfully deleted #{student.f_name}"
        redirect_to admin_students_path
      else
        render "index"
      end
    end

    private

    def student_params
      params.require(:student).
      permit(
        :f_name,
        :l_name,
        :tag,
        )
    end
  end
end