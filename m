Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACA646BF
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 00:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208234; cv=none; b=Y0AohsoLPFD1Q8bteT2p/nrqBnYZ8R6tUbTMHELyUm7jzowQaiGnzYBkIcHAlUlufTtNF2TmllQupyt8HMMeF9u165nDeiD+yartUbKSX/sOgC3+NlDiRv/sjFGnWGe/yRAOTNgm+6vHc77FP/OxJsMH1w/7S3zmvg1EFaA5Ufc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208234; c=relaxed/simple;
	bh=fdYhHgKgsUmIxBa+AdOLU+FujFLR58qBPCwcj4EHysU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MmelFS5Sny5VRLO2dlgXr+zVPekLiehX8VuyyNk6BX/FAfXkWLujWbc7sW7xYucHCuzJTTYvhTpx/v8mr269dnsW3NqU3ckR+Ymn0SSw43sOmgMq9Sd9fJRnYvmnYtsRzEN8+RbwEJ1fab1K+wud+QYAXS0oGgwxkUDBXPceVLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iGt99SIr; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iGt99SIr"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8e8445219so132535456d6.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 16:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1736208230; x=1736813030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7F9aIJvmZZRHwFnTPTykyqjJydlIPU4/22TvPBaoQ6g=;
        b=iGt99SIrLUZboL300DYGgEhmQ/d/4eakKGvr2/mKYzcz1cMqe5z2Nc1vssqb/UyfjB
         E6skkqw/F+M9hn8KVGkPSR27JjBfUADXWcTNgE96KmrEaYaP8OJrfWvG2Xw9m5SauTFG
         VqhHbTzFSPU4mPIt8vl2y7YbT/cdfEk3klBPidUeZfrgRKiXE++7Go/TK/WGBjfoVQC4
         CAgrFUvGyIH//aD/Hm8HoxdoOucmnNguzD+2M0q3lMSlyzJY5NkV1z/YDYF99HdGm/sO
         KjwtgPjcYfDrsRvlyibAVMMKDRgLy793oHpOaP/P8DCU3wIAR9uRGrQi92Kn6gfFTPwB
         AUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736208230; x=1736813030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7F9aIJvmZZRHwFnTPTykyqjJydlIPU4/22TvPBaoQ6g=;
        b=avdm909flngblcjwdMoyn2qHcDRlUfbBsmA37qZa7McRt8YOFAN/Pt2HOXxDmRUN1/
         Ix8wUUPOJure8Efc9++QGxhfutjBiV+/dIp5jVJVS5PaCi/e/+eg2x9efJkYg11jlsL5
         EA0sYuEycUboTp6qISl85i9HmyA95MjgxGDSVkz9DAPzipKBPJWufSfvqlpiKrRZyfB+
         NUfTS7uHmnrJJ58gLAW7OvcFJDRJ3N788GRuhEZwPR/tx6DeVcLnzsc0amrSBPK7XTRx
         MBNQuoy/J65vlG3U+XlP0nG7pfhcqmk0C+xMwM3w2LE+ZydV2WqAK2slOrKyZ+abyrXn
         qsYA==
X-Gm-Message-State: AOJu0Ywd4i5KeEyrv6vsStmjd1uhCkKOwpOG3CaG5tFN2uOLVuL661Bg
	d0ky1blwPFO9f9qpaMt88jHdjVkBPAkfNbe6LajxaUuDc9Gzxl06NuI61zIgj48=
X-Gm-Gg: ASbGncvxOrTy8CDWyCbjfl//SasDSrD22RmIqTDFZLzdMYVRiO41zgluIwVaFmDYamB
	gxQ0TYGVKLQ372EhW54TE4U3HHYFNvtiBIb9SR3q5JrTPbexbcebxQF+1lD0Is078Ax7Q2Re4Qd
	NNbE7LKwK654FjHQHOP35svbCrpN9jujYjeS4fCIr7BuhXYhSztdLIN1kVDmJa4uMvhee4od56a
	7Lz1FDn2msWXX8mpD9+69ubCgBmDwj1a56vQg8q6eOLDXJzF2ITJGR+WOrRWcxIFLyUt5BB2CWS
	/RtZvRvxLcqyvp5xT0mYwo36cxeSE7biGAHrkU+aF4gT
X-Google-Smtp-Source: AGHT+IF+mYRnk/NIcdkkRLvhUPlffWd6FMKOjD6S7ChDXrEeCMpbbAck/XrcDGkea/OJxhSCVD7kBw==
X-Received: by 2002:ad4:5c61:0:b0:6d8:7eb9:9bd7 with SMTP id 6a1803df08f44-6dd233b7865mr867787096d6.43.1736208230126;
        Mon, 06 Jan 2025 16:03:50 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137218sm174104476d6.57.2025.01.06.16.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:03:49 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	david@redhat.com,
	nphamcs@gmail.com,
	gourry@gourry.net,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kbusch@meta.com,
	ying.huang@linux.alibaba.com,
	feng.tang@intel.com,
	donettom@linux.ibm.com
