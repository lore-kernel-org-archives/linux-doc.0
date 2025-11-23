Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D645425BEE7;
	Sun, 23 Nov 2025 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763890154; cv=none; b=N7vMfXrfUSj/llLexKVCb8236ErkVPD//OsnpMLUOOz3ZJH6jyRArb0sMo7x8k9uKcyPkOUtYR6UUG5LQm+Fl3Tu/K1b+McWiDcsEsu6K+JheGySMlcwWudxIYCz29gskPM6DLsGzwdtMuCcL7AHBuMmLnnbzhTwakxImtq0uRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763890154; c=relaxed/simple;
	bh=BsCF5Vo0XWlxKJ/sd2YtUXNzzKo8ijMIlbF7CAcmddQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/uW4d6RXfK88dF7WIwNwM53BJlbSskPXuCFcsFa01z1/IGv+RVjipuqxHLSKiYtIgnKLiLlQB97Amjngje0wUCXeFTKzlepycabC5Q57celTMWS2Xi9OcFDZVehaHoAxmz+3eAQj/S9sp7b6d3BRFfmiWKUiXEoFF8W/DVV0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khHRGrer; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khHRGrer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9630EC16AAE;
	Sun, 23 Nov 2025 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763890153;
	bh=BsCF5Vo0XWlxKJ/sd2YtUXNzzKo8ijMIlbF7CAcmddQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khHRGrerO0B4QAeiYUvcoYrCRZ7uhsJTe+ITJfW9iphjYhW1N0sKuW0fM2MRwJw5g
	 l5TQWitHCTush7XpYYXn86yoAgIkRd9Jwskf2hII2lEiVCE7zf5OOfdvlMrwa8vZjW
	 Ik5A1AzJIUJHNbsmi9XzwA+YcND1G9ACaXTYc4WHni5+e1Z1jhbXz3uCmnpCgQ2m3H
	 xVSHgwZBltr02JD/bKnR+CeUVLQl/hSqnsw87N+adQ/1gUneAjaJhpHJc+n/0k18+T
	 x1fX5UifmLzM5F0ekSp9B9Kvbm9Hhy2/LQg7y3Qe21gYlJvr175L8foN4YrQkfmFk/
	 c90tmT+r9YtYg==
Date: Sun, 23 Nov 2025 11:29:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, mhocko@suse.com,
	surenb@google.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david@kernel.org,
	akpm@linux-foundation.org,
	Vladimir Davydov <vdavydov@virtuozzo.com>,
	Konstantin Khlebnikov <koct9i@gmail.com>,
	Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] pagemap: Update BUDDY flag documentation
Message-ID: <aSLT4J4UNh-0xiXN@kernel.org>
References: <20251122211920.3410371-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122211920.3410371-1-richard@nod.at>

On Sat, Nov 22, 2025 at 10:19:20PM +0100, Richard Weinberger wrote:
> Since v4.6 the BUDDY flag is set for _all_ pages in the block
> and no longer just for the first one.
> This change was introduced by:
> commit 832fc1de01ae ("/proc/kpageflags: return KPF_BUDDY for "tail" buddy pages")
> 
> Strictly speaking, this was an ABI change, but as nobody has noticed
> since 2016, let's just update the documentation.
> 
> Cc: Vladimir Davydov <vdavydov@virtuozzo.com>>
> Cc: Konstantin Khlebnikov <koct9i@gmail.com>
> Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  Documentation/admin-guide/mm/pagemap.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
> index e60e9211fd9b2..c57e61b5d8aa8 100644
> --- a/Documentation/admin-guide/mm/pagemap.rst
> +++ b/Documentation/admin-guide/mm/pagemap.rst
> @@ -115,7 +115,8 @@ Short descriptions to the page flags
>      A free memory block managed by the buddy system allocator.
>      The buddy system organizes free memory in blocks of various orders.
>      An order N block has 2^N physically contiguous pages, with the BUDDY flag
> -    set for and _only_ for the first page.
> +    set for all pages.
> +    Before 4.6 only the first page of the block had the flag set.
>  15 - COMPOUND_HEAD
>      A compound page with order N consists of 2^N physically contiguous pages.
>      A compound page with order 2 takes the form of "HTTT", where H donates its
> -- 
> 2.51.0
> 
> 

-- 
Sincerely yours,
Mike.
