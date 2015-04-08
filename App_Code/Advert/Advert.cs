using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

 
    public class Advert
    {

        private int _id;
        public int id
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

        private string _reference;
        public string Reference
        {
            get
            {
                return _reference;
            }
            set
            {
                _reference = value;
            }
        }

        private string _title;
        public string Title
        {
            get
            {
                return _title;
            }
            set
            {
                _title = value;
            }
        }

        private string _spec;
        public string Spec
        {
            get
            {
                return _spec;
            }
            set
            {
                _spec = value;
            }
        }

        private string _salary;
        public string Salary
        {
            get
            {
                return _salary;
            }
            set
            {
                _salary = value;
            }
        }

        private string _duration;
        public string Duration
        {
            get
            {
                return _duration;
            }
            set
            {
                _duration = value;
            }
        }

        private DateTime? _startdate;
        public DateTime? Startdate
        {
            get
            {
                return _startdate;
            }
            set
            {
                _startdate = value;
            }
        }
 
        private DateTime _updatedon;
        public DateTime UpdatedOn
        {
            get
            {
                return _updatedon;
            }
            set
            {
                _updatedon = value;
            }
        }

        private string _location;
         public string Location
        {
            get
            {
                return _location;
            }
            set
            {
                _location = value;
            }
        }

         private string _contactname;
         public string ContactName
         {
             get
             {
                 return _contactname;
             }
             set
             {
                 _contactname = value;
             }
         }

         private string _contactemail;
         public string ContactEmail
         {

             get
             {
                 return _contactemail;
             }
             set
             {
                 _contactemail = value;
             }
         }

        // 1 = Temp job
        // 2 = Perm Job
         private int _jobtype;
         public int JobType
         {

             get
             {
                 return _jobtype;
             }
             set
             {
                 _jobtype = value;
             }
         }

         private int _live;
         public int Live
         {
             get
             {
                 return _live;
             }
             set
             {
                 _live = value;
             }
         }


         public static Advert GetByid(int id)
         {
             return AdvertDB.GetByid(id);
         }

         public static bool Delete(int id)
         {
             return AdvertDB.Delete(id);
         }

         public bool Create(Advert NewItem)
         {
             return AdvertDB.Create(NewItem);

         }
         public bool Update(Advert NewItem)
         {
             return AdvertDB.Update(NewItem);

         }
 
 
        public Advert()
        {
        }


        public Advert(int id , string Reference, string Title, string Spec, string Salary, string Duration, DateTime? StartDate, DateTime UpdatedOn, string Location, string ContactName, String ContactEmail, int JobType, int Live)
        {
            this._id = id;
            this._reference = Reference;
            this._title = Title;
            this._spec = Spec;
            this._salary = Salary;
            this._duration = Duration;
            this._startdate = StartDate;
            this._updatedon = UpdatedOn;
            this._location = Location;
            this._contactname = ContactName;
            this._contactemail = ContactEmail;
            this._jobtype = JobType;
            this._live = Live;
        }

    }
 
 