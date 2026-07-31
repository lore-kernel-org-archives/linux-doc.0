Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F6B3EF0C8
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512771; cv=none; b=aGU73puhQVVjiZ6wiWv0NiQQA1do7mFwHnp5aoSF77jp2g9w7RGhXZ/QCdv/y1sAz3AGF8zpU4CsnlDej4FK7wW99h3y+Jt+e7wPxzmutMASk3otCLU2wBEm5W+nNUsWSFZ2Syp2dF231b0VNiYOe1gy4UbAa+IBxJIl3Sawgzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512771; c=relaxed/simple;
	bh=IBsP0yIp4hizlUWX48RA5d1IoaYpiPpLHHtYnaNL1cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apPs6VMRMCr2Xn+CCSTyIal40hgpEOz0W0ov5NgRuXxaNpClnlWeei7vLaDv+aicG7vAEL5bZAXmXPhTdcsmoC8cHj3pyVj8sojP/+WtPwegFLsG0U+dttZPFhpeS5RiSrJl+HEKpziRrK0/9YMCJlp+T/GaqTz8CQVQa+nK6FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=tIj/Pdke; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="tIj/Pdke"
Date: Fri, 31 Jul 2026 23:45:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785512757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=//STl+si+eGCX61KjNFuIRqf8ohMGJldZHL4mxeZzeI=;
	b=tIj/PdkekRnsXQrKG0E5jW3wLYHg3DsHNZh/CpUiAbTGWvPpRFpXB8ehgD5OT2GfKYrm/6
	8BeK0lTtTB0dzZDgFKGkEPptg+9AZt9hQl1NSUQrrD5LUIbbgX8btg+AVKFpD6cisOw+j1
	WdneFxzIqQiKpM2qxJnV9+nRqPf2YEydNJxlxQYuT73XX5e5n1BmcgSKA/witO8Xzq0Tkb
	oPPBB1v1yXTbCBZ5RU6GKn3DEwBKUKkLFMCeIbMcV1X1K2/rHHfu7QXfNv/DUx1lH+XF45
	PFi0T6sIz/Y/bSmYrT15qJCYAN9tiFM18WRB2JPf7mZveRYqbT/I+Kwd3z6AGw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Traditional Chinese documentation
 maintainers
Message-ID: <amzDLOTe5J9cQ4st@wyuan.org>
References: <20260731032101.7244-1-chenyou910331@gmail.com>
 <amxHIcHC0vjcp5bG@wyuan.org>
 <87o6fn5n2h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6fn5n2h.fsf@trenco.lwn.net>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 31, 2026 at 07:02:46AM -0600, Jonathan Corbet wrote:
> Weijie Yuan <wy@wyuan.org> writes:
> 
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 2f9472c1a090..60f77e7fd3f5 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -27460,10 +27460,11 @@ F:	kernel/trace/trace_osnoise.c
> >>  F:	kernel/trace/trace_sched_wakeup.c
> >>  
> >>  TRADITIONAL CHINESE DOCUMENTATION
> >> +M:	Chen-Yu Yeh <chenyou910331@gmail.com>
> >> +M:	Weijie Yuan <wy@wyuan.org>
> >>  M:	Hu Haowen <2023002089@link.tyut.edu.cn>
> >
> > Agreed: Haowen is always welcomed :-)
> 
> Nonetheless, I'm not sure I see the value of listing a maintainer who
> has not maintained for years; a move to CREDITS may be in order.

Makes sense. I haven't even noticed there's a CREDITS file before. Sorry.

> > I remembered Haowen sent a patch here [1] aiming to change his name and
> > address to:
> >
> > Haowen Hu <srcres258@furdevs.cn>
> >
> > Can we pick it up here?, while it may also needs Haowen's double check..
> >
> > [1] https://lore.kernel.org/linux-doc/20260220160201.41149-1-srcres258@furdevs.cn/
> 
> I resisted that because it was the third time churning all of those
> email addresses in all of those files.  If we are going to address them
> now, I think the best thing is to simply remove them.

Sorry about that.

I was previously aware of the relevant context regarding this matter, so
I only thought of simply updating his email address only here while we
are at it. But obviously, moving to CREDITS is a better idea.

Thanks.
