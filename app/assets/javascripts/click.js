// 点滅用クラス
function func_switch_js(){
    // on・off用フラグ
    var outer_switch = "off";
    var set_switch_flg = function(value){
        outer_switch = value;
    };
    this.set_switch_flg = set_switch_flg;
    var get_switch_flg = function(){
        return outer_switch;
    };
    this.get_switch_flg = get_switch_flg;
    
    // タイマーID
    var timerID = null;
    // switch関数
    var switching = function(id){
        // IDをチェック
        var ele = document.getElementById(id);
        if(ele == null) return;
        if(ele == "undefined") return;
        // 点滅解除
        if(outer_switch == "off") {
            if(timerID != null){
                // タイマーIDがあればクリアする
                clearTimeout(timerID);   
            }
            
            ele.className = "switch-on";
            return; // 処理を抜ける
        }
        
        // cssのクラス名取得
        var css = ele.className;
        if(css == "switch-on"){
            // onの場合はoffに
            ele.className = "switch-off";
        }
        else{
            // offの場合はonに
            ele.className = "switch-on";
        }
        // 0.5秒後にswitchingを再実行
        timerID = setTimeout(function(elemId){
            switching(elemId);
        }, 500, id);
    };
    this.switching = switching;
}
 
// 点滅用クラスのインスタンス化
var switch_js = new func_switch_js();

// 以下、統合部分
var recorder;

window.onload = function () {
  // get audio stream from user's mic
  navigator.mediaDevices.getUserMedia({
    audio: true
  })
  .then(function (stream) {
    recorder = new MediaRecorder(stream);

    // listen to dataavailable, which gets triggered whenever we have
    // an audio blob available
    recorder.addEventListener('dataavailable', onRecordingReady);
  });
};
// 以上

 
// onボタン押下のイベント
function switch_js_on(){
    // 2重起動禁止
    if(switch_js.get_switch_flg() == "on") return;
    // 関数実行
    switch_js.set_switch_flg("on");
    switch_js.switching("switch_js");
    recorder.start();

    var on_btn = document.getElementById("record");
    on_btn.style.display ="none";

    var off_btn = document.getElementById("stop");
    off_btn.style.display ="block";

}
// offボタン押下のイベント
function switch_js_off(){
    switch_js.set_switch_flg("off");
    recorder.stop();

    var off_btn = document.getElementById("stop");
    off_btn.style.display ="none";

    var on_btn = document.getElementById("submit");
    on_btn.style.display ="block";

}


function onRecordingReady(e) {
  var audio = document.getElementById('audio');
  // e.data contains a blob representing the recording
  audio.src = URL.createObjectURL(e.data);
  audio.play();

  const reader = new FileReader();
    reader.onload = function(){
    const b64 = reader.result;
     console.log(b64);

    const vd = document.getElementById('voice_voice');
    vd.value = b64;

    console.log(vd.value);
    };
reader.readAsDataURL(e.data);

}