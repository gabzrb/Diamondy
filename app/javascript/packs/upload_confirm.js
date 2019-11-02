const uploadConfirm = () => {
  // we select the photo input
  const input = document.getElementById('cert-input');
  if (input) {
    // we add a listener to know when a new doc is uploaded
    input.addEventListener('change', () => {
      const btnCert = document.getElementById('btn-cert');
      btnCert.classList.add('confirmed');
    })
  }
}

uploadConfirm();
