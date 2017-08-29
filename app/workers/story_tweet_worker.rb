class StoryTweetWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  sidekiq_retries_exhausted do |msg, e|
    Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  end

  def perform(story_id, force=false)
    Sidekiq.logger.info "Publishing #{story_id}"
    result = Story.find(story_id).publish!(force)
    if result.id
      Sidekiq.logger.info "Tweet id: #{result.id}, total: #{result.user.statuses_count}, user: #{result.user.name}"
    else
      Sidekiq.logger.error "Error: #{result.inspect}"
    end
  end
end
