using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

 
    public class FooterNotes
    {

        private int _id;
        public int Id
        {
            get
            {
                return _id;
            }
            set 
            {
                _id = value;
            }
        }

        private string _footernotestext;
        public string FooterNotesText
        {
            get
            {
                return _footernotestext;
            }
            set
            {
                _footernotestext = value;
            }
        }


        public FooterNotes()
        {
        }


        public FooterNotes(int Id, string FooterNotesText)
        {

            _id = Id;
            _footernotestext = FooterNotesText;
        }


        public static FooterNotes GetFooterNotesText() 
        {
            return FooterNotesDB.GetFooterNotesText();
        }

    }
 