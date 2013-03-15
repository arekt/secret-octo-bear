class FormsController < ApplicationController
  def index
  end
  def create
    Rails.logger.debug "received: #{params.to_yaml}"
    render :json => {errors:{first_name:["two long"], age:["to old"]}}.to_json
  end
end
