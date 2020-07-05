<template>
  <Layout>
    <div class="container">
      <Hero />
      <ImagesGrid :projects="$page.projects.edges" />
    </div>
    <LatestJournals :journals="$page.journals.edges" />
  </Layout>
</template>

<page-query>
query Posts {
	projects: allImagePost {
    edges {
      node {
        id
        date (format: "YYYY")
        title
        categories
        thumbnail (quality: 90)
        path
      }
    }
  },
  journals: allJournalPost (perPage: 4) {
    edges {
      node {
        id
        path
        title
      }
    }
  }
}
</page-query>

<script>
import Hero from "@/components/Hero"
import ImagesGrid from "@/components/ImagesGrid"
// import LatestJournals from "@/components/LatestJournals"

export default {
  components: {
    Hero,
    // LatestJournals,
    ImagesGrid
  }
}
</script>
