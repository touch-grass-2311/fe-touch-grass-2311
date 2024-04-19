# Touch Grass 🌱 Backend Application

The Touch Grass fronten application allows a user to sign in via GitHub OAuth and will create a user in the Backend database based on the information we receive from GitHub. Once a user signs in, they will have access to search plants and add plants to their dashboard where they can get specific information on the plant such as scientific name and bloom months.

1. [Welcome Page](#welcome-page)
2. [Plants by id](#plants-by-id)
3. [Search plants](#search-plants)
4. [Create a user](#create-a-user)

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
- Base URL: https://be-touch-grass-d382a872eaa4.herokuapp.com
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

### Plants by id
Details:
1. This endpoint should follow the pattern of `GET /api/v1/plants/:id`

2. If a valid plant id is passed in, a JSON object is sent back with a top-level data key that points to the plant resource with that id, and all attributes for that plant.

3. If an invalid plant id is passed in, a 404 status as well as a descriptive error message shouuld be sent back in response.

Example [#1] 😁

Request: 
```
GET /api/v1/plants/115385
Content-Type: application/json
```
Response: `status: 200`
```
{
  "data": {
    "id": "115431",
    "type": "plant",
    "attributes": {
      "common_name": "Spinach",
      "family_common_name": "",
      "image_url": "https://bs.plantnet.org/image/o/9a94b709c585490a302c614ee638c45f81c35aa2",
      "scientific_name": "Spinacia oleracea",
      "synonyms": [],
      "bloom_months": [
        "jun",
        "jul",
        "aug",
        "sep"
      ],
      "edible": true,
      "edible_part": [
        "leaves"
      ],
      "family": "Amaranthaceae",
      "light": 7,
      "min_precipitation": {
        "mm": null
      },
      "ph_max": 7.5,
      "ph_min": 7
    }
  }
}
```

Example [#2] 😞 

Request:
```
GET /api/v1/plants/11223342 (where `11223342` is an invalid Plant id)
Content-Type: application/json
```
Response: `status: 404`
```
{
"error": "Couldn't find Species with 'id'=11223342"
}
```
### Search plants
Details:

Search a plant by common name or scientific name and a list of 20 plants will populate.
1. This endpoint should follow the pattern `/api/vi/search?q="keyword"`

Query Parameters:
- Must include `q` followed by a string (see example), if not, a 404 status as well as a descriptive error message shouuld be sent back in response.
- Page: can include optional parameter `page` to retrieve plants from multiple pages e.g. `/api/v1/search?q="keyword"&page=1..2`

Example [#1] 😁

Request: 
```
GET /api/v1/search?q=spinach
Content-Type: application/json
```
Response: `status: 200`
```
{
  "data": [
    {
      "id": "115385",
      "type": "plant",
      "attributes": {
        "common_name": "Spinach",
        "family_common_name": "",
        "image_url": "https://bs.plantnet.org/image/o/9a94b709c585490a302c614ee638c45f81c35aa2",
        "scientific_name": "Spinacia oleracea",
        "synonyms": []
      }
    },
  ...
  ]
}
```
Example [#2] 😞 

Request:
```
GET /api/v1/search OR GET /api/v1/search?q=
Content-Type: application/json
```
Response: `status: 404`
```
{
"error": "param is missing or the value is empty: q"
}
```
### Create a user

