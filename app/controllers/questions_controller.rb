class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers
  end

  def new
    @question = Question.new
    4.times {@question.answers.build}
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
      if @question.save
       redirect_to questions_path, notice: 'Question was successfully created.' 
      else
        redirect_to new_question_path, notice: 'Question was not created'
      end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated'
    else
      render :edit 
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, answers_attributes: [:id, :content, :is_correct])
    end
end

