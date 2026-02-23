%dw 2.0
output application/json
---
if (error.errorType.identifier == "BAD_REQUEST")
    400
else if (error.errorType.identifier == "UNAUTHORIZED")
    401
else if (error.errorType.identifier == "FORBIDDEN")
    403
else if (error.errorType.identifier == "NOT_FOUND")
    404
else if (error.errorType.identifier == "METHOD_NOT_ALLOWED")
    405
else if (error.errorType.identifier == "NOT_ACCEPTABLE")
    406
else if (error.errorType.identifier == "UNSUPPORTED_MEDIA_TYPE")
    415
else if (error.errorType.identifier == "NOT_IMPLEMENTED")
    501
else
    500