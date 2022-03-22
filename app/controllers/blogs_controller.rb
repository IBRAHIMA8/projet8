#class BlogsController < ApplicationController
#  def index
#  end

#  def new
#    @blog = Blog.new
#  end

#  def create
#    Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    # new_blog_pathというPrefixを書くことで、"/blogs/new"というURLの指定をします、という意味になる。
#    redirect_to new_blog_path
#  end
#end



#class BlogsController < ApplicationController
#  def index
#  end

#  def new
#    @blog = Blog.new
#  end

#  def create
#    Blog.create(params.require(:blog).permit(:title, :content))
#    redirect_to new_blog_path
#  end
#end








#class BlogsController < ApplicationController
#  def index
#    @blogs = Blog.all
#  end

#  def new
#    @blog = Blog.new
#  end

#  def create
#    Blog.create(blog_params)
#    redirect_to new_blog_path
#  end

#  private

#  def blog_params
#    params.require(:blog).permit(:title, :content)
#  end
#end






#class BlogsController < ApplicationController
#  def index
#     @blogs = Blog.all
#   end

#    def new
#    @blog = Blog.new
#   end

#  def create
#    Blog.create(blog_params)
#    redirect_to new_blog_path
#  end

  # Définir
#  def show
#  @blog = Blog.find(params[:id])
#  end

#  private

#  def blog_params
#    params.require(:blog).permit(:title, :content)
#  end
#end







class BlogsController < ApplicationController
before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
     @blogs = Blog.all
   end

    def new
    @blog = Blog.new
   end



   #def create
    #   @blog = Blog.new(blog_params)
    #   if @blog.save
    #     redirect_to blogs_path, notice: "J'ai créé un blog！"
    #   else
    #     render :new
    #   end
     #end




     def create
         @blog = Blog.new(blog_params)
         if params[:back]
           render :new
         else
           if @blog.save
             redirect_to blogs_path, notice: "j'ai créé un blog！"
           else
             render :new
           end
         end
       end



  # Définir
  def show
  #@blog = Blog.find(params[:id])
  end

  def edit
    # @blog = Blog.find(params[:id])   
   end


  def update
     #@blog = Blog.find(params[:id])
     if @blog.update(blog_params)
       redirect_to blogs_path, notice: "J'ai édité le blog!"
     else
       render :edit
     end
   end

   def destroy
       @blog.destroy
       redirect_to blogs_path, notice:"J'ai supprimé le blog！"
   end


   def confirm
      @blog = Blog.new(blog_params)
    end


    def confirm
        @blog = Blog.new(blog_params)
        render :new if @blog.invalid?
      end


  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  # Ajouter une méthode pour obtenir une valeur avec id comme clé
 def set_blog
   @blog = Blog.find(params[:id])
 end
end
