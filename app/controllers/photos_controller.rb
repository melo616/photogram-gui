class PhotosController < ApplicationController
  def index
    render({ :template => "photo_templates/index"})
  end

  def show
    @the_photo = Photo.where({:id => params.fetch("path_id")}).at(0)
    render({ :template => "photo_templates/show" })
  end

  def destroy
    the_photo = Photo.where({ :id => params.fetch("path_id")}).at(0)
    the_photo.destroy
    redirect_to("/photos")
  end
end

