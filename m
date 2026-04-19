Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34651BC2A;
	Sun, 19 Apr 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776604644; cv=none; b=tKQ4enyVMT7Kj+m2fyFa1vXIib70JgKkRVfNJwghYwcRU39f3n5EmAcQNUr+cUB6RLnr6jIq2p4YUn4c2LQmJjfdKv/3gCszC1cqMN7qg5PmiuY1uqVtEgbe/xWQ63AQD9RzhOMgFNzRJVYWFjnjSfsHx3YuSjMrJwT3lJ/PjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776604644; c=relaxed/simple;
	bh=ohdmWo16vNUrAsv5m1BvZ6YSb/zDYTUqhQnVl/n0QOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uqd0oSqOhmhEvtC7V92xEJPMhgtpyehDhjPtfxN2vWux79hH8K+6yyf+/PTLvt1m3A/ehCnmXvLbZpbVgw6rrXT1rpvBfyzF/JyJ0Yu/3R8GPVgbruTWb3NqNrdeRqn/jQJBHYH38BgTbcxh3J2MJEvrNrmD0X9AFYs/+xkNynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTB/pcxt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTB/pcxt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB1DC2BCAF;
	Sun, 19 Apr 2026 13:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776604644;
	bh=ohdmWo16vNUrAsv5m1BvZ6YSb/zDYTUqhQnVl/n0QOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTB/pcxtd5Y5AgVqa7kH0u50Yh0y17fIweATDD/xLjI/qILdgtSPZ0hb6RwRNrCVu
	 hP2RTuD8ab8cDa/jxzv9WHZToe0EH3B5htkqov1Q+seanVeW9ut+L3c7F+lqyLXK4d
	 q4FNrUG+lY9nrb0BXTdN+05RDdP3eCw6iILObkGjIKeVWr3yebJ/2jctVJLFM5vA+n
	 GwDCxCgUaT3EMQHkUekg423BeMvL+r+WfM/b3LlGJfDr1/ELSg1NRiSy2tyoy+m1bD
	 RfAz6QZjRHZUtxjqVJXlZNILuwSdK6tB5BwcVlhNjJ08ZEsFHsn999hHuKL8lWeuoe
	 w6++5U6ZGrVhQ==
Date: Sun, 19 Apr 2026 14:17:17 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Nick Huang <sef1548@gmail.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
Message-ID: <aeTTw4gziJigaNbU@lucifer>
References: <20260418000635.17499-1-sef1548@gmail.com>
 <aeNGbNyPxJssnkbO@lucifer>
 <aeOuCH8ydw_yzdXZ@casper.infradead.org>
 <c113f667-f897-42cc-a0e5-b8a0bbd91be3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c113f667-f897-42cc-a0e5-b8a0bbd91be3@kernel.org>

On Sun, Apr 19, 2026 at 10:35:44AM +0200, David Hildenbrand (Arm) wrote:
> On 4/18/26 18:15, Matthew Wilcox wrote:
> > On Sat, Apr 18, 2026 at 10:07:22AM +0100, Lorenzo Stoakes wrote:
> >> On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> >>> - Add "Overview" section explaining the slab allocator's role and purpose
> >>> - Document the three main slab allocator implementations (SLAB, SLUB, SLOB)
> >>
> >> The fact you're insanely wrong about the current state of slab only makes this
> >> worse.
> >
> > This is actually a new low.  We've always had to contend with people
> > putting up outdated or just wrong information on web pages, and there's
> > little we can do about it.  Witness all the outdated information about
> > THP that's based on code that's been deleted for over a decade.
> >
> > But now we've got AI trained on all this wrong/ out of date information,
> > and, er, "enthusiasts" who are trying to change the correct information
> > in the kernel to match what the deluded AI "thinks" should be true.
> >
> > Let that sink in.

Ugh ye gawds. My attitude is nip this in the bud early.

I'm very harsh in response to these things for a reason - firstly, it's rude,
obnoxious + disrespectful, so a negative response is wholly appropriate.

But more importantly, I want to SET A PRECEDENT that if you send this crap
you'll get a VERY negative response.

Clueless but good faith or bad faith - it's straight up plagiarism and that's
totally unacceptable.

> >
>
> I think we should make it very clear that we don't want doc updates from someone
> that is not a renowned expert in that area or wants to become an expert in that
> area (and already discussed working on the docs with maintainers/experts).
>
> Otherwise we'll have this same discussion over and over again.
>
> diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
> index 7aa2a88869083..8c5721001c8bb 100644
> --- a/Documentation/mm/index.rst
> +++ b/Documentation/mm/index.rst
> @@ -7,6 +7,11 @@ of Linux.  If you are looking for advice on simply allocating
> memory,
>   see the :ref:`memory_allocation`.  For controlling and tuning guides,
>   see the :doc:`admin guide <../admin-guide/mm/index>`.
>
> +A lot of documentation in this guide is still incomplete. If you are not
> +a renowned expert in the specific area, but you want to contribute bigger
> +chunks of documentation, talk to the respective MM experts first. LLM
> +generated slop from non-experts will be rejected without further comments.
> +
>   .. toctree::
>      :maxdepth: 1
>
>
>
> LLMs are just the tip of the iceberg. It will all be developmend-by review with
> inexperienced contributors. And we are only willing to put in the effort to
> teach contributors if the contributors are not actually worth our time: i.e.,
> LLM kiddies that will actually stick around and help the subsystem in the long run.
>
>
> The whole doc update stuff is similar to people just grepping for TODOs in the
> kernel and then using an LLM to produce code they have no idea about.
>
> It's the evolution of typo fixes: review load without any benefit.

Agree with all of that!

Let's do that, happy to give tags on a patch for the above :)

>
> --
> Cheers,
>
> David
>

Cheers, Lorenzo
