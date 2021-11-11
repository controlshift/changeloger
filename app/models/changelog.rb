class Changelog < ApplicationRecord
  belongs_to :mailing, optional: true

  KINDS = %w[fix improvement feature]

  validates :name, presence: true
  validates :kind, presence: true, inclusion: {in: KINDS}

  scope :promoted, -> { where(promoted: true) }
  scope :published, -> { where.not(published_at: nil ).order('published_at DESC, created_at DESC') }

  def pull_request_url
    "https://github.com/controlshift/agra/pull/#{pull_request_id}"
  end

  def pull_request
    client = Octokit::Client.new(:access_token => ENV['GITHUB_API_TOKEN'])
    client.pull_request('controlshift/agra', self.pull_request_id)
  end

  def body_html
    Kramdown::Document.new(body).to_html
  end

  def as_json(options = {})
    super(options.merge(methods: [:body_html, :date, :title, :excerpt]))
  end

  def excerpt
    body.truncate(200, separator: ' ')
  end

  def title
    name
  end

  def date
    published_at
  end

  def pending?
    self.published_at.nil?
  end
end
