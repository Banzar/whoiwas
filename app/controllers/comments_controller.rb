class CommentsController < ApplicationController
	before_action :find_legacy
	before_action :find_comment, only: [:destroy, :edit, :update]
	before_action :comment_owner, only: [:destroy, :edit, :update]
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

	def destroy
		@comment.destroy
		redirect_to legacy_path(@legacy)
	end

	def edit
		
	end

	def update
		if @comment.update(comment_params)
			redirect_to legacy_path(@legacy)

		else
			render 'edit'
		end	
	end


	private
	def comment_params
		params[:comment].permit(:content)	
	end

	def find_legacy
		@legacy = Legacy.find(params[:legacy_id])
	end

	def find_comment
		@comment = @legacy.comments.find(params[:id])
	end

	def comment_owner
		unless current_user.id == @comment.user_id || current_user.try(:super?)
			flash[:notice] = "Must be comment owner to do this."
			redirect_to @legacy		
				end		
	end
end
