class HashWithIndifferentAccess
    def self.dump(hash)
     hash.to_json
    end

    def self.load(hash)
      (hash ? hash : {}).with_indifferent_access
    end
end