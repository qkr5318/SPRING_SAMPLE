// 베가스 영역
$(function () {
  // $('body').vegas({
  //     delay: 3000,
  //     slides: [
  //         { src: '/images/nature-1.jpg' },
  //         { src: '/images/nature-2.jpg' },
  //         { src: '/images/nature-3.jpg' }
  //     ]
  // });
  $(".mp4").vegas({
    slides: [
      {
        src: "",
        video: {
          src: ["/intro/video/gn_travle.mp4"],
          loop: true,
          mute: true,
        },
      },
    ],
  });
});
