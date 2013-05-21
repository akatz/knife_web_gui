desc "load servers from aws into db"
task :load_servers => [:environment] do
  puts ServerSync.new(ENV['SYNC_KEY'], ENV['SYNC_SECRET']).persist.map {|server| server.instance_id }
end
