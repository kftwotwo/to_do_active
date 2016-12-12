require('spec_helper')

describe(List) do
  describe(".all") do
    it("return an array") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff"})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff"})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus stuff"})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe(".find") do
    it("returns a list by its ID") do
      test_list = List.new({:name => "Epicodus stuff"})
      test_list.save()
      test_list2 = List.new({:name => "Home stuff"})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end

  describe("#tasks") do
    it("returns an array of tasks for that list") do
      test_list = List.new({:name => "Epicodus stuff"})
      test_list.save()
      test_task = Task.new({:description => "Learn SQL", :list_id => test_list.id()})
      test_task.save()
      test_task2 = Task.new({:description => "Review Ruby", :list_id => test_list.id()})
      test_task2.save()
      expect(List.first.tasks.all).to(eq([test_task, test_task2]))
    end
  end
end
