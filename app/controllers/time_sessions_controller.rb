class TimeSessionsController < ApplicationController
	def create
		@time_session = TimeSession.new(time_session_params)
		if @time_session.save
			flash[:notice] = "Exam running..."
			redirect_to new_answer_sheet_path(time_session_id: @time_session.id)
		else
			flash[:notice] = "Exam can't run."
			redirect_to user_path(current_user)
		end
	end

	private

	def time_session_params
		params.require(:time_session).permit(:start_time, :end_time, :user_session_exam_id)
	end
end
