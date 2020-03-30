class Follow
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(id)
        data = QuestionsDB.instance.execute("SELECT * FROM follows WHERE id = #{id}")
        Follow.new(data[0])
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.followers_for_question_id(question_id)
        data = QuestionsDB.instance.execute(<<-SQL, question_id)
            SELECT
                users.id, users.fname, users.lname
            FROM
                users
            JOIN
                follows ON users.id = follows.user_id
            WHERE
                follows.question_id = ?
        SQL
        data.map { |datum| User.new(datum) }
    end

    def self.followed_questions_for_user_id(user_id)
        data = QuestionsDB.instance.execute(<<-SQL, user_id)
            SELECT
                questions.*
            FROM
                questions
            JOIN
                follows ON questions.id = follows.question_id
            WHERE
                follows.user_id = ?
        SQL
    end

    def self.most_followed_questions(n)
        data = QuestionsDB.instance.execute(<<-SQL, n)
            SELECT
                questions.*
            FROM
                questions
            JOIN
                follows ON questions.id = follows.question_id
            GROUP BY
                questions.title
            LIMIT ?
        SQL
        data.map { |datum| Follow.new(datum)}
    end


end
