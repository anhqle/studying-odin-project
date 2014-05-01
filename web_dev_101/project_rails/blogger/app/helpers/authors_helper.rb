module AuthorsHelper
  def author_params
    params.require(:author).permit(:username, :email, :password, :password_confirmation)
  end
end
