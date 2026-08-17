Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DD941B354
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 16:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985755; cv=none; b=OTNeKswZllH7dTOF9tCr59MRm2h9aQOn2iMaPgjvepSPYYWcGThNF7fiesQbnYz+ZyCUi+5rloIXgRXEuclOMmIPajZiPgN51g+08KbZElAPYRnbBipXAz4olbaVRbAdmi2hKrRB2AJEl161dYmsIibk5tVql7NWvE4q7BfgT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985755; c=relaxed/simple;
	bh=IsAA0YPS5Cn1G1UJfs/kaqGc9Sde6OhYkqRAKlkYVxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjxZTny3VjJUHw5V+Nhxgr+589Qra2f02xtWws0uSJg7MDCVtt81qCWmumoBicsA7EDxQGHX0dY9eZ6LQLfsXkRO5kUUPn7UWtX/6p4PxEub5iwBcXx5WRGXpuhOByn5s8TIf52hePGStjqso6filuYjEZ9EQsScEGBP1wTgzGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvWJIxWK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvWJIxWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6711F000E9;
	Mon, 17 Aug 2026 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786985743;
	bh=xTXizeJAPN4W1pOJCZ7S/BTb0ROM//QBXQ2YriiHtoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gvWJIxWKGZQArcmY6QS85E/A1O8ewuvUfJKRBan0w4Gono2Yrk7XlDXvs96RWzejn
	 5VUHdR8hhSnoXJ9efGtKC2fgjVXBQJfyyykIJQltThPF/xDaRWzUpCPt7CSwVPmClA
	 svxI1wBISMLxjmObdB4asMKk0V71IRJD5sqIddfZoB57Ra2jFKhxtXGSHPmRzTDhdJ
	 J2gRRuJlPpIa7gTD/RuB31vhspwuiT4izxJNRLLUKNCVQ6zWb97umAv6karC9sLbW0
	 NvRHudMrg0pTjU3qwdDdpcKGrH4xyz+2K0Cchn8VFy9ASkJbLbi1jNA7ohe2xBTPCc
	 eNfeZ/EfkHgKA==
Date: Mon, 17 Aug 2026 17:55:23 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	shr@devkernel.io, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com
Subject: Re: [PATCH v2 2/2] mm/ksm: fix advisor_min_pages_to_scan description
Message-ID: <aoM8bbWNeuEbfCdy@lucifer>
References: <20260813031722.569983-1-tujinjiang@huawei.com>
 <20260813031722.569983-3-tujinjiang@huawei.com>
 <an2g39TIN9v87enG@lucifer>
 <b35d14b5-65d8-4b8e-8754-de35f03d4b2d@huawei.com>
 <an3RcQgDuhmcAb37@lucifer>
 <238c66fa-8144-4cad-b90c-e7992b14ee6f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <238c66fa-8144-4cad-b90c-e7992b14ee6f@huawei.com>

On Mon, Aug 17, 2026 at 10:54:52AM +0800, Jinjiang Tu wrote:
>
> 在 2026/8/13 22:32, Lorenzo Stoakes (ARM) 写道:
> > Please show me the common courtesy of responding to _all_ the review given,
> > not only the one point you want to respond to.
> >
> > I'm not happy with this patch, sorry, for the reasons stated that you chose
> > to ignore.
> >
> > On Thu, Aug 13, 2026 at 07:17:05PM +0800, Jinjiang Tu wrote:
> > > 在 2026/8/13 18:56, Lorenzo Stoakes (ARM) 写道:
> > > > On Thu, Aug 13, 2026 at 11:17:22AM +0800, Jinjiang Tu wrote:
> > > > > Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
> > > > > variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
> > > > > lower limit of the pages_to_scan parameter, but that is not how the
> > > > > scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
> > > > > advisor") only uses it to initialize ksm_thread_pages_to_scan when the
> > > > > scan-time advisor is enabled. This will mislead the users.
> > > > >
> > > > > The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
> > > > > [1], but the documentation wasn't updated.
> > > > >
> > > > > Update the documentation and comment to match the semantics of
> > > > > advisor_min_pages_to_scan.
> > > > Umm, firstly if this were wrong you'd need to change the name of the variable
> > > > too instad of documenting it as something completely distinct.
> > > >
> > > > But secondly AFAICT the logic in scan_time_advisor() suggests that it truly does
> > > > act as a minimum bound as well as being the initial value for
> > > > ksm_thread_pages_to_scan.
> > > As the cover letter[1] said, 'The initial value and the max value for the pages_to_scan parameter can
> > > be limited with:', ksm_advisor_min_pages is used as the initial value, not the min value of pages_to_scan.
> > (Wrap your lines properly please, it's a common courtesy to learn how to
> > send mail according to community conventions.)
>
> Thanks for the reminder, I will follow this in the future.
>
> > One of the part of my review you ignored:
> >
> > 	But in any case, you are making a claim here yet have provided no
> > 	evidence for it. 'It is just the initial assignment' means nothing
> > 	- if the logic can then only increase it up to the maximum value
> > 	then it still acts as a minimum.
>
> ksm_thread_pages_to_scan is adjusted by scan_time_advisor() after a full
> scan finishes. ksm_thread_pages_to_scan could increase or decrease depend
> on the real scan time is longer or shorter than the target scan time.
> The min value of ksm_thread_pages_to_scan is only limited by
> KSM_ADVISOR_MIN_CPU, so ksm_thread_pages_to_scan could be smaller
> than ksm_advisor_min_pages_to_scan.

OK thanks :)

With this explanation put in the commit msg somewhere on respin then we should
be good.

Probably we want to rename the variable too but can save that for another change
since the attr is called min still (ugh).


--
Cheers, Lorenzo
