module SessionHelper

    def self.is_guest?
        @user.email == nil
    end 

end