after_create_commit -> {
  broadcast_prepend_to "comments",
                       target: "comments-list",
                       partial: "comments/comment",
                       locals: { comment: self }
}