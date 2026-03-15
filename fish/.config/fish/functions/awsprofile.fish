# Switch AWS_PROFILE universally across all terminals.
# Usage:
#   awsprofile          - show current profile and list available ones
#   awsprofile <name>   - set AWS_PROFILE (exported universal var, persists across all shells)
function awsprofile --description "Switch AWS_PROFILE universally across all terminals"
    if test (count $argv) -eq 0
        if set -q AWS_PROFILE
            echo "Current: $AWS_PROFILE"
        else
            echo "Current: (not set)"
        end
        echo ""
        if test -f ~/.aws/config
            echo "Available profiles:"
            awk '/^\[profile / { gsub(/\[profile |\]/, ""); print "  " $0 }' ~/.aws/config
        else
            echo "No ~/.aws/config found"
        end
    else
        set -Ux AWS_PROFILE $argv[1]
        echo "Switched to: $argv[1]"
    end
end
