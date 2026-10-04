// ADMIN DASHBOARD JAVASCRIPT
document.addEventListener("DOMContentLoaded", function() {

    // 1. Search Functionality - Bookings table me search
    const searchInput = document.getElementById("searchInput");
    if(searchInput){
        searchInput.addEventListener("keyup", function(){
            let filter = this.value.toLowerCase();
            let rows = document.querySelectorAll("#bookingTable tr");

            rows.forEach(row => {
                let text = row.textContent.toLowerCase();
                row.style.display = text.includes(filter)? "" : "none";
            });
        });
    }

    // 2. Auto Calculate Dashboard Stats
    let amounts = document.querySelectorAll(".amount-col");
    let totalRevenue = 0;
    amounts.forEach(col => {
        totalRevenue += parseInt(col.textContent) || 0;
    });

    const revenueCard = document.getElementById("totalRevenue");
    if(revenueCard){
        revenueCard.textContent = "Rs " + totalRevenue.toLocaleString('en-IN');
    }

    // 3. Delete Confirmation
    const deleteBtns = document.querySelectorAll(".delete-btn");
    deleteBtns.forEach(btn => {
        btn.addEventListener("click", function(e){
            if(!confirm("Are you sure you want to delete this booking?")){
                e.preventDefault();
            }
        });
    });

    // 4. Simple Bar Chart without library (for report)
    console.log("Admin Dashboard Loaded");
    console.log("Total Revenue Calculated: " + totalRevenue);

    // Agar Chart.js use karna hai to ye add karo:
    // City wise revenue chart ke liye
    if(document.getElementById("cityChart")){
        // Example for Chart.js - optional
        alert("Dashboard loaded with " + amounts.length + " bookings. Total Revenue is Rs " + totalRevenue);
    }
});