class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def age
    unless birthdate.nil?
        years = Date.today.year- birthdate.year
        if Date.today.month < birthdate.month
            years = years + 1
        end
        if (Date.today.month == birthdate.month &&
            Date.today.day < birthdate.day)
            years = years -1
        end
        return years
    end
    
end
  
end
