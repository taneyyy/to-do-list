class ItemsController < ApplicationController
    
    def index
        @items = Item.all
    end
    
    def new
        @item = Item.new
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def create
        @item = Item.new(item_params)
        
        if @item.save
            redirect_to @item
        else
            render 'new'
        end
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        
        if @item.update(item_params)
            redirect_to @item
        else
            render 'edit'
        end
    end
    
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
 
        redirect_to show_completed_path
    end
    
    def mark
        @item = Item.find(params[:id])
        
        if @item.update(done: true)
            redirect_to '/items'
        else
            logger.debug "cannot mark as done"
        end
        
    end
    
    def show_completed
        @items = Item.where(:done => true)
        render 'show_completed'
    end
    
    
    private
        def item_params
            params.require(:item).permit(:name, :date)
        end
end
