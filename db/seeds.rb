admin = User.find_or_create_by!(email: "admin@supera.com") do |user|
  user.name = "System Admin"
  user.password = "admin@123"
  user.password_confirmation = "admin@123"
  user.role = :admin
end

puts "Created admin user: #{admin.email}"

# Sample Events
events_data = [
  {
    name: "Tech Meetup 2025",
    description: "Join us for an evening of tech talks and networking. Learn about the latest trends in web development, AI, and startup culture.",
    date: 1.month.from_now.change(hour: 19),
    location: "São Paulo, SP",
    published: true,
    created_by_id: admin.id
  },
  {
    name: "Product Summit",
    description: "Annual product management summit featuring industry leaders sharing roadmap strategies and best practices.",
    date: 2.months.from_now.change(hour: 9),
    location: "Florianópolis, SC",
    published: true,
    created_by_id: admin.id
  },
  {
    name: "AI Workshop Series",
    description: "Hands-on workshop series covering machine learning fundamentals, practical applications, and ethical considerations.",
    date: 3.months.from_now.change(hour: 14),
    location: "Curitiba, PR",
    published: true,
    created_by_id: admin.id
  }
]

events_data.each do |event_attrs|
  Event.find_or_create_by!(name: event_attrs[:name]) do |event|
    event.assign_attributes(event_attrs)
  end
end

# Sample Roles
roles_data = [
  {
    name: "Senior Backend Developer",
    description: "Join our engineering team to build scalable web applications using Ruby on Rails and modern technologies.",
    company: "Spheric Technologies",
    location: "Remote / São Paulo, SP",
    salary: "R$ 15.000 - R$ 20.000",
    contact: "Human Resources",
    email: "careers@spheric.com",
    benefits: ["Vale Refeição", "Plano de Saúde", "Home Office", "Plano de Carreira"],
    requirements: "5+ years Rails experience, PostgreSQL, Docker, AWS knowledge preferred",
    published: true,
    created_by_id: admin.id
  },
  {
    name: "Frontend Engineer",
    description: "Create amazing user experiences with React, TypeScript and modern frontend technologies.",
    company: "Spheric Technologies",
    location: "São Paulo, SP",
    salary: "R$ 12.000 - R$ 18.000",
    contact: "Tech Team Lead",
    email: "frontend-jobs@spheric.com",
    benefits: ["Vale Refeição", "Plano de Saúde", "Vale Transporte"],
    requirements: "React, TypeScript, CSS-in-JS, testing experience with Jest/RTL",
    published: true,
    created_by_id: admin.id
  },
  {
    name: "DevOps Engineer",
    description: "Help us scale our infrastructure and improve our deployment processes using cloud technologies.",
    company: "Spheric Technologies",
    location: "Remote",
    salary: "R$ 18.000 - R$ 24.000",
    contact: "Infrastructure Team",
    email: "devops@spheric.com",
    benefits: ["Vale Refeição", "Plano de Saúde", "Home Office", "Seguro de Vida"],
    requirements: "AWS/GCP, Terraform, Kubernetes, CI/CD pipelines, monitoring tools",
    published: true,
    created_by_id: admin.id
  }
]

roles_data.each do |role_attrs|
  Role.find_or_create_by!(name: role_attrs[:name], company: role_attrs[:company]) do |role|
    role.assign_attributes(role_attrs)
  end
end

# Sample Projects
projects_data = [
  {
    name: "Corporate Website Redesign",
    description: "Complete redesign of our marketing website with focus on user experience, performance, and modern design principles.",
    location: "Remote",
    date: 2.months.from_now.to_date,
    contact: "design@spheric.com",
    published: true,
    created_by_id: admin.id
  },
  {
    name: "Data Analytics Pipeline",
    description: "Build a comprehensive ETL pipeline for business intelligence and analytics using modern data engineering tools.",
    location: "Remote / São Paulo, SP",
    date: 3.months.from_now.to_date,
    contact: "data-team@spheric.com",
    published: true,
    created_by_id: admin.id
  },
  {
    name: "Mobile App MVP",
    description: "Development of iOS and Android mobile application prototype to validate product-market fit.",
    location: "Curitiba, PR",
    date: 4.months.from_now.to_date,
    contact: "mobile-dev@spheric.com",
    published: true,
    created_by_id: admin.id
  }
]

projects_data.each do |project_attrs|
  Project.find_or_create_by!(name: project_attrs[:name]) do |project|
    project.assign_attributes(project_attrs)
  end
end

puts "Seeded: #{Event.count} events, #{Role.count} roles, #{Project.count} projects"
puts "✅ Database seeded successfully!"