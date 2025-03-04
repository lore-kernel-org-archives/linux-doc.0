Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5272D14830C
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 01:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741053207; cv=none; b=iRnxiWyJmZYb0oIPnnmlgDMkS/3ExwGJc356z2/uvQXkAMxybI7gslmNnwDTQ8rHspps+tONkkz9zpjhqApejSa3r9PULfx0pHSS8hE8qyO1L8yh4UsacVmXqMvAtrcq9nhHdD7/iM5OCu8ImJggO7ToQXnrP02kuqCbkxJ1pyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741053207; c=relaxed/simple;
	bh=QT+yAUq7QI8FCYFnqi87ncgkR6mSvNYl4Z8WHs5KLa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/x88G+kPMr4PRCq532I/zaIICstNp5pukMOezAUORsM0l03YJEZVsiT3Tsmc6k8TtU6DhwjtM0bKychxG8QPQE58Sv5FzcymywYoLiJDCxyGIgkWRMXdh68LGa3/u17LJxYxjSO4cUyDnNPEeGQkxIhE8YAJ3Id9J366YBvxxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ERcwq2KU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ERcwq2KU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fkMD3/ZM952KAsgAtbxJsRazNoXaR1WQ8DBEyIo/tY0=; b=ERcwq2KUcxaZ3NeYEAHHrr6A0c
	ChgwryTj4wx44a/Iku0MhaJbdjMbWMcHAc96FMNVD9/sTqV00dAEFx0YwHsbxJYnW/Z/+f82h/4yl
	XnE1yfVq3AP2hKO4ZpD75zajOJNd9NJV9OaD2VPxl1rSwMCSnOFnkbLYryJpVs5D/H4GWGwe3Xx2s
	v7we2fjdnKNbroGrVesuAZCD+cuzk18a+8t2VZNRjVAx9PDjGWFPyi2SNJ9B2NkzJ0UsG8u80eUv7
	QLo54mCaEcmYyO0WW1m4DvoUx9euvoyq1st/GUwRW36cjyylG+lYWjx9y0jk2hRb43+7B68OKXiio
	snXSAnSA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHTH-000000001uc-0MAD;
	Tue, 04 Mar 2025 01:53:23 +0000
Date: Tue, 4 Mar 2025 01:53:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Joshua Rose <joshuarose@gmx.com>
Cc: linux@leemhuis.info, linux-doc@vger.kernel.org
Subject: Re: Grammar issue(s) in documentation
Message-ID: <Z8ZdEioHt184CYNm@casper.infradead.org>
References: <Z8Y-FHZ5tYBEMy4j@spinny>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8Y-FHZ5tYBEMy4j@spinny>

On Tue, Mar 04, 2025 at 10:41:08AM +1100, Joshua Rose wrote:
> I just wanted to briefly point out that as a native English speaker I
> found the following text significantly hard to read.
> 
> "Do not worry installing your kernel manually and thus bypassing your
> distribution’s packaging system will totally mess up your machine: all
> parts of your kernel are easy to remove later, as files are stored in
> two places only and normally identifiable by the kernel’s release
> name."[1]
> 
> I found this very hard to read. I would probably re-phrase this as
> follows, but I'd be completely open - and in fact encourage - any
> suggestions on the rephrasing of the excerpt.
> 
> "Do not attempt to circumvent your distribution's packaging system by
> installing your kernel manually; this will likely break your machine.
> Components of your kernel can be selectively removed later on.  Such
> components (files) are stored in two locations, both identifiable
> by the kernel's release name."

I think that's the opposite of what they meant.  I understand it as:

"Feel free to circumvent your distribution's package manager as it's
easy to remove the kernel afterwards".

But hey, what do I know?
