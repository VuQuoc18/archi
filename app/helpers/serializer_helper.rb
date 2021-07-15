module SerializerHelper
  def serializer_data model, data, params = nil
    result = params.present? ? model.new(data, params).serializable_hash : model.new(data).serializable_hash
    return if result[:data].nil?
    return result[:data].map {|i| i[:attributes]} if result[:data].instance_of?(Array)

    result[:data][:attributes]
  end
end
