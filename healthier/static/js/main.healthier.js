/**
 * Created by lekanterragon on 9/27/17.
 */

toastr.options.closeButton = true;

notify_success = function (message) {
                toastr.options = {
                  "closeButton": true,
                  "positionClass": "toast-top-center",
}
                toastr.success(message)

};

notify_failure = function (message) {
        toastr.error(message)
};

notify_danger = function (message) {
        toastr.warning(message);
};

checkCookie = function () {
    let status = Cookies.get('status');
    if(status == "True"){
        notify_success(Cookies.get('message'));
        Cookies.remove('status');
        Cookies.remove('message');
        console.log(Cookies.get('status'))
    }
    console.log(status)
};

checkCookie();

