<#include "../common/layout.ftlh">

<#--header-->
<@header title="Edit article - " + blogTitle>
</@header>

<#--app-->
<@app>
    <main>
        <div class="ui form">
            <div class="field">
                <label>Title</label>
                <input type="text" v-model.trim="article.title">
            </div>

            <div class="field">
                <label>Permalink</label>
                <input type="text" v-model.trim="article.permalink">
            </div>

            <div class="field">
                <label>Markdown</label>
                <textarea rows="30" v-model.trim="article.markdownContent" autofocus></textarea>
            </div>

            <button class="ui primary button" @click="handleSaveArticle">Save</button>
        </div>
    </main>
</@app>

<#--footer-->
<@footer>
    <script>
        new Vue({
            el: '#app',
            data: {
                article: {
                    title: '',
                    permalink: '',
                    markdownContent: ''
                }
            },
            mounted: function () {
                axios.get('/admin/api/articles/${id}').then((response) => {
                    const data = response.data.data;
                    this.article.title = data.title;
                    this.article.permalink = data.permalink;
                    this.article.markdownContent = data.markdownContent;
                });
            },
            methods: {
                handleSaveArticle: function() {

                    if (this.article.title === "" || this.article.permalink === "") {
                        return;
                    }

                    axios.put('/admin/api/articles/${id}', {
                        title: this.article.title,
                        permalink: this.article.permalink,
                        markdownContent: this.article.markdownContent
                    }).then((response) => {
                        if(response.status === 200 && response.data.code === 0) {
                        alert('Successfully updated.');
                        window.location.href = '/admin/article/list';
                    } else {
                        alert('Updated failed!\nmsg: ' + response.data.msg);
                    }
                }).catch((error) => {
                        alert('Updated failed!\nmsg: ' + response.data.msg);
                });
                }
            }
        });
    </script>
</@footer>
