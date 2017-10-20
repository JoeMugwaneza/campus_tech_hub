class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    find_question
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save

      redirect_to @question
    else
      render :new
    end
  end

  def edit
    find_question
  end

  def update
    @question = Question.find_by(id: params[:id])
    @question.update_attributes(question_params)

    if @question.save
      redirect_to @question
    else 
      render "edit"
    end
  end

  private

  def question_params
    params.require(:question).permit(:subject_line, :description, :user_id)
    
  end

  def find_question
    @question = Question.find_by(id: params[:id])
  end

end
