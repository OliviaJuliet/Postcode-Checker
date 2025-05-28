Lsoa.destroy_all
ServedPostcode.destroy_all

Lsoa.create!([ {
    name: "Southwark"
},
{
    name: "Lambeth"
} ])

ServedPostcode.create!([ {
    postcode: "SH241AA"
},
{
    postcode: "SH241AB"
} ])
