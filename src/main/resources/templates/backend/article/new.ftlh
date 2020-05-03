<#include "../common/layout.ftlh">
<@header title="New article - " + blogTitle></@header>
<@body>
    <div class="container message is-danger" :class="{ 'is-hidden': isHidden }">
        <p class="message-body">{{ message }}</p>
    </div>
    <div class="container">
        <div class="field">
            <div class="control">
                <input class="input" type="text" placeholder="Title"
                       v-model.trim="article.title"
                       :autofocus="autofocus" :disabled="inputDisabled">
            </div>
        </div>
        <div class="field">
            <div class="control">
                <input class="input" type="text" placeholder="Permalink"
                       v-model.trim="article.permalink" :disabled="inputDisabled">
            </div>
        </div>
        <div class="field">
            <div class="control">
                <textarea class="textarea" placeholder="Markdown..." rows="20"
                          v-model.trim="article.markdownContent" :disabled="inputDisabled">
                </textarea>
            </div>
        </div>
        <div class="field">
            <div class="control">
                <button class="button is-info" :class="{ 'is-loading' : isLoad }"
                        @click="handleSaveArticle">Save</button>
            </div>
        </div>
    </div>
</@body>
<@footer>
    <script>
        document.getElementById('article-new').className = 'is-active';
        new Vue({
            el: '#app',
            data: {
                article: {
                    title: '',
                    permalink: '',
                    markdownContent: ''
                },
                autofocus: true,
                isLoad: false,
                inputDisabled: false,
                isHidden: true,
                message: ''
            },
            methods: {
                handleSaveArticle: function () {
                    let _this = this;
                    if (_this.article.title === ""
                        || _this.article.permalink === ""
                        || _this.article.markdownContent === "") {
                        return;
                    }
                    _this.inputDisabled = true;
                    _this.isLoad = true;
                    axios.post('/admin/api/articles', {
                        title: _this.article.title,
                        permalink: _this.article.permalink,
                        markdownContent: _this.article.markdownContent
                    }).then(function(response) {
                        if(response.status === 200 && response.data.code === 0) {
                            alert('Saved successfully');
                            window.location.href = '/admin/article/list';
                        } else {
                            _this.message = 'Save failed: ' + response.data.msg;
                            _this.isHidden = false;
                            _this.inputDisabled = false;
                            _this.isLoad = false;
                        }
                    }).catch(function(error) {
                        _this.message = 'Save failed: ' + error;
                        _this.isHidden = false;
                        _this.inputDisabled = false;
                        _this.isLoad = false;
                    });
                }
            }
        });
    </script>
</@footer>