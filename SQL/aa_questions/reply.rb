class Reply
    attr_accessor :id, :body, :question_id, :parent_id, :user_id

    def self.find_by_id(id)
        data = QuestionsDB.instance.execute("SELECT * FROM replies WHERE  id = #{id}")
        self.new(data[0])
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @user_id = options['user_id']
    end

end
