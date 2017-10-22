class AnswersController < ApplicationController

  before_action :set_answer
  def index
    @answers = @question.answers
  end
  def show
    
    @answer = @question.answers.find_by(id: params[:id])
    
  end
  def new
    @answer = Answer.new
  end


  def create
    @answer = @question.answers.create(answer_params)
    @answer.user_id = current_user.id

    if @answer.save 
      redirect_to @answer.question
    else 
      render 'new'
    end
  end

  def edit
    
    @answer = @question.answers.find_by(id: params[:id])
  end

  def update
    
    @answer = @question.answers.find_by(id: params[:id])
    @answer.update_attributes(answer_params)

    redirect_to @question
  end

  private 

  def answer_params
    params.require(:answer).permit(:question_id, :content, :user_id)
  end
  
  # before_action :set_answer is making specific answer_id found and be accessable in entire answer class. 

  def set_answer
    @question = Question.find(params[:question_id])
  end
end
