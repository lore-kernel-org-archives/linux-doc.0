Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2B4766BC
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109322; cv=none; b=E7Himqdo5CFR4iVij7XYltbNIp7qL2t0VYj4X85fpkSjGn5lyRDieAq7Ys56KOgPF1HiJ+V9C98vjxUapWNx5bvIWQtl7s3l23USpyr+TX55HWMh+z9rRz4YKtT3rVrUKfcXy+RVjEGzOh+ztjTECe4x8lK7disxG8YJaZ+UsnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109322; c=relaxed/simple;
	bh=kC9uhcChRxr+Yf7WNSZG8OGc+4+uqAsijQ0nIbNaBeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMD/apnYD6GrpYgDhTE+h/qQDs8ILe1nrkWVmS/QfIZxcrDqhs0z+6ofa8NcsMb9PmRepBd9ul3MTdtvkhh49pyKUpvyxYVPtqu70BEofoGKuaiJTCc2C1yVpdpTm9mOKhIstu++AIfNSH+3OmkHJygF5fBuI6jC3o7v9cOhOFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=jCcPZUw+; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="jCcPZUw+"
Date: Fri, 7 Aug 2026 21:28:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1786109315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x4nEMJDUuAOuMHIVr5A8w4i/QBXuuG0Pzbd7aAEhG6w=;
	b=jCcPZUw+o0yQvK0fx0bLq+LD4nlPepfEV8f/pXXXsXl9O0bUM9Qeq8xURMEPOIOOpL6hcq
	+/uq2IjsGkjOnBh6SKIxu1z4Ru/59WFjkL7IzzFiBv8J5SrhPi7LnO7G5MNJR0Z8krQHZs
	rnoCsj8udXmvcynIXUTOkoffGrK3CD++4wWz5N6kefQX4W/ubCpfjgIGMcmYV7xDgJf+zV
	kCRnUzBHjA2eRYHLkC5E6lWRmNrgoyHWUwCJpxtVBe2IZscwfkE4RO8l3BK+3dlXwzxrVk
	ocm/LvWN8ZMnsaFSBOsRMsuYEbgW1arPeft5yJjWtveEwEJhTgTNUHELBhpu4Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/16] docs/zh_TW: process: localize terminology in
 2.Process.rst
Message-ID: <anXddDML5sw8loCQ@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-11-chenyou910331@gmail.com>
 <anDANHRAHb3wr2o8@wyuan.org>
 <CAKspUhL-1fh8o19aEvLzxVGMqvnFtmP0XksS7ni5QCYNBWqSKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhL-1fh8o19aEvLzxVGMqvnFtmP0XksS7ni5QCYNBWqSKw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Aug 05, 2026 at 02:48:35AM +0800, 葉宸佑 wrote:
> On Tue, Aug 04, 2026 at 12:22:12AM +0800, Weijie Yuan wrote:
> > Either: add a <space> before staging
> > Or: remove the <space> after staging
> >
> > [A] Greg Kroah-Hartman 目前負責維護staging樹。
> > [B] Greg Kroah-Hartman 目前負責維護 staging 樹。
> >
> > Which one do you prefer? I think the first option is more consistent
> > with the usage throughout the text.
> 
> Sorry, I misread that as two separate changes. You are right that it
> should be one or the other.
> 
> I went and counted across the whole zh_TW tree, matching a CJK
> character directly adjacent to an ASCII alphanumeric with and without
> a space:
> 
>   without space: 2581
>   with space:     721
> 
> 2.Process.rst itself is 69 without / 22 with. So [A] it is, both for
> the file and for the tree as a whole. Fixed in v3.
> 
> For what it is worth, my own preference as a Taiwanese reader would
> have been [B] -- a space between CJK and Latin text is easier to read
> and is what most Taiwanese technical writing does nowadays. But the
> existing translations overwhelmingly do not, and this series is about
> terminology, not typography. Mixing the two would make it much harder
> to review.

Yes, I think a space between CJK and Latin text is more "proper", or
a more "universal" way.

> That said, it is probably worth writing the rule down rather than
> leaving each contributor to guess. I would suggest:
> 
>   - no space between CJK and ASCII (following existing practice)
>   - apply it to new translations and to paragraphs that are being
>     rewritten anyway

I might be more inclined to remain neutral, so I would prefer to hear
the opinions of others. Or we could take a look at how zh_CN and jp_JP
handle it.

Or: for new articles, we can start to require spaces between.

>   - do not go back and normalize existing files

Of course.
