class Blacklight::Sparql::Response::Group

  #include Blacklight::Sparql::Response::PaginationMethods

  attr_reader :key, :group, :response
  
  def initialize key, group, response
    @key = key
    @group = group
    @response = response
  end

  def doclist
    group[:doclist]
  end

  # short cut to response['numFound']
  def total
    doclist[:numFound].to_s.to_i
  end
    
  def start
    doclist[:start].to_s.to_i
  end

  def docs
    doclist[:docs].map {|doc| ::SparqlDocument.new(doc, response)}
  end

  def field
    response.group_field
  end
end
