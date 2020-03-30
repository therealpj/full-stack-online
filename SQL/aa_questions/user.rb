class User
    attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        data = QuestionsDB.instance.execute("SELECT * FROM users WHERE id = #{id}")
        User.new(data[0])
    end

    def initialize(options)
        @id = options["id"]
        @fname = options["fname"]
        @lname = options["lname"]
    end

end
