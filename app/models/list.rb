class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  def self.adjust(list, direction)
    y = list.board_id
    case list.priority
    when "1"
      if direction == 'up'
      else
        z = List.where(board_id: y, priority: 2).limit(1)
        z.update_all(priority: 1)
        pri = 2
      end
    when "2"
      if direction == 'up'
        z = List.where(board_id: y, priority: 1).limit(1)
        z.update_all(priority: 2)
        pri = 1
      else
        z = List.where(board_id: y, priority: 3).limit(1)
        z.update_all(priority: 2)
        pri = 3
      end
    when "3"
      if direction == 'up'
        z = List.where(board_id: y, priority: 2).limit(1)
        z.update_all(priority: 3)
        pri = 2
      else
        z = List.where(board_id: y, priority: 4).limit(1)
        z.update_all(priority: 3)
        pri = 4
      end
    when "4"
      if direction == 'up'
        z = List.where(board_id: y, priority: 3).limit(1)
        z.update_all(priority: 4)
        pri = 3
      else
        z = List.where(board_id: y, priority: 5).limit(1)
        z.update_all(priority: 4)
        pri = 5
      end
    when "5"
      if direction == 'up'
        z = List.where(board_id: y, priority: 4).limit(1)
        z.update_all(priority: 5)
        pri = 4
      end
    end
    list.update_attribute(:priority, pri)
  end

end
