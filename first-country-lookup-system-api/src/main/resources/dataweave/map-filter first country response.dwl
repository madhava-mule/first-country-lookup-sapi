%dw 2.0
output application/json skipNullOn = 'everywhere'
fun filterCountryByISOCode(data, isoCode) = data filterObject ((value, key) -> key ~= isoCode)
var filteredCountry = filterCountryByISOCode(payload.data, vars.isoCode)
---
(filteredCountry pluck (value, key) -> {
	country: value.country,
	region: value.region,
	isoCode: key
}) reduce $
