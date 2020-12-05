const uploadConfirm = () => {
  // we select the input
  const input = document.getElementById('product_product_attachments_attributes_0_photo');
  if (input) {
    // we add a listener to know when a new doc is uploaded
    input.addEventListener('change', (e) => {
 console.log(input.files[0].name);
        const label = document.querySelector(".upload-photo")
        label.classList.add('uploaded-file');
        label.innerHTML = input.files[0].name;
    })
  }
}

uploadConfirm();
