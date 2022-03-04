unique template features/core/iptables/config;

# Add basic set of iptables rules (component is included in this template)
# Default policy is to DROP all incoming packets that do not come from an IP
# address with domain.tld
include 'common/core/iptables';
