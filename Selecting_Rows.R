#############################################
# Selecting rows with Chicago zipcodes
# Cristina Y. Sakamoto
# The University of Chicago
#############################################

attach(data)

chi_data <- data[ which(data$zip ==	60601	|	data$zip ==	60631	|	data$zip ==	60615	|	data$zip ==	60646	|
                          data$zip ==	60602	|	data$zip ==	60632	|	data$zip ==	60616	|	data$zip ==	60647	|
                          data$zip ==	60603	|	data$zip ==	60633	|	data$zip ==	60617	|	data$zip ==	60649	|
                          data$zip ==	60604	|	data$zip ==	60634	|	data$zip ==	60618	|	data$zip ==	60651	|
                          data$zip ==	60605	|	data$zip ==	60635	|	data$zip ==	60619	|	data$zip ==	60652	|
                          data$zip ==	60606	|	data$zip ==	60636	|	data$zip ==	60620	|	data$zip ==	60653	|
                          data$zip ==	60607	|	data$zip ==	60637	|	data$zip ==	60621	|	data$zip ==	60655	|
                          data$zip ==	60608	|	data$zip ==	60638	|	data$zip ==	60622	|	data$zip ==	60656	|
                          data$zip ==	60609	|	data$zip ==	60639	|	data$zip ==	60623	|	data$zip ==	60657	|
                          data$zip ==	60610	|	data$zip ==	60640	|	data$zip ==	60624	|	data$zip ==	60659	|
                          data$zip ==	60611	|	data$zip ==	60641	|	data$zip ==	60625	|	data$zip ==	60660	|
                          data$zip ==	60612	|	data$zip ==	60643	|	data$zip ==	60626	|	data$zip ==	60661	|
                          data$zip ==	60613	|	data$zip ==	60644	|	data$zip ==	60628	|	data$zip ==	60666	|
                          data$zip ==	60614	|	data$zip ==	60645	|	data$zip ==	60629	|	data$zip ==	60827	|
                          data$zip ==	60630),]

detach(data)
