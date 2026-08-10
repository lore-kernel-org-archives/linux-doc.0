Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DE23403EF
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 03:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786333691; cv=none; b=rQweV0d8JKervevuzntHcWHjKYcPJKOvVXnYCO9YyDFEtSyTuppwcAhGHYUg8qrdE2w6Xw06r2IONpSuPgD22E/Kn8x2Ts8r82otpBmebfw8MMcUiwJpkmGAxSKQkVY58LT8Pdvd23ThsdRfMll1+0Oyi/4R7vFzD/RpPti0ohg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786333691; c=relaxed/simple;
	bh=LazCVVKyreEHcOLi3QuNIbrzWdaepTaWLf6Gx/jLCOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbDBNUy6n4oA4JkmDYWad7E4i4btTvU+O6MXLUlQE6uE2mBxl02q56zcbVEcrBe3/9Zt5EF2SK4tZZYzQrSd6hOg/9u+TWib5RoNo3KOeo5SYfwukcTTPHA/7/mqdgAproxj5YX8JXO/lD4/V+IWHxluDLKL3UX7uuxwQbEaZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=bDoMMpDB; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="bDoMMpDB"
Date: Mon, 10 Aug 2026 11:47:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1786333686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i0R5gOWKc+MFEdlol5ovpPrZdwxfXTxED7CZjoMb1Y0=;
	b=bDoMMpDBidGXLUB6+xQf+xoWNhhtMS2LZ2yLIARPzAyjyKWBmiHEQF15lCNs3E08xUJKVL
	6W5l0jlU9VBw8IvvxOqd5IpS+qXvyuywegMQSjbF2D6iIHBmKZWquOWwAQI+kKLd0Xa3nO
	ZUFA0mqh8L2PPLpPFoiK9DjshGG8Xcs5CaUGh3ybsm/9UaF6Tt32zy1hfuQ2v+IX465jto
	Vvcym19M+1FdueveD/mf6SuwdBJn6RPv5O7RAgkNUtfEXNOCO5kvxxC1Vi5KpQfpUMUs/1
	t/uzx0LDVowjOCjEB5rbql97F67NWV9IUraGDKmH0rC6rne3KCuCSBZHXrUH+Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Chen Miao <chenmiao.ku@gmail.com>, Dongliang Mu <dzm91@hust.edu.cn>,
	alexs@kernel.org, si.yanteng@linux.dev, skhan@linuxfoundation.org,
	mchehab@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew
 support
Message-ID: <anlJ7YQzjJ9qlZfA@wyuan.org>
References: <20260809101923.13176-1-chenmiao.ku@gmail.com>
 <20260809101923.13176-2-chenmiao.ku@gmail.com>
 <anh6axawbEiF37WD@wyuan.org>
 <49a6022d-7d7b-4414-ba61-4482ecca4b11@hust.edu.cn>
 <aniKpkE5iCCU835q@wyuan.org>
 <CAKxVwgdjNjDLWpR2WPOdsXKhusobwq_52ioB5J15gdD2C=obvQ@mail.gmail.com>
 <87tsp2j543.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tsp2j543.fsf@trenco.lwn.net>
X-Migadu-Flow: FLOW_OUT

On Sun, Aug 09, 2026 at 04:34:04PM -0600, Jonathan Corbet wrote:
> Chen Miao <chenmiao.ku@gmail.com> writes:
> 
> > Thanks for the clarification. I'll first check whether the kernel documentation
> > already has something like a "macOS kernel development guide." If not, I think
> > it might be worth documenting this.
> >
> > In particular, macOS uses a case-insensitive APFS volume by default, which can
> > cause unexpected problems for newcomers working with the Linux kernel source
> > tree. It would be unfortunate if there were no documentation covering the
> > things developers need to be aware of when doing kernel development on macOS.
> > That said, I suspect this would be better handled in a separate patch series.
> >
> > Of course, if such documentation already exists, then that's even better, and
> > there would be no need to add another one.
> 
> There is no such guide now.
> 
> Correct me if I'm wrong, but I *think* that absence reflects the fact
> that Linux kernel development is mostly done on Linux systems?

Yes, I think so. But while macOS is not a common platform for kernel
development itself, it might still be worthwhile to make things a little
easier for people who want to contribute to the kernel *documentation*
from macOS.

That said, I don't have any data on how many people would actually want
to work on the documentation from macOS. In my own case, though, there
have been a few times when I only had an Apple machine available and
still needed to get some work done.

So overall, if supporting that use case is not too complicated and does
not create much of a maintenance burden, having one more option
available does not seem like a bad thing.

Thanks.

> We can certainly add such a guide if somebody is willing to write it,
> and if it would be useful to people.
