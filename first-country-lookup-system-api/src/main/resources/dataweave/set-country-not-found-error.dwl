%dw 2.0
output application/json skipNullOn = 'everywhere'
fun format(date: DateTime) = date as String {
	format: "uuuu-MM-dd HH:mm:ss"
}
---
{
	correlationId: vars.correlationId default correlationId,
	status: vars.httpStatus,
	success: false,
	timeStamp: format(now()),
	reasons: [{
		message: 'Country not found',
		description: error.description ++" "++ vars.isoCode ++ ". Please verify Country ISO Code in the request."
	}]
}