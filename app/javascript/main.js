


function modalAddJoin(){
  let cross_info = document.querySelectorAll(".grade-info");
  let info_num = cross_info.length;

  for(let i=0; i<=info_num - 1; i++){
    cross_info[i].onclick = function(){
      let lessonId = this.children[0].innerHTML.trim();
      let studentId = this.children[1].innerHTML.trim();
      const modal = document.getElementById("modal");
      const mask = document.getElementById("mask");
      const close = document.getElementById("close");
      const studentInput = document.getElementById("student_id-input");
      const lessonInput = document.getElementById("lesson_id-input");
      studentInput.value = Math.floor(studentId);
      lessonInput.value = Math.floor(lessonId);
      modal.classList.remove("hidden");
      mask.classList.remove("hidden")

      close.onclick = function(){
        modal.classList.add("hidden");
        mask.classList.add("hidden");
        modalAddJoin;
      };
    }
  }
}




window.addEventListener("load", modalAddJoin);