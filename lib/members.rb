class Member
  @@members = []
  attr_reader(:first, :last, :position)
  define_method(:initialize) do |attributes|
    @first = attributes.fetch(:first)
    @last = attributes.fetch(:last)
    @position = attributes.fetch(:position)
    @id = @@members.length() + 1
  end

  define_method(:all) do
    @@members
  end

  define_method(:clear) do
    @@members = []
  end

  define_method(:save) do
    @@members.push(self)
  end

  define_singleton_method(:find) do |id|
    found_member = nil
    @@members.each do |member|
      if member.id().eql?(id)
        found_member = member
      end
    end
    found_member
  end
end
