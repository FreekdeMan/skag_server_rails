AdWords on Rails
================

Google's AdWords API service lets developers design computer programs that
interact directly with the AdWords platform. With these applications,
advertisers and third parties can more efficiently -- and creatively -- manage
their large or complex AdWords accounts and campaigns.

The AdWords on Rails sample application demonstrates how to access the AdWords
API from within a Ruby on Rails environment. It is based on the [Google Ruby
AdWords API client library](https://github.com/googleads/google-api-ads-ruby).

If you are new to Rails you can find more information on the
[official site](http://rubyonrails.org/).

The application demonstrates the following:

 - Authorization against AdWords with OAuth schema and credentials re-use.
 - Simple service request (CampaignService.get) and displaying the results.
 - Basic AdHoc reporting functionality with downloads support.

We are sharing this code as open source to provide a starting point for new
developers and to demonstrate some of the core functionality in the API.


How do I get started?
---------------------

1. Check you have Ruby 2.2 or later installed:

    * Update RubyGems http://railsapps.github.io/updating-rails.html
    ```
    gem -v
    gem update --system
    ```

    * Create Gemset with RVM
    ```
    ruby -v
    rvm use ruby-2.4.0
    rvm gemset create skag_server_rails_app
    rvm --ruby-version use 2.4.0@skag_server_rails_app
    rvm gemset list
    ```

    * Fix Bin directory
    ```
    rake rails:update:bin
    ```

2. Download the application from [GitHub](https://github.com/googleads/google-api-ads-ruby).

3. Clone the directory adwords_on_rails

4. Install dependencies
    ```
    sudo gem install rails
    gem install bundle
    bundle install -V
    ```

5. Open PostgreSQL

6. Initialize local PostgreSQL schema:
    ```
    rails db:create db:migrate RAILS_ENV="development"
    ```

7. Configure AdWords API settings:
    * Guides:
        * https://github.com/googleads/google-api-ads-ruby
        * https://github.com/googleads/google-api-ads-ruby/wiki/API-access-using-own-credentials-(installed-application-flow)
            * https://developers.google.com/adwords/api/docs/guides/authentication#installed
    * Login and Create Project in Google API Manager https://console.developers.google.com
    * Create Credentials
        * OAuth Client ID
            * Fill out the OAuth Consent Form
            * Select "Other" Application Type
            * Copy the OAuth Client ID and Secret that are shown
            into .env
            * Restrictions
                * Authorized JavaScript origins
                    * http://localhost:3000
                * Authorized redirect URIs (callbacks)
                    * http://localhost:3000/oauth2/callback


    ```
    subl config/adwords_api.yml
    ```

8. Start the server:
    ```
    rails server
    ```

You should be able to access the application now by pointing your browser to:
    ```
    open http://localhost:3000
    ```


Using the application
---------------------

In order to access AdWords data the application needs to be granted access by a
logged in user. You will be automatically redirected to a page with login prompt
when not yet authorized.

To grant access, click the 'Proceed' link. Make sure you are on the Google login
page, log in with your AdWords account credentials and select 'Grant access'.

Note: Granting access to the application will only allow access to the AdWords
data for the account. Other services will not be accessible.

Once logged in you can retrieve the accounts list, select an account and browse
the campaigns list or download a report with the corresponding menu items.


Configuring the Ruby AdWords API library
----------------------------------------

To be able to use the AdWords API there are a few parameters that need to be
specified. The configuration file is located under the 'config' directory and
named adwords_api.yml.

For details regarding configuration directive please refer to the [library
README](https://github.com/googleads/google-api-ads-ruby/blob/master/adwords_api/README.md).


Production accounts
-------------------

This demo is capable of accessing production accounts. Although the app doesn't
perform any mutate opertions, it's best to be careful especially if modifying it
to include additional functionality.


Where do I submit bug reports and feature requests?
---------------------------------------------------

Bug reports and feature requests can be submitted at:

    https://github.com/googleads/google-api-ads-ruby/issues

Also please feel free to ask questions and discuss the application on forums:

    https://groups.google.com/forum/#!forum/adwords-api

Make sure to subscribe to our Google Plus page for API change announcements and
other news:

    https://plus.google.com/+GoogleAdsDevelopers

Contacts:
---------

Authors:

    Danial Klimkin
    Michael Cloonan
