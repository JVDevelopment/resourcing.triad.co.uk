using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
 
    public class SearchResults : System.Collections.Generic.List<Advert>
    {

        public SearchResults()
        {
        }

        public static SearchResults GetLatest(int SearchType)
        {
            return SearchResultsDB.GetLatest(SearchType);
        }

        public static SearchResults Search(string keywords, int SearchType)
        {
            return SearchResultsDB.Search(keywords, SearchType);
        }

        public static SearchResults GetAll(int filter)
        {
            return SearchResultsDB.GetAll(filter);
        }



    }
 