# Touch Grass 🌱 Frontend Application

The Touch Grass fronten application allows a user to sign in via GitHub OAuth and will create a user in the Backend database based on the information we receive from GitHub. Once a user signs in, they will have access to search plants and add plants to their dashboard where they can get specific information on the plant such as scientific name and bloom months.

1. [Welcome Page](#welcome-page)
2. [Plants Search](#plants-search)
3. [Plants Show](#plants-show)

# Collaborators
- Sam Puttman - [Github](https://github.com/SamPuttman)
- Matthew Darlington - [Github](https://github.com/mdarl17)
- Martin Chavez - [Github](https://github.com/Chavezgm)
- Logan Finnegan - [Github](https://github.com/LoganFinnegan)
- Odell McFarland IV - [Github](https://github.com/odellmac4)

# Status
<div style="background-color: #fff3cd; color: #856404; border: 1px solid #ffeeba; padding: 10px; border-radius: 5px;">
  <strong>In Development:</strong> This application is currently under development.
</div>

# Resources
- Docs: [Trefle API](https://docs.trefle.io/)
- [Backend Github Repo](https://github.com/touch-grass-2311/be-touch-grass-2311)
- [Frontend Github Repo](https://github.com/touch-grass-2311/fe-touch-grass-2311)

# User Stories

### Welcome Page
Details: 

As a visitor
When I visit the application's landing page ("/")
there is a button with the label 'Sign in with GitHub' that allows current users to log in with their GitHub credentials
(automatically logged in if currently logged in to GitHub). It also allows new users to register and log in without manually
providing their email and a new password


Example:

<img width="1438" alt="Screenshot 2024-04-19 at 12 03 34 AM" src="https://github.com/touch-grass-2311/fe-touch-grass-2311/assets/149460430/065df554-65d5-4a9e-bbfd-69b5e3954338">

### Plants Search
 Details:

 When a visitor opens the menu/nav and clicks on "Plants Search" and enters a plant by name (common name or scientific name), and then clicks on "Find Your Plant" it leads to the path `/plants/search` where 2-3 pages of plants will return along with their picture and attributes.

### Plants Show
  Details:

  When a visitor clicks on the plant photo from the search page, it leads to the path `/plant/:plant_id` where there will be more specific data such as family common name, hours of light a plant needs, etc.
