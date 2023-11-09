class UsersController < ApplicationController
  def index

    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index" })

  end

  def show
    # Parameters: {"path_username" => "anisa"}

    url_username = params.fetch("path_username")
    
    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

   # if @the_user == nil
    # redirect_to("/404")
   # else

    render({ :template => "user_templates/show" })
    
   # end
  end

  def create

    input_user = params.fetch("query_username")
   
    a_new_user = User.new
  
    a_new_user.username = input_user
  
    a_new_user.save
  
  
      #render({ :template => "photo_templates/create" })
  
      redirect_to("/users/" + a_new_user.username.to_s)
  
    end

    def update
      the_username = params.fetch("modify_id")
  
      matching_users = User.where({ :username => the_username })
  
      the_user = matching_users.at(0)
  
      input_user = params.fetch("query_username")
  
      the_user.username = input_user
  
      the_user.save
  
      #render({ :template => "photo_templates/update" })
      
      redirect_to("/users/" + the_user.username.to_s)
  
    end
end
