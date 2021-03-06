require 'spec_helper'

module TwichBlade
  describe 'Time' do
    context 'show' do
      it 'should be able to give just tweeted message' do
        time  = Object::Time.new + 35
        time_object = Time.new(time)
        expect { time_object.show }.to output(/Just Tweeted/).to_stdout
      end

      it 'should be able to give minutues message' do
        time  = Object::Time.new + 135
        time_object = Time.new(time)
        expect { time_object.show }.to output(/2 minutes ago/).to_stdout
      end

      it 'should be able to give hours message' do
        time  = Object::Time.new + 13335
        time_object = Time.new(time)
        expect { time_object.show }.to output(/3 hours ago/).to_stdout
      end

      it 'should be able to give message on the basis of tweeted date' do
        time  = Object::Time.new + 864023
        time_object = Time.new(time)
        a = "#{time.to_time.strftime("%d %b %Y")}"
        expect { time_object.show }.to output(a).to_stdout
      end
    end
  end
end
