namespace :buzz do
  desc "TODO"
  task late_events: :environment do
    Event.where('date < ?', Time.now - 1.day).each do |model|
      event.destroy
    end
  end

end
