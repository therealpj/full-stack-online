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

end
