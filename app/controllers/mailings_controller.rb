class MailingsController < ApplicationController

  def index
    @unsent_changelogs = Changelog.where(mailing_id: nil).where.not(published_at: nil)
    @mailings = Mailing.all
  end

  def create
    @mailing = Mailing.new
    @mailing.save!
    @unsent_changelogs = Changelog.where(mailing_id: nil).where.not(published_at: nil)
    @unsent_changelogs.update_all(mailing_id: @mailing.id)

    redirect_to mailing_path(@mailing)
  end

  def show
    @mailing = Mailing.find(params[:id])
  end
end
