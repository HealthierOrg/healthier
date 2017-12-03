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
    }
    else if(status == "error"){
        notify_failure(Cookies.get('message'));
    }
        Cookies.remove('status');
        Cookies.remove('message');
};

addField = function () {
         $(".add-more").click(function(){
          let field_html = $(".check_now").html();
          let value_html = $(".copy_value").html();
          $(".after-add-more-key").after(field_html);
      });
};

checkCookie();

$('#pagination-demo').twbsPagination({
        totalPages: 16,
        visiblePages: 6,
        next: 'Next',
        prev: 'Prev',
        onPageClick: function (event, page) {
            //fetch content and render here
           alert('You clicked me.')
        }
    });

