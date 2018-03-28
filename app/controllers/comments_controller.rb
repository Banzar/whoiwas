class CommentsController < ApplicationController
	before_action :find_legacy
	def create
		@comment = @legacy.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.save

		if @comment.save
			redirect_to legacy_path(@legacy)
		else
			render 'new'
		end
	end


	private

	def find_legacy
		@legacy = Legacy.find(params[:legacy_id])
	end
end
