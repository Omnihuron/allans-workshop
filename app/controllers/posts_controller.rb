class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end
    
    def new
    end
    
    def create
      if params['commit'] == "Cancel" then
        redirect_to action: 'index'
      else
        #Post.create(title: params['title'], author: params['author'], body: params['body'])
        Post.create(post_params)
        redirect_to action: 'index'
      end
    end
    
    
    private
    
    def post_params
      params.require('posts').permit(:title, :author, :body)
    end
    
end
