#!/usr/bin/env -S awk -f

# TO_(S,SC,SN,C,N,U,H,J)

BEGIN {
    print "<ProductHints>"
}
# Match lines starting with TO_(
/^TO_\(/ {
    # Create a working copy of the line
    line = $0
    
    # Strip L" and " prefixes/suffixes and wrapper parentheses
    gsub(/L"/, "", line)
    gsub(/"/, "", line)
    sub(/^TO_\(/, "", line)
    sub(/\)$/, "", line)
    
    # Split the clean comma-separated values into an array
    n = split(line, f, /, */)
    
    # Ensure there are at least 8 fields
    if (n >= 8) {
        print "  <Product>"
        print "    <ProductSpecific>"
        print "      <SNPID>" f[1] "</SNPID>"
        print "      <COMPANY>" f[4] "</COMPANY>"
        print "      <PACKAGE>" f[5] "</PACKAGE>"
        print "      <UUID>" f[6] "</UUID>"
        print "      <HU>" f[7] "</HU>"
        print "      <JDX>" f[8] "</JDX>"
        print "    </ProductSpecific>"
        print "  </Product>"
    }
}
END {
    print "</ProductHints>"
}
