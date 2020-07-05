<template>
  <Layout>

    <div class="container">
      <div class="journal-hero">
        <h1 class="journal-header">
          Image Feed
        </h1>
      </div>
    </div>

    <g-link
      :to="item.node.path"
      v-for="item in $page.projects.edges"
      :key="item.node.id"
      class="journal-post"
    >
      <div class="container journal">
        <h2 class="journal-title">{{ item.node.title }}</h2>
        <ul class="categories">
          <li class="category" v-for="cat in item.node.categories" :key="cat">
            {{ cat }}
          </li>
        </ul>
      </div>
    </g-link>

  </Layout>
</template>

<page-query>
query Projects {
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
}
</page-query>

<script>
export default {
}
</script>

<style scoped>
.container.journal {
  max-width: 720px;
}
.journal-hero {
  padding: 4rem 0;
  text-align: center;
  color: var(--color-base-1);
}
.journal-header {
  font-size: 3rem;
  font-weight: 700;
  padding: 0;
  margin: 0;
}
.journal-post {
  display: block;
  padding: 2rem 0;
  text-decoration: none;
  transition: background 0.5s ease;
}
.journal-post h1,
.journal-post h2 {
  margin: 0;
  padding: 0;
}
.journal-title {
  font-size: 2rem;
  color: var(--color-contrast);
}
.journal-excerpt {
  color: var(--color-contrast-1);
}

@media (min-width: 560px) {
  .journal-post {
    padding: 3rem 0;
  }
}

@media (min-width: 860px) {
  .journal-post {
    padding: 5rem 0;
  }
}

.categories {
  display: flex;
  list-style: none;
  padding: 0;
}
.category {
  margin-right: 0.25em;
}
</style>
