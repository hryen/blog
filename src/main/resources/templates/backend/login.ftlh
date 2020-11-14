<#include "common/layout.ftlh">
<@header title="Log in to " + blogTitle>
    <style>
        .section {
            padding-top: 6rem;
        }
        form {
            padding: 2.5rem;
            box-shadow: 0 0 1px 2px #0000000d;
            border-radius: 5px;
        }
        .text-align-center {
            text-align: center;
        }
    </style>
</@header>
<@body breadcrumb=false>
    <div class="container message is-danger" :class="{ 'is-hidden': isHidden }">
        <p class="message-body">{{ message }}</p>
    </div>
    <div id="login" class="container">
        <form @submit.prevent="handleSubmit">
            <h1 class="title is-4 text-align-center">Login in to ${blogTitle}</h1>
            <div class="field">
                <label class="label">Username</label>
                <div class="control">
                    <input class="input is-small" type="text" v-model.trim="username" autofocus>
                </div>
            </div>
            <div class="field">
                <label class="label">Password</label>
                <div class="control">
                    <input class="input is-small" type="password" v-model="password">
                </div>
            </div>
            <div class="field">
                <div class="control">
                    <button class="button is-link is-fullwidth" :class="{ 'is-loading' : isLoad }">Log in</button>
                </div>
            </div>
            <div class="text-align-center"><a href="/">← Back to the homepage</a></div>
        </form>
    </div>
</@body>
<@footer>
    <script>
        new Vue({
            el: '#app',
            data: {
                username: '',
                password: '',
                isLoad: false,
                isHidden: true,
                message: ''
            },
            methods: {
                handleSubmit: function () {
                        let _this = this;
                        _this.isLoad = true;
                        axios.post('/admin/login', {
                            username: _this.username,
                            password: _this.password
                        }).then(function (response) {
                            if(response.status === 200 && response.data.code === 0) {
                                window.location.href = '/admin/article/list';
                            } else {
                                _this.message = 'Login failed: ' + response.data.msg;
                                _this.isHidden = false;
                                _this.isLoad = false;
                            }
                        }).catch(function (error) {
                            _this.message = 'Login failed: ' + error;
                            _this.isHidden = false;
                            _this.isLoad = false;
                        });
                    }
                }
        });
    </script>
</@footer>