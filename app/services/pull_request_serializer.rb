class PullRequestSerializer
  def initialize(data)
    @data = data
  end

  def self.perform(data)
    new(data).perform
  end

  def perform
    PullRequest.new(pull_request_attributes)
  end

  private

  attr_reader :data

  def pull_request_attributes
    {
      author: data['user']['login'],
      created_at: data['created_at'],
      description: data['body'],
      link: data['html_url'],
      title: data['title']
    }
  end
end
