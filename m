Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD23AD506;
	Tue, 12 May 2026 20:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619049; cv=none; b=umd2JvfST0qxx6JeHMapMepc6o+2OF3hDiwqJFZs1o/pLRHLhhGQ6arxUA3WMKNGuWNkU4/trBhQYBoVykEe/Fjm0OL/Q2CANT15Up4C3Cb5q749M9Ly+O4MKa/r6gR7/Hq65PZMq7jFMoU0i44jwbyWAlzYT/a4rfISPnAv7bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619049; c=relaxed/simple;
	bh=J1+BBsxHIE+HrjehY8LHoqBtJpYy2NaNIQ0f/pZVtbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sondxTpc6MrFpqnIyjCEIigeysb15Z/nwVurxI8ZlSY7A8eua7hd6/1q5IY/NuWPJfBYgqcX9zsJsW/AA7hBcNMbnwd9iFvjUutnikvTR3dq6TA1KUlDsDesx+akYXI4pA3brLGKYW62+bWYv8fQdaxnyCAkZSHeJ9RBGYhXSk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MqXXv57B; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MqXXv57B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EWStSEwgzx60kVon+5J/IIIjCujBnqO9UfUs8RrKRaw=; b=MqXXv57BUFTs0Lc7VnWZ4gN3aJ
	KkLgMSwbveGvop/smi29ccAw+P8gcmimJ3t0ApUBAOgkV4vGk4kbuGQJHynvlj0cf1B1OXjOOCeai
	El+LLjfNmtVG2p/i15tSBh3ihmehDCDnNfjBKHntMLVAYW26/q2B5PTBoODj2vTR30KWHgjM/Ka4e
	AZKbYahRnuH4JgQfHZOMfYCwlcJlQCV4B9c6PJDJVvb9A7aAhG9Doww/l0yJQF1BtKY6TL1AAEhkD
	8DB941zsS6xIo7XUaMqv+eH8XsuH/2xshdjq6j6VuVNzMuq/8mhAuO3uO3x1p9+Jm2rjS0pizRAHb
	KENrQTDw==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMu3v-00000000OE5-1sSh;
	Tue, 12 May 2026 20:50:43 +0000
Date: Tue, 12 May 2026 16:50:36 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] Documentation: maple_tree: Clarify behavior when
 using reserved values
Message-ID: <kkunuk6hph3uwljo26qqgskczsodydsxvbadycube6n2rldjba@rz6of4335slj>
References: <20260504165746.1422057-1-weilin.chang@arm.com>
 <20260504165746.1422057-3-weilin.chang@arm.com>
 <5qnwgdcxqat2zo5qe7qy63xm5awo5l4lkdkf4umbj3sl2ct5sj@v5c3szzdbbq3>
 <q2dtphja7i45kknjk3bs4hn2bpictyoaideyjfbdh4sz4pxllo@xtsyvo3eztdb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2dtphja7i45kknjk3bs4hn2bpictyoaideyjfbdh4sz4pxllo@xtsyvo3eztdb>

On 26/05/07 11:09PM, Wei-Lin Chang wrote:
> On Thu, May 07, 2026 at 05:24:11AM +0200, Liam R. Howlett wrote:
> > On 26/05/04 05:57PM, Wei-Lin Chang wrote:
> > > It doesn't matter whether the normal or the advanced API is used if the
> > > user uses xa_{mk, to}_value when storing and retrieving the values. Just
> > > specify that the normal API blocks usages of reserved values while the
> > > advanced API does not.
> > 
> > Your comment above is incorrect.
> > 
> > The normal API will filter out reserved values on return while the
> > advanced API will return whatever is stored there regardless of the
> > value.
> > 
> > Meaning, if you store a reserved value with the advanced API, it will
> > not be returned by the normal API.
> 
> This is valuable information, thanks for explaining.

Hmm, maybe I answered too quickly here.  We filter out XA_ZERO_ENTRY on
normal API searches, which is in the reserved range.

> However, I'm confused how this shows my comment incorrect?

It matters if you use the xa_(mk, to}_value since the top bit will be
lost.  Re-reading your comment, you don't specifically say that though,
you said 'if the user uses..', so I was confused by your wording of what
you were saying.

> 
> From the original doc:
> 
> <quote>
> If the user needs to use a reserved value, then the user can convert the
> value when using the :ref:`maple-tree-advanced-api`, but are blocked by
> the normal API.
> </quote>
> 
> To me this is conveying the following points:
> 
> 1. User can convert the value with xa_{mk, to}_value() when using the
>    advanced API if reserved values are being stored. This works because
>    those functions transform the reserved values into non-reserved ones.
> 2. User can not use reserved values with or without xa_{mk, to}_value()
>    with the normal API.
> 3. What happens when reserved values are stored is not clearly stated,
>    but the normal API will block it.
> 
> In my understanding 2. is incorrect because if xa_{mk, to}_value() are
> deployed, it doesn't matter whether the normal or advanced API is used,
> they both work since the values stored aren't reserved.
> 
> Please do you mind pointing out what I am getting wrong here?

I think you are missing the part where the top bit may be lost?

I also don't think the reserved values will matter if you use the
advanced API exclusively.  You would have to filter the special cases or
whatever you want - that is, if you mix the interfaces then you may see
odd behaviour in regards to the special cases in the normal API while
the advanced API would return the reserved items and need to be filtered
at a higher level than the maple tree code.

> 
> I was genuinely confused when I was reading the doc and trying to use
> this data structure.

Then we need to rework the wording somehow.  Thanks.

> 
> > 
> > > 
> > > Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> > > ---
> > >  Documentation/core-api/maple_tree.rst | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
> > > index 87020a30ba69..e5ccafb84804 100644
> > > --- a/Documentation/core-api/maple_tree.rst
> > > +++ b/Documentation/core-api/maple_tree.rst
> > > @@ -30,9 +30,9 @@ Tree reserves values with the bottom two bits set to '10' which are below 4096
> > >  (ie 2, 6, 10 .. 4094) for internal use.  If the entries may use reserved
> > >  entries then the users can convert the entries using xa_mk_value() and convert
> > >  them back by calling xa_to_value().  Note that xa_{mk, to}_value() bit shifts
> > > -the given data, so the top bit will be lost.  If the user needs to use a
> > > -reserved value, then the user can convert the value when using the
> > > -:ref:`maple-tree-advanced-api`, but are blocked by the normal API.
> > > +the given data, so the top bit will be lost.  Usage of reserved values is
> > > +blocked by the normal API, and will cause undefined behavior if used with the
> > > +:ref:`maple-tree-advanced-api`.
> > 
> > Which behaviour is undefined?
> 
> I originally thought storing reserved values could break the tree
> because of its internal use (see 3. above).

You can't break the tree by storing reserved values.  The normal API
will outright not allow storing it while the advanced API will store and
return it.

The issue comes from when you mix and match - if you store a reserved
value using the advanced api and then iterate through with the normal
api, some values may be lost.  Today, that's XA_ZERO_ENTRY only, but we
reserve the right to change that if it is necessary for some tree
version.

Does that make sense?

Thanks,
Liam
