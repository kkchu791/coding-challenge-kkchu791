class ApplicationController < ActionController::API

  def get_pop
    byebug
    @zip_code = zip_code_params[:zip_code]
  end


  private

  def zip_code_params
    params.permit(:zip_code)
  end
end
