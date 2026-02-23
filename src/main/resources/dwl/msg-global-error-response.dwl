%dw 2.0
output application/json
var suppressed = error.suppressedErrors[0] default[]
---
{
	api: Mule::p('application.name') as String,
	env: Mule::p('mule.env') as String,
	response: 'Error',
	statusCode: vars.httpStatus as Number default 500,
	timestamp: now() as String,
	correlationId: correlationId,
	errorType: if(!isEmpty(suppressed))
					(suppressed.errorType.namespace default "" ++ ":" ++ suppressed.errorType.identifier default "")
			   else
					vars.errorMessage.errorType default ((error.errorType.namespace default "") ++ ":" ++ (error.errorType.identifier default "")),
	
	errorMessage: if(!isEmpty(suppressed))
					suppressed.description default error.description
				  else
					vars.errorMessage.errorDescription default error.description
}