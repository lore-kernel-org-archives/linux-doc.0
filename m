Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B515530C
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773604826; cv=none; b=L68Pql5/hUQd9fBPLNGVprkoTwCqCYf5W96PgTH6+/UthAacZlKplosXk/IESKADT2xnNxPbXqEMeJ7MAVCjgkT6AcyL0dbzf6O6CidMtxFsVy0rxKtdJrJb+7RfgjEfi4FojAF9IXBYlUAnUmypdneHt4QL8gVrosqbp3mHizo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773604826; c=relaxed/simple;
	bh=J9pDEzjtYa3DToQjgPpIae13LOkifdux6SX0ArC5xeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXhR+fHLcl1t9Z8TALh1uGRmZmRm/ZAfshGQpEzgVbWohk2+LJRLcU9KeGeFkpyRSArswlaVs0HEIzi4B5oa83n2ohcLiEdD8gLPLDBXFgC6V3x+6JyZJI5MGzLPVRkfSEbeX67DXNhL8rxJkgRBVPY35XLyNhPyE92kKRvRK5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvkL39AK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvkL39AK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABBCC4CEF7;
	Sun, 15 Mar 2026 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773604825;
	bh=J9pDEzjtYa3DToQjgPpIae13LOkifdux6SX0ArC5xeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RvkL39AKyiFEpOJuefEub8AY0x3Q2qxf8z3SJgt6teW+RYuCp6NdXiSuXBsPzZ+L/
	 2Q1vbVnHRF4Vxmfe0QYwXeobwvIe+GKh4KhqD4UVyRg4TJwp4Ox8oZcQ6NBB5wtU2U
	 CdOIPmAnCJj/cVaz3+CmczlRcTySZippB1GRI3lwwDDxhiCR73q14ZWvc8nnjrYfs4
	 3OM5Fu2dFnJM1s7LNAohDNVsnhuD/e234uHKX2wCwcZNmdnvLBTdqjZm/FsA0ZglXt
	 PioWGb/6fF7EHeMFAMdJvuMywZ1sbRFLSQ6Pdzz+rEsF4LtWzyhcI/rX1EAMdRtNgh
	 KosX6lygEzKqw==
Date: Sun, 15 Mar 2026 20:00:22 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, david@kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
Message-ID: <aa646958-9021-4062-8151-4d1a1fac94c2@lucifer.local>
References: <20260314152538.100593-1-xaum.io@gmail.com>
 <87ms0ajtvy.fsf@trenco.lwn.net>
 <CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com>
 <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>

NAK to this and every patch like this.

On Sat, Mar 14, 2026 at 11:17:57AM -0700, Andrew Morton wrote:
> On Sat, 14 Mar 2026 17:02:47 +0100 Kit Dallege <xaum.io@gmail.com> wrote:
>
> > Hi Jon,
> >
> > The material was written with AI assistance (Claude) and then verified
> > against the source code in mm/shmem.c. I read through the implementation,
> > the existing comments, and Mel Gorman's book outline to identify what
> > should be covered, then used AI to help draft the prose, which I reviewed
> > and edited.

'The material was written with AI assistance'

That reads to me like Claude generated this and you 'checked' it, but
absolutely none of the commit messages give the slightest indication that
you understand any of it.

In fact they're all useless, lazy and seem auto-generated too.

You have no previous contributions to the kernel whatosever, let alone in
mm.

So you are not well placed honestly to check any of this, and are instead
putting in low effoft and expecting finite maintainer resource to review
this for you.

NO to this.

I can go right now and get Claude to do the same thing, this is not
helpful.

>
> OK, so you're saying that you created the content and used an LLM to
> assist in finishing it off?

See above, that is not what it reads like.

>
> > I'm happy to rework anything that's inaccurate or doesn't meet the bar.
> > Should I add an Assisted-by tag to the commit?
>
> Yes, Assisted-by: is appropriate and useful here.

https://kernel.org/doc/html/latest/process/generated-content.html

"As with the output of any tooling, the result may be incorrect or
inappropriate. You are expected to understand and to be able to defend
everything you submit. If you are unable to do so, then do not submit the
resulting changes.

If you do so anyway, maintainers are entitled to reject your series without
detailed review."

>
> >From a quick scan, this material appears to be helpful and I think it
> would be good for us to get this into the tree in some fashion.  Which
> will involve asking the relevant MM developers to review each change.

It's not useful, it is doing something anybody could do, and delegates all
the work to the sub-maintainers, and there's already too much review in mm.

I do NOT want this precedent set.

>
> > Mel Gorman's book outline
>
> Well, Mel may have an opinion on this - hopefully you discussed this
> with him beforehand.

Mel's book is fantastic and Mel is great but it's very old now.

In any case I question whether even this has been done, look at the commit
messages. They're as lazy as they could be and look auto-generated.

Kit - if this is sincere, please take the time to try to understand what
you're describing FIRST, in DEPTH.

In fact I don't think it makes any sense for us to take doc patches about
mm from anybody other than somebody with actual experience working in mm or
who can SERIOUSLY demonstrate understanding.

Thanks, Lorenzo
