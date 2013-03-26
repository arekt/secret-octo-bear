class FormsController < ApplicationController
  def index
    @person = {:first_name => "John", :last_name => "Smith", :age => 45, :details => { hobby: "Movies", work: "PR", some_field: "asdfas"}, :errors => [:first_name => "aaaaa"]}
  end
  def create
    Rails.logger.debug "received: #{params.to_yaml}"
    @person = params[:person]
    @person[:last_name] += "a"
    @person[:errors] = []
    @person[:errors] << {:last_name => "is to short"}
    @person[:details][:errors] = [{:hobby => "this is work, not hobby"}]
    render :json => @person.to_json
  end
end
