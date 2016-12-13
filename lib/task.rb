class Task < ActiveRecord::Base
  belongs_to :lists
  validates(:description, :presence => true)
  scope(:not_done, -> do
    where({:done => false})
  end)
end
