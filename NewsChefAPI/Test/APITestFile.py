import aylien_news_api
from aylien_news_api.rest import ApiException

# Need to change this key values
# they have been expired for now

# Configure API key authorization: app_id
aylien_news_api.configuration.api_key['X-AYLIEN-NewsAPI-Application-ID'] = '1f6b6359'
# Configure API key authorization: app_key
aylien_news_api.configuration.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'd4a61229e18ac3ffbfa9c01cdd1f40f6'

# create an instance of the API class
api_instance = aylien_news_api.DefaultApi()

title = 'beyonce'
sort_by = 'social_shares_count.facebook'
language = ['en']
since = 'NOW-7DAYS'
until = 'NOW'
entities = [
]

try:
    # List stories
    api_response = api_instance.list_stories(title=title, language=language, published_at_start=since, published_at_end=until, entities_body_links_dbpedia=entities, sort_by=sort_by)
    print(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_stories: %s\n" % e)