class Team
  @@teams = []
  attr_reader(:teamname, :industry, :id, :members)
  define_method(:initialize) do |attributes|
    @teamname = attributes.fetch(:teamname)
    @industry = attributes.fetch(:industry)
    @id = @@teams.length() + 1
    @members = []
  end

  define_singleton_method(:all) do
    @@teams
  end

  define_method(:clear) do
    @@teams = []
  end

  define_method(:save) do
    @@teams.push(self)
  end

  define_singleton_method(:find) do |id|
    found_team = nil
    @@teams.each do |team|
      if team.id().eql?(id)
        found_team = team
      end
    end
    found_team
  end

  define_method(:add_member) do |member|
    @members.push(member)
  end
end
