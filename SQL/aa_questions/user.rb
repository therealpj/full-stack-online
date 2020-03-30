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

    def followed_questions
        Follow.followed_questions_for_user_id(self.id)
    end

    def liked_questions
        Like.liked_questions_for_user_id(self.id)
    end

    def average_karma
        QuestionsDB.instance.execute(<<-SQL, self.id)
            SELECT
                CAST(COUNT(likes.id) as FLOAT) /
                    COUNT(DISTINCT(questions.id)) as avg_karma
            FROM
                questions
            LEFT OUTER JOIN
                likes
            ON
                questions.id = likes.question_id
            WHERE
                questions.user_id = ?
        SQL
    end

    def save
        raise "Already in database" if self.id
        QuestionsDB.instance.execute(<<-SQL, self.fname, self.lname)
            INSERT INTO
                users(fname, lname)
            VALUES
                (?, ?)
        SQL
        @id = QuestionsDB.instance.last_insert_row_id
    end

    def update
        raise "Not in database" unless self.id
        QuestionsDB.instance.execute(<<-SQL,  self.fname, self.lname, self.id)
            UPDATE
                users
            SET
                fname = ?,
                lname = ?
            WHERE
                id = ?
                SQL
        end

end
