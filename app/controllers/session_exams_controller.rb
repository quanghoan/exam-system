class SessionExamsController < ApplicationController

  def index
  	@session_exams = SessionExam.all
  end

  def show
    @session_exam = SessionExam.find(params[:id])
    @users = @session_exam.users
    @exam = @session_exam.exam
  end

  def new
  	@session_exam = SessionExam.new
    @exams = Exam.all
  end

  def edit
    @session_exam = SessionExam.find(params[:id])
    @exams = Exam.all
  end

  def create
    @session_exam = SessionExam.new(session_exam_params)
    @exams = Exam.all
    if @session_exam.save
      flash[:notice] = "Session created successfully"
      redirect_to session_exam_path(@session_exam)
    else
      flash[:notice] = "failed"
      redirect_to session_exams_path
    end
  end

  def update
    @session_exam = SessionExam.find(params[:id])
    if @session_exam.update_attributes(session_exam_params)
      flash[:notice] = "Session updated successfully."
      redirect_to session_exam_path(@session_exam)
    else
      render 'new'
    end
  end

  def destroy
    @session_exam = SessionExam.find(params[:id])
    @session_exam.destroy
    flash[:notice] = "Session destroyed "
    redirect_to session_exams_path
  end

  private

  def session_exam_params
    params.require(:session_exam).permit(:name, :exam_id)
  end
end
