namespace :db do
  desc ''

  desc 'Restore db to development from RAILS_ROOT/tmp/latest.dump'
  task :restore do
    dev = Rails.application.config.database_configuration['development']
    test = Rails.application.config.database_configuration['test']

    abort 'Live db is not postgresql' unless dev['adapter'] =~ /postgresql/
    abort 'Missing db config' if dev.blank? || test.blank?

    dev_db = dev['database']
    test_db = test['database']

    connection_options = "-h #{dev['host']} -w -U #{dev['username']}"

    password = "PGPASSWORD=#{dev['password']}"

    pg_restore = 'pg_restore --verbose --clean --no-acl --no-owner'
    psql = 'psql'
    dropdb = 'dropdb'
    createdb = 'createdb'

    #disconnect_script = "#{Rails.root}/script/db_import/disconnect.sql"
    dump_script = "#{Rails.root}/tmp/latest.dump"
    # change_data_script = "#{Rails.root}/script/database-import/change_data.sql"

    #system "#{password} #{psql} #{connection_options} #{dev_db} -f #{disconnect_script}"
    system "#{password} #{dropdb} #{connection_options} #{dev_db}"
    system "#{password} #{dropdb} #{connection_options} #{test_db}"
    system "#{password} #{createdb} #{connection_options} #{dev_db}"
    system "#{password} #{createdb} #{connection_options} #{test_db}"
    system "#{password} #{pg_restore} #{connection_options} -d #{dev_db} #{dump_script}"
    #system "#{password} #{psql} #{connection_options} #{dev_db} -f #{change_data_script}"

    puts 'Done!'
  end
end
