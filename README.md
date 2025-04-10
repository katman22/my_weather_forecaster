# My Weather Forecaster

Simple weather forecasting application. Using NOAA.gov public data and OpenWeatherMap free data.

##### Prerequisites

The setup steps expect following tools are installed on the system.

- Github
- Ruby [3.3.0](https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/)
- Rails [8.0.2](https://rubyonrails.org/2025/3/12/Rails-Version-8-0-2-has-been-released)

##### 1. Check out the repository

```bash
git clone https://github.com/katman22/my_weather_forecaster.git
```
```bash
git clone git@github.com:katman22/my_weather_forecaster.git
```
```bash
gh repo clone katman22/my_weather_forecaster
```

##### 2. No Database needed

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000/forecast/index

### NOAA.gov API

Visit: https://www.weather.gov/documentation/services-web-api for information specific to "Content Negotiation"
### Content Negotiation (NOAA.gov)
The new API will use headers to modify the version and format of the response. Every request, either by browser or application, sends header information every time you visit any website. For example, a commonly used header called "UserAgent" tells a website what type of device you are using so it can tailor the best experience for you. No private information is shared in a header, and this is a standard practice for all government and private sites. Developers can override these headers for specific purposes (see the "API Specifications" tab for more information). You can get full details by visiting the header field definitions page at the World Wide Web Consortium site.

https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html

### OpenCage GEOCoding API

Geocoding service of some type is needed to convert addresses I.E. city, state or zip; into latitude and longitude which is needed for NOAA api responses.
Note: An account is needed to use free service.

https://opencagedata.com/

### First Version Layout Design
![layout_example.png](public/images/layout_example.png)


