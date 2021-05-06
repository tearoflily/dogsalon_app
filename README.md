# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

* ...

computed: {
search_pets(){

        　return this.pets.filter(p => {
            return p.pet_name.includes(this.search_pet_name)
            && p.customer.last_name.includes(this.search_customer_name)

    　})

}
},
