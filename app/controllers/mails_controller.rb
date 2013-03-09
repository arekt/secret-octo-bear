class MailsController < ApplicationController
  layout false
  respond_to :json

  def show
    if ["spam", "inbox", "sent", "archive"].include?(params[:id])
      render :json => {id: params[:id], mails: Message.where(:folder => params[:id]).all}.to_json
    else
      render :json => Message.find(params[:id]).to_json
    end
  end
end
