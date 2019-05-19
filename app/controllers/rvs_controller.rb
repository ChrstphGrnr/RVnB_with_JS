class RvsController < ApplicationController

    # def new 
    # end

    # def create
    # end

    # def edit 
    # end
    
    def index
        @rvs = Rv.all
    end

    def sort_by_price 
        @rvs = Rv.order_by_price
        render 'rvs/index'
    end

    def show 
        @rv = Rv.find(params[:id])
    end

    # def destroy
    # end

    private 
    
        def rv_params
            params.require(:rv).permit(:name, :owner_id, :sleeps, :price, :trip_count)
        end
end
