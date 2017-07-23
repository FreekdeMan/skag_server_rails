AdWords on Rails
================

## Screenshots

![alt tag](https://raw.githubusercontent.com/ltfschoen/skag_server_rails/master/screenshots/index.png)

Google's AdWords API service lets developers design computer programs that
interact directly with the AdWords platform. With these applications,
advertisers and third parties can more efficiently -- and creatively -- manage
their large or complex AdWords accounts and campaigns.

This program adapts the [AdWords on Rails sample application](https://github.com/googleads/google-api-ads-ruby) that demonstrated how to access the AdWords API from within a Ruby on Rails environment. It is based on the [Google Ruby
AdWords API client library](https://github.com/googleads/google-api-ads-ruby).

The application demonstrates the following:

 - Authorization against AdWords with OAuth schema and credentials re-use.
 - Simple service request (CampaignService.get) and displaying the results.
 - Basic AdHoc reporting functionality with downloads support.

## AdWords


* AdWords Setup
    * Initial Setup of AdWords Product, Test, and Google Accounts
        * Create New Production Google Account (i.e. ltfschoen)
            * Create New Google Account for Production https://accounts.google.com/SignUp?hl=en
            * Create AdWards Production MMC Account https://adwords.google.com/um/Welcome/Home
            * Click Gear Icon (Manager account)
                * Account Settings
                    * AdWords API Center
                        * Create Token for Independent AdWords Developer with "Test Accounts" Access Level
            * Note: Use API Tokens from Production MMC Account in app
        * Create New Test AdWords Account (i.e. ltfschoentest100)
            * Create New Google Account for Test Account
            * Create AdWords Test Account https://adwords.google.com/um/Welcome/?sf=mt
                * Select "To manage other people's accounts" (NOT "To manage my accounts")
                * Click Gear Icon
                    * Account Settings
                        * Account Access
                            * Invite your Production MMC Account
                * Create Client Account within Adwords Test Account
                    * Click ACCOUNT > New AdWords account (i.e. ltfschoen200)
                * Create Campaign within ltfschoen100 (Test Account) under ltfschoen200 (Client Account)
    * Workflow within Rails app
        * Click "Proceed"
        * Login with Google Account of AdWords Test Account (i.e. ltfschoen100)
        * Click "List Accounts"
            * Note: To view hierarchy of accounts from a different Production MMC Account then use their developer token instead and have that production account send an access invitation to ltfschoen100.
            * Select Account: ltfschoen200 (since used to create Campaign)
        * Click "List Campaigns"

* AdWords Other
    * Reports & Measure Reports - https://developers.google.com/adwords/api/docs/guides/uireports
        * Campaign Negative Keywords Performance Report - https://developers.google.com/adwords/api/docs/appendix/reports#campaign-negative-keywords
        * Ad Groups Report - https://developers.google.com/adwords/api/docs/appendix/reports#ad-group
        * Ad Performance Report - https://developers.google.com/adwords/api/docs/appendix/reports#ad
        * Keywords Performance Report - https://developers.google.com/adwords/api/docs/appendix/reports#keywords
        * Display Keyword Performance Report - https://developers.google.com/adwords/api/docs/appendix/reports#display-keyword
        * **Search Query Performance Report**
            * https://developers.google.com/adwords/api/docs/appendix/reports#search-query
            * https://developers.google.com/adwords/api/docs/appendix/reports/search-query-performance-report
            * See what people searching and if matches keywords
            * All Campaigns > Query > Search Terms (requires live ads)
            * Fields:
                * CampaignId, AdGroupStatus, Ctr, Impressions, Clicks, AverageCpc
            * Notes
                * Example Ruby Code Snippets for AdWords API https://developers.google.com/adwords/api/docs/samples/ruby/reporting
                * Add Add Group
                    * https://github.com/googleads/google-api-ads-ruby/blob/master/adwords_api/examples/v201702/basic_operations/add_ad_groups.rb
                * Search Query Performance Report
                    * Goal:
                        * Increase:
                            * Ctr (click through rates)
                        * Decrease:
                            * Cpc (cost per click)
                            * CPA (cost per acquisition)
                        * Maintain:
                            * Impressions
                            * Clicks
                            * Conversions
                    * Problems
                        * Situation - Broad Match Search Terms - ads show for broad search phrases very different
                        from keyword bidding on.
                            * i.e. broad match search term results in ad served on related terms with synonymns that increase Ad Impressions but not good if not selling regular shoes but instead selling specialised goods (i.e. sports shoes)
                                * Bid Broad Match - "women’s sports shoes"
                                * Ad Served - "ladies sports shoes", "shoes for women"
                        * Issue - Quality Score lowers, Cpc increases, Conversion rate lowers, CPA increases
                    * Strategies
                        * Remove Search Terms with low performance (conversion rate)
                * **IN PROGRESS**
                * Reference: https://reportgarden.com/2016/08/02/adwords-search-terms-reports/
            * SciRuby
                * Daru
                    * https://github.com/SciRuby/daru
                    * https://github.com/domitry/nyaplot
                    * http://v0dro.github.io/blog/2014/11/25/data-analysis-in-ruby-basic-data-manipulation-and-plotting/
                    * http://nbviewer.jupyter.org/github/SciRuby/sciruby-notebooks/tree/master/
            * Links
                * https://developers.google.com/adwords/api/docs/guides/reporting
                * Export Report https://reportgarden.com/2016/08/02/adwords-search-terms-reports/
                * https://groups.google.com/forum/#!topic/adwords-api/6_se0m7g1v8

	* Setup Developer Account Links
		* https://developers.google.com/adwords/api/docs/guides/reset-devtoken
		* https://support.google.com/adwords/answer/6139186
		* https://adwords.google.com/home/tools/manager-accounts/
		* https://developers.google.com/adwords/api/docs/guides/signup
		* https://groups.google.com/forum/#!topic/adwords-api/ZmNKYoLjpYc
		* https://groups.google.com/forum/#!topic/adwords-api/rdDyOLlH3Ls
		* https://developers.google.com/adwords/api/docs/reference/v201702/CustomerService
		* https://developers.google.com/adwords/api/docs/guides/accounts-overview#test_accounts
        * https://medium.com/@MihaZelnik/how-to-create-test-account-for-adwords-api-503ca72b25a4
        * IGNORE
            * Created Account ltfschoen101 "To manage my accounts"
            * Configure Test Account
                * ACCOUNT > Link existing accounts > Enter customer IDs (i.e. the Production MCC ID)
            * Go to "Manually set account ID" within the app at localhost:3000
                * Enter Account clientCustomerID (CID) of Test Account (i.e. 000-000-0000) shown at https://adwords.google.com/cm/CampaignMgmt
            * Click List Campaigns on Home page
	* API Methods
		* get_customers
			* http://googleadsdeveloper.blogspot.com.au/2016/10/access-multiple-adwords-accounts-with.html
	* Support
		* 1800 988 571 for free advice on customizing your account

## Setup

* IntelliJ IDE Config

    * Fix error: "No Rails found in SDK" IntelliJ

        * Edit Configurations > Click "+" > Select "Rails" > for "Ruby SDK" choose "Use other SDK" and select 'RVM: ruby-2.4.1 [skag_server_rails_app]'

        * File > Project Structure > Project Settings > Project SDK > select 'RVM: ruby-2.4.1 [skag_server_rails_app]'

        * File > Project Structure > Platform Settings > SDK > Select 'RVM: ruby-2.4.1 [skag_server_rails_app]' > Change "Gems bin directory" to the directory shown when you run `which rails` from the project directory (but remove `rails` from the end i.e. `/Users/Me/.rvm/gems/ruby-2.4.1@skag_server_rails_app/bin`)

    * Fix error: Rails server launcher wasn't found in project
        * Refer to my Stackoverflow post here: https://stackoverflow.com/questions/30141740/rubymine-rails-server-launcher-wasnt-found-in-the-project/44922746#44922746

* Run Locally

    * Check Ruby 2.2 or later installed:

    * Update RubyGems http://railsapps.github.io/updating-rails.html
        ```
        gem -v
        gem update --system
        ```

    * Create Gemset with RVM
        ```
        ruby -v
        rvm list
        rvm use ruby-2.4.1
        rvm gemset create skag_server_rails_app2.4.1
        rvm --ruby-version use 2.4.1@skag_server_rails_app2.4.1
        rvm gemset list
        rvm gemdir
        ```

    * Fix missing Bin directory
        ```
        rake rails:update:bin
        ```

    * Install dependencies
        ```
        gem install rails -v 5.1.2
        gem install bundle
        bundle install -V
        ```

    * Open PostgreSQL

    * Initialize local PostgreSQL schema:
        ```
        rails db:create db:migrate RAILS_ENV="development"
        ```

    * Configure AdWords API settings:
        * Guides:
            * https://github.com/googleads/google-api-ads-ruby
            * https://github.com/googleads/google-api-ads-ruby/wiki/API-access-using-own-credentials-(installed-application-flow)
                * https://developers.google.com/adwords/api/docs/guides/authentication#installed
        * Login and Create Project in Google API Manager https://console.developers.google.com
        * Create Credentials
            * OAuth Client ID
                * Fill out the OAuth Consent Form
                * Select "Web Application" Application Type
                (it may be necessary to also create "Other" Type first)
                * Copy the OAuth Client ID and Secret that are shown
                into .env
                * Restrictions
                    * Authorized JavaScript origins
                        * http://localhost:3000
                    * Authorized redirect URIs (callbacks)
                        * http://localhost:3000/login/callback


        ```
        subl config/adwords_api.yml
        ```

    * Start the server. Open in browser:
        ```
        rails server;
        open http://localhost:3000
        ```

## Usage

To access AdWords data the app needs to be granted access by a
logged in user. The user is automatically redirected to a page with login prompt
when not yet authorized.

After being prompted with say `SKAG Server Rails wants to Manage your AdWords campaigns`, to grant access, click the 'Proceed' link. Ensure you are on the Google login
page, log in with your AdWords account credentials and select 'Grant access'.

Note: Granting access to the application will only allow access to the AdWords
data for the account. Other services will not be accessible.

Once logged in you can retrieve the accounts list, select an account and browse
the campaigns list or download a report with the corresponding menu items.


## Configuring the Ruby AdWords API library

To be able to use the AdWords API there are a few parameters that need to be
specified. The configuration file is located under the 'config' directory and
named adwords_api.yml.

For details regarding configuration directive please refer to the [library
README](https://github.com/googleads/google-api-ads-ruby/blob/master/adwords_api/README.md).


## Production accounts

This demo is capable of accessing production accounts. Although the app doesn't
perform any mutate operations, it is best to be careful especially if modifying it to include additional functionality.


## Links

* Bug reports - https://github.com/googleads/google-api-ads-ruby/issues
* Forums - https://groups.google.com/forum/#!forum/adwords-api
* Google Plus page for API change announcements and
other news - https://plus.google.com/+GoogleAdsDevelopers
* Original Authors - Danial Klimkin, Michael Cloonan
