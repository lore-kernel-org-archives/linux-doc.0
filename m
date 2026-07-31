Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFED442B1D
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519933; cv=none; b=B/q4SHOveew9qIm5JR9HZp/hfvBVld37Z6EAFeijEbeqHEcayybSpTEHCYfQqcqoCk6r6JqRjNqBJrH03qqT9DbfB8NKzJOGd0RGVHNyLM5809Xc/pnVya8ohp5RDZLE/1cKagzs3p0hlYnSaRNZVNcSUTr7Ke93UTT+inY/tlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519933; c=relaxed/simple;
	bh=/1aSOq/1XJ/mWAxwcQBTuAeCO6Xn8R23owzdjmCW3iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lq4zWuX2s2L7sV8+VnFP3zxafX8jlfHJ53pkksagVBTOxjWQP2ikrkFx8dgB0Vl4gJvgjsAkeL1vfCKzc99hbNXAiE7fNfDgHNGbJysl6kDKyCW1ZdROUWruFGNwH9mBNKv8PKVJtc6lh9pDXekJJu5XBnstkBIHxTowhnqaVKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dop1KBqR; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dop1KBqR"
Date: Sat, 1 Aug 2026 01:45:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785519919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5WCgFJrnyfuhm2k03nwSxm+MAdaup4V0b17HwL94PJQ=;
	b=dop1KBqRaSR9dRjqa3pro7aM/h4p9zEsS6wLMnQxdyAru+fLy6kf2oCf3QwHeysz2ZORy/
	8xYW8/nBwKW5bSdAeRC+d+7vz4u9zNKV7t8vn6GWjjCFCmyzmuZ8q6zhhXxXAiadhSdKZg
	ppZszGPm6kSur8q4Pe81PWKAs4aYnwTf0rrvtGxGf+qgSIq1Gibs85N5k5P6RH1bn9hcxT
	FALZQPv0xG0MgKWeoqazPnyrDG2b46aWk8jOXOEwxzi75ZZ9HJNvZQvSiCkhsm3HftD4V6
	3oQR8CQWzxa6cUpalCSZLXmo5X2Ph7LNlN2/rbRuFDD22mM+5LvDseNbzfhQVg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Traditional Chinese documentation
 maintainers
Message-ID: <amzfJ0bIxTJud6uo@wyuan.org>
References: <20260731032101.7244-1-chenyou910331@gmail.com>
 <amxHIcHC0vjcp5bG@wyuan.org>
 <87o6fn5n2h.fsf@trenco.lwn.net>
 <amzDLOTe5J9cQ4st@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amzDLOTe5J9cQ4st@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 31, 2026 at 11:45:57PM +0800, Weijie Yuan wrote:
> > > I remembered Haowen sent a patch here [1] aiming to change his name and
> > > address to:
> > >
> > > Haowen Hu <srcres258@furdevs.cn>
> > >
> > > Can we pick it up here?, while it may also needs Haowen's double check..
> > >
> > > [1] https://lore.kernel.org/linux-doc/20260220160201.41149-1-srcres258@furdevs.cn/
> > 
> > I resisted that because it was the third time churning all of those
> > email addresses in all of those files.  If we are going to address them
> > now, I think the best thing is to simply remove them.

Oops, I might misunderstood your words here. So absulutely yes, churning
all of those email addresses is a huge pain. Then I only thought of
simply updating his email address only here in MAINTAINERS file while we
are at it right now. (But that's meaningless now, as we are removing it
in MAINTAINERS file in the next re-roll)

And simply removing them is a good idea. Let me add it into our todo
notebook then.

Thanks.

> I was previously aware of the relevant context regarding this matter, so
> I only thought of simply updating his email address only here while we
> are at it. But obviously, moving to CREDITS is a better idea.
> 
> Thanks.
