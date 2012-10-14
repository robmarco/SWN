function animateMember($action,$first,$last){
	$teamMember = '.team-members .member';

	$memberSlideDone = false;

	if ($action == 'load') {
		
		$('.team-members .member').each(function(i){
			$(this).addClass('member' + i);
		});
		$($teamMember).first().fadeIn('slow').addClass('active').siblings().removeClass('active');
		$($teamMember + '.active .picture').animate({
			left: '0' }, {
			duration: 700,
			easing: 'easeInOutExpo'
		});
		$($teamMember + '.active .desc').delay(300).animate({
			top: '0' }, {
			duration: 1200,
			easing: 'easeInOutExpo',
			complete: function(){
				$memberSlideDone = true;
			}
		});
		return false;
	}



	/* first, hide the current member */
	$($teamMember + '.active .picture').stop(true,true).animate({
		left: '-100%' }, {
		duration: 700,
		easing: 'easeInOutExpo'
	});

	$($teamMember + '.active .desc').stop(true,true).delay(300).animate({
		top: '-300px' }, {
		duration: 700,
		easing: 'easeInOutExpo',
		complete: function(){
			/* old member hiding is complete, now move on to the next/prev one */

			/* Next - Not last - Show next*/
			if ($action == "next" && $last == false)
				$($teamMember +'.active').next().addClass('active').show().siblings().removeClass('active').hide();
			/* Next - Last - Go to first*/
			if ($action == "next" && $last == true)
				$($teamMember).first().addClass('active').show().siblings().removeClass('active').hide();

			/* Previous - Not first - Show previous*/
			if ($action == "prev" && $first == false)
				$($teamMember +'.active').prev().addClass('active').show().siblings().removeClass('active').hide();
			/* Previous - First - Show Last*/
			if ($action == "prev" && $first == true)
				$($teamMember).last().addClass('active').show().siblings().removeClass('active').hide();

			$($teamMember + '.active .picture').stop(true,true).animate({
				left: '0' }, {
				duration: 700,
				easing: 'easeInOutExpo'
			});
			$($teamMember + '.active .desc').stop(true,true).delay(300).animate({
				top: '0' }, {
				duration: 1200,
				easing: 'easeInOutExpo'
			});
			$memberSlideDone = true;
		}
	});

}