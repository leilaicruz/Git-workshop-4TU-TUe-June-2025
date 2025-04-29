# How to Use This JSON-LD

## Description of the metadata spec fields

https://dev.discovery.biothings.io/ns/bioschemas/bioschemas:Course

## Tool to generate bioschema markup

https://github.com/BioSchemas/BioschemasMarkupGenerator


## Next steps

- Step 1: Define the Schema Structure
Based on the BioSchema Course template you've provided, you'll need to define the structure for both upcoming and past courses. Each course will have metadata that follows the BioSchema standard, which can then be displayed on the website.

- Step 2: Collect Data
Gather all relevant information for each training course, including:

    Title and description
    Dates and locations
    Instructor details
    Any prerequisites or educational outcomes
    Links to course materials or registration pages

- Step 3 For each course, create a JSON-LD snippet that conforms to the BioSchema standards. Here's a simplified example:

```json
{
  "@context": "https://schema.org",
  "@type": "Course",
  "name": "Introduction to Git",
  "description": "This course provides an introductory look into version control systems and the basics of Git software.",
  "provider": {
    "@type": "Organization",
    "name": "Software Carpentry",
    "sameAs": "https://software-carpentry.org"
  },
  "hasCourseInstance": {
    "@type": "CourseInstance",
    "startDate": "2025-01-15",
    "endDate": "2025-04-10",
    "instructor": {
      "@type": "Person",
      "name": "Dr. Jane Doe",
      "url": "http://www.janedoe.com"
    }
  }
}

``` 

- Step 4: Embed JSON-LD in Web Pages
For each course, embed the corresponding JSON-LD in the HTML of the webpage where the course is described. This helps search engines understand the content of your pages and improves SEO.

- Step 5: Create the Web Page Structure
Develop the HTML structure for the "Upcoming and Past Trainings" tab. You might want to use a tabbed interface or a list that users can filter based on date or topic. Ensure that each listing links to a more detailed page or modal that provides comprehensive course details.

- Step 6: Test and Validate
Use tools like Google's Structured Data Testing Tool to validate the JSON-LD schema to ensure it's correctly implemented and recognized by search engines.

- Step 7: Monitor and Update
Regularly update the training tab as new courses are scheduled and past courses are archived. Keep the JSON-LD updated to reflect any changes, such as new course instances or updated instructor information.