Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B763B42BC3A;
	Wed, 12 Aug 2026 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532155; cv=none; b=qyiouYyXHUicQmXvZrHSk0TTsAH1n5X/OwBYBaJtEXy2a7CyGz2gm1F7SCkuXMynN/hm8d82BqOyutO+HtbqpkM9NrjFnhDHZnxtEN73G/w2yFbxBvQsfiFAGAJXT9z1bTovl5yVjrg9idweovl4aBLSU/7n0MP+uBJ5eI7/LJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532155; c=relaxed/simple;
	bh=cHIf+vA61CaEGuWgB8MFLMULM/bCBHCBP47056I+sIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPBCJZgM0qPqCHul1IpX9cyPPjvkTUrw9AknPZCkyooCuIobAGpqhdgARgtxLWEiHWzTSAUmFKlYurV8fDbx/WhONHdXidnxAxCKcEbqdBarBx8KEQVc7lMqTp9629Xdj3mL/yBq8/91UYGwGZG8KXPl8oVHofACxfW8Cy9J8NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gku0R5S3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gku0R5S3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980241F000E9;
	Wed, 12 Aug 2026 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786532150;
	bh=k5uHhnuuJb6gOsUFCBIoK7kOwlDZPmfwyDZP5sWNWB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gku0R5S3IJN7+mHnFfjkJPv+WAk/hMV9qHNEgNq0PdzEpPSfxHvExumlxvpyxecfr
	 xQDTCQy2sDEUtS1WWzJTgPoGKhIk4794lzdica2x0DVZerQZ+G+19WWXIqkWSDbKCZ
	 8Pl7PbZO2DJGfenljfwkam1B2eaq1A0zjuPmN/BEQKyVh8JDpz1ZUe78FyoPSD5S7Z
	 o4Yg9yvA0ni/z2/yBHl1HXbvuNuX9rCWQsqSmx3b6GCzjBfUIe8Sv4QRpE9R+0wgrc
	 SL43KlXNvYs5RgB6W2bU254F8qOOq3nJRSa8me+D4Oi3XlinForUNNdpYVjlGFGGeM
	 6geqmJkwM9XLA==
Date: Wed, 12 Aug 2026 11:55:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Song Hu <husong@kylinos.cn>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, usama.arif@linux.dev, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Docs/mm: fix THP policy counts in transhuge
Message-ID: <anxRGxcLRplmYr2r@lucifer>
References: <20260812080313.330413-1-husong@kylinos.cn>
 <20260812080313.330413-3-husong@kylinos.cn>
 <anw8ASKdPWW9v86d@lucifer>
 <6e4aae7b-2c71-4109-945c-6481efde3636@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4aae7b-2c71-4109-945c-6481efde3636@linux.alibaba.com>

On Wed, Aug 12, 2026 at 06:52:30PM +0800, Baolin Wang wrote:
>
>
> On 8/12/26 5:27 PM, Lorenzo Stoakes (ARM) wrote:
> > On Wed, Aug 12, 2026 at 04:03:13PM +0800, Song Hu wrote:
> > > transhuge.rst claims seven policies for transparent_hugepage_shmem= and
> > > four for transparent_hugepage_tmpfs=.  Both boot parameters are parsed by
> > > shmem_parse_huge(), which accepts six: always, within_size, advise, never,
> > > deny and force.  The "four" applies only to the per-mount huge= option
> > > (shmem_param_enums_huge).  Fix both counts to six.
> > >
> > > Signed-off-by: Song Hu <husong@kylinos.cn>
> > > ---
> > >   Documentation/admin-guide/mm/transhuge.rst | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> > > index b187d618452f..72e944f49da5 100644
> > > --- a/Documentation/admin-guide/mm/transhuge.rst
> > > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > > @@ -389,14 +389,14 @@ is not defined within a valid ``thp_anon``, its policy will default to
> > >   Similarly to ``transparent_hugepage``, you can control the hugepage
> > >   allocation policy for the internal shmem mount by using the kernel parameter
> > >   ``transparent_hugepage_shmem=<policy>``, where ``<policy>`` is one of the
> > > -seven valid policies for shmem (``always``, ``within_size``, ``advise``,
> > > +six valid policies for shmem (``always``, ``within_size``, ``advise``,
> > >   ``never``, ``deny``, and ``force``).
> >
> > I'm not sure we really want to advertise 'special' testing modes like this,
> > sorry. These are not modes anybody should be using in practice especially at
> > kernel boot. We should probably stop people doing that...!
>
> Yes, 'deny' and 'force' are testing-only configurations and really shouldn't
> be exposed via the kernel command line. I'll clean them up.

Thanks!

--
Cheers, Lorenzo
