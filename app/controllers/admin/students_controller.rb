module Admin
  class StudentsController < ApplicationController
    before_filter :authenticate_user!
    def show
      @student = Student.find(params[:id])
    end

    def update
      @student = Student.find(params[:id])
      if @student.update_attributes(student_params)
        flash[:notice] = "Student updated"
        redirect_to admin_students_path
      else
        flash[:notice] = "There was an error with your request"
        render admin_student_path
      end
    end

    def index
      @students = Student.all.page params[:page]
      if params[:search]
        @searched_students =
        Student.search(params[:search]).order("created_at DESC").page params[:page]
      else
        @searched_students =
        Student.order("created_at DESC").page params[:page]
      end
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


