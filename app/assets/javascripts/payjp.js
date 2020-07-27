$(document).on("turbolinks:load", function() {
  let submit = document.getElementById("payment_card_submit-button");
  Payjp.setPublicKey("pk_test_1ec0ec04db6b232048c16e77");
  submit.addEventListener('click', function(e){
    e.preventDefault();

    let card = {
      number: document.getElementById("payment_card_no").value,
      cvc: document.getElementById("payment_card_cvc").value,
      exp_month: document.getElementById("payment_card_month").value,
      exp_year: document.getElementById("payment_card_year").value
    };

    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        $("#payment_card_no").removeAttr("name");
        $("#payment_card_cvc").removeAttr("name");
        $("#payment_card_month").removeAttr("name");
        $("#payment_card_year").removeAttr("name");
        $("#charge-form").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        );
        document.inputForm.submit();
        alert("登録が完了しました"); //正常処理完了確認用。createビューがあればつけなくてもOKかな
      } else {
        alert("カード情報が正しくありません。"); //エラー確認用
      }
    })
  })
})