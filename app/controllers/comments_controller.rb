class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash.now[:notice] = "コメントの投稿に成功しました。"
      render :index
    else
      flash.now[:alert] ="コメントの投稿に失敗しました。"
      render :index
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    flash.now[:notice] = "コメントを削除しました。"
    @comments = @comment.article.comments 
      respond_to do |format|
      format.html { redirect_to article_path(@comment.article_id), notice: "コメントを削除しました。" }
      format.js { render 'index' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
