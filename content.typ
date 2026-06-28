#import "utils.typ": *

// CV content is sourced from the shared profile hub.
// profile.json is a symlink → ../profile.json (personal/profile.json), the single
// source of truth shared by the resume, the website, and the LinkedIn profile.
#let _data = json("profile.json")

#let personal = _data.personal
#let skills_data = _data.skills

#let work_experience = _data.work_experience.map(e => (
  title: e.title,
  company: e.company,
  location: e.location,
  dates: dates-helper(start-date: e.start, end-date: e.end),
  bullets: e.bullets,
))

#let education = _data.education.map(e => (
  institution: e.institution,
  location: e.location,
  dates: dates-helper(start-date: e.start, end-date: e.end),
  degree: e.degree,
))

#let research = _data.research.map(e => (
  name: e.name,
  dates: dates-helper(start-date: e.start, end-date: e.end),
  url: e.url,
  bullets: e.bullets,
))

#let projects = _data.projects.map(e => (
  name: e.name,
  dates: dates-helper(start-date: e.start, end-date: e.end),
  bullets: e.bullets,
))

#let interests = _data.interests

#let organizations = _data.organizations.map(e => (
  name: e.name,
  role: e.role,
  dates: dates-helper(start-date: e.start, end-date: e.end),
  location: e.location,
))

#let certificates = _data.certificates
#let awards = _data.awards
