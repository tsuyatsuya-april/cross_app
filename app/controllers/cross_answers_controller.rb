class CrossAnswersController < ApplicationController
  def index
    @lessons = Lesson.all
    @students = Student.all
    @cross_answers = CrossAnswer.all
    if params[:lesson_id] && params[:student_id]
      set_cross_answer
    else
    @cross_answer = CrossAnswer.new
    end

  end
  def create
    @cross_answer = CrossAnswer.new(cross_answer_params)
    if @cross_answer.save
      redirect_to root_path
    else
      render :index
    end
  end

  def update
    @cross_answer = CrossAnswer.find(params[:id])
    if @cross_answer.update(cross_answer_params)
      redirect_to cross_answers_path
    end
  end

  private
  def cross_answer_params
    params.require(:cross_answer).permit(:lesson_id, :student_id, :writing, :mark)
  end

  def set_cross_answer
    @cross_answer = CrossAnswer.find_by(lesson_id: params[:lesson_id], student_id: params[:student_id])
  end

end
