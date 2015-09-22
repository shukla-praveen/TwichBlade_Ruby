require 'spec_helper'

module TwichBlade
  describe 'register interface' do
    before(:each) { @register_interface = RegisterInterface.new }

    context "validate?" do
      it "should be able to validate the username" do
        dbname = "test_twichblade"
        interface = RegisterInterface.new
        allow(Kernel).to receive(:gets).and_return("foo", "asdasasdsasds")
        interface.take_user_input
        expect(interface.validate?).to eq(true)
      end

      it "should be able to validate the null username" do
        dbname = "test_twichblade"
        interface = RegisterInterface.new
        allow(Kernel).to receive(:gets).and_return("")
        interface.take_user_input
        expect(interface.validate?).to eq(false)
      end

      it "should be able to validate the null password" do
        dbname = "test_twichblade"
        interface = RegisterInterface.new
        allow(Kernel).to receive(:gets).and_return("foo", "")
        interface.take_user_input
        expect(interface.validate?).to eq(false)
      end

      it "should be able to validate the password" do
        dbname = "test_twichblade"
        interface = RegisterInterface.new
        allow(Kernel).to receive(:gets).and_return("foo", "barbar1234")
        interface.take_user_input
        expect(interface.validate?).to eq(true)
      end

      it "should be able to validate the username and password length validaiton" do
        dbname = "test_twichblade"
        interface = RegisterInterface.new
        allow(Kernel).to receive(:gets).and_return("foo", "bar")
        interface.take_user_input
        expect(interface.validate?).to eq(false)
      end

      it "should be able to validate the username and password length validaiton" do
        dbname = "test_twichblade"
        interface = RegisterInterface.new
        allow(Kernel).to receive(:gets).and_return("foo", "foobar12345")
        interface.take_user_input
        expect(interface.validate?).to eq(true)
      end

      context 'display' do
        it 'should not be able to allow user to register without proper username and password' do
          allow_any_instance_of(RegisterInterface).to receive(:display_header).with("SignUp")
          allow_any_instance_of(RegisterInterface).to receive(:take_user_input)
          allow_any_instance_of(RegisterInterface).to receive(:validate?).and_return(false)
          allow_any_instance_of(RegisterInterface).to receive(:validate_error)
          @register_interface.display
        end
      end
    end
  end
end
