
// for sweet Alert
document.addEventListener('DOMContentLoaded', function () {
    const deleteForms = document.querySelectorAll('.delete-form')
    deleteForms.forEach(form => {
        form.querySelector('.btn-delete').addEventListener('click', function (e) {
            e.preventDefault();
            // console.log(form.getAttribute('data-id'))
            // Get data attributes from the form
            const name = form.getAttribute('data-name');
            const email = form.getAttribute('data-email' || 'N/A');
            const slug = form.getAttribute('data-slug' || 'N/A');
            // Create a personalized and professional message
            const message = `
                <div style="text-align: left; font-size: 17px; color: #333;">
                    You are about to permanently delete the following record:
                    <br>
                    <div class='text-center'>
                        <strong>Name:</strong> ${name}<br>
                        ${email ? `<strong>Email:</strong> ${email}<br>` : ''}
                        ${slug ? `<strong>Email:</strong> ${slug}<br>` : ''}
                    </div>
                    <br>
                    <span style="color: #b30000;">This action cannot be undone.</span>
                </div>
            `;
            
            Swal.fire({
                title: '<span style="font-size: 20px; font-weight: 600; color: #333;">Confirm Deletion</span>',
                html: message,
                icon: 'warning',
                showCancelButton: true,
                theme: 'auto',
                confirmButtonColor: '#d33',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Yes, delete it !',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit(); // Submit the form if confirmed
                }
            });
        });
    });
});
