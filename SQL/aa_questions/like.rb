class Like
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(id)
        data = QuestionsDB.instance.execute("SELECT * FROM likes WHERE id = #{id}")
        Like.new(data[0])
    end

    def initialize(options)
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.likers_for_question_id(question_id)
        data = QuestionsDB.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users
            JOIN
                likes ON users.id = likes.user_id
            WHERE
                question_id = ?
        SQL

        data.map { |datum| User.new(datum)}
    end

    def self.num_likes_for_question_id(question_id)
        data = QuestionsDB.instance.execute(<<-SQL, question_id)
            SELECT
                COUNT(*) as Count
            FROM
                users
            JOIN
                likes ON users.id = likes.user_id
            WHERE
                question_id = ?
        SQL
        data[0]['Count']
    end

    def self.liked_questions_for_user_id(user_id)
        data = QuestionsDB.instance.execute(<<-SQL, user_id)
            SELECT
                questions.*
            FROM
                questions
            JOIN
                likes ON questions.id = likes.question_id
            WHERE
                likes.user_id = ?
        SQL

        data.map {|datum| Question.new(datum) }
    end

end
