function validateBitcoinFormFunction() {
  $('#bitcoinValueForm').validate({
    rules: {
      "bitcoinQuantity": {
        digits: true,
        maxlength: 10
      }
    }
  });
}

$(document).ready(validateBitcoinFormFunction);
$(document).on('page:load', validateBitcoinFormFunction);