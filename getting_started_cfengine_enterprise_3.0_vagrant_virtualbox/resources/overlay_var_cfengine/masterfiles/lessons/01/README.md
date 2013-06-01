# Set message of the day

## Test beginning state
Check the current message of the day

    `vagrant ssh hub`
        cat /etc/motd

    `vagrant ssh node001`
        cat /etc/motd

## Activate Policy
To activate the policy you will log into the hub and uncomment a line that
activates the ssh policy.

0. Log into mission portal and add a new tracker for motd.
    Navigate to the Hosts app
    Select linux Hosts
    Select events tab
    Add new tracker
    Name it "Message of the Day"
    Select report type Promise Repaired
    Set the watch to motd_config.* 
    Set the start time to now

1. Log into the hub and elevate privledges so you can edit files in `/var/cfengine/masterfiles`.
    vagrant ssh hub
    sudo -i
2. Change into the masterfiles directory and edit promises.cf with your favorite editor.
    cd /var/cfengine/masterfiles
    vi promises.cf
3. Uncomment the "motd_config" from the bundlesequence in body common control.
4. Check the policy syntax.
    cf-promises -f ./promises.cf

5. Sit back and watch the tracker you setup in step 0 :) When you see that
   things have been repaired try to log in as root like you did when you began
   the lesson
