// USER DASHBOARD JAVASCRIPT
document.addEventListener("DOMContentLoaded", function() {

    const form = document.querySelector("form");
    const citySelect = document.getElementById("city");
    const packageSelect = document.getElementById("package");
    const amountField = document.getElementById("amount");

    // Package ke hisab se Price auto-fill
    const packagePrices = {
        "Beach Retreat": 15000,
        "Mountain Trek": 12000,
        "Heritage Tour": 10000,
        "Houseboat Special": 18000,
        "Temple Tour": 8000
    };

    if(packageSelect){
        packageSelect.addEventListener("change", function(){
            let selected = this.value;
            if(packagePrices[selected]){
                amountField.value = packagePrices[selected];
            }
        });
    }

    // Form Validation
    if(form){
        form.addEventListener("submit", function(e){
            let name = document.getElementById("name").value.trim();
            let email = document.getElementById("email").value.trim();
            let phone = document.getElementById("phone").value.trim();

            if(name == "" || email == "" || phone == ""){
                alert("Please fill all fields!");
                e.preventDefault();
                return false;
            }

            if(phone.length!= 10){
                alert("Phone number must be 10 digits!");
                e.preventDefault();
                return false;
            }

            // Email validation
            let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            if(!email.match(emailPattern)){
                alert("Please enter valid email!");
                e.preventDefault();
                return false;
            }

            alert("Booking Confirmed! Thank you for booking with us.");
        });
    }
});