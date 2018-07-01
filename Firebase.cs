using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace MentalHealth3
{
    public class Firebase
    {
        static public List<FirebaseData> Read(string Address)
        {
            List<FirebaseData> Output = new List<FirebaseData>();
            string Data;

            string URL = Address;
            HttpWebRequest request1 = (HttpWebRequest)WebRequest.Create(URL);
            request1.ContentType = "application/json: charset=utf-8";
            HttpWebResponse response1 = request1.GetResponse() as HttpWebResponse;
            using (Stream responsestream = response1.GetResponseStream())
            {
                StreamReader Read = new StreamReader(responsestream, Encoding.UTF8);
                Data = Read.ReadLine();
            }

            if (Data == "" || Data == "null")
                return Output;


            int ss = Data.Split('&').Length;
            for (int i = 0; i < Data.Split('&').Length - 4; Output.Add(new FirebaseData(Data.Split('&')[i + 1], Data.Split('&')[i + 3])), i += 4) ;

            return Output;
        }

        static public void Write(string Address, string _Name, string _Value)
        {
            var json = Newtonsoft.Json.JsonConvert.SerializeObject(new
            {
                Name = "&" + _Name + "&",
                Value = "&" + _Value + "&",
            });

            var request = WebRequest.CreateHttp(Address);
            request.Method = "POST";
            request.ContentType = "application/json";
            var buffer = Encoding.UTF8.GetBytes(json);
            request.ContentLength = buffer.Length;
            request.GetRequestStream().Write(buffer, 0, buffer.Length);
            var response = request.GetResponse();
            json = (new StreamReader(response.GetResponseStream())).ReadToEnd();
        }

        public static void EditUser(string Address, List<FirebaseData> Inputs)
        {
            Delete(Address);

            foreach (var Input in Inputs)
            {
                Write(Address, Input.Name, Input.Value);
            }
        }

        private static void Delete(string Address)
        {
            var request = WebRequest.CreateHttp(Address);
            request.Method = "DELETE";
            request.ContentType = "application/json";
            var response = request.GetResponse();
        }
    }
}