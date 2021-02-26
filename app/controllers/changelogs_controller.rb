require 'net/http'
require 'uri'

class ChangelogsController < ApplicationController
  before_action :load_changelog, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:feed]


  def index
    @changelog = Changelog.new
    @changelogs = Changelog.all.order('created_at DESC')
  end

  def new
    @changelog = Changelog.new

    if params[:pr_number]
      pr = github_client.pull_request('controlshift/agra', params[:pr_number])
      @changelog.name = pr.title
      @changelog.body = pr.body
      @changelog.pull_request_id = pr.number
    end
  end

  def edit
  end

  def update
    if @changelog.update!(changelog_params)
      redirect_to changelogs_path
    else
      render 'edit'
    end
  end

  def create
    @changelog = Changelog.new(changelog_params)
    if @changelog.save
      redirect_to changelogs_path
    else
      render 'new'
    end
  end

  def publish
    Changelog.where(published_at: nil).update_all(published_at: Time.now)
    resp = Faraday.post(ENV['NETLIFY_BUILD_HOOK'], '')

    redirect_to changelogs_path
  end

  def feed
    render json: Changelog.published.group_by { |m| m.created_at.beginning_of_month.strftime('%Y-%m') }
  end

  def feed_months
    months = Changelog.published.select("date_trunc('month', created_at) as month").distinct.order('month desc').collect{|m| m.month }
    render json: {months: months}
  end

  def destroy
    @changelog.destroy!
    redirect_to changelogs_path
  end

  private

  def load_changelog
    @changelog = Changelog.find(params[:id])
  end

  def changelog_params
    params.require(:changelog).permit(:name, :body, :pull_request_id, :kind, :created_at)
  end
end
