class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate]

  def index
    @students = Student.all
  end

  def show
    @student_active_message = set_student.active ? "This student is currently active." : "This student is currently inactive."
  end

  def activate
    set_student.active ? set_student.update(active: false) : set_student.update(active: true)
    redirect_to student_path(set_student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
