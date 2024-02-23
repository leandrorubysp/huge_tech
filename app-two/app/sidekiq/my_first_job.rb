class MyFirstJob
  include Sidekiq::Job

  def perform
    puts "working test!"
  end
end
