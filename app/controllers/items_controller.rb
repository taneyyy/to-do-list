class ItemsController < ApplicationController
    
    def index
        @items = Item.all
        @item = Item.new
    end
    
    def create
         @item = Item.new(item_params)
         respond_to do |format|
             if @item.save
                format.html
                format.js {render layout: false}
                format.json { render json: @item, status: :created, location: @item }
             else
                format.html { render action: "create" }
                format.json { render json: @item.errors, status: :unprocessable_entity }
             end 
        end
        
    end
    
    def edit
        @edit_item = Item.find(params[:id])
        
    end
    
    def update
        @item = Item.find(params[:id])
        
        if @item.update(item_params)
            redirect_to '/items'
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
        @items= Item.all
         respond_to do |format|
             if @item.update(done: true)
                format.html 
                format.js   {render layout: false}
                format.json { render json: @items, status: :marked, location: @items }
             else
                format.html { render action: "mark" }
                format.json { render json: @item.errors, status: :unprocessable_entity }
             end
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