Subject: [RFC v3 PATCH 0/5] Promotion of Unmapped Page Cache Folios.
Date: Mon,  6 Jan 2025 19:03:40 -0500
Message-ID: <20250107000346.1338481-1-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unmapped page cache pages can be demoted to low-tier memory, but
they can presently only be promoted in two conditions:
    1) The page is fully swapped out and re-faulted
    2) The page becomes mapped (and exposed to NUMA hint faults)

This RFC proposes promoting unmapped page cache pages by using
folio_mark_accessed as a hotness hint for unmapped pages.

We show in a microbenchmark that this mechanism can increase
performance up to 23.5% compared to leaving page cache on the
low tier - when that page cache becomes excessively hot.

When disabled (NUMA tiering off), overhead in folio_mark_accessed
was limited to <1% in a worst case scenario (all work is file_read()).

There is an open question as to how to integrate this into MGLRU,
as the current design is only applies to traditional LRU.

Patches 1-3
	allow NULL as valid input to migration prep interfaces
	for vmf/vma - which is not present in unmapped folios.
Patch 4
	adds NUMA_HINT_PAGE_CACHE to vmstat
Patch 5
	Implement migrate_misplaced_folio_batch
Patch 6
	add the promotion mechanism, along with a sysfs
	extension which defaults the behavior to off.
	/sys/kernel/mm/numa/pagecache_promotion_enabled

v3 Notes
===
- added batch migration interface (migrate_misplaced_folio_batch)

- dropped timestamp check in promotion_candidate (tests showed
  it did not make a difference and the work is duplicated during
  the migraiton process).

- Bug fix from Donet Tom regarding vmstat

- pulled folio_isolated and sysfs switch checks out into
  folio_mark_accessed because microbenchmark tests showed the
  function call overhead of promotion_candidate warranted a bit
  of manual optimization for the scenario where the majority of
  work is file_read().  This brought the standing overhead from
  ~7% down to <1% when everything is disabled.

- Limited promotion work list to a number of folios that match
  the existing promotion rate limit, as microbenchmark demonstrated
  excessive overhead on a single system-call when significant amounts
  of memory are read.
  Before: 128GB read went from 7 seconds to 40 seconds over ~2 rounds.
  Now:    128GB read went from 7 seconds to ~11 seconds over ~10 rounds.

- switched from list_add to list_add_tail in promotion_candidate, as
  it was discovered promoting in non-linear order caused fairly
  significant overheads (as high as running out of CXL) - likely due
  to poor TLB and prefetch behavior.  Simply switching to list_add_tail
  all but confirmed this as the additional ~20% overhead vanished.

  This is likely to only occur on systems with a large amount of
  contiguous physical memory available on the hot tier, since the
  allocators are more likely to provide better spacially locality.


Test:
======

Environment:
    1.5-3.7GHz CPU, ~4000 BogoMIPS, 
    1TB Machine with 768GB DRAM and 256GB CXL
    A 128GB file being linearly read by a single process

Goal:
   Generate promotions and demonstrate upper-bound on performance
   overhead and gain/loss. 

System Settings:
   echo 1 > /sys/kernel/mm/numa/pagecache_promotion_enabled
   echo 2 > /proc/sys/kernel/numa_balancing
   
Test process:
   In each test, we do a linear read of a 128GB file into a buffer
   in a loop.  To allocate the pagecache into CXL, we use mbind prior
   to the CXL test runs and read the file.  We omit the overhead of
   allocating the buffer and initializing the memory into CXL from the
   test runs.

   1) file allocated in DRAM with mechanisms off
   2) file allocated in DRAM with balancing on but promotion off
   3) file allocated in DRAM with balancing and promotion on
      (promotion check is negative because all pages are top tier)
   4) file allocated in CXL with mechanisms off
   5) file allocated in CXL with mechanisms on

Each test was run with 50 read cycles and averaged (where relevant)
to account for system noise.  This number of cycles gives the promotion
mechanism time to promote the vast majority of memory (usually <1MB
remaining in worst case).

Tests 2 and 3 test the upper bound on overhead of the new checks when
there are no pages to migrate but work is dominated by file_read().

|     1     |    2     |     3       |    4     |      5         |
| DRAM Base | Promo On | TopTier Chk | CXL Base | Post-Promotion |
|  7.5804   |  7.7586  |   7.9726    |   9.75   |    7.8941      |

Baseline DRAM vs Baseline CXL shows a ~28% overhead just allowing the
file to remain on CXL, while after promotion, we see the performance
trend back towards the overhead of the TopTier check time - a total
overhead reduction of ~84% (or ~5% overhead down from ~23.5%).

