
# Website Response Time Monitor

This bash script monitors the response time of a specified URL and sends an email notification via Gmail if the response time exceeds a defined threshold.

Prerequisites

1-Curl: Command-line tool for transferring data with URLs.

2-[Google App Password](https://myaccount.google.com/apppasswords): Required if using Gmail for sending emails.

## Setup
Clone the repository:

```
git clone https://github.com/raeis-i/Bash-Check-ResponceTime.git
cd Bash-Check-ResponceTime
```

## Configure script:
Edit the script (check_url_and_send_email.sh) and modify the following variables:

sender: Your Gmail address.
receiver: Email address where notifications will be sent.
gapp_password: Your Google App Password for SMTP authentication.
url: The URL of the website you want to monitor.
threshold_ms: Threshold response time in milliseconds (default is 200ms).
Save the changes after editing.

Make the script executable:
```
chmod +x check_url_and_send_email.sh
bash check_url_and_send_email.sh
```

## Setup a cronjob:
To schedule the script to run periodically, set up a [cron job](https://phoenixnap.com/kb/set-up-cron-job-linux) to run the script at your desired interval. 
