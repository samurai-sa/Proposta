class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(resource)
        posts_path
    end
  
    def after_update_path_for(resource)
        posts_path
    end
end
