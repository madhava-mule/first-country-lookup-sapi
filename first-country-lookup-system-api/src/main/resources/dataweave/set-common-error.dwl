%dw 2.0
output application/json skipNullOn = 'everywhere'
fun format(date: DateTime) = date as String {
	format: "uuuu-MM-dd HH:mm:ss"
}
fun reason() =[{
	message: "Internal Server Error",
	description: error.description
}]
---
{
	correlationId: vars.correlationId default correlationId,
	status: vars.httpStatus,
	success: false,
	timeStamp: format(now()),
	reasons: if ( !isEmpty(error.errorMessage.payload) and error.errorMessage.payload is Object ) error.errorMessage.payload else reason()
}