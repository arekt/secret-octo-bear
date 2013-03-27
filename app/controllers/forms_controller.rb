# encoding: utf-8
class FormsController < ApplicationController
  def index
    @person = {:"名" => "John", :last_name => "Smith", :age => 45, :details => { hobby: "Movies", work: "PR", some_field: "asdfas", :errors => []}, :errors => []}
  end
  def create
    Rails.logger.debug "received: #{params.to_yaml}"
    @person = params[:person]
    @person[:errors] = []
    @person[:errors] << {:名 => "aasdfasdf"} if @person[:名] == "Arkadiusz"
    @person[:errors] << {:last_name => "asdfasdf"}
    @person[:details][:errors] = [{:hobby => "asdfasdfasdfsadfsadfasdf"}]
    Rails.logger.debug @person.to_json
    render :json => @person.to_json
  end
end
