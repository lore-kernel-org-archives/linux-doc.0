Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BFA4457CB;
	Tue,  4 Aug 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836791; cv=none; b=N35G++2H7HjEO5Dbphv/3JmhLDH3QN1spe/lIaI/kxxgLo4ozkFMk0ruHm9+ycelE3kKT4vYZt2lhnN850L6zeq5JqeaF2XAFLCy0+odT1H88vo0GpLFF6xRK+dgrW3Ce40CkL85xhCuCHu2q4iQrm5GuEobEV00FdfUl//16m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836791; c=relaxed/simple;
	bh=aXX+uW8zd/lHXwfFUl7KF2dZHTMvABPDQLqnSznJiM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwtHthCIZmwk8g3wpVZZwnVkhPU+uZ/9N13VbCOboHc0wSjy1KUYVSbg6ARGud82VcnoJHYNpYoMHmFBxeIq8N5phs1xkztEca4l6MMvWufmsF4ofHgTey0JTswlRBF20g2UwHw7uKanQYq01CYziOLRT/fhhRpz95sN5CbbPvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2o4gSK0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2o4gSK0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D8B1F000E9;
	Tue,  4 Aug 2026 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785836789;
	bh=QPl1NnW3HOJANz1RXsjHVLKOE+dOYvB90CttIGQTxgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k2o4gSK0H/XcFjPm+cAKp8Q5Rxbi2azeO9k5oLYnZscvG2EZWFrAp7ABhEv8jwfHl
	 1OK10rUXansvSAVRXF07ppQg0K/zys8wul59PuSROg7Jf0ocFFNWiL5N28oVJturNZ
	 CWpeJudJySMj5GTCCGO75wm/HJbVbeeeov0GovgqCEm5mtbDt3cZwDIQLvE3w8Ijc5
	 CEz7jIlQIRStSPV51iwR4R/bDx2xiYtojO0lY+RVW5UJQCNkEllapGBFHK9Y46RMr3
	 JyJNOgmIouWBfXux7lk6nXUoiH7ndilkv4Pb4kHXB1FCoyvIvRrOtaEbC3LubjiD60
	 LIbBpxOnjorOw==
Date: Tue, 4 Aug 2026 10:46:08 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v9 2/3] mm: rename swap.c to folio.c
Message-ID: <anG0QwQddFNo8PKJ@lucifer>
References: <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-0-2bc72b4f8730@gmail.com>
 <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-2-2bc72b4f8730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-2-2bc72b4f8730@gmail.com>

On Wed, Jul 08, 2026 at 07:35:44PM +0800, Jianyue Wu wrote:
> Rename mm/swap.c to mm/folio.c so the filename better matches
> the code's main responsibility.
>
> This keeps the implementation split from swap-specific code without
> changing the published LRU helper interfaces.
>
> Update MAINTAINERS and the remaining mm/swap.c documentation references
> after the rename.
>
> Suggested-by: Baoquan He <bhe@redhat.com>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/vm.rst |  3 ---
>  Documentation/core-api/mm-api.rst       |  2 +-
>  MAINTAINERS                             |  3 +--
>  mm/Makefile                             |  2 +-
>  mm/{swap.c => folio.c}                  | 10 +++-------
>  5 files changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 22cc54cac3b2..5b318d17aa4b 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -19,9 +19,6 @@ The files in this directory can be used to tune the operation
>  of the virtual memory (VM) subsystem of the Linux kernel and
>  the writeout of dirty data to disk.
>
> -Default values and initialization routines for most of these
> -files can be found in mm/swap.c.
> -
>  Currently, these files are in /proc/sys/vm:
>
>  - admin_reserve_kbytes
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index 4df7d5edbee5..c1d03a5a2a19 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -118,7 +118,7 @@ More Memory Management Functions
>  .. #kernel-doc:: mm/hmm.c (build warnings)
>  .. kernel-doc:: mm/memremap.c
>  .. kernel-doc:: mm/hugetlb.c
> -.. kernel-doc:: mm/swap.c
> +.. kernel-doc:: mm/folio.c
>  .. kernel-doc:: mm/memcontrol.c
>  .. #kernel-doc:: mm/memory-tiers.c (build warnings)
>  .. kernel-doc:: mm/shmem.c
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d19822d574fd..c3e535ca4bef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17085,7 +17085,7 @@ F:	Documentation/admin-guide/mm/multigen_lru.rst
>  F:	Documentation/mm/multigen_lru.rst
>  F:	include/linux/mm_inline.h
>  F:	include/linux/mmzone.h
> -F:	mm/swap.c
> +F:	mm/folio.c

Hmm noticed today that mm/folio.c is in the MGLRU section :)

This doesn't seem correct - shouldn't this be moved to the core mm section?

If this is already in mm-stable can send a follow up patch for that?

>  F:	mm/vmscan.c
>  F:	mm/workingset.c
>
> @@ -17237,7 +17237,6 @@ F:	include/linux/swap.h
>  F:	include/linux/swapfile.h
>  F:	include/linux/swapops.h
>  F:	mm/page_io.c
> -F:	mm/swap.c
>  F:	mm/swap.h
>  F:	mm/swap_table.h
>  F:	mm/swap_state.c
> diff --git a/mm/Makefile b/mm/Makefile
> index 4fc713867b9b..8e7e964b99a4 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -50,7 +50,7 @@ endif
>
>  obj-y			:= filemap.o mempool.o oom_kill.o fadvise.o \
>  			   maccess.o page-writeback.o folio-compat.o \
> -			   readahead.o swap.o truncate.o vmscan.o shrinker.o \
> +			   readahead.o folio.o truncate.o vmscan.o shrinker.o \
>  			   shmem.o util.o mmzone.o vmstat.o backing-dev.o \
>  			   mm_init.o percpu.o slab_common.o \
>  			   compaction.o show_mem.o \
> diff --git a/mm/swap.c b/mm/folio.c
> similarity index 99%
> rename from mm/swap.c
> rename to mm/folio.c
> index c88643e56af7..d2937600cf72 100644
> --- a/mm/swap.c
> +++ b/mm/folio.c
> @@ -1,17 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - *  linux/mm/swap.c
> + *  linux/mm/folio.c
>   *
>   *  Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
>   */
>
>  /*
> - * This file contains the default values for the operation of the
> - * Linux VM subsystem. Fine-tuning documentation can be found in
> - * Documentation/admin-guide/sysctl/vm.rst.
> - * Started 18.12.91
> - * Swap aging added 23.2.95, Stephen Tweedie.
> - * Buffermem limits added 12.3.98, Rik van Riel.
> + * Folio LRU helpers: add/remove folios from LRU lists, batching,
> + * activation/deactivation, and page cache release paths.
>   */
>
>  #include <linux/mm.h>
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
