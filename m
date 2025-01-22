Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B81F8AE4;
	Wed, 22 Jan 2025 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737544573; cv=none; b=tYEDFKkb6QUkrF66r2pVFqSheA+GtFHSDjuYOZ/yLy1HO2G/NJ5I7KKrNPqUbD6ewG53tKzzAa3HO8eTJ47ilybdP3L7Ekb21agv/Ar2Qvl4l4J1dZV9EvJeU4Mo6CnJzTzdTljTW8sE8rwWBV0mNNKCtySyd1qwWuYJFLMeolo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737544573; c=relaxed/simple;
	bh=MzTgi36Te4Egs62RtIZfNaRRcix36lrB11JQcaewGeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iLGCF9GHxJIWVe3gnLwVtmNg+xYrzTaa9RjF7P2H2sU9a5Am5QofLQChI7GQ88FhPI1x8MndLZn3g7aCjEPdgRabhbpbLdXXlwwuCbhCgnuuSS5s1FSpaSSJ7zQStP2BWAzd3exUBhSVUWK1ThRuTqxCZWzOgdlRSyVW8bm7Ubk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Z+eBYqBf; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Z+eBYqBf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737544566; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=oCcoTgEGZm+arePLfM5YzMP65mZlu3coxFNf8SkfBl8=;
	b=Z+eBYqBfbbPJOEVyiWKfq89+lsA8q3ULn/qqGMTMXCPPYuLr5nvBwfIaI7zOKLELsUJ6ogvyDSy17C+jim8DVPF0Dimbv/agMS/Lw9C1P+uNrGRWrRSOAhwVJ57xg/mN2sgeOJo+7AUC4JB2sjKOl4aLGiO9K8hJgz8YBVRPnSA=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WO8GLjT_1737544563 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 22 Jan 2025 19:16:04 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  kernel-team@meta.com,
  nehagholkar@meta.com,  abhishekd@meta.com,  david@redhat.com,
  nphamcs@gmail.com,  akpm@linux-foundation.org,  hannes@cmpxchg.org,
  kbusch@meta.com,  feng.tang@intel.com,  donettom@linux.ibm.com
Subject: Re: [RFC v3 PATCH 0/5] Promotion of Unmapped Page Cache Folios.
In-Reply-To: <20250107000346.1338481-1-gourry@gourry.net> (Gregory Price's
	message of "Mon, 6 Jan 2025 19:03:40 -0500")
References: <20250107000346.1338481-1-gourry@gourry.net>
Date: Wed, 22 Jan 2025 19:16:03 +0800
Message-ID: <87v7u7gkuk.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Hi, Gregory,

Thanks for the patchset and sorry about the late reply.

Gregory Price <gourry@gourry.net> writes:

