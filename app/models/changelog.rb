class Changelog < ApplicationRecord
  belongs_to :mailing, optional: true

  KINDS = ['fix', 'improvement']

  validates :name, presence: true
  validates :kind, presence: true, inclusion: {in: KINDS}

  scope :published, -> { where.not(published_at: nil ) }

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
    super(options.merge(methods: :body_html))
  end

  def pending?
    self.published_at.nil?
  end
end
