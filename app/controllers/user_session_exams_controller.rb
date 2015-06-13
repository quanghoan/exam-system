class UserSessionExamsController < ApplicationController

	def show  
		@user = User.all 
		@session_exam = SessionExam.find(params[:id])
	end
 
	def update
		@session_exam = SessionExam.find(params[:id])
		if @session_exam.update_attributes(user_session_exam_params)
			flash[:notice] = "Updated successfully"
			redirect_to session_exam_path(@session_exam)
		else
			flash[:notice] = "updated failed"
			redirect_to session_exam(@session_exam)
		end
	end

	private

	def user_session_exam_params
		params.require(:session_exam).permit(user_ids: [])
	end
end
