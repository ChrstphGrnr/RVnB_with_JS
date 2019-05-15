class ApplicationController < ActionController::Base
    def welcome 
        @rvs = Rv.all
    end
end
