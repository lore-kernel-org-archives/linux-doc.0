Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4663A5E61;
	Fri, 10 Apr 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829842; cv=none; b=VJcp/g8HX1gBV4BP+hOsUtpVFP7+3+fvxkcvwCinvvkQhEK3FNfwSxqGDpaPfbYipcWkQ7Nldsoq+tE3ZHP4KezMbFGNxM3vY37i3T3+siFtliT18Crur3KNe62FpXXrBaYAmzsTUwBzbfFsktZbqfCtGVLVqrRFZoHuAegzk5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829842; c=relaxed/simple;
	bh=k29VzHrYXcntzqh3MpQdzl7oCeJUUxXuxp9pxmuAAIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOitehxhfdKRQxPKn8FAwxlsAUGkSbNFDXG8MswyHo/4F6+kA6xFJD9Ytm0lt3xT+drnvDQXUiMb42uJ0m1hj3/4ZdJI7/GVi+51dzUYqPE6Cxkwl33NhPuB1nW+5PZhG1J8CP/48ibQ5VHuGStCZQvmVTvMtfvnWJDY68LFsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=FiIZLPmE; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="FiIZLPmE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u07fAeMble8DRxQXr390mZRhSpEry1623RqnFVFFlts=; b=FiIZLPmE9vXhLmIvq9nU47rz+d
	Xq9utxOqa7ohP95zKw4udUp6qC1POyYZVdjayitrRJRTp7tG91n64oaBTW2PicsxWFDP/zxemGFZZ
	OFPuGLR8DVi8RPv8bDSZsGWBnaCnkQEJSlQ3GPumsrmf70le7ApsqQtzciAZR+VEHF4ZVN/Hzac9V
	/KmfRHSN3sKVSOY4ShHzazNDBdOvQBQzM3BZ2MJ2Z8qKvfP4IKjOFQJOOC5b42Gq6oW2uV+1qD4hg
	/vFgEV9AZj8OepwMksyA09u4Dm801kUVpZrHjve55uJjp99R85B+MnkS6lzb66pWJ/QEMcDfO2nsO
	0lvOsFeg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wBCSc-00A1tG-1w;
	Fri, 10 Apr 2026 14:03:50 +0000
Date: Fri, 10 Apr 2026 07:03:45 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 1/3] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
Message-ID: <adkCtR0LzJ7aWfm-@gmail.com>
References: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
 <20260331-ecc_panic-v2-1-9e40d0f64f7a@debian.org>
 <e074d5de-f494-4995-2521-32de4f2bd34f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e074d5de-f494-4995-2521-32de4f2bd34f@huawei.com>
X-Debian-User: leitao

On Tue, Apr 07, 2026 at 10:56:39AM +0800, Miaohe Lin wrote:
> On 2026/3/31 19:00, Breno Leitao wrote:
> > When get_hwpoison_page() returns a negative value, distinguish
> > reserved pages from other failure cases by reporting MF_MSG_KERNEL
> > instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
> > and should be classified accordingly for proper handling by the
> > panic_on_unrecoverable_memory_failure mechanism.
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  mm/memory-failure.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> > index ee42d4361309..6ff80e01b91a 100644
> > --- a/mm/memory-failure.c
> > +++ b/mm/memory-failure.c
> > @@ -2432,7 +2432,11 @@ int memory_failure(unsigned long pfn, int flags)
> >  		}
> >  		goto unlock_mutex;
> >  	} else if (res < 0) {
> > -		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
> > +		if (PageReserved(p))
> > +			res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);
> 
> Is it safe or common to check page flags without holding extra refcnt?


Yes, this is safe. At this point the page has HWPoison set, preventing
reallocation.

PageReserved is an atomic flag test on struct page memory that's always
valid for online PFNs.

Reserved pages are inherently stable (kernel text, firmware, etc.) and
don't change status dynamically.

This follows the same pattern as the existing is_free_buddy_page(p)
check a few lines above, which also reads page state without an extra
refcount.

The result is only used for a detailed classification, so even a theoretical
race would not be a bad issue.
