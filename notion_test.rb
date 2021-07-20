class Objective
    LOCK_STATUSES = {
      :unlocked  => 0,
      :uploading => 1,
      :locked    => 2
    }
      
    def locked?
      locked_by.present? &&
      [LOCK_STATUSES[:uploading], LOCK_STATUSES[:locked]].include?(lock_status)
    end
    
    def release_lock
      assign_attributes(
        :locked_by => nil,
        :locked_on_name => nil,
        :locked_on_id => nil,
        :lock_status => LOCK_STATUSES[:unlocked]
      )
    end
  end

  describe Objective do
      describe "#locked?" do
        it "it locked" do
            expect(locked_by, lock_status).to be > 0 
            
        end
        it "it unlocked" do
            expect(locked_by).to be_nil 
            expect(lock_status).to eq(0) 
        end
      end
  end

  