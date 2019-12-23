class ImagesController < ApplicationController 
    def new
        @image = current_user.articles.find(params[:article_id]).images.new
    end
    def create
        @image= current_user.articles.find(params[:article_id]).images.create(image_params)
        redirect_to article_path(params[:article_id])
    end
def destroy
    @image = current_user.articles.find(params[:id]).image(image_params)
    @image.destroy
    redirect_to article_path(@article)
  rescue ActiveRecord::RecordNotFound  
    redirect_to :controller => "articles", :action => "index"
    return

end 
    private
    def image_params
        params.require(:image).permit(:img)
        
    end 
end


    
   