class RenameAttendanceAttendaces < ActiveRecord::Migration
  def change
  	rename_table :attendance, :attendances
  end
end
