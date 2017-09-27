/**
 * Created by lekanterragon on 9/27/17.
 */


updateHealthierUser = function () {


    $('#updateAccountDetailsBtn').on('click', function (event) {
            event.preventDefault();
            console.log("I got here now");
        let user_details = {
            username : $('#username').val(),
            website : $("#website").val(),
            description : $('#description').val(),
            phone_number : $('#phone_number').val(),
            city : $('#city').val(),
            country : $('#country').val(),
        }
                    console.log(user_details)
    })

};

updateHealthierUser();
