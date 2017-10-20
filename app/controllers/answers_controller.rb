class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)

    if @answer.save 
      redirect_to @answer.question
    else 
      render 'new'
    end
  end

  def edit
    @answer = @question.answers.find_by[id: params[:id]]
  end

  def update
    @answer.update(answer_params)

    redirect_to answer.question
  end

  private 

  def answer_params
    params.require(:answer).permit(:question_id, :content, :user_id)
  end

  def set_answer
     @answer = @question.answers.find_by[id: params[:id]]
  end
end
