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




class BlogsController < ApplicationController
  #省略

  def create
    Blog.create(blog_params)
    redirect_to new_blog_path
  end

  # 定義する
  def show
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
