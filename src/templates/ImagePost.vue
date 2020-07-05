<template>
  <Layout>
    <div class="project">

      <div class="container">

        <div class="project-header">
          <h1 class="project-title" v-html="$page.post.title" />
          <div class="project-info">

            <div class="year-container">
              <span class="label">Date</span>
              <div/>
              {{$page.post.date}}
            </div>

            <div class="year-container">
              <span class="label">ISO</span>
              <div v-html="$page.post.iso"/>
            </div>

            <div class="year-container">
              <span class="label">Lens</span>
              <div/> {{$page.post.lens}} mm
            </div>

            <div class="year-container">
              <span class="label">f/</span>
              <div/> {{$page.post.fstop}}
            </div>

            <div class="year-container">
              <span class="label">Exp</span>
              <div/> {{$page.post.exposure}}
            </div>

            <!-- <div class="year-container">
              <span class="label">Size</span>
              <div/> {{$page.post.width}}x{{$page.post.height}}
            </div> -->

          </div>
        </div>

        <div v-html="$page.post.content" class="content" />



      <div class="categories-container">
        <div class="categories">
          <span class="label">Categories</span>
          <span
            class="category"
            v-for="(category, index) in $page.post.categories"
            :key="index"
            v-text="category"
          />
        </div>
      </div>

      </div>

    </div>
  </Layout>
</template>

<page-query>
query ImagePost ($path: String!) {
  post: imagePost (path: $path) {
    title
    date (format: "YYYY-MM-DD")
    content
    categories
    iso
    lens
    fstop
    exposure
    width
    height
    project_bg_color
    project_fg_color
  }
}
</page-query>

<script>
export default {
  metaInfo () {
    return {
      title: this.$page.post.title,
      bodyAttrs: {
        style: `background-color: ${this.$page.post.project_bg_color ? this.$page.post.project_bg_color : 'var(--color-base)'}; color: ${this.$page.post.project_fg_color ? this.$page.post.project_fg_color : 'var(--color-contrast)'}`
      }
    }
  }
}
</script>

<style scoped>
.project-header {
  padding: 20vh 0 4rem 0;
}
.project-title {
  font-size: 4rem;
  margin: 0 0 4rem 0;
  padding: 0;
}
.project-info {
  display: flex;
  flex-wrap: wrap;
  font-size: 0.8rem;
}
.project-info > div {
  margin-right: 2rem;
}
.project-info > div:last-of-type {
  margin: 0;
}
.category:after {
  content: ', '
}
.category:last-of-type:after {
  content: '';
}
</style>
