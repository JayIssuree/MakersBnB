# MakersBnB Specification

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline Specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### User Stories:

```
Signing Up & Logging In/Out:
As a user, so that I can use the service, I would like to sign up with a username, email and password
As a user, so that someone else can use the service, I would like to log out
As a user, so that I can use the service, I would like to log in
```
```
Listing Spaces:
As a user, so I can have customers, I would like to be able to post a listing
As a user, so I can have customers, I would like to be able to list the dates available for booking
```
```
Booking:
As a user, so I can book a place to stay, I would like to be able to see all available listings
As a user, so I can book a place to stay, I would like to see the dates available for the listing I have selected
As a user, so I can book a place to stay, I would like to send a request to stay for a specific date at the listing
As a user, so I can decide who stays at my property and when, I would like to see all requests for my listings
As a user, so I can decide who stays at my property and when, I would like to approve any request
As a user, so I can book a place to stay, I would like to confirm any approved requests
As a user, so I don't double book, I would like confirmed booking dates not to show up
```

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ???chat??? functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

### Setting up the Database

From the command line in the project directory run the following:
```
rake db:create
```
This creates the databases in the config/database.yml file
