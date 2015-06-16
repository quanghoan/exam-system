class AnswerSheetsController < ApplicationController  
  
  def show
    @answer_sheet = AnswerSheet.find(params[:id])
    # @session_exam = SessionExam.find(params[:session_exam_id]) 

  end

  def new
    @answer_sheet = AnswerSheet.new  
    @session_exam = SessionExam.find(params[:session_exam_id]) 
    # @user = User.find(params[:user_id])
    @exam = @session_exam.exam   
  end

  def create   
    @answer_sheet = AnswerSheet.new
    # @user = User.find(params[:user_id])
    # @answer_sheet.user_id = params[:user_id]
    # @answer_sheet.user_session_exam_id = params[:user_session_exam_id] 
    @session_exam = SessionExam.find(params[:session_exam_id])
    @answer =params[:answer]
    # @question = params[:question]
    # binding.pry
    if @answer_sheet.save
      flash[:success] = 'successfully submitted.'
      # redirect_to answer_sheet_path(@answer_sheet)
    else
      flash[:danger] = 'failed.'
      # redirect_to answer_sheet_path(@answer_sheet)
    end
  end

  # private

  # def answer_sheet_params
  #   params.require(:answer_sheet).permit(:user_id, :session_exam_id, :user_session_exam_id )
  # end
end