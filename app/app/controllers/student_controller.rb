class StudentController < ApplicationController
  def index
  end

  def create
    @student = Student.new(student_params)
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def student_params
    params.require(:name,:major,:rank)
  end
end
