#import "@preview/fontawesome:0.6.0": *

#let icon-link-generator(
  name,
  url,
  icon_name,
  ..args
) = {
    if name.len() == 0 {
      panic("The name must contain at least one character")
    }

    if url.len() == 0 {
      panic("The url must contain at least one character")
    }

    let styled_text = text(
      name,
      ..args
    )

    let clickable_link = url

    // unify all links
    // Google Scholar doesn't find the profile if a slash is appended -.-'
    if not clickable_link.ends-with("/") and not clickable_link.contains("scholar.google") {
      clickable_link = clickable_link + "/"
    }

    // Return all content wrapped in a single content block
    [
      #fa-icon(icon_name)
      #" "
      #link(clickable_link)[#styled_text]
    ]
}


#let facebook-info(
  name,
  url: "https://www.facebook.com/",
  ..args
) = {
  icon-link-generator(name, url, "facebook", ..args)
}

#let instagram-info(
  name,
  url: "https://www.instagram.com/",
  ..args
) = {
  icon-link-generator(name, url, "instagram", ..args)
}

#let tiktok-info(
  name,
  url: "https://www.tiktok.com/@",
  ..args
) = {
  // icon-link-generator(name, url, fa-icon.with("tiktok", font: "Font Awesome 6 Brands"), ..args)
  icon-link-generator(name, url, fa-icon.with("tiktok"), ..args)
}

#let youtube-info(
  name,
  url: "https://www.youtube.com/@",
  ..args
) = {
  icon-link-generator(name, url, "youtube", ..args)
}

#let vimeo-info(
  name,
  url: "https://vimeo.com/",
  ..args
) = {
  icon-link-generator(name, url, "vimeo", ..args)
}

#let linkedin-info(
  name,
  url: "https://www.linkedin.com/",
  ..args
) = {
  icon-link-generator(name, url, "linkedin", ..args)
}

#let xing-info(
  name,
  url: "https://www.xing.com/",
  ..args
) = {
  icon-link-generator(name, url, "xing", ..args)
}

#let github-info(
  name,
  url: "https://github.com/",
  ..args
) = {
  icon-link-generator(name, url, "github", ..args)
}

#let gitlab-info(
  name,
  url: "https://gitlab.com/",
  ..args
) = {
  icon-link-generator(name, url, "gitlab", ..args)
}

#let bitbucket-info(
  name,
  url: "https://bitbucket.org/",
  ..args
) = {
  icon-link-generator(name, url, "bitbucket", ..args)
}


#let docker-info(
  name,
  url: "https://hub.docker.com/",
  ..args
) = {
  icon-link-generator(name, url, "docker", ..args)
}

#let stackoverflow-info(
  name,
  url: "https://stackoverflow.com/",
  ..args
) = {
  // icon-link-generator(name, url, fa-icon.with("stack-overflow", font: "Font Awesome 6 Brands"), ..args)
  icon-link-generator(name, url, fa-icon.with("stack-overflow"), ..args)
}

#let stackexchange-info(
  name,
  url: "https://stackexchange.com/",
  ..args
) = {
  // icon-link-generator(name, url, fa-icon.with("stack-exchange", font: "Font Awesome 6 Brands"), ..args)
  icon-link-generator(name, url, fa-icon.with("stack-exchange"), ..args)
}

#let skype-info(
  name,
  url: "https://www.skype.com/",
  ..args
) = {
  icon-link-generator(name, url, "skype", ..args)
}

#let discord-info(
  name,
  url: "https://discord.com/",
  ..args
) = {
  icon-link-generator(name, url, "discord", ..args)
}

#let twitter-info(
  name,
  url: "https://twitter.com/",
  ..args
) = {
  icon-link-generator(name, url, "twitter", ..args)
}

#let x-twitter-info(
  name,
  url: "https://x.com/",
  ..args
) = {
  icon-link-generator(name, url, fa-icon.with("\u{e61b}"), ..args)
}

#let orcid-info(
  name,
  url: "https://orcid.org/",
  ..args
) = {
  // icon-link-generator(name, url, fa-icon.with("orcid", font: "Font Awesome 6 Brands"), ..args)
  icon-link-generator(name, url, fa-icon.with("orcid"), ..args)
}


#let google-scholar-info(
  name,
  url: "https://scholar.google.com/citations?user=",
  ..args
) = {
  icon-link-generator(name, url, fa-icon.with("google-scholar"), ..args)
}
