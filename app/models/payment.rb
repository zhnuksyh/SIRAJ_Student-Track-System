class Payment < ApplicationRecord
  self.table_name = "payments" # Explicitly map to the Supabase table
end
