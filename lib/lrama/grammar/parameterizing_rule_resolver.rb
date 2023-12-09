module Lrama
  class Grammar
    class ParameterizingRuleResolver
      attr_reader :rules, :tokens, :term

      def initialize
        @rules = []
        @tokens = []
        @term = nil
        @parameterizing_rule_builders = []
      end

      def add_parameterizing_rule_builder(builder)
        @parameterizing_rule_builders << builder
      end

      def defined?(name)
        @parameterizing_rule_builders.any? { |builder| builder.name == name }
      end

      def build_rules(token, rule_counter, lhs_tag, user_code, precedence_sym, line)
        builder = @parameterizing_rule_builders.select { |b| b.name == token.s_value }.last
        raise "Unknown parameterizing rule #{token.s_value} at line #{token.line}" unless builder

        build_token = builder.build_token(token)
        @rules = @rules + builder.build_rules(token, build_token, rule_counter, lhs_tag, user_code, precedence_sym, line)
        @tokens << build_token
        @term = builder.term
      end
    end
  end
end
