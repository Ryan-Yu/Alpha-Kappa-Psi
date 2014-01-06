# Alpha Kappa Psi: UC Berkeley (Alpha Beta) Chapter

This is the official website for [*UC Berkeley Alpha Kappa Psi*](http://calakpsi.com)
by Ryan Yu.

Technologies used:
* Ruby on Rails 4
* Authentication: [*Devise*](https://github.com/plataformatec/devise)
* Administration: [*ActiveAdmin*](http://www.activeadmin.info/)
* Photograph attachments: [*Paperclip Gem*](https://github.com/thoughtbot/paperclip), hosted on [*S3*](http://aws.amazon.com/s3/)

Points of interest:
* The website is designed in such a way that makes it maintainable for those with no programming experience.
* Both the _Rush_ page and the _Careers_ page update dynamically based on _RushEvent_ and _CareerEntry_ objects created within the administrative portal.
	- The Rush page will automatically process all rush events, and will order in ascending order based on time of event.
	- The Careers page will automatically process all career entries, and will apply sorting logic to it to display the information appropriately; career entries will first be sorted on year, then will be divided into full-time offers and internships, then will internally be divided into job categories.
* As of now, the _About_ page, _Contact_ page, _Consulting_ page, and _Corporate_ page are static.
* Rushees may _only_ be created/edited/destroyed from within the Admin interface
* Actives can _only_ see Rushee index and profile pages when signed in