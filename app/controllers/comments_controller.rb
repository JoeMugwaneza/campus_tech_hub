class CommentsController < ApplicationController
  before_action :load_commentable
  before_action :set_comment
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to [@question, @commentable], notice: "comment created"
    else
      render :new
    end
  end

private

  # def load_commentable
  #   resource, id = request.path.split('/')[1, 2]
  #   @commentable = resource.singularize.classify.constantize.find(id)
  # end

  def load_commentable
    klass = [Answer].detect {|c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def set_comment
    @question = Question.find(params[:question_id])
    @commentable = @question.answers.find(params[:answer_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    
  end
end
