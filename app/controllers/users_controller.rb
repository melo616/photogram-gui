class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404" )
    else
      render({ :template => "user_templates/show"})
    end
  end

  def create
    u = User.new
    u.username = params.fetch("username")

    u.save
    
    redirect_to("/users/#{u.username}")
  end

  def update
    the_user = User.where({ :id => params.fetch("path_id")}).at(0)
    the_user.username = params.fetch("username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end
end