> Unmapped page cache pages can be demoted to low-tier memory, but
> they can presently only be promoted in two conditions:
>     1) The page is fully swapped out and re-faulted
>     2) The page becomes mapped (and exposed to NUMA hint faults)
>
> This RFC proposes promoting unmapped page cache pages by using
> folio_mark_accessed as a hotness hint for unmapped pages.
>
> We show in a microbenchmark that this mechanism can increase
> performance up to 23.5% compared to leaving page cache on the
> low tier - when that page cache becomes excessively hot.
>
> When disabled (NUMA tiering off), overhead in folio_mark_accessed
> was limited to <1% in a worst case scenario (all work is file_read()).
>
> There is an open question as to how to integrate this into MGLRU,
> as the current design is only applies to traditional LRU.
>
> Patches 1-3
> 	allow NULL as valid input to migration prep interfaces
> 	for vmf/vma - which is not present in unmapped folios.
> Patch 4
> 	adds NUMA_HINT_PAGE_CACHE to vmstat
> Patch 5
> 	Implement migrate_misplaced_folio_batch
> Patch 6
> 	add the promotion mechanism, along with a sysfs
> 	extension which defaults the behavior to off.
> 	/sys/kernel/mm/numa/pagecache_promotion_enabled
>
> v3 Notes
> ===
> - added batch migration interface (migrate_misplaced_folio_batch)
>
> - dropped timestamp check in promotion_candidate (tests showed
>   it did not make a difference and the work is duplicated during
>   the migraiton process).
>
> - Bug fix from Donet Tom regarding vmstat
>
> - pulled folio_isolated and sysfs switch checks out into
>   folio_mark_accessed because microbenchmark tests showed the
>   function call overhead of promotion_candidate warranted a bit
>   of manual optimization for the scenario where the majority of
>   work is file_read().  This brought the standing overhead from
>   ~7% down to <1% when everything is disabled.
>
> - Limited promotion work list to a number of folios that match
>   the existing promotion rate limit, as microbenchmark demonstrated
>   excessive overhead on a single system-call when significant amounts
>   of memory are read.
>   Before: 128GB read went from 7 seconds to 40 seconds over ~2 rounds.
>   Now:    128GB read went from 7 seconds to ~11 seconds over ~10 rounds.
>
> - switched from list_add to list_add_tail in promotion_candidate, as
>   it was discovered promoting in non-linear order caused fairly
>   significant overheads (as high as running out of CXL) - likely due
>   to poor TLB and prefetch behavior.  Simply switching to list_add_tail
>   all but confirmed this as the additional ~20% overhead vanished.
>
>   This is likely to only occur on systems with a large amount of
>   contiguous physical memory available on the hot tier, since the
>   allocators are more likely to provide better spacially locality.
>
>
> Test:
> ======
>
> Environment:
>     1.5-3.7GHz CPU, ~4000 BogoMIPS, 
>     1TB Machine with 768GB DRAM and 256GB CXL
>     A 128GB file being linearly read by a single process
>
> Goal:
>    Generate promotions and demonstrate upper-bound on performance
>    overhead and gain/loss. 
>
> System Settings:
>    echo 1 > /sys/kernel/mm/numa/pagecache_promotion_enabled
>    echo 2 > /proc/sys/kernel/numa_balancing
>    
> Test process:
>    In each test, we do a linear read of a 128GB file into a buffer
>    in a loop.

IMHO, the linear reading isn't a very good test case for promotion.  You
cannot test the hot-page selection algorithm.  I think that it's better
to use something like normal accessing pattern.  IIRC, it is available
in fio test suite.

> To allocate the pagecache into CXL, we use mbind prior
>    to the CXL test runs and read the file.  We omit the overhead of
>    allocating the buffer and initializing the memory into CXL from the
>    test runs.
>
>    1) file allocated in DRAM with mechanisms off
>    2) file allocated in DRAM with balancing on but promotion off
>    3) file allocated in DRAM with balancing and promotion on
>       (promotion check is negative because all pages are top tier)
>    4) file allocated in CXL with mechanisms off
>    5) file allocated in CXL with mechanisms on
>
> Each test was run with 50 read cycles and averaged (where relevant)
> to account for system noise.  This number of cycles gives the promotion
> mechanism time to promote the vast majority of memory (usually <1MB
> remaining in worst case).
>
> Tests 2 and 3 test the upper bound on overhead of the new checks when
> there are no pages to migrate but work is dominated by file_read().
>
> |     1     |    2     |     3       |    4     |      5         |
> | DRAM Base | Promo On | TopTier Chk | CXL Base | Post-Promotion |
> |  7.5804   |  7.7586  |   7.9726    |   9.75   |    7.8941      |

For 3, we can check whether the folio is in top-tier as the first step.
Will that introduce measurable overhead?

> Baseline DRAM vs Baseline CXL shows a ~28% overhead just allowing the
> file to remain on CXL, while after promotion, we see the performance
> trend back towards the overhead of the TopTier check time - a total
> overhead reduction of ~84% (or ~5% overhead down from ~23.5%).
>
> During promotion, we do see overhead which eventually tapers off over
> time.  Here is a sample of the first 10 cycles during which promotion
> is the most aggressive, which shows overhead drops off dramatically
> as the majority of memory is migrated to the top tier.
>
> 12.79, 12.52, 12.33, 12.03, 11.81, 11.58, 11.36, 11.1, 8, 7.96
>
> This could be further limited by limiting the promotion rate via the
> existing knob, or by implementing a new knob detached from the existing
> promotion rate.  There are merits to both approach.

Have you tested with the existing knob?  Whether does it help?

> After promotion, turning the mechanism off via sysfs increased the
> overall performance back to the DRAM baseline. The slight (~1%)
> increase between post-migration performance and the baseline mechanism
> overhead check appears to be general variance as similar times were
> observed during the baseline checks on subsequent runs.
>
> The mechanism itself represents a ~2-5% overhead in a worst case
> scenario (all work is file_read() and pages are in DRAM).
>
[snip]

---
Best Regards,
Huang, Ying
