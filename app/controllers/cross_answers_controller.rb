class CrossAnswersController < ApplicationController
  def index
    @lessons = Lesson.all
    @students = Student.all
    @cross_answer = CrossAnswer.new
  end
  def new
  end
  def create
    @cross_answer = CrossAnswer.new(cross_answer_params)
    if @cross_answer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def cross_answer_params
    params.require(:cross_answer).permit(:lesson_id, :student_id, :writting, :mark)
  end
end
