Basic Searching

search → Runs a search with terms/keywords.

index= → Specifies which index to search.

sourcetype= → Filters by data type.

source= → Filters by file, stream, or input source.

host= → Filters by host machine.


Filtering & Fields

fields → Include/exclude specific fields.

table → Display results in table format.

dedup → Remove duplicate results based on fields.

where → Apply conditional filters (like SQL WHERE).

regex → Filter events using regex patterns.


Transformations

stats → Aggregate functions (count, avg, sum, min, max, etc.).

timechart → Time-based stats visualization.

chart → Create charts grouped by fields.

top → Most common values.

rare → Least common values.

Event Processing

eval → Create or modify fields.

sort → Sort results.

rename → Rename fields.

rex → Extract fields using regex.

spath → Parse JSON data.


Subsearches

subsearch ([...]) → Embed one search inside another.

join → Join results from subsearch with main search.

append / appendcols → Add results from another search.

set → Perform union/intersect/minus between datasets.


Event Manipulation

transaction → Group related events into a single transaction.

eventstats → Like stats, but adds results back into events.

streamstats → Running statistics across results.

bin → Bucket data into time intervals.


Utility

head → First N results.

tail → Last N results.

reverse → Reverse result order.

lookup → Match events with external lookup tables.

inputlookup → Read lookup file contents.

outputlookup → Write results into a lookup table.