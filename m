Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E85CDF1
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 06:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773643644; cv=none; b=ILrBaBus0SidhIqmuZA8kp3plc05kdEhNm+kkoGiagiPMErHFTsoxLoDyYH0RT13DLfNlBlEBj/rNcD5mYMvvhm8PHuBk0t+z07qEksU0L4YO6HrZuSC5cZjqNBhrEkrojUmMcgYty0xUTSD1xpEi3+nnzkct5diQl3ZK8ifn9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773643644; c=relaxed/simple;
	bh=ZDu+xUvhrChyttr6D5WuK5J+jLBduob1K3CBSUvWzKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAUmTknEjCk+XewINMQhz1ORrIzK0OJJvL5JoGFMqkhv89uIuecxA39dpYbAGWL0gZp+QzTD3vtdRlUg7CjDMNeLPoGM3o6cuXQfBYdkBaUDUIjO8AXq8ucTh5V71wig/LoMKrbcx9cNwSE2LmrosAH9Ey2hkxCXrHmX6/v9WsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLFHWwM4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLFHWwM4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C97CC19421;
	Mon, 16 Mar 2026 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773643644;
	bh=ZDu+xUvhrChyttr6D5WuK5J+jLBduob1K3CBSUvWzKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BLFHWwM4FysvgHmhk+4rELTKsRLvPP+wjzM/AXnEk4opaDmVP7zvG6aVaqvDS0Tl+
	 qoBwoX/XCbc/WlCD0pLZlmfo4BaEXUVJ9OXay2jnv80DISXBU9d56ms86LfF4/OkJR
	 lAwQEtTK7emx18u6CDQorQPwDUwFLrLhnd3g2Wc8i2008cM/a3YG4S5kyApwdFlxuD
	 jO+n5zvq89xJa/SgiDCSte+tJKx0eOkCJxfr/u2TIYkRrG0a6rYri9Vz3EyCpHEtxR
	 E3O/snFJxCWdflcpRk1CehXkP+qAhBhfxo1Da2SjGvUikwbsnmBf426ZaX2jP9PF6U
	 3arAVeCeun/rw==
Date: Mon, 16 Mar 2026 08:47:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Kit Dallege <xaum.io@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, corbet@lwn.net, linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document Boot Memory
Message-ID: <abendSlwDIwB4teF@kernel.org>
References: <20260314152527.100295-1-xaum.io@gmail.com>
 <0c981733-477b-496e-abe5-54eebaae04b1@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c981733-477b-496e-abe5-54eebaae04b1@lucifer.local>

On Sun, Mar 15, 2026 at 08:43:24PM +0000, Lorenzo Stoakes (Oracle) wrote:
> NAK for being AI slop, again, obviously.
> 
> +cc Mike, the 'boot memory' maintainer, who again I'm sure will be
> overjoyed by this.
 
I'm not going to review it thoroughly because
"maintainers are entitled to reject your series without detailed review"

> Reasons, as the rest:
> - Worthless documentation
> - Everything about patch screams 'zero effort, Claude did it all'
> - Bad etiquette
> 
> On Sat, Mar 14, 2026 at 04:25:27PM +0100, Kit Dallege wrote:
> > Fill in the bootmem.rst stub created in commit 481cc97349d6
> > ("mm,doc: Add new documentation structure") as part of
> > the structured memory management documentation following
> > Mel Gorman's book outline.

We don't need to fill in missing parts just to fill files with contents, we
need quality documentation.
This doc does not improve over what we already have in
Documentation/core-api/boot-time-mm.rst.

...

> > +The memblock allocator fills this role, managing physical memory from the
> > +earliest stages of boot until the buddy allocator takes over.  The
> > +implementation is in ``mm/memblock.c`` and ``mm/mm_init.c``.
> 
> This is at least reasonable.

But still wrong. mm_init.c is not a part of memblock allocator.
 
> > +- ``kernelcore=`` sets the amount of memory that must be in non-movable
> > +  zones.
> > +- ``movablecore=`` sets the amount of memory to place in ``ZONE_MOVABLE``.
> > +- ``movable_node`` allows entire NUMA nodes to be treated as movable.
> > +- ``kernelcore=mirror`` restricts non-movable memory to mirrored regions.
> > +
> > +These parameters control the boundary between ``ZONE_MOVABLE`` and the
> > +other zones, which in turn affects how much memory is available for
> > +transparent huge pages, memory hot-remove, and CMA.

Oh, my ...
How CMA and THP are related to ZONE_MOVABLE here?!

-- 
Sincerely yours,
Mike.
