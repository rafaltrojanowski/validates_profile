#encoding: utf-8
require 'uri'
require 'active_model'

class NoSuchTypeError < StandardError ; end

module ActiveModel
  module Validations
    class ProfileValidator < ActiveModel::EachValidator

      def initialize(options)
        options.reverse_merge!(:message => "is not a valid profile name or link to profile")
        super(options)
      end

      def validate_each(record, attribute, value)
        raise NotImplementedError, 'You must implement the validate_each method'
      end

      def option_call(record, name)
        option = options[name]
        option.respond_to?(:call) ? option.call(record) : option
      end
    end

    module ClassMethods
      def validates_profile(*attr_names)
        class_name = attr_names.last[:type].to_s.humanize.concat('Validator').constantize

        validates_with class_name, _merge_attributes(attr_names)
      end
    end
  end
end
