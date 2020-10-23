# BYO Butler 
 _or “How I save $67.39 per annum”_

Trello’s Butler tool  allows you to create buttons, rules, and scheduled commands to perform different actions on your boards.

To access all of Butler’s power, you need to buy Trello gold.


But if you’re a cheapsk8, BYO Butler instead!

## You will need:
- a trello account
- a heroku account
- a terminal, and a basic understanding of bash
- knowledge of git basics such as adding, committing and pushing

## Overview
Butler provides a convenient GUI to use the [Trello API](https://developer.atlassian.com/cloud/trello/rest/). But if you’re willing to do a bit of coding, we can achieve the same functionality. 

The set up is simple: 

- I make API calls with [cURL](https://en.wikipedia.org/wiki/CURL), and format the parameters with [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))

- Each script is saved as a separate [`.sh` file](https://hpc-wiki.info/hpc/Sh-file#:~:text=A%20shell%20script%20or%20sh,the%20specified%20commands%20in%20order.), to be run by bash

- These little scripts are run as a job by the Heroku Scheduler, which controls when the scripts are run e.g hourly daily, weekly, or monthly*

*actually, there is no weekly/monthly option. You have to hack this by adding conditionals to a script you run daily e.g “if it is a monday, run the following script . . .”







## Setting up a Heroku app
1. The following directory structure is required for [heroku-buildpack-shell](https://github.com/niteoweb/heroku-buildpack-shell).
 Inside a newly made project directory:

    ```
    # Create file '.heroku/run.sh' containing bash commands
    echo 'echo "hello world"' >.heroku/run.sh
    ```

1. Login to Heroku, click New -> Create new app

1. Without specifying a buildpack, Heroku throws errors. We don’t actually need any of the configuration the buildpack provides, so I picked the most minimal one I could find, [heroku-buildpack-shell](https://github.com/niteoweb/heroku-buildpack-shell) . Add it at `https://dashboard.heroku.com/apps/<PROJECT_NAME>/settings` by clicking “Add buildpack”

## Writing your BYO butler scripts


1. [Generate your trello API keys and tokens](https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/) to use in API calls.

1. Mess around on the command line getting your API calls correct. Remember that the API calls must be [URL encoded](https://en.wikipedia.org/wiki/Percent-encoding), so keep that in mind when [using emojis in URLS](http://factmyth.com/factoids/you-%F0%9F%91%8F-can-%F0%9F%91%8F-put-%F0%9F%91%8F-emojis-%F0%9F%91%8F-in-%F0%9F%91%8F-urls-%F0%9F%91%8F/). Unrelated, here's an [interesting hack](https://www.chromium.org/developers/design-documents/idn-in-google-chrome) exploiting browsers that actually render emojis in the url bar.

    My `.sh` files in this repo might be helpful as a starting point.

      My development process was to:

        a) get a local cURL request working e.g making a POST request to generate a new card, then checking my trello board to check if the card appeared
        
        b) replace any personal data with config variables

        c) check it still works 

        e) fiddle around with niceties such as formatting card titles and adding emojis 

        d) if the job is intended to run weekly or monthly, wrap the script in a conditional to check that the current date is the first day of the week or month (see `create_weekly_list.sh` for an example)
    
1. Save each API call at the top level of your project folder, with a well titled file with the `.sh` extension

## Deploying to Heroku

1. Follow your pick of heroku deployment instructions at `https://dashboard.heroku.com/apps/<PROJECT_NAME>/deploy/heroku-git`. I chose to deploy using Heroku Git.
  
1. [Add config variables](https://devcenter.heroku.com/articles/config-vars) used in your scripts 

1. check that your scripts are working by manually executing your scripts deployed on heroku, from your local command line
```
 heroku run bash name-of-script.sh
```


## Setting up the heroku scheduler

1. Click “configure add-ons”, add “Heroku Scheduler”

1. From the Heroku Scheduler window, click add job, and fill in the job editor form. e.g in the "Run job" box, add `bash name-of-script.sh`.

    Make sure to convert the desired time in your timezone to UTC. 


    Heroku scheduler doesn’t have weekly or monthly options, but you can add a daily job in combination with conditionals in your scripts to check that the current date is the first day of the week, or first of the month.

3. Save your job, sit back, relax, and let your bash butler do all the hard work!
