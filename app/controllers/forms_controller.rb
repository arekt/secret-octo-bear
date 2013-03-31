# encoding: utf-8
class FormsController < ApplicationController
  def index
    @person = {:first_name => nil, :last_name => "Smith", :age => 45, :details => { hobby: "Movies", work: "PR", :errors => []}, :errors => []}
  end
  def create
    @person = params[:person]
    @person[:errors] = []
    @person[:errors] << {:first_name => "Fist should have less then 10 characters."} if @person[:first_name].length > 10
    @person[:errors] << {:last_name => "Last name error."}
    @person[:details][:errors] = [{:hobby => "Some hobby error."}]
    render :json => @person.to_json
  end
end
