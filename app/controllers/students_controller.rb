class StudentsController < ApplicationController
  def index
  end
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @sutdent.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def student_params
    params.require(:sutdent).permit(:name)
  end
end
