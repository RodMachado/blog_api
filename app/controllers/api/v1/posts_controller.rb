module Api
  module V1
    class PostsController < ApplicationController

      before_action :set_post, only: [:show, :edit, :update, :destroy]

      def index
        render json: Post.all
      end

      def show
      end

      def new
        render json: Post.new
      end

      def edit
      end

      def create
        @post = Post.new(post_params)
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: @post, status: :ok
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy
        head :no_content
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :body)
      end

    end
  end
end
