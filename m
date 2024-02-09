Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E745667
	for <linux-doc@vger.kernel.org>; Fri,  9 Feb 2024 03:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707450604; cv=none; b=Cnmz8o8uP2pJtThdVJMad1BiLvC6RsCoTZG3034RsjAWIskRXNJT1WlXJpMmXadFDYS73Ze2gYBa5pIa1CPU5xaD9+dpm/w4HAuhq6YPv6lZk9nmLyl6QD6Ll1bVH9KiVl6qVWD/k3OWmANNaql6LLy9m9+8zRbEHZxP2/i8tUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707450604; c=relaxed/simple;
	bh=eNY2fs2mANmERASGOw1MR+zj2PuIqpBiHFnb2fVwYKw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r5dEH6libgUyi51RHTNMx/tLzAQWLqCgJmzI5NFmkm4zAV2JnzOkiiNWP1yzEeHBqPyJIjPcohT7ZD9w2r5ctV8PCHAmVaqVJQvNLaf/ddDmOp+jHIBR8WFgbRAr5TAt2MiTfQWIkMluL4xCQgrVZp3Di2v+XlW/FR79MLRC5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2oJZaxNv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2oJZaxNv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=f3a10knLyzZhIkQdiKX9fpwU3h5NBkaJGA1Wc2aCehM=; b=2oJZaxNv4/KhSZ29n67j6hv5Wj
	Tk4RZzJ0AOfTfHoQdZ3KxS3hiT8bqt39Gi+CksFW4jhcTjLCnDNJfGQHZDXAJtCbA8cVGq+oct/j2
	Y+OP6xihNSSmQOMR8/BoFvyxUCKwOX0t2v53tGua08Oq4VNnJ8VbIYVbN0k7T9k15bqavBF+y/srW
	BDdG5p4qOq6TiHNrp1IPijSbXnOk4wvktN8u/AKNHMBKW9uPorqpGweaFYdMEDtIi41jRNYNeg70n
	OKtT6mKv45UpbbexAuoNd98vC5iNKL9Ym1Q+JVwMGCUvQALedl+7UjBggzozUcQUcr0mtLK9U96GE
	V8G7u2MQ==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYHtn-0000000G4dL-3egu;
	Fri, 09 Feb 2024 03:49:59 +0000
Message-ID: <b7c5562d-611f-43e5-b78b-122c84941f60@infradead.org>
Date: Thu, 8 Feb 2024 19:49:56 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH docs-next] scripts/kernel-doc: reindent
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20240208161705.888385-1-vegard.nossum@oracle.com>
Content-Language: en-US
In-Reply-To: <20240208161705.888385-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[I should have sent this when I wrote it a few hours ago....]


On 2/8/24 08:17, Vegard Nossum wrote:
> This file is using an ungodly mixture of 4 spaces, 2-wide tabs, 4-wide
> tabs, _and_ 8-wide tabs, making it really hard to find good editor
> settings for working with this file.
> 
> Bite the bullet and reindent it by hand. I tried using both perltidy
> and vim, but neither of them were up to the task without changing too
> much or getting confused about what they were supposed to be doing.
> 
> I did change a few instances of
> 
>     }
>     else
> 
> into
> 
>     } else

ack.

> (and same for elsif); the file is again written using both styles, and
> I left functions which already seemed self-consistent alone.
> 
> You can verify that this commit only changes whitespace using e.g.:
> 
>     git diff --ignore-all-space --word-diff
> 
> or to see (only) the instances where newlines were added/removed:
> 
>     git diff --ignore-all-space
> 
> You can also see the delta from what perltidy would have wanted to
> do to this file (when asked to only indent it), which isn't that much
> in the end:
> 
>     perltidy -io -fnl scripts/kernel-doc
>     git diff --no-index scripts/kernel-doc{,.tdy}
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

I'm not verifying that the changes are whitespace only, but this change
needs to be done.

The only downside of it for me is finding what commit to blame for
a Fixes: tag. I have no good skills for doing that.

> ---
> I know that reindenting whole files is frowned upon and I apologize
> in advance, but having this file be so completely out of whack is
> not helping anybody. FWIW, I am working on other patches that would
> benefit from the reindent in the sense of being easier to review.
> 
> Of the currently active stable releases, I only see a handful of
> patches to this file that have ever been backported to stable:
> 
> 5.10
> 9fd7bdaffe0e stddef: Introduce struct_group() helper macro
> 9cee26031015 scripts: kernel-doc: fix parsing function-like typedefs
> 5c0aa48d046d scripts: kernel-doc: Restore anonymous enum parsing
> 
> 5.15
> 1d9bd723e7b4 stddef: Introduce DECLARE_FLEX_ARRAY() helper
> d57ab893cdf8 stddef: Introduce struct_group() helper macro
> 
> This should hopefully alleviate concerns about backporting troubles
> due to this reindent. I also volunteer to help with anything that
> needs to be backported across this patch.
> 
>  scripts/kernel-doc | 2522 ++++++++++++++++++++++----------------------
>  1 file changed, 1258 insertions(+), 1264 deletions(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
#Randy
