Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0E24676D
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481007; cv=none; b=ATs9B2eyPOqveUfchEYYzbGeQYF39Ke2mENrJysJHdwSmKlsREPoljdqX/A/7nTH88UuhMQLDDOihV4JYv371ydgw+bs4wzZXNep9UyBmTzzga/DaKSOPnJuOsXo7hE5n3DXB17UmR+kUNSB/GyRwoUJ0ZQDEC+vscfvVgnYwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481007; c=relaxed/simple;
	bh=Q5W8cfwgLuELT0BI/Utkiy8DF+lukLPZuNdwDkOtaY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SU4ww5se3IHYnbb+XI20k97OUerJY3W4RhQEP5ESBAmdujh/3+r3009feTtG1BEHdCQDHNE4MV4y2tYlNBD3nz+RUKQskm30FGgRyTShNDhKBbPQGrncaJWcc0zUyP6OxlnE04xn7xg3CXrcrKmBXf8MfdMt5LX6wzsXo5Ylx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=MKCUn7l+; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="MKCUn7l+"
Date: Fri, 31 Jul 2026 14:56:33 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785481003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+QrFa0E+09H/Ff2hadp6ZJsBnRAs7OpwZWmGD8jm9k=;
	b=MKCUn7l+3bh1pywmjznaU1j1v9n/O6LvXPgjczFbrNSGY3JHELmz+RZ/4eQIKNTdpfqyEi
	vBMc+q/TNDvJt0xH8HgZF9zm015SHAUQgDxgxEp2nsJ91mzIARkQHIxAA7GikDwPjqJubf
	oKKku6/glRkJ6MUbHYwLf/ElcQcnpTf/WoYW89WxDST/ru5wSVr9r+oH6NZpKfGvTxvZ23
	g3Boso8OIDb/yjALbvNnV1Emj8SiULnJ16eXur4s21d9QrMXZo6VAVMn8/8k9fmnX4LqcM
	hNGeKdHPzPAOlNnW8440K8vRdE74NUOPmB+SfsYPdXBy1eseW4D72zjoSDg3Bw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Traditional Chinese documentation
 maintainers
Message-ID: <amxHIcHC0vjcp5bG@wyuan.org>
References: <20260731032101.7244-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731032101.7244-1-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 31, 2026 at 11:21:01AM +0800, Chen-Yu Yeh wrote:
> The zh_TW translation has been unmaintained for about two years: the
> listed maintainer has been unreachable, and because no active
> maintainer was listed, get_maintainer.pl did not point contributors at
> anyone who could actually pick up a patch. My own zh_TW patch sat on
> the list for five weeks for exactly that reason.
> 
> Following the discussion in [1] and the plan in [2], add the people
> who have stepped up to carry zh_TW forward, with a shift in focus
> towards Taiwanese Mandarin terminology rather than a plain
> simplified-to-traditional conversion:
> 
>   Chen-Yu Yeh   - translation and zh_TW terminology decisions
>   Weijie Yuan   - process, list monitoring and status reports

Monitoring the list is the plan I made before touching MAINTAINERS file,
(in case there are patches land on the list but not in our mailbox). So
if this patch applied, I guess it would be no long needed for me to
monitor the list? (Although I always go through the archives)

I do some review, and wish to handle all miscellaneous matters, leaving
enough energy for the other two to do the work they are good at.

I thought for a while to find a better wording here..
Weijie - Miscellaneous matters? Or I leave the question to you ;-)

Or we could leave the division of responsibilities out of commit message
and instead write it after '---', To prevent any future changes from
going unnoticed and not being explicitly mentioned in the commit message
again. (perhaps years later)

However, those who are interested can still find our original division
of responsibilities under '---' in the archive.

But this is just a minor issue, not a big deal. It can be handled in any
way.

>   Dongliang Mu  - review
> 
> Hu Haowen is kept in the list; his earlier work is the basis of the
> current translation and he is welcome back at any time. His personal
> repository links are dropped, as they are no longer reachable.
> 
> zh_TW stays a separate entry and is maintained separately from zh_CN;
> the two may share a tree for pull requests, but the review and
> terminology work is independent.

Yup, and I would also love to maintain our own tree on git.kernel.org
(and mirrors?) so that we don't need to bother Alex every time.

In general I guess it would be more efficient, what do you think?

> [1] https://lore.kernel.org/linux-doc/20260603082531.263115-1-chenyou910331@gmail.com/
> [2] https://lore.kernel.org/linux-doc/amcZ5SI3-Hzw4HkJ@wyuan.org/
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> This comes earlier than the trial period I mentioned when I first
> offered to help with zh_TW [1]. Weijie raised the MAINTAINERS question
> off-list because the lack of a reachable maintainer has been the main
> bottleneck so far, and both he and Dongliang have confirmed they are
> willing to be listed. Happy to hold this until after the v2 series
> lands if you would prefer to see that first.
> Weijie, Dongliang: we settled this off-list, but could you ack here so
> the agreement is on the record?

Absolutely ;-)

Acked-by: Weijie Yuan <wy@wyuan.org>

> 
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f9472c1a090..60f77e7fd3f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27460,10 +27460,11 @@ F:	kernel/trace/trace_osnoise.c
>  F:	kernel/trace/trace_sched_wakeup.c
>  
>  TRADITIONAL CHINESE DOCUMENTATION
> +M:	Chen-Yu Yeh <chenyou910331@gmail.com>
> +M:	Weijie Yuan <wy@wyuan.org>
>  M:	Hu Haowen <2023002089@link.tyut.edu.cn>

Agreed: Haowen is always welcomed :-)

I remembered Haowen sent a patch here [1] aiming to change his name and
address to:

Haowen Hu <srcres258@furdevs.cn>

Can we pick it up here?, while it may also needs Haowen's double check..

[1] https://lore.kernel.org/linux-doc/20260220160201.41149-1-srcres258@furdevs.cn/

> +M:	Dongliang Mu <dzm91@hust.edu.cn>
>  S:	Maintained
> -W:	https://github.com/srcres258/linux-doc
> -T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
>  F:	Documentation/translations/zh_TW/
