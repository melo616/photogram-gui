class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc})
    render({ :template => "photo_templates/index"})
  end

  def show
    @the_photo = Photo.where({:id => params.fetch("path_id")}).at(0)
    render({ :template => "photo_templates/show" })
  end

  def create
    new_photo = Photo.new

    new_photo.image = params.fetch("image_url")
    new_photo.caption = params.fetch("caption")
    new_photo.owner_id = params.fetch("owner_id")

    new_photo.save
    redirect_to("/photos/#{new_photo.id}")
  end
  
  def update
    the_photo = Photo.where({ :id => params.fetch("path_id" )}).at(0)
    the_photo.image = params.fetch("image_url")
    the_photo.caption = params.fetch("caption")

    the_photo.save
    redirect_to("/photos/#{the_photo.id}")
  end

  def destroy
    the_photo = Photo.where({ :id => params.fetch("path_id")}).at(0)
    the_photo.destroy
    redirect_to("/photos")
  end
end
