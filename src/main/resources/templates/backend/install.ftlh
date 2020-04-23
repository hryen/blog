<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Install</title>
    <link rel="preconnect" href="https://cdn.jsdelivr.net">
    <link href="https://cdn.jsdelivr.net/gh/Semantic-Org/Semantic-UI-CSS@2.4.1/semantic.min.css" rel="stylesheet">
    <style>
        main.install {
            padding: 100px 20px 20px 20px;
            max-width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div id="app">
    <main class="install">

        <h2 class="ui center aligned icon header">
            <i class="circular user icon"></i>
            Create a user
        </h2>

        <div v-if="errorVisible" class="ui red message">{{ errorMessage }}</div>

        <div class="ui form">
            <div class="field">
                <label>Username</label>
                <input type="text" v-model.trim="username" @input="handleCheckInput">
            </div>

            <div class="field">
                <label>Password</label>
                <input type="password" v-model="password" @input="handleCheckInput">
            </div>

            <div id="confirmPasswordField" class="field">
                <label>Confirm Password</label>
                <input type="password" v-model="confirmPassword" @input="handleCheckInput">
            </div>

            <button id="submitButton" class="fluid ui button primary disabled" @click="handleInstall">Submit</button>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/gh/vuejs/vue@2.6.11/dist/vue.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/axios/axios@0.19.2/dist/axios.min.js"></script>
<script>
    new Vue({
        el: '#app',
        data: {
            username: '',
            password: '',
            confirmPassword: '',
            errorVisible: false,
            errorMessage: ''
        },
        methods: {
            handleCheckInput: function () {
                let hasError = false;

                if(this.username === '' || this.password === '' || this.confirmPassword === '') {
                    hasError = true;
                }

                if(this.password !== this.confirmPassword) {
                    document.getElementById('confirmPasswordField').className = 'field error';
                    hasError = true;
                } else {
                    document.getElementById('confirmPasswordField').className = 'field';
                }

                if(hasError) {
                    document.getElementById('submitButton').className = 'fluid ui button primary disabled';
                    return false;
                } else {
                    document.getElementById('submitButton').className = 'fluid ui button primary';
                    return true;
                }
            },
            handleInstall: function () {
                let ok = this.handleCheckInput();
                if(ok) {
                    let _this = this;
                    axios.post('/admin/install', {
                        username: _this.username,
                        password: _this.password
                    }).then(function (response) {
                        if(response.status === 200 && response.data.code === 0) {
                            window.location.href = '/admin/login';
                        } else {
                            _this.errorMessage = 'Error: ' + response.data.msg;
                            _this.errorVisible = true;
                        }
                    }).catch(function (error) {
                        _this.errorMessage = 'Error: ' + error;
                        _this.errorVisible = true;
                    });
                }
            }
        }
    })
</script>
</body>
</html>
