<#include "common/layout.ftlh">

<#--header-->
<@header title="Settings - " + blogTitle>
    <style>
        main.settings {
            max-width: 600px;
        }
    </style>
</@header>

<#--app-->
<@app>
    <main class="settings">
        <h2 class="ui dividing header">Blog Settings</h2>

        <div class="ui form">
            <div class="field">
                <label>Blog Title</label>
                <input type="text" v-model.trim="setting.blogTitle">
            </div>
            <div class="field">
                <label>Blog Owner</label>
                <input type="text" v-model.trim="setting.blogOwner">
            </div>
            <div class="field">
                <label>Index Page Size</label>
                <input type="number" v-model="setting.indexPageSize">
            </div>
            <button class="ui button" @click="handleUpdateSettings">Submit</button>
        </div>

        <div v-if="messageVisible" :class="messageGood ? 'ui green message' : 'ui red message'">{{ message }}</div>
    </main>
</@app>

<#--footer-->
<@footer>
    <script>
        document.getElementById('settings').className += 'active';

        new Vue({
            el: '#app',
            data: {
                setting: {
                    blogTitle: '',
                    blogOwner: '',
                    indexPageSize: 0
                },
                messageVisible: false,
                messageGood: true,
                message: ''
            },
            mounted: function () {
                this.handleGetSettings();
            },
            methods: {
                handleGetSettings: function () {
                    var _this = this;
                    axios.get('/admin/api/settings')
                        .then(function (response) {
                            if(response.status === 200 && response.data.code === 0) {
                                _this.setting.blogTitle = response.data.data.blogTitle;
                                _this.setting.blogOwner = response.data.data.blogOwner;
                                _this.setting.indexPageSize = response.data.data.indexPageSize;
                            } else {
                                _this.messageGood = false;
                                _this.message = 'Get settings failed: ' + response.data.msg;
                                _this.messageVisible = true;
                            }
                        }).catch(function (error) {
                            _this.messageGood = false;
                            _this.message = 'Get settings failed: ' + error;
                            _this.messageVisible = true;
                        });
                },
                handleUpdateSettings: function () {
                    var _this = this;
                    axios.put('/admin/api/settings', {
                        blogTitle: _this.setting.blogTitle,
                        blogOwner: _this.setting.blogOwner,
                        indexPageSize: _this.setting.indexPageSize
                    }).then(function (response) {
                        if(response.status === 200 && response.data.code === 0) {
                            _this.messageGood = true;
                            _this.message = 'Successfully updated!';
                            _this.messageVisible = true;
                        } else {
                            _this.messageGood = false;
                            _this.message = 'Updated failed: ' + response.data.msg;
                            _this.messageVisible = true;
                        }
                    }).catch(function (error) {
                        _this.messageGood = false;
                        _this.message = 'Updated failed: ' + error;
                        _this.messageVisible = true;
                    });
                }
            }
        });
    </script>
</@footer>
