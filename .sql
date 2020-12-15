SELECT
		 /* --- This first instance is for all the new leads in the system --- */ 
         "Full Name" 'Name',
		 "Created Time" 'Date',
		 "Lead Source",
         /* --- If you do not already have it as a field in the Leads module, create the "Link to CRM" here using the CONCAT function --- */
		 "Link to CRM",
		 "Id" 'Record ID',
		 'New Leads' 'Category'
FROM  "Leads" 
UNION ALL
 SELECT
		 /* --- This second instance is for CONVERTED leads, essentially, new contacts --- */ 
         "Full Name" 'Name',
		 "Created Time" 'Date',
		 "Lead Source",
		 concat('YOUR_CONTACTS_BASE_URL', "Id"),
		 "Id" 'Record ID',
		 'Converted Leads' 'Category'
FROM  "Contacts" 
UNION ALL
 SELECT
		 c."Full Name" 'Name',
		 d."Created Time" 'Date',
		 c."Lead Source",
		 concat('YOUR_DEALS_BASE_URL', d."Id"),
		 d."Id" 'Record ID',
		 'New Deals' 'Category'
FROM  "Deals" d
JOIN "Contacts" c ON d."Contact Name"  = c."Id"  
UNION ALL
 SELECT
		 c."Full Name" 'Name',
		 d."Closing Date" 'Date',
		 c."Lead Source",
		 concat('YOUR_DEALS_BASE_URL', d."Id"),
		 d."Id" 'Record ID',
		 'Closed Deals' 'Category'
FROM  "Deals" d
JOIN "Contacts" c ON d."Contact Name"  = c."Id"  
WHERE	 d."Stage"  LIKE 'Closed Won'
