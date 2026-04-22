Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99CC32B9A8;
	Wed, 22 Apr 2026 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871404; cv=none; b=e2sOdHWCm4zp1DPLBct2mHV4RQJ/wfyr+kqnlglPtCyMkwq8F6w5iuyASID2qgKui7EYwCx30cq0J3P9xV0AfPhlY8WTeqQuwsfxdC9xyp4xsDCGs1wZtyZYfb8q8jXtbljKDTC4gklnmv3bvLKU89W+CBhKGtDAMpyAq4y9FOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871404; c=relaxed/simple;
	bh=jQDpzWuCXmdv1F1/abjSy27qegTNfY6jEbfNbv1hbXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKgglMedmVI3HC4/3IRLaV/l0+EUX2ICyrBjQVhqOgYglCB3P4I92nhTHQOro9ayHlpv7/KxRS9Azbvr4xcU0okpQTz53ZeSlqJFi8a+puMyQeGgXVfcusWJLBg7fMZjzVl0UJjN/52rEzLS7vRlbgHnG9txxLAhnygsC0P2Ne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=vxcEGDX9; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="vxcEGDX9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=2d38+AL4M7Yw85ZULCXmHoMpmyNuNJJ0+LlK7sbOybg=; b=vxcEGDX94dL0ogQnI/K3g9DG2T
	WCdhIwcCdrHhlXKEiXiLQ8Kncy491mxHIfpCglgVNrGCPIlnaTKohTjC+mpA3h0Tbp35yW+UkHV5b
	AGPC3bW4hDP0kdi3Zg2Uthj2vNtGVrHs2D+mdqqD7AvT5v+uAtliF38IyrP4qifMsCaMgzL9Kntgp
	leG+7xPtRnNhFP123fCkfJPLAZ+nWHQY/TbbGZ7R6HOOZC0jIksJOeMM840mVYz/fsz+w9GDmDzQv
	BriTxxfmim57F3os9xXv4aG+0HbR20JMtsF/onkRyX3UOsNKmDObeeeW3Nwaww+Q38JddLxlUVbFk
	i2jP8FSw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wFZQ3-001iIv-2o;
	Wed, 22 Apr 2026 15:23:16 +0000
Date: Wed, 22 Apr 2026 08:23:10 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 3/3] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Message-ID: <aejnmh3xlHsuKfP3@gmail.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <20260415-ecc_panic-v4-3-2d0277f8f601@debian.org>
 <7b4a6659-e2e5-5e63-2952-c7a840ffcdec@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b4a6659-e2e5-5e63-2952-c7a840ffcdec@huawei.com>
X-Debian-User: leitao

On Wed, Apr 22, 2026 at 11:43:16AM +0800, Miaohe Lin wrote:
> On 2026/4/15 20:55, Breno Leitao wrote:
> > Add documentation for the new vm.panic_on_unrecoverable_memory_failure
> > sysctl, describing the three categories of failures that trigger a
> > panic and noting which kernel page types are not yet covered.
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  Documentation/admin-guide/sysctl/vm.rst | 37 +++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> > index 97e12359775c9..592ce9ec38c4b 100644
> > --- a/Documentation/admin-guide/sysctl/vm.rst
> > +++ b/Documentation/admin-guide/sysctl/vm.rst
> > @@ -67,6 +67,7 @@ Currently, these files are in /proc/sys/vm:
> >  - page-cluster
> >  - page_lock_unfairness
> >  - panic_on_oom
> > +- panic_on_unrecoverable_memory_failure
> >  - percpu_pagelist_high_fraction
> >  - stat_interval
> >  - stat_refresh
> > @@ -925,6 +926,42 @@ panic_on_oom=2+kdump gives you very strong tool to investigate
> >  why oom happens. You can get snapshot.
> >  
> >  
> > +panic_on_unrecoverable_memory_failure
> > +======================================
> > +
> > +When a hardware memory error (e.g. multi-bit ECC) hits a kernel page
> > +that cannot be recovered by the memory failure handler, the default
> > +behaviour is to ignore the error and continue operation.  This is
> > +dangerous because the corrupted data remains accessible to the kernel,
> > +risking silent data corruption or a delayed crash when the poisoned
> > +memory is next accessed.
> > +
> > +When enabled, this sysctl triggers a panic on three categories of
> > +unrecoverable failures: reserved kernel pages, non-buddy kernel pages
> > +with zero refcount (e.g. tail pages of high-order allocations), and
> > +pages whose state cannot be classified as recoverable.
> > +
> > +Note that some kernel page types — such as slab objects, vmalloc
> > +allocations, kernel stacks, and page tables — share a failure path
> > +with transient refcount races and are not currently covered by this
> > +option. I.e, do not panic when not confident of the page status.
> > +
> > +For many environments it is preferable to panic immediately with a clean
> > +crash dump that captures the original error context, rather than to
> > +continue and face a random crash later whose cause is difficult to
> > +diagnose.
> 
> Should we add some userful cases to show the real-world application scenarios?

Yes, good idea. What about something like:

Use cases
---------

This option is most useful in environments where unattributed crashes
are expensive to debug or where data integrity must take precedence
over availability:

* Large fleets, where multi-bit ECC errors on kernel pages are observed
  regularly and post-mortem analysis of an unrelated downstream crash
  (often seconds to minutes after the original error) consumes
  significant engineering effort.

* Systems configured with kdump, where panicking at the moment of the
  hardware error produces a vmcore that still contains the faulting
  address, the affected page state, and the originating MCE/GHES
  record — context that is typically lost by the time a delayed crash
  occurs.

* High-availability clusters that rely on fast, deterministic node
  failure for failover, and prefer an immediate panic over silent data
  corruption propagating to replicas or persistent storage.
