output application/json
import * from dw::util::Values
---
if(!isEmpty(vars.currencyCode))
	(payload update "CurrencyCode__c" with vars.currencyCode) update "ProductPrice__c" with ((($ * vars.conversionRate) as String {format:"0.00"})) as Number
else
	payload update "ProductPrice__c" with ($ as String {format: "0.00"})