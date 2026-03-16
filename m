Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3B326ED3E
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670583; cv=none; b=YIbMyYsSr2XjQ5C82XOCC3iH2aZTBE7NBrRVzKgvRtfIjxnsi5822PZYRL0U122PWFrE/nBrOddSh/6GfnERIwp0QD+Db2p2J/Q67FTu5rh5Y+KQ9wEYlB9rDhK49JlElhTi/+FlF1N34a6g7MLjGoI9zbLO1/0raGucDXDByMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670583; c=relaxed/simple;
	bh=cilkpyBHTl8FoLZ6zf1SV8BbTFy7E3q8+hYxDhT77jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fliY9Wj2oMXpch4foOJ6913V8KvVhi5lhBGi7x/YvyIX/XLo1vo5/40iVOclqm8/COJ9I0QYGBCDnczUY1Gv8bxE7MKRM3x/uG5OncaUMz++jFgMWN585NgdU0P6bioztrMGe9poRBDDJ0QkyUEbro8HCdVxfncMM5sFDdMIETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dv1o6m9N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dv1o6m9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C52C19425;
	Mon, 16 Mar 2026 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773670583;
	bh=cilkpyBHTl8FoLZ6zf1SV8BbTFy7E3q8+hYxDhT77jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dv1o6m9NWt1UNoSa/4Fp/YfDfexuelCFbQZtpueejINBiYZG7R29aXbA0zF4RSc1L
	 xXQkoo0g77KJvVh9veX7Q3cu6O4lRHQ4R4IAoscKIFHeS9puOoPduYIvwUzOfWbgxr
	 Xx1EmYKhMMLhDHVYgYp5JLt0M2QnkpUCxdUMgDF31VInCM098XXtwr5A8tze8TB8YO
	 nsekd3vpxKXxm/WAbcvsH+tN2NmQKGZxMgXFcahjK82guNXIp0ATw7Pr2kaHmLICvA
	 kUAOYtn/ajGvXMxjZBEIodSkGfwU+7GHCUmVbL7kGVxKxi07IdWbOxydOR99sOHAlr
	 4BP7eFDbFYjWA==
Date: Mon, 16 Mar 2026 14:16:19 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Kit Dallege <xaum.io@gmail.com>, akpm@linux-foundation.org, 
	david@kernel.org, corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document the OOM killer
Message-ID: <31744315-bf9e-4d9a-9c25-63eef0bd2f01@lucifer.local>
References: <20260314152518.100194-1-xaum.io@gmail.com>
 <fbee0ca1-4de6-4182-865b-a33d9ed32ee4@lucifer.local>
 <abeyD1ZngYhkAx6g@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abeyD1ZngYhkAx6g@tiehlicka>

On Mon, Mar 16, 2026 at 08:32:31AM +0100, Michal Hocko wrote:
> On Sun 15-03-26 20:48:22, Lorenzo Stoakes (Oracle) wrote:
> > NAK for being AI slop again, obviously.
> >
> > Again, +cc the OOM maintainer you failed to bother to look up.
>
> Thanks!

No problem!

>
> > Reasons, as the rest:
> > - Worthless documentation
> > - Everything about patch screams 'zero effort, Claude did it all'
> > - Bad etiquette
> >
> > As with all the rest it'd need to be totally rewritten and it's not worth the
> > maintainer time.
> >
> > On Sat, Mar 14, 2026 at 04:25:18PM +0100, Kit Dallege wrote:
> > > Fill in the oom.rst stub that was created in commit 481cc97349d6
> > > ("mm,doc: Add new documentation structure") as part of the structured
> > > memory management documentation following Mel Gorman's book outline.
> >
> > I mean the more I see it the more annoying it is.
> >
> > >
> > > Cover the scoring heuristic, allocation constraints, OOM reaper,
> > > process_mrelease syscall, and sysctl knobs.
> >
> > This sentence contains almost as much content as the patch.
>
> The real question is who is the expected audience of this documentation?
> Administrators, kernel developers?
> Reading through this proposal this doesn't really seem to fit neither
> well. For kernel developers who try to wrap their heads around the code
> it is barely scratches the surface. For admins it doesn't really explain
> more than an existing documentation for tunables.
>
> So if there is a serious interest to make this useful kernel developers
> oriented documentation I am more than willing to help. The code is not
> really easy to follow as it is scattered. There are many subtle
> expectations spread out and it is quite easy to break a delicate balance
> tuned for through years. So there is a big documentatin gap I never got
> around to fill up.

I mean, we definitely could do with better documentation :) Obviously I
somewhat document it from a 'learning the code in depth' perspective in my
book, but that's tied to v6.0, effectively paywalled (sorry!) and not the
same as the kind of documentation we'd ideally like the kernel to expose,
which would be less specific I thik but also up-to-date with newer kernels.

The point WRT this patch however is that really, it needs to come from
somebody who has some experience/understanding, and generating it via an
LLM is just not useful - any kernel developer with understanding could do
so.

Otherwise we end up with:

1. generated LLM documentation sent without understanding
2. maintainers have to essentially rewrite the whole documentation ourselves

And thus we essentially have the work dictated to us, but credited
elsewhere (not that credit matters all that much in the end, but it's the
principle of the thing).

So while we want documentation, we don't want _any_ documentation :P

Speaking about docs more broadly - as usual we're all so busy it's a bit of
a catch-22, though once we have something in place, iterating it won't be
so hard.

I wonder if some of us (I realise this sounds like self volunteering)
should just write up some bare bones and patch it in, then we can get the
iterating part of things moving?

>
> --
> Michal Hocko
> SUSE Labs

Cheers, Lorenzo
