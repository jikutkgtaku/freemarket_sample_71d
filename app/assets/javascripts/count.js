$(document).on("turbolinks:load", function() {
// 商品の説明の文字数カウント
  var count = $(".items--text__field").text().replace(/\n/g, "改行").length;
  var now_count = 1000 - count
  $(".items--text__count").text("残り" + now_count + "文字");
  $(".items--text__field").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 1000 - count;
    if (count > 1000) {
      $(".items--text__field").css("color", "red");
    } else {
      $(".items--text__field").css("color", "black");
    }
    $(".items--text__count").text("残り" + now_count + "文字");
  })
})