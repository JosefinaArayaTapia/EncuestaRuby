class Api::V1::UsersController < ApplicationController
  #Arquitectura REST

  #POST /users
  def create
    #param= {auth :{provider,uid}}

    @user = User.from_omniauth(params[:auth])

    @token = Token.create(user: @user)


    render "api/v1/users/show"
  end


end


