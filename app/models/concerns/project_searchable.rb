require 'elasticsearch/model'
module ProjectSearchable
  extend ActiveSupport::Concern

  attr_accessor :client

  included do
    include ::Elasticsearch::Model

    delegate :index_document, to: :__elasticsearch__

    #---Customize the index name

    settings index: { number_of_shards: 1, number_of_replicas: 0 } do
      mapping do
        indexes :title, type: 'string', analyzer: 'simple'
        indexes :description, type: 'string', analyzer: 'simple'
        indexes :category, type: 'string', analyzer: 'simple'
        indexes :project_type, type: 'string', analyzer: 'simple'
        indexes :councilor, type: 'string', analyzer: 'simple'
      end
    end

    ##---Set up callbacks for updating the index on model changes
    #
    after_commit on: [:create, :update] do
      index_document
    end

    after_commit on: [:destroy] do
      delete_document_in_cascade
    end


    ##---Customize the JSON serialization for Elasticsearch
    #
    def as_indexed_json(options = {})
      as_json(only: [:title, :description, :category, :project_type], methods: [:councilor])
    end

    def delete_document
      begin
        initialize_client.delete index: self.class.index_name, type: self.class.document_type, id: id
      rescue Elasticsearch::Transport::Transport::Errors::NotFound
        Rails.logger.error "On destroy:: Error on contact with id:: #{id}, index:: #{self.class.index_name}, document_type:: #{self.class.document_type}>> NOT FOUND!!"
      ensure
        delete_index
      end
    end

    def initialize_client
      @client ||= Elasticsearch::Client.new host: Settings.elasticsearch.client.url
    end
  end
end
