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

    # if @the_user == nil
    #   redirect_to("/404" )
    # else
    #   render({ :templates => "user_templates/show"})
    # end
    render({ :template => "user_templates/show" })
  end

  def insert_new_user
    u = User.new
    u.username = params.fetch("username")

    u.save
    
    redirect_to("/users")
  end
end
