class FindingAction
    belongs_to :creator
    
    def notify_creator(updater)
      FindingActionNotifier.send_creator_notification(self) if should_notify_creator?(updater)
    end
    
    private
    
    def should_notify_creator?(updater)
      updater != creator && NotificationsManager.allows_notifying?(updater)
    end
  end

  describe FindingAction do
    describe "#notify_creator" do
        before {allow(should_notify_creator?).to receive(updater)}

        it "notify create" do
            expect(should_notify_creator?).to have_received(updater)
        end
    end
    
      
  end
  