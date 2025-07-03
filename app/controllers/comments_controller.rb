class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:update, :destroy, :like, :unlike]
  before_action :ensure_comment_owner, only: [:update, :destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("new_comment_form", partial: "comments/form", locals: { post: @post, comment: @comment })
        end
        format.html { redirect_to @post, alert: 'Error creating comment.' }
      end
    end
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("comment_#{@comment.id}_form", partial: "comments/edit_form", locals: { comment: @comment })
        end
        format.html { redirect_to @post, alert: 'Error updating comment.' }
      end
    end
  end

  def destroy
    @comment.soft_delete!
    
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post, notice: 'Comment was successfully deleted.' }
    end
  end

  def like
    @like = @comment.likes.build(user: current_user)
    
    if @like.save
      @comment.reload
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @post }
      end
    else
      respond_to do |format|
        format.turbo_stream { head :unprocessable_entity }
        format.html { redirect_to @post, alert: 'Error liking comment.' }
      end
    end
  end

  def unlike
    @like = @comment.likes.find_by(user: current_user)
    
    if @like
      @like.destroy
    end
    
    # Always reload the comment and return success
    @comment.reload
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def ensure_comment_owner
    unless @comment.user == current_user
      redirect_to @post, alert: 'You can only edit your own comments.'
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
