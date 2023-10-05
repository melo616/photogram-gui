class CommentsController < ApplicationController
  def create
    new_comment = Comment.new

    new_comment.photo_id = params.fetch("photo_id")
    new_comment.author_id = params.fetch("author_id")
    new_comment.body = params.fetch("body")

    new_comment.save
    redirect_to("/photos/#{new_comment.photo_id}")
  end
end
