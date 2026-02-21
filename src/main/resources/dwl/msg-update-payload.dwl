%dw 2.0
output application/json
---
payload map (item) -> {
    (item - "ProductPrice__c" - "CurrencyCode__c"),
    "ProductPrice__c": if (item.CurrencyCode__c == "USD") 
                          (item.ProductPrice__c as Number) as String {format: "0.00"}
                       else 
                          ((item.ProductPrice__c as Number) / (vars.currencyRates.rates[item.CurrencyCode__c] default 1)) 
                          as String {format: "0.00"},
                          
    "CurrencyCode__c": "USD"
}