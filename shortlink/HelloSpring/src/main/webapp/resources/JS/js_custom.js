 function ValidURL() {
            var str = document.getElementById('input_url').value;
            /*      var regex = /(http|https):\/\/(\w+:{0,1}\w*)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%!\-\/]))?/;*/
            /* https://stackoverflow.com/questions/8667070/javascript-regular-expression-to-validate-url */
            var regex = /^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff0-9fff]{2,})))(?::\d{2,5})?(?:[/?#]\S*)?$/
            if (str == "") {
                document.getElementById('ErrMer').innerHTML = "Vui lòng nhập URL";
                $('#hideLink').empty();
                return false;
            } else if (!regex.test(str)) {
                document.getElementById('ErrMer').innerHTML = "URL này không tồn tại";
                document.getElementById('lba').innerHTML = str;
                $('#hideLink').empty();
                return false;
            } else {
                debugger;
                /* var lba = document.getElementById('link_bien_a').getAttribute('href');
                 document.getElementById('lba').innerHTML = lba;
                 document.getElementById('lba').setAttribute('href',lba);*/
                return true;
            }
        }