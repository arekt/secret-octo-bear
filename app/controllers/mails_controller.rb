class MailsController < ApplicationController
  layout false
  respond_to :js

  def show
    if ["spam", "inbox", "sent", "archive"].include?(params[:id])
      render :action => params[:id]
    else
      render :js => '{"id":15,"from":"brennan@lake.xyz","to":"steve@example.com","date":"May 20, 2011","subject":"RE: Car9 network is out of service","messageContent":"Hi Garrett,\u003cbr/\u003e\u003cbr/\u003eStock now gave bird my nevermore. From never name saintly then a and reclining shall a dying the back doubtless. Syllable token all unbroken mystery fancy i to the. Clasp the louder gave this the door on upon dreaming. Ghastly heart scarce perched.\u003cbr/\u003e\u003cbr/\u003eMetell there wind the.\u003cbr/\u003e\u003cbr/\u003eMadam nevernevermore was pondered floor and whose made suddenly disaster more seat. Sainted i me to was my came she i songs nothing forgotten of one the was said unbrokenquit.\u003cbr/\u003e\u003cbr/\u003eThat that more oer evermore but enchanted lie. Linking my and this some that in ease louder. Faintly on lent the a quaint aidenn from sign.\u003cbr/\u003e\u003cbr/\u003eThanks,\u003cbr/\u003eFredericka","folder":"Archive"}'
    end
  end

  def inbox
    render :js => '{"id":"inbox","mails":[{"id":1,"from":"Abbot \u003coliver@smoke-stage.xyz\u003e","to":"steve@example.com","date":"May 25, 2011","subject":"Booking confirmation #389629244","folder":"inbox"},{"id":2,"from":"Addison Begoat \u003cupton.oprdrusson@pear-income.xyz\u003e","to":"steve@example.com","date":"May 7, 2011","subject":"FW: Associate advice","folder":"inbox"}]}'
  end

  def archive
    render :js => '{"id":"inbox","mails":[{"id":1,"from":"Abbot aaaaa@smoke-stage.xyz\u003e","to":"steve@example.com","date":"May 25, 2011","subject":"Booking confirmation #389629244","folder":"inbox"},{"id":2,"from":"Addison Begoat \u003cupton.oprdrusson@pear-income.xyz\u003e","to":"steve@example.com","date":"May 7, 2011","subject":"FW: Associate advice","folder":"inbox"}]}'
  end

  def sent
    render :js => '{"id":"inbox","mails":[{"id":1,"from":"Abbot bbbb@smoke-stage.xyz\u003e","to":"steve@example.com","date":"May 25, 2011","subject":"Booking confirmation #389629244","folder":"inbox"},{"id":2,"from":"Addison Begoat \u003cupton.oprdrusson@pear-income.xyz\u003e","to":"steve@example.com","date":"May 7, 2011","subject":"FW: Associate advice","folder":"inbox"}]}'
  end

  def spam
    render :js => '{"id":"inbox","mails":[{"id":1,"from":"Abbot vvvvv@smoke-stage.xyz\u003e","to":"steve@example.com","date":"May 25, 2011","subject":"Booking confirmation #389629244","folder":"inbox"},{"id":2,"from":"Addison Begoat \u003cupton.oprdrusson@pear-income.xyz\u003e","to":"steve@example.com","date":"May 7, 2011","subject":"FW: Associate advice","folder":"inbox"}]}'
  end
end
