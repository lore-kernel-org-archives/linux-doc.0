Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138531A045
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254396; cv=none; b=KXBX+FRm3xFLZmHEhGcfotTOyARPHk/sSOzh3cNHuhE9fWzgwcw1NXjtOxAlhma0TKqv2YT0Mnkh4qi1JFm6LazlRzcApijSrqrWq2dghsLQRaDu5WUxwxJcvurm0QA7dAamCU9ajfDcSsK+yAUBF1LBMyUnR+WBOQoDQoajpuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254396; c=relaxed/simple;
	bh=w8taRjkt4XGiOQDynhLX/WWqlpwViiZIIlH21qeYuX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0RwE/fSrt3Vcc7PFkjL36kdqV+QKvR/w/XJswzi6BtvQ4VvUsQtQgKrKC6iLLvoXgKSRLeHdJJnXAjGMiv4keFadlaqCLJQnMudQPfAMg8qsf3sXeKvxv1I5BXkhJn5jMfX0XK7LyFQYTMbd04/xAy8SijK0b/Im3WLMSmEZJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=m2ZBc3ir; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="m2ZBc3ir"
Date: Tue, 28 Jul 2026 23:59:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785254379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JT/zsOPWVp30ryJSOOqi2seBguSclew0b0YVRvEmi58=;
	b=m2ZBc3irZGpG/oZRSQoN2KLkSMBx2jP4a9vYY0e485iuo/rGKfzzI3wstHYJRbottTIFkG
	DqAUUAWE61PA/U40LPgwsez/lzjae0svR+KEWFWvP19x1b5+FQ7AG38meihwnhr/3ugw8+
	GKN9Wxq3XqMZRHdeRG2D2u5HVXS3SqEdb78mQh0A6gour1ragr9xBesMHFIEP61xVyztYh
	McDLyzWnxzHQtXxyrBF5jQgBhWZRvkESZCEYPlUzLDrQnlktaAMSVMOiaFVUFuhhYj1A3Z
	XAsokvbVxPUs5eZgAdqfwh108kGGP5rMr2GXH0375x1N3QukIZ6eWER+mS6rbQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] Plans for zh_TW: prioritize maintainability over coverage
Message-ID: <amjR4_X_C1mEPtfY@wyuan.org>
References: <amcZ5SI3-Hzw4HkJ@wyuan.org>
 <87wlugk1ty.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wlugk1ty.fsf@trenco.lwn.net>
X-Migadu-Flow: FLOW_OUT

On Mon, Jul 27, 2026 at 07:18:49AM -0600, Jonathan Corbet wrote:
> Weijie Yuan <wy@wyuan.org> writes:
> 
> > That is to say, we will deliberately select relatively important
> > articles for translation and hope to maintain this consistently
> > first. By avoiding the large expansion of the translation coverage
> > we can't handle, it is possible to truly ensure the quality of each
> > article that has a translation.
> 
> This seems like a good approach in general.

Thanks for your support.

> Of course, somebody is sure to point out that the *English*
> documentation is often not maintained to such a standard.  We have a lot
> of stuff that somebody dropped into the tree years ago and nobody has
> updated since.

That's very modest of you to say so. The English documentation is much
larger in scale, involves more complex workflows, and passes through
many more hands, so maintaining it is by no means an easy task.

The kernel community encompasses so many subsystems and people, and
reaching consensus is not always easy, so I completely understand the
constraints you are working under. (Yeah, The assisted-by trailer
discussion may be an example) By comparison, we have it much easier on
our side.

> I shall continue to try to get the community to live up to your level
> of diligence!

You're giving us too much credit. But it may be a little early to praise
us - we're only just getting started. ;-)

Since I´m new here, I´ve had to dig through the history of this part to
get up to speed quickly, and just watched Kernel Recipes 2016 - Kernel
documentation again, how time flies!

Thank you, Jon, for a decade of tireless dedication.
