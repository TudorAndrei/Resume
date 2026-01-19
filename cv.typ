#import "utils.typ": *
#import "sections.typ": *
#import "content.typ": personal, skills_data, work_experience, education, research, projects, certificates, organizations, awards, interests

#show: resume.with(
  author: personal.name,
  location: personal.location,
  position: personal.position,
  email: personal.email,
  github: personal.github,
  linkedin: personal.linkedin,
  phone: personal.phone,
  accent-color: "#26428b",
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)

#skills-section(skills_data)
#work-section(work_experience)
#education-section(education)
#research-section(research)
#projects-section(projects)
#certificates-section(certificates)
#organizations-section(organizations)
#awards-section(awards)
#interests-section(interests)
