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

    def self.find_by_name(fname, lname)
        QuestionsDB.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname like ?
            AND
                lname like ?
        SQL
    end

    def authored_questions
        Question.find_by_user_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

end
