class Task < ActiveRecord::Base
  belongs_to :lists
  validates(:description, {:presence => true, :length => { :maximum => 50 }})
  scope(:not_done, -> do
    where({:done => false})
  end)
end
