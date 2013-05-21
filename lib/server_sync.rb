require 'set'
class ServerSync
  def initialize(key,secret)
    @conn = Fog::Compute::AWS.new(aws_access_key_id: key, aws_secret_access_key: secret)
  end
  def get_servers
    @servers = @conn.servers
  end
  def persist
    get_servers.each do |server|
      create_server(server)
    end
    remove_deleted_servers_from_local
  end
  def create_server(server)
    servername = extract_server_name(server)
     existing_server = Server.find_by_instance_id(server.id)
     if existing_server
       existing_server.update_attributes(
        instance_id: server.id,
        name: servername,
        public_ip: server.public_ip_address,
        private_ip: server.private_ip_address,
        flavor: server.flavor_id,
        image: server.image_id,
        ssh_key_name: server.key_name,
        security_groups: server.security_group_ids.join(","),
        state: server.state
       )
     else
       existing_server = Server.new(
        instance_id: server.id,
        name: servername,
        public_ip: server.public_ip_address,
        private_ip: server.private_ip_address,
        flavor: server.flavor_id,
        image: server.image_id,
        ssh_key_name: server.key_name,
        security_groups: server.security_group_ids.join(","),
        state: server.state
       )
     end
     existing_server.save
  end

  private

  def extract_server_name(server)
    if server.tags.nil? || server.tags.empty?
        "No Name"
    else
      if server.tags["Name"].nil?
        "No Name"
      else
        server.tags["Name"]
      end
    end
  end
  def remove_deleted_servers_from_local
    servers = Server.all
    server_set = Set.new(servers.map(&:instance_id))
    fog_set = Set.new(@conn.servers.map(&:id))
    xor = server_set ^ fog_set

    xor.each do | server_id |
      Server.find_by_instance_id(server_id).destroy
    end
    Server.all
  end
end
