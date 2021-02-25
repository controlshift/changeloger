class ChangelogsController < ApplicationController
  before_action :load_changelog, only: [:edit, :update, :destroy]

  def index
    @changelog = Changelog.new
    @changelogs = Changelog.all
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
      @changelogs = Changelog.all

      render 'index'
    end
  end

  def destroy
    @changelog.destroy!
    @changelogs = Changelog.all

    render 'index'
  end

  private

  def load_changelog
    @changelog = Changelog.find(params[:id])
  end

  def changelog_params
    params.require(:changelog).permit(:name, :body, :pull_request_id)
  end
end
