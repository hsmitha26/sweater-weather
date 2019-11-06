class BaseService
  def parse_response
    JSON.parse(connection.body, symbolize_names: true)
  end
end
