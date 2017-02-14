class Datafixes::FixKittens < Datafix
  def self.up
    table_name = Kitten.table_name
    archive_table(table_name)
    transaction do # Optional use of transaction
      execute %Q{ UPDATE #{table_name} SET fixed = 't'; }
    end
  end

  def self.down
    table_name = Kitten.table_name
    revert_archive_table(table_name)
  end
end