During promotion, we do see overhead which eventually tapers off over
time.  Here is a sample of the first 10 cycles during which promotion
is the most aggressive, which shows overhead drops off dramatically
as the majority of memory is migrated to the top tier.

12.79, 12.52, 12.33, 12.03, 11.81, 11.58, 11.36, 11.1, 8, 7.96

This could be further limited by limiting the promotion rate via the
existing knob, or by implementing a new knob detached from the existing
promotion rate.  There are merits to both approach.

After promotion, turning the mechanism off via sysfs increased the
overall performance back to the DRAM baseline. The slight (~1%)
increase between post-migration performance and the baseline mechanism
overhead check appears to be general variance as similar times were
observed during the baseline checks on subsequent runs.

The mechanism itself represents a ~2-5% overhead in a worst case
scenario (all work is file_read() and pages are in DRAM).


Development History and Notes
=======================================
During development, we explored the following proposals:

1) directly promoting within folio_mark_accessed (FMA)
   Originally suggested by Johannes Weiner
   https://lore.kernel.org/all/20240803094715.23900-1-gourry@gourry.net/

   This caused deadlocks due to the fact that the PTL was held
   in a variety of cases - but in particular during task exit.
   It also is incredibly inflexible and causes promotion-on-fault.
   It was discussed that a deferral mechanism was preferred.


2) promoting in filemap.c locations (callers of FMA)
   Originally proposed by Feng Tang and Ying Huang
   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/tiering.git/patch/?id=5f2e64ce75c0322602c2ec8c70b64bb69b1f1329

   First, we saw this as less problematic than directly hooking FMA,
   but we realized this has the potential to miss data in a variety of
   locations: swap.c, memory.c, gup.c, ksm.c, paddr.c - etc.

   Second, we discovered that the lock state of pages is very subtle,
   and that these locations in filemap.c can be called in an atomic
   context.  Prototypes lead to a variety of stalls and lockups.


3) a new LRU - originally proposed by Keith Busch
   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git/patch/?id=6616afe9a722f6ebedbb27ade3848cf07b9a3af7

   There are two issues with this approach: PG_promotable and reclaim.

   First - PG_promotable has generally be discouraged.

   Second - Attach this mechanism to an LRU is both backwards and
   counter-intutive.  A promotable list is better served by a MOST
   recently used list, and since LRUs are generally only shrank when
   exposed to pressure it would require implementing a new promotion
   list shrinker that runs separate from the existing reclaim logic.


4) Adding a separate kthread - suggested by many

   This is - to an extent - a more general version of the LRU proposal.
   We still have to track the folios - which likely requires the
   addition of a page flag.  Additionally, this method would actually
   contend pretty heavily with LRU behavior - i.e. we'd want to
   throttle addition to the promotion candidate list in some scenarios.


5) Doing it in task work

   This seemed to be the most realistic after considering the above.

   We observe the following:
    - FMA is an ideal hook for this and isolation is safe here
    - the new promotion_candidate function is an ideal hook for new
      filter logic (throttling, fairness, etc).
    - isolated folios are either promoted or putback on task resume,
      there are no additional concurrency mechanics to worry about
    - The mechanic can be made optional via a sysfs hook to avoid
      overhead in degenerate scenarios (thrashing).


Suggested-by: Huang Ying <ying.huang@linux.alibaba.com>
Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Suggested-by: Keith Busch <kbusch@meta.com>
Suggested-by: Feng Tang <feng.tang@intel.com>
Signed-off-by: Gregory Price <gourry@gourry.net>

Gregory Price (6):
  migrate: Allow migrate_misplaced_folio_prepare() to accept a NULL VMA.
  memory: move conditionally defined enums use inside ifdef tags
  memory: allow non-fault migration in numa_migrate_check path
  vmstat: add page-cache numa hints
  migrate: implement migrate_misplaced_folio_batch
  migrate,sysfs: add pagecache promotion

 .../ABI/testing/sysfs-kernel-mm-numa          | 20 +++++
 include/linux/memory-tiers.h                  |  2 +
 include/linux/migrate.h                       | 10 +++
 include/linux/sched.h                         |  4 +
 include/linux/sched/sysctl.h                  |  1 +
 include/linux/vm_event_item.h                 |  8 ++
 init/init_task.c                              |  2 +
 kernel/sched/fair.c                           | 24 ++++-
 mm/memcontrol.c                               |  1 +
 mm/memory-tiers.c                             | 27 ++++++
 mm/memory.c                                   | 32 ++++---
 mm/mempolicy.c                                | 25 ++++--
 mm/migrate.c                                  | 88 ++++++++++++++++++-
 mm/swap.c                                     |  8 ++
 mm/vmstat.c                                   |  2 +
 15 files changed, 230 insertions(+), 24 deletions(-)

-- 
2.47.1

