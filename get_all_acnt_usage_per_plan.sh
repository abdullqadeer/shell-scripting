#!/bin/bash
# Date: 17-07-2024
# Description: Script will fecth all cPanel accounts usages as per plan assigned to it.

echo "May we know the plan you want it's associated accounts usage?"
read PLAN

#PLAN="Enterprise"
OUTPUT_FILE="acnt_usage_$PLAN.txt"
UAPI_CMD="/usr/bin/uapi"

# Check if the UAPI command exists
if [ ! -x "$UAPI_CMD" ]; then
    echo "UAPI command not found or not executable."
    exit 1
fi

# Clear the output file if it exists
> "$OUTPUT_FILE"

# Find users with the specified plan and iterate over them
grep -irl "$PLAN" /var/cpanel/users/ | awk -F\/ '{ print $5 }' | while read -r USER; do
    echo "Fetching account usage for user: $USER" >> "$OUTPUT_FILE"

    # Fetch account usage using UAPI and append it to the output file
    $UAPI_CMD --user="$USER" ResourceUsage get_usages | grep -wE 'usage|description' | awk '{ print $2}' >> "$OUTPUT_FILE"

    echo "" >> "$OUTPUT_FILE" # Add a blank line for readability
done

echo "Account usage data has been written to $OUTPUT_FILE."
