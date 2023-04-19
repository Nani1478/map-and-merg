%dw 2.0
output application/json
var book = [
        {
            "bookid": 10001,
            "title": "Wings of fire",
			 "price": 1500

        },
        {
		     "bookid": 20001,
			 "title": "Geetanjali",
			 "price": 1500
			},
			{
		     "bookid": 30001,
			 "title": "Chitra",
			 "price": 1500
			}
    ]
    var author = [
        {
			    "bookid":10001,
				"author":"Dr. A. P. J. Abdul Kalam"
			  },
			  {
			    "bookid": 20001,
				"author":"Dr. Rabindra Nath Tagore"
			  },
			  {
			    "bookid": 30001,
				"author":"Dr. Rabindra Nath Tagore"
			  }
    ]
---
                        //using variables//
/*book map(v,i) ->using (id=v.bookid){
    "BookId": id,
    "BookTitle": v.title,
    "cost": v.price,
    (author filter ($.*bookid contains id)
       map(item) ->{
           auther : item.author
       })
}*/
                 //usig input payload//  
 flatten(payload.books) map(v,i) ->using (id=v.bookid)
 {
      "BookId": id,
    "BookTitle": v.title,
    "cost": v.price,
    ((flatten(payload.auther)) filter ($.*bookid contains id)
    map(item)->{
          auther: item.author
    })
 }
