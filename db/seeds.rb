# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "admin@supera.com", password: "admin@123", password_confirmation: "admin@123", name: "Admin")

# db/seeds.rb

events = [
  { name: "Tech Meetup", description: "Evening talks + networking", date: Time.zone.parse("2025-09-10 19:00"), location: "São Paulo" },
  { name: "Product Summit", description: "Roadmaps & PM best practices", date: Time.zone.parse("2025-10-05 09:00"), location: "Florianópolis" },
  { name: "AI Workshop", description: "Hands-on ML intro", date: Time.zone.parse("2025-11-20 14:00"), location: "Curitiba" }
]

roles = [
  { name: "Backend Developer", description: "Rails + Postgres", company: "Spheric", location: "Remote", salary: "R$15k-20k", contact: "HR", email: "jobs@spheric.com", benefits: ["VR/VA", "Health"], requirements: "Rails, SQL, Docker" },
  { name: "Frontend Engineer", description: "React + TypeScript", company: "Spheric", location: "São Paulo", salary: "R$12k-18k", contact: "HR", email: "jobs@spheric.com", benefits: ["VR/VA", "Health"], requirements: "React, TS, CSS" },
  { name: "DevOps Engineer", description: "AWS + CI/CD", company: "Spheric", location: "Remote", salary: "R$18k-24k", contact: "HR", email: "jobs@spheric.com", benefits: ["VR/VA", "Health"], requirements: "AWS, Terraform, Kubernetes" }
]

projects = [
  { name: "Site Revamp", description: "Marketing site redesign", location: "Remote", date: Date.new(2025, 9, 30), contact: "design@spheric.com" },
  { name: "Data Pipeline", description: "ETL for analytics", location: "Remote", date: Date.new(2025, 10, 15), contact: "data@spheric.com" },
  { name: "Mobile MVP", description: "iOS/Android prototype", location: "Curitiba", date: Date.new(2025, 11, 10), contact: "mobile@spheric.com" }
]

# Prefer upsert_all (Rails 6+) to avoid duplicates if re-seeding
if Admins::Event.respond_to?(:upsert_all)
  Admins::Event.upsert_all(events, unique_by: :index_admins_events_on_name) rescue events.each { |e| Admins::Event.find_or_create_by!(name: e[:name]) { |r| r.assign_attributes(e) } }
  Admins::Role.upsert_all(roles, unique_by: :index_admins_roles_on_name)   rescue roles.each { |e| Admins::Role.find_or_create_by!(name: e[:name]) { |r| r.assign_attributes(e) } }
  Admins::Project.upsert_all(projects, unique_by: :index_admins_projects_on_name) rescue projects.each { |e| Admins::Project.find_or_create_by!(name: e[:name]) { |r| r.assign_attributes(e) } }
else
  events.each   { |e| Admins::Event.find_or_create_by!(name: e[:name])   { |r| r.assign_attributes(e) } }
  roles.each    { |e| Admins::Role.find_or_create_by!(name: e[:name])    { |r| r.assign_attributes(e) } }
  projects.each { |e| Admins::Project.find_or_create_by!(name: e[:name]) { |r| r.assign_attributes(e) } }
end

puts "Seeded: #{Admins::Event.count} events, #{Admins::Role.count} roles, #{Admins::Project.count} projects."
