# get_all_acnt_usage_per_plan.sh

## Overview

This script automates the process of fetching usage data from cPanel accounts associated with a specific plan. It is designed to simplify the task for users who may not be familiar with cPanel intricacies or lack bash scripting skills.

## Features

- **Input Prompt**: Users are prompted to enter the cPanel plan they want to analyze.
- **Automated Process**: The script automatically scans through cPanel's user configuration files to find accounts linked to the specified plan.
- **UAPI Integration**: Utilizes cPanel's UAPI (`/usr/bin/uapi`) to retrieve usage data for each identified user using the `ResourceUsage get_usages` endpoint.
- **Output Management**: All fetched usage data is compiled into a file named `acnt_usage_$PLAN.txt` for easy review and analysis.

## Usage

1. **Permissions**: Ensure the script has executable permissions:
   ```bash
   chmod +x get_all_acnt_usage_per_plan.sh
   ```

2. **Execution**: Run the script and follow the prompts to specify the plan:
   ```bash
   ./get_all_acnt_usage_per_plan.sh
   ```

3. **Output**: Upon completion, a report file (`acnt_usage_$PLAN.txt`) will be generated containing the usage details for all accounts associated with the specified plan.

## Requirements

- **UAPI Command**: The script requires cPanel's UAPI (`/usr/bin/uapi`) to be correctly installed and configured on the system.
- **Permissions**: Proper permissions are needed to access cPanel user configuration files (`/var/cpanel/users/`).

## Comparison with Manual Checking

### Manual Process

- **Pros**: Provides direct control and interaction with each account's usage details.
- **Cons**: Time-consuming and prone to errors, especially when managing numerous accounts.

### Automated Script (`get_all_acnt_usage_per_plan.sh`)

- **Pros**: Saves time by automating the collection of usage data across multiple accounts. It reduces the likelihood of errors and ensures consistent data gathering.
- **Cons**: Requires initial setup and configuration. It depends on the availability and reliability of the UAPI command and correct file permissions.

## Conclusion

The `get_all_acnt_usage_per_plan.sh` script offers an efficient solution for non-technical users to manage and analyze cPanel account usage data effortlessly. By automating the retrieval process and integrating with cPanel's UAPI, it enhances efficiency and accuracy in usage statistics management.
