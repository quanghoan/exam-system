class ExamQuestionsController < ApplicationController

  def show
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update_attributes(exam_question_params)
      flash[:notice] = "Exam has been updated"
      redirect_to exam_path
    else
      flash[:notice] = "Can't add questions to exam."
      redirect_to exam_path
    end
	end

  private
  def exam_question_params
    params.require(:exam).permit(question_ids: [])
  end
end