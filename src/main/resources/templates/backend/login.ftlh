<#include "common/layout.ftlh">
<@header title="Log in to " + blogTitle></@header>
<@body breadcrumb=false>
    <div class="container message is-danger" :class="{ 'is-hidden': isHidden }">
        <p class="message-body">{{ message }}</p>
    </div>
    <div id="login" class="container">
        <form @submit.prevent="handleSubmit">
            <div class="field">
                <label class="label">Username</label>
                <div class="control">
                    <input class="input" type="text" placeholder="Username" autofocus
                           v-model.trim="username">
                </div>
            </div>
            <div class="field">
                <label class="label">Password</label>
                <div class="control">
                    <input class="input" type="password" placeholder="Password"
                           v-model="password">
                </div>
            </div>
            <div class="field">
                <div class="control">
                    <button class="button is-info"
                            :class="{ 'is-loading' : isLoad }">Log in</button>
                </div>
            </div>
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