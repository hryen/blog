<#include "../common/layout.ftlh">

<#--header-->
<@header title="New article - " + blogTitle>
</@header>

<#--app-->
<@app>
    <main>
        <form>
            <div class="form-group">
                <label for="Title">Title</label>
                <input type="text" class="form-control" id="Title" autofocus
                       v-model.trim="article.title">
            </div>
            <div class="form-group">
                <label for="Permalink">Permalink</label>
                <input type="text" class="form-control" id="Permalink"
                       v-model.trim="article.permalink">
            </div>
            <div class="form-group">
                <label for="markdownContent">Markdown</label>
                <textarea class="form-control" id="markdownContent" rows="20"
                          v-model.trim="article.markdownContent"></textarea>
            </div>
            <button type="button" class="btn btn-primary" @click="handleSaveArticle">Save</button>
        </form>
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
            methods: {
                handleSaveArticle: function () {

                    if (this.article.title === "" || this.article.permalink === "") {
                        return;
                    }

                    axios.post('/admin/api/articles', {
                        title: this.article.title,
                        permalink: this.article.permalink,
                        markdownContent: this.article.markdownContent
                    }).then(function(response) {
                        if(response.status === 200 && response.data.code === 0) {
                            alert('Successfully saved.');
                            window.location.href = '/admin/article/list';
                        } else {
                            alert('Save failed!\nmsg: ' + response.data.msg);
                        }
                    }).catch(function(error) {
                        alert('Save failed!\nmsg: ' + error);
                    });
                }
            }
        });
    </script>
</@footer>
