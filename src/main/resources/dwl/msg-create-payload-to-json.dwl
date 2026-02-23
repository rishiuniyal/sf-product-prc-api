%dw 2.0
output application/json
fun filterSuccessRecords(rec) = rec [?($.Success == true)]
---
if (isEmpty(filterSuccessRecords(payload)))
	    {
	        "Status": false,
	        "Message": "All records failed during create operation"
	    }
else filterSuccessRecords(payload)