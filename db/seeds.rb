# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
initial_colors = [
    {
        name: 'subtle green',
        color: '#164B35'
    },
    {
        name: 'subtle yellow',
        color: '#7F5F01'
    },
    {
        name: 'subtle orange',
        color: '#702E00'
    },
    {
        name: 'subtle red',
        color: '#5D1F1A'
    },
    {
        name: 'subtle purple'
        color: '#352C63'
    },
    {
        name: 'green',
        color: '#216E4E'
    },
    {
        name: 'yellow',
        color: '#7F5F01'
    },
    {
        name: 'orange',
        color: '#A54800'
    },
    {
        name: 'red',
        color: '#AE2E24'
    },
    {
        name: 'purple',
        color: '#5E4DB2'
    },
    {
        name: 'bold green',
        color: '#4BCE97'
    },
    {
        name: 'bold yellow',
        color: '#E2B203'
    },
    {
        name: 'bold orange',
        color: '#FEA362'
    },
    {
        name: 'bold red',
        color: '#F87168'
    },
    {
        name: 'bold purple',
        color: '#9F8FEF'
    },
    {
        name: 'subtle blue',
        color: '#09326C'
    },
    {
        name: 'subtle sky',
        color: '#164555'
    },
    {
        name: 'subtle lime',
        color: '#37471F'
    },
    {
        name: 'subtle pink',
        color: '#50253F'
    },
    {
        name: 'subtle black',
        color: '#454F59'
    },
    {
        name: 'blue',
        color: '#0055CC'
    },
    {
        name: 'sky',
        color: '#206A83'
    },
    {
        name: 'lime',
        color: '#4C6B1F'
    },
    {
        name: 'pink',
        color: '#943D73'
    },
    {
        name: 'black',
        color: '#596773'
    },
    {
        name: 'bold blue',
        color: '#579DFF'
    },
    {
        name: 'bold sky',
        color: '#6CC3E0'
    },
    {
        name: 'bold lime',
        color: '#94C748'
    },
    {
        name: 'bold pink',
        color: '#E774BB'
    },
    {
        name: 'bold black',
        color: '#8C9BAB'
    }
]

initial_colors.each do |color|
    Color.create(name: color[:name], color: color[:color])
end