| lookup users.csv userid OUTPUT username — add username field from lookup table based on userid

| lookup geo_ip ip OUTPUT city, country — enrich events with city and country from lookup table

| lookup users.csv userid OUTPUTNEW username — add username only if it doesn’t already exist in events

| lookup product_lookup productId OUTPUT productName, category — map product ID to product name & category

| inputlookup users.csv — display all contents of lookup file users.csv

| inputlookup geo_ip | stats count by country — analyze lookup table directly without index

| inputlookup collection=my_kvstore — read lookup data from KV store collection

| outputlookup status_summary.csv — save results into lookup file status_summary.csv (overwrite if exists)

| outputlookup users.csv append=true — append results into users.csv instead of overwriting

| outputlookup collection=my_kvstore append=true — save/append results into KV store collection