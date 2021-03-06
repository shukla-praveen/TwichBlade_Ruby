module TwichBlade
  #user can login
  class LoginInterface < UserInterface
    def display
      display_header("SignIn")
      take_user_input
      logged_in = User.new(@username, @password).login
      if logged_in == :ERROR
        connection_error
        display_index_page
      elsif logged_in == :FAILED
        unauthorized_user
      else
        authorized_user
      end
    end

    def unauthorized_user
      display_error_message
      display_index_page
    end

    def authorized_user
      response = User.new(@username, @password).get_user_info
      if response == :ERROR
        connection_error
        display_index_page
      else
        welcome_message(response)
        HomePageInterface.new.display(response)
      end
    end

    private
    def display_error_message
      puts "UserName or Password is incorrect. please try again"
    end

    def welcome_message(user_name)
      puts "Welcome #{user_name} !!! you are successfully signed in."
    end
  end
end
