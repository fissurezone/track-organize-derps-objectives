require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "create task without statusi specified sets status to new" do
    task = Task.new(title: "Test", details: "Test details")
    assert task.save
    assert_equal "New", task.status, "Unspecified status was set to 'New'"
  end

  test "update status" do
    [ "Done", "Redo" ].each do |status|
      task = tasks(:new)
      task.update(status: status)
      assert_equal status, task.status
    end
  end
end
