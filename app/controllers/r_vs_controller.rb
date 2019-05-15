class RVsController < ApplicationController

    def new 
    end

    def create
    end

    def edit 
    end
    
    def index
    end

    def show 
    end

    def destroy
    end

    private 
    
        def rv_params
            params.require(:rv).permit(:name, :owner_id, :sleeps, :price, :trip_count)
        end
end
