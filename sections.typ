#import "utils.typ": *

// Module for managing section imports in CV and Resume templates

// Function to include a specific section if it's in the include list
#let should-include(section-name, include-sections) = {
  if include-sections == none {
    return true  // Include all sections by default in the full CV
  }
  if include-sections.contains(section-name) {
    return true  // Include this section if it's in the include list
  }
  return false  // Don't include this section
}

// Section content functions - each returns content wrapped in a function
// This allows conditional inclusion in different resume templates

// Personal information section
#let personal-info(
  name: "",
  position: "",
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
) = {
  (
    name: name,
    position: position,
    location: location,
    email: email, 
    github: github,
    linkedin: linkedin,
    phone: phone
  )
}

// Skills section content
#let skills-section(categories) = {
  [
    == Skills
    #skills(categories: categories)
  ]
}

// Work experience section content
#let work-section(entries) = {
  [
    == Work Experience
    #for (i, entry) in entries.enumerate() {
      work(
        title: entry.at("title", default: ""),
        company: entry.at("company", default: ""),
        location: entry.at("location", default: ""),
        dates: entry.at("dates", default: "")
      )
      if "bullets" in entry {
        for bullet in entry.bullets {
          [- #bullet]
        }
      }
      // Add space between entries, except after the last one
      if i < entries.len() - 1 {
        v(0.5em)
      }
    }
  ]
}

// Education section content
#let education-section(entries) = {
  [
    == Education
    #for (i, entry) in entries.enumerate() {
      edu(
        institution: entry.at("institution", default: ""),
        location: entry.at("location", default: ""),
        dates: entry.at("dates", default: ""),
        degree: entry.at("degree", default: ""),
        gpa: entry.at("gpa", default: "")
      )
      // Add space between entries, except after the last one
      if i < entries.len() - 1 {
        v(0.5em)
      }
    }
  ]
}

// Research section content
#let research-section(entries) = {
  [
    == Research
    #for (i, entry) in entries.enumerate() {
      project(
        name: entry.at("name", default: ""),
        dates: entry.at("dates", default: ""),
        url: entry.at("url", default: "")
      )
      if "bullets" in entry {
        for bullet in entry.bullets {
          [- #bullet]
        }
      }
      // Add space between entries, except after the last one
      if i < entries.len() - 1 {
        v(0.5em)
      }
    }
  ]
}

// Projects section content
#let projects-section(entries) = {
  [
    == Projects
    #for (i, entry) in entries.enumerate() {
      project(
        name: entry.at("name", default: ""),
        dates: entry.at("dates", default: ""),
        url: entry.at("url", default: "")
      )
      if "bullets" in entry {
        for bullet in entry.bullets {
          [- #bullet]
        }
      }
      
      // Add space between entries, except after the last one
      if i < entries.len() - 1 {
        v(0.5em)
      }
    }
  ]
}

// Interests section content
#let interests-section(interests) = {
  [
    == Interests
    #interests.join(", ")
  ]
}

// Organizations section content
#let organizations-section(entries) = {
  [
    == Organizations
    #for (i, entry) in entries.enumerate() {
      extracurriculars(
        activity: entry.at("name", default: "") + ", " + entry.at("role", default: ""),
        dates: entry.at("dates", default: "") + " | " + entry.at("location", default: "")
      )
      if i < entries.len() - 1 {
        v(0.5em)
      }
    }
  ]
}

// Certificates section content
#let certificates-section(entries) = {
  [
    == Certificates
    #for (i, entry) in entries.enumerate() {
      certificates(
        name: entry.at("name", default: ""),
        issuer: entry.at("issuer", default: ""),
        url: entry.at("url", default: ""),
        date: entry.at("date", default: "")
      )
      // Add space between entries, except after the last one
      if i < entries.len() - 1 {
        v(0.5em)
      }
    }
  ]
}

// Awards section content
#let awards-section(entries) = {
  [
    == Awards
    #for (i, entry) in entries.enumerate() {
      extracurriculars(
        activity: entry.at("title", default: "") + ", " + entry.at("organization", default: ""),
        dates: entry.at("date", default: "")
      )
      if i < entries.len() - 1 {
        v(0.5em)
      }
    }
  ]
}