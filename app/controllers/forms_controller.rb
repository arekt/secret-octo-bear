class FormsController < ApplicationController
  def index
    @person = {:first_name => "John", :last_name => "Smith", :age => 45, :details => { hobby: "Books", work: "PR"}}
  end
  def create
    Rails.logger.debug "received: #{params.to_yaml}"
    render :json => {errors:{first_name:["two long"], age:["to old"]}}.to_json
  end
end
