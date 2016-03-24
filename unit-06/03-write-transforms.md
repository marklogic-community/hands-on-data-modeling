# Write Transforms

A write transform modifies documents during the ingest process. If we know how we want to change data at the time we're loading it, we can update it as we load it. This technique is useful when we don't need data from external sources; the additional data is available outside MarkLogic; or the additional data is already present in MarkLogic. In other words, we're not likely to use this early on as we load data as it becomes available. 

# Example: Date normalization

Suppose we have a document with an element `<dob>4/28/1957</dob>`. This is a customary way to display dates (in the US), but is not useful for indexing. We can build a write transform that will transform this date to a canonical format, such as `<dob canonical="1957-04-28">4/28/1957</dob>`. 

JavaScript makes the date conversion easy: 

    var dob = new Date('4/28/1957');
    dob.toISOString().substr(0, 10);

A write transform would then insert a new element with this value into the XML, which is then written to the database. 
