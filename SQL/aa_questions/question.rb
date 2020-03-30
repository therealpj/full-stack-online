class Question
    attr_accessor :id, :title, :body, :user_id

    def self.find_by_id(id)
        data = QuestionsDB.instance.execute("SELECT * FROM questions WHERE id = #{id}")
        Question.new(data[0])
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def self.find_by_user_id(user_id)
        QuestionsDB.instance.execute("SELECT * FROM questions WHERE user_id = #{user_id}")
    end

    def author
        QuestionsDB.instance.execute(<<-SQL, self.user_id)
            SELECT
                fname, lname
            FROM
                users
            WHERE
                id = ?
        SQL
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    

end
