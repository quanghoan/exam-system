class ExamsController < ApplicationController
  # before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
    @question = @exam.questions
    @session_exam = @exam.session_exams
  end

  def new
    @exam = Exam.new
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def create
    @exam = Exam.new(exam_params)
      if @exam.save
        redirect_to exams_path, notice: 'Exam was successfully created.' 
      else
        render :new, notice: 'Exam was not created.'
      end
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update_attributes(exam_params)
      redirect_to exams_path, notice: 'Exam was successfully updated.'
    else
      render :edit, notice: 'Failed.'
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_url, notice: 'Exam was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_exam
    #   @exam = Exam.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name)
    end
end
