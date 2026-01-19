#import "../../utils.typ": *
#import "../../sections.typ": *
#import "../../content.typ": *

#let app-config = json("config.json")

#let include_sections = app-config.at("include_sections")
#let selected_skills = app-config.at("selected_skills")
#let app-position = app-config.at("position")
#let professional-summary = app-config.at("professional_summary", default: "")

#let tailored-work-experience = ()
#for entry in app-config.at("work_experience") {
  tailored-work-experience.push((
    title: entry.at("title"),
    company: entry.at("company"),
    location: entry.at("location"),
    dates: dates-helper(start-date: entry.at("dates").at("start"), end-date: entry.at("dates").at("end")),
    bullets: entry.at("bullets")
  ))
}

#let filtered-education = ()
#for entry in education {
  if not entry.at("institution").contains("George Coșbuc") {
    filtered-education.push(entry)
  }
}

#show: resume.with(
  author: personal.name,
  location: personal.location,
  position: app-position,
  email: personal.email,
  github: personal.github,
  linkedin: personal.linkedin,
  phone: personal.phone,
  accent-color: "#26428b",
)

#let content-blocks = ()
#if should-include("professional_summary", include_sections) {
  if professional-summary != "" {
    content-blocks.push([
      == Professional Summary
      #professional-summary
    ])
  }
}
#if should-include("skills", include_sections) {
  content-blocks.push(skills-section(selected_skills))
}
#if should-include("work_experience", include_sections) {
  content-blocks.push(work-section(tailored-work-experience))
}
#if should-include("education", include_sections) {
  content-blocks.push(education-section(filtered-education))
}

#content-blocks.join()
