class database {
  static List categories = [
    "2 wheeler"
        "3 wheeler"
        "4 wheeler"
        "Heavy vehicle"
  ];

  static List<Map<String, dynamic>> mechanic = [
    {
      "name": "Saju",
      "location": "Edapally, Ernakulam",
      "current_location": {
        "latitude": 10.023676,
        "longitude": 76.311623,
      },
      "status": "online",
      "category": "4-wheeler",
      "age": "35",
      "image":
          "https://cdn1.vectorstock.com/i/1000x1000/23/70/man-avatar-icon-flat-vector-19152370.jpg",
      "contact number": "9946353610",
      "whatsapp nbr": "8756372819",
      "description":
          "I am ambitious and determined. I always have something to work towards and love a good challenge. I have never been one to accept mediocrity and will jump at any chance to improve myself and prove others wrong. My prior position saw me promoted three times in under two years.",
      // reviews
      "reviews": [
        {
          "name": "ragav",
          "datetime": "25 days ago",
          "content":
              "Great service provided by the team with fair pricing. Every order I made for my car was fulfilled either on time or beforehand. All accessories on the app are also great. User interface and customer support are also great",
          "rated": 3.5,
          "dateTime": "23 days ago"
        },
      ],
      // rating
      "rating": "4.5"
    },
    {
      "name": "Kishan kumar",
      "location": "Chittethukara,Ernakulam",
      "current_location": {
        "latitude": 9.992212,
        "longitude": 76.352577,
      },
      "status": "offline",
      "category": "4-wheeler",
      "age": "40",
      "image":
          "https://cdn1.vectorstock.com/i/1000x1000/23/65/man-avatar-icon-flat-vector-19152365.jpg",
      "contact number": "9590372956",
      "whatsapp nbr": "8974568329",
      "description":
          "I have always been a leader. Ive always had a knack for leading others, and as a result, Ive quickly risen through the ranks at every company where Ive worked. Even when Im not in a leadership position, my coworkers still come to me with questions and concerns. They know that even if I dont have the solution, Ill know where to find it. Less than a year into my last two positions, I was promoted to a managerial position.",
      // reviews
      "reviews": [
        {
          "name": "Sunil",
          "datetime": "5 days ago",
          "content":
              "I am very much disappointed with Quick mech service buddy and their staff. I gave my car to Gomechanic for the standard service and front and rear paint. Everything was done good but half tank fuel has been theft my car, and I was wondering how this happened. The workshop location is just 4-5 kms from my place, and the same has been escatlated to the customer service, and they promised to resolve the issue within 48 hrs but till nothing happened. ",
          "rated": 4.1,
          "dateTime": "23 days ago"
        },
      ],
      // rating
      "rating": "3.9"
    }
  ];

  static List saved = [];
  static List history = [];
}
