document.addEventListener('turbolinks:load', function() {
    document.querySelectorAll(".comment-toggle-button").forEach(function(button){
        button.addEventListener('click', function() {
            const postId = this.dataset.postId;
            const commentForm = document.getElementById('comment-form-' + postId);
            commentForm.classList.toggle('hidden');
        });
    });
});

document.addEventListener('turbolinks:load', function() {
    console.log("Turbolinks load event triggered");
    document.querySelectorAll(".comment-toggle-button").forEach(function(button) {
        console.log("Button found:", button);
        button.addEventListener('click', function() {
            console.log("Button clicked");
            // 以前のコード
        });
    });
});