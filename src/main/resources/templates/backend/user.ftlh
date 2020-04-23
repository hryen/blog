<#include "common/layout.ftlh">

<#--header-->
<@header title="User - " + blogTitle>
    <style>
        main.user {
            max-width: 600px;
        }
    </style>
</@header>

<#--app-->
<@app>
    <main class="user">
        <h2 class="ui dividing header">Change Password</h2>

        <div class="ui form">
            <div class="field">
                <label>Old password</label>
                <input type="password" placeholder="Old password" v-model="user.oldPassword">
            </div>
            <div class="field">
                <label>New Password</label>
                <input type="password" placeholder="New Password" v-model="user.newPassword">
            </div>
            <div class="field">
                <label>Confirm New Password</label>
                <input type="password" placeholder="Confirm New Password" v-model="user.confirmNewPassword">
            </div>
            <button class="ui button" @click="handleUpdatePassword">Submit</button>
        </div>

        <div v-if="errorVisible" class="ui negative message">
            <div class="header">Updated failed</div>
            <ul class="list">
                <li v-for="msg in errorMsgList">{{ msg }}</li>
            </ul>
        </div>
    </main>
</@app>

<#--footer-->
<@footer>
    <script>
        document.getElementById('user').className += 'active';

        new Vue({
            el: '#app',
            data: {
                errorVisible: false,
                errorMsgList: [],
                user: {
                    oldPassword: '',
                    newPassword: '',
                    confirmNewPassword: ''
                }
            },
            methods: {
                handleUpdatePassword: function () {
                    this.errorVisible = false;
                    this.errorMsgList = [];

                    if(null === this.user.oldPassword || '' === this.user.oldPassword) {
                        this.errorMsgList.push('Please enter old password');
                    }

                    if(null === this.user.newPassword || '' === this.user.newPassword) {
                        this.errorMsgList.push('Please enter new password');
                    }

                    if(null === this.user.confirmNewPassword || '' === this.user.confirmNewPassword) {
                        this.errorMsgList.push('Please enter comfirm new password');
                    }

                    if(this.user.newPassword !== this.user.confirmNewPassword) {
                        this.errorMsgList.push('New passwords do not match');
                    }

                    if(this.errorMsgList.length !== 0) {
                        this.errorVisible = true;
                    } else {
                        var _this = this;
                        axios.put('/admin/api/user/password', {
                            oldPassword: _this.user.oldPassword,
                            newPassword: _this.user.newPassword
                        }).then(function (response) {
                            if(response.status === 200 && response.data.code === 0) {
                                window.location.href = '/admin/logout';
                            } else {
                                _this.errorMsgList = [response.data.msg];
                                _this.errorVisible = true;
                            }
                        }).catch(function (error) {
                            _this.errorMsgList = [error];
                            _this.errorVisible = true;
                        });
                    }
                }
            }
        });
    </script>
</@footer>
