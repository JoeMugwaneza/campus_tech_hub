class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order('created_at DESC')
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

    if @question.update_attributes(question_params)
      redirect_to @question
    else 
      render "edit"
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy

    redirect_to root_path
  end 

  private

  def question_params
    params.require(:question).permit(:subject_line, :description, :user_id)
    
  end

  def find_question
    @question = Question.find_by(id: params[:id])
  end

end
