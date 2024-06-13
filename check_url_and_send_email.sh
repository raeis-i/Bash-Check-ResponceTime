#!/bin/bash

# Define variables
sender="YourEmail@gmail.com"
receiver="YourEmail@gmail.com"
gapp_password="YourGoogleAppPassword"
url="https://RequestedUrl.com"

# Threshold response time in milliseconds (200ms)
threshold_ms=200

# Function to check the status of the URL and send email notification if response time is high
check_url_and_send_email() {
    local response_time=$(curl -w "%{time_total}" -s -o /dev/null "$url")
    local response_time_ms=$(printf "%.0f" "$response_time")  # Convert to integer milliseconds

    if [ $response_time_ms -gt $threshold_ms ]; then
        local subject="High Response Time Alert"
        local body="The website $url has a high response time:\n\nResponse Time: $response_time_ms ms"
        local email_content="From: $sender\nTo: $receiver\nSubject: $subject\n\n$body"
        
        local response=$(curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
            --mail-from "$sender" \
            --mail-rcpt "$receiver" \
            --user "$sender:$gapp_password" \
            -T <(echo -e "$email_content"))
        
        if [ $? -eq 0 ]; then
            echo "Email sent successfully."
        else
            echo "Failed to send email."
            echo "Response: $response"
        fi
    else
        echo "Response time within threshold: $response_time_ms ms"
    fi
}

# Call the function to check URL and send email
check_url_and_send_email

