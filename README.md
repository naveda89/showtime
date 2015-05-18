# showtime [(live demo)](https://onshowtime.herokuapp.com)
> REST API in Ruby of a Multimedia store

A live demo is available at [onshowtime.herokuapp.com](https://onshowtime.herokuapp.com).

## Usage
```
git clone git@github.com:naveda89/showtime.git
cd showtime
bundle install
rake db:reset
foreman start
```
## Testing
Run `rspec` on terminal.
> Source available at [**specs**](/specs) directory.

## Resources endpoints
> All results are paginated
- [/api/v1/contents](https://onshowtime.herokuapp.com/api/v1/contents) - Retrieves all contents
- [/api/v1/movies](https://onshowtime.herokuapp.com/api/v1/movies) - Retrieves all movies
- [/api/v1/seasons](https://onshowtime.herokuapp.com/api/v1/seasons) - Retrieves all seasons
- [/api/v1/purchases](https://onshowtime.herokuapp.com/api/v1/purchases) - Retrieves all alive purchases from a user

> Example of results from *[/api/v1/contents](https://onshowtime.herokuapp.com/api/v1/contents)*
```json
{
  contents: [
    {
      type: "movies",
      slug: "peyton-wyman",
      title: "Peyton Wyman",
      plot: "Aliquam similique id ut sit ipsa pariatur sed. Aspernatur id inventore dolorem veniam quod sunt. Quia dolor error repellat omnis architecto. Eligendi dolorum nesciunt velit aut nihil quo. Maxime asperiores ex sint fugit impedit corporis.",
      content_purchase_options: [
        {
          id: 1,
          price: "8.03",
          quality: "hd"
        },
        {
          id: 2,
          price: "4.13",
          quality: "sd"
        }
      ]
    },
    ...
  ]
}
```

### Movies
- `/api/v1/movies`
- `/api/v1/movies/:id`

### Seasons / Episodes
- `/api/v1/seasons`
- `/api/v1/seasons/:id`
- `/api/v1/seasons/:season_id/episodes/:id`

### Purchases
- `/api/v1/purchases` **user_id** parameter required!

## Pagination
> In route pagination:
- [/api/v1/contents/page/1](https://onshowtime.herokuapp.com/api/v1/contents/page/1)
- [/api/v1/movies/page/1](https://onshowtime.herokuapp.com/api/v1/movies/page/1)
- [/api/v1/seasons/page/1](https://onshowtime.herokuapp.com/api/v1/seasons/page/1)
- [/api/v1/purchases/page/1](https://onshowtime.herokuapp.com/api/v1/purchases/page/1)

> Or query string pagination:
- [/api/v1/contents?page=1](https://onshowtime.herokuapp.com/api/v1/contents?page=1)
- [/api/v1/movies?page=1](https://onshowtime.herokuapp.com/api/v1/movies?page=1)
- [/api/v1/seasons?page=1](https://onshowtime.herokuapp.com/api/v1/seasons?page=1)
- [/api/v1/purchases?page=1](https://onshowtime.herokuapp.com/api/v1/purchases?page=1)

## Caching
- Stored into a **redis** database.
- Fragment caching of [**serializers**](/app/serializers).
- Set to 3 hours on almost all resources.
