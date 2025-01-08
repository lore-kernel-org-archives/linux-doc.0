Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983CC1FA8C1;
	Wed,  8 Jan 2025 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348799; cv=none; b=nEXy8LfPv+R9yjGdcQPHcMaGziipnQKqIDN7SRcw/+Qr0Gc41lO8J5i7qlWtgl381eDxju+OcPe2sRn7bjqBGu6+cQBo+zSekdKQG+Lz5c8TF8X16NJgeGSl2vdXWqCuSUEbJzuxu5lg9ndahgFu5p44jcCi478fhDLqcDK1VLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348799; c=relaxed/simple;
	bh=8YI/syiCtx4/CAUkZUgkTVHJSX+i4LU6MGB98eE2uew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThYZKTs6PolEXdF2nS+Gi+uJLW2SnU6QkLIqysDFCgLmmoEQMUCN0/9+pYI75nuczMtmcKRpO9J9+d4Ibd7Mv61Peo4577La/4lcxYSnIV2q+h1vvZoxw2TzqdM6G3M4l1JR+1WyF0//qXjMbEoCDmLNELDLeU/PDjV7WVA+Rpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wCU5vQtK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wCU5vQtK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g4rEC2S0bD60WFG/xnWdsn4WDrtcGeQhnGV7y8gu2Ts=; b=wCU5vQtKb4w0d1q5atL9IcOXrq
	YuLiCqwMXGcTjra52cf9ZWJnzxTcTTTE0srGBmQ8M9H9uuEBIQdq7AD/aQBImQRLCS5XDhAoTtSac
	O+Q4601MBhAecVmIaT0teemFrkaraY52ckuhCRP4ueVLFEjJ4j1OsSGf222zCBDw+rGAVEBegVPJG
	oCgXc8V1+0IFFBq0VVpo10O1wRpOnjsrpm+nnEJ9pMqZw688orV0GLoFsDfbjFO5I3XhS6vmj3tNG
	LTNd0aLO/KdWc3jOjCEq3U9bAfdwCJD3xCDyR5z3OCsTIdRj2dfjWI4aAwimMwpU7WyTRzFyvJrWk
	5ZcTjPlA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXdR-00000001B8S-3BEj;
	Wed, 08 Jan 2025 15:06:17 +0000
Date: Wed, 8 Jan 2025 15:06:17 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	peterz@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org,
	mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v7 11/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited
Message-ID: <Z36UafdgGTcbvaun@casper.infradead.org>
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-12-surenb@google.com>
 <275bd492-7d7c-4b9a-9fce-fbe25639cbfb@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <275bd492-7d7c-4b9a-9fce-fbe25639cbfb@suse.cz>

On Wed, Jan 08, 2025 at 10:16:04AM +0100, Vlastimil Babka wrote:
> >  static inline __must_check __signed_wrap
> > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > +bool __refcount_add_not_zero_limited(int i, refcount_t *r, int *oldp,
> > +				     int limit)
> >  {
> >  	int old = refcount_read(r);
> >  
> >  	do {
> >  		if (!old)
> >  			break;
> > +		if (limit && old + i > limit) {
> 
> Should this be e.g. "old > limit - i" to avoid overflow and false negative
> if someone sets limit close to INT_MAX?

Although 'i' might also be INT_MAX, whereas we know that old < limit.
So "i > limit - old" is the correct condition to check, IMO.

I'd further suggest that using a limit of 0 to mean "unlimited" introduces
an unnecessary arithmetic operation.  Make 'limit' inclusive instead
of exclusive, pass INT_MAX instead of 0, and Vlastimil's suggestion,
and this becomes:

		if (i > limit - old)

> > +			if (oldp)
> > +				*oldp = old;
> > +			return false;
> > +		}
> >  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));

...

> > +static inline __must_check __signed_wrap
> > +bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > +{
> > +	return __refcount_add_not_zero_limited(i, r, oldp, 0);

Just to be clear, this becomes:

	return __refcount_add_not_zero_limited(i, r, oldp, INT_MAX);

