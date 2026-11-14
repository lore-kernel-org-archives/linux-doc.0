Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640206;
	b=R3/I5Zvq1dMxfxtm98S9vMFqhJeZeFjZCPDsg8Gk4QT8tqXZiu+hRkiAIw2Q+dPKvjMD
	 uZjB1gx3c/9DMu8k+TvfsW78Hn8XBc/qlfbAzyEi/gJHdGr6Xe3sSrgREPwta2m0v2GMs
	 vhWmmP3oR+r227BqhenF2Y9cQ921SfZv09PkQEr4/NS+I6Ixi4gXc3zW41ISLQIX11ynQ
	 NPFCXkkpLWoCyxYbot0bYb8Ocn39Mdso+IJlHdLZyy8VIHr79iLiFSgAMOgKnFSiZ10wy
	 y6MrRy+T/8PETca008YzBU8GzmYHLYl7qwkzrGsrkAPIbWrDUJR0T8jkzcisiuWIv/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oRfBKleHhU3BUp7ltu8uNKVynP2g/0Xp3jgnuf+J/Eo=;
	b=IW6fnF+jVkIjqqMzjimAAMADhia1PVq1diad7IAf9Lv48bXqi2NaRYR0Csv+brAaF90D
	 lG6q0C6mbl1twe2WZVh2geXnC92T7UyOn8muPxzYO/gmbUudRG0HpWs1janP2kxzrzEEl
	 xZzOm4ZSQzreY3VsWJlwdCVeEnFvwJf+8spozxFJjQXRA247RNEBb4dAkPV0ZRw5ZDDxL
	 j8XWp4tuuhwAVDik0cEi3Z04Drzp9k/D1hI+lLNKqUEAt+vPnBN8QF918PJAlFuWC/i7+
	 nUVAM6Vc8gJPoAJZiNi9GUl4nqIIZQO1S1QVDrkElBEG2R4wjxb5NRMriPw+92x2w7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=a14J+ivW;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ABF606A32E
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57ABF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=a14J+ivW
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9495d543b91so53676585a.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640204; x=1795245004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oRfBKleHhU3BUp7ltu8uNKVynP2g/0Xp3jgnuf+J/Eo=;
        b=a14J+ivWzJ/poYORcK4nNkkQRbfvwDjPC+e6K1Ne6hUI5q5zkfi2YJp38SflEWnqEp
         XFZVhHKO/Qe4IhOAtPdb+5xWEBDEf+CRvZFv/Xmb9JJ0i82uZjhBpiUGQztIMksos6gg
         xGxFElFmKZ2suNnoBeSLuTQBsMs5Nf7OrYOFYJvYQISHbw4+R+RO8si0+OvQHKqhkbjY
         KvHL4cxvfPXZ96A4VSjq+VnxjO1TGDXLVYg9VsVWtLyw/p2B3+9BUPO/onXKp3RxqVR1
         qrOcQEof96hwqfQFb6IQQIBoMEN2I3TrYTw361/F+VmC6r7ByoRMkxiD8WOkiQSjh60S
         xLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640204; x=1795245004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRfBKleHhU3BUp7ltu8uNKVynP2g/0Xp3jgnuf+J/Eo=;
        b=tjw2hhW/Bkn481vOHBixLgrl80OgrBV87OHp5Fuj86Fc6M7Fiv/gN0lfEiJzDD6ZRO
         OdXMFsUQy/oSxAoGWLltXvJmzr6oIGi46SFw03wJNOUkiK6LrUd+0HJ0+powBbpuAmsq
         X693WV9fKO1PEBdUv8wn6VQc9N4DuS1Boxm/WBYaHwJjcJh+GS37bO1uwROAORrDy1RU
         QcYZnBofs+0CI9w8lTvy9RORCMLAwQyh6SWoQ9g4gkKbhZxo5AYj355hVs33etO/9ksr
         DHliO00lYzVoN8KIqCT+l9pgheNU1xR9OR2PiM7WlciPtFNuaRFwYg6HS22QHHa5OJhX
         YE6w==
X-Forwarded-Encrypted: i=1; AL+hErHzrgDf89XwIzzi2T+JAsLJsiEAznuSCpfkmhYp5E5xtGqyAegMfdSghYccI7do7zmycuC7crBh5xU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3TlI0AN1E0yc8oplUK9DhtBkfauwvcSv2X5NRt4x+uO6OVuLL
	188SrZSUE9m1Bui9dSUFcCEx+g0zqzZwEYTpObWsH/DMfBvLjbE84w/VVaop6tRgF5Q=
X-Gm-Gg: AYBFou0x1iBH+jK1Rw53LAp5Dfj245cgi7MGQ28Yy2IpOseW3IsOyIRFxz2kUrUrBVK
	800CFNDmN17d4deniF1JGyWaFbUzUIAwQaJ8BvTfQJFKU3AmRm4f9xRODngHXAQ/ABxhwcnZW/O
	+khIscH8d3ZLOKL1f6wu2MktU4vHyIqVw+vOY8s9f8x1Gm8pvEVwgHicThmwZfGXb/Xg9YCyoku
	eILOV76ew0QALGGD6qqPkJErzc2Bgwc1rBlhTHmVNFnuuJW6TA7BH6YYA0TxdLZSOgeebNmp8P3
	JCMNbYcbEhdcyx4LsoQRaZScYncFTwh4uGm4TZ/YlewWoWDSxQ33HSBum+JqIraVjHO8n6gNp3G
	lCRKrByeyeQMq69Ep1uez8IehuHOc4Ai41NpXMiiNIklTLykwRgvorD1fQPxxBVGlgXOhyDvauM
	8brguwsd7LnmPuNaYsYNeFxbLZLmjmnFoq+2huqKprEtxMRF1MiMuUHd5dAI77XlSzbS1BLcY/p
	a+w/UGx2WCuEnehBA5veR7PZSdplRpcbdanPPGsVWWOwkqLIRlQVOTWak+RtjRE2sGdUqZjxA24
	ndr26bnFEYbcAT4NwDzX08jHhjN8Csmso35hnRoPiwfEN/jhOcpGM3iilnDJvL3Y497EP73KSQE
	5vP0gB6cQznlMC8k+
X-Received: by 2002:a05:620a:8398:b0:93c:ba88:cd65 with SMTP id af79cd13be357-9494b9e13damr803141185a.7.1794640204107;
        Fri, 13 Nov 2026 23:10:04 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:03 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 00/22] mm: introduce N_MEMORY_COMMON
Date: Sat, 14 Nov 2026 02:09:37 -0500
Message-ID: <20261114070959.3490008-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is phase 1 of the Private NUMA node series.

I will send v6 "Private Memory NUMA nodes" (phases 2 and 3) separately
next week for further discussion - but I pulled this out ahead to make
the core filtering mechanism easier to review.

The series is now broken up like so:

Phase 1: Introduce N_MEMORY_COMMON to define "general purpose" (common)
         memory as a concept separate from a node having memory as a
         topological feature (N_MEMORY).

         This phase is a no-op for existing systems, but creates the
         baseline for ensuring private node memory is default opted-out
         of being touched by MM (much like ZONE_DEVICE).


Phase 2: Introduce N_MEMORY_PRIVATE to define memory not part of the
         general purpose pool. With this we can introduce a minimum set
         of KUnit tests for the page allocator to demonstrate the
         isolation mechanism.

         At this point it will be possible for a driver to re-use the
         buddy allocator to make uniform order-N allocations.


Phase 3: Introduce feature bits (COMPACTION, RECLAIM, MEMPOLICY) which
         is the minimum viable set to allow userland to manage a private
         memory node via mbind() and migrate_pages().  

         This enables management of HBM and Coherent GPU memory via
         userland tools (numactl, cpuset) while protecting them from
         incidental allocation (no fallbacks, only explicit placement).

         The memory could even be hotplugged in ZONE_NORMAL and pinned.

Actual cover letter for this portion
====================================

N_MEMORY has two meanings today:
  1) this node has memory
  2) ordinary allocations and MM services can use this node's memory

The two are the same today. They stop being the same once a NUMA node
with memory isn't part of the general allocation pool.

This series adds N_MEMORY_COMMON for the second meaning and converts
the relevant N_MEMORY users accordingly. N_MEMORY continues reporting
memory topology - and some users (cpusets) still utilize it.

At the end of this series, N_MEMORY == N_MEMORY_COMMON, so the series
changes no behavior for existing systems. A later series will add memory
outside N_MEMORY_COMMON without having to audit every N_MEMORY user again.

Rather than add new hooks for page-table and pfn walkers, we consolidate
existing ZONE_DEVICE checks (page/folio_is_zone_device()) into a general
`page/folio_is_common_memory()` check.

The series is laid out as:

  1-3   helper functions to check node states and a folio's
        membership to a common memory node.  N_MEMORY_COMMON itself, and
        the `has_common_memory` sysfs ABI.
  4     zonelists: the fallback lists hold common nodes, and a node's
        __GFP_THISNODE list is built only for a common node
  5-21  N_MEMORY->N_MEMORY_COMMON and zone_device -> common_memory
        conversions. One component per patch.
  22    removal of first_memory_node/next_memory_node, which no longer
        have users after this series.

Each conversion restricts or adjusts:
  - an MM service (reclaim, compaction, KSM, collapse, etc)
  - an allocation target to common memory
  - accounting meant for ordinary allocations from common memory only

has_common_memory lists the same nodes as has_memory until memory
outside N_MEMORY_COMMON exists. It is added now so that userspace, such
as libnuma, can start choosing allocation targets from it, and so that
the meaning is fixed before anything makes the two lists differ.

first/next_memory_node() is replaced by first/next_node_state().

Gregory Price (Meta) (22):
  mm: add node-state-filtered zone and node iterators
  mm: publish and clear node memory states via helpers
  mm: introduce the common-memory node state
  mm/page_alloc: build zonelists from common memory
  mm/mempolicy: keep interleave and tmpfs mount policies on common memory
  mm: base hash distribution on common memory nodes
  mm/memory_hotplug: migrate offlined pages to common memory
  mm/memory-tiers: restrict demotion topology to common memory
  mm/ksm: restrict merging to common memory
  mm/khugepaged: restrict collapse to common memory
  mm/mempolicy: don't NUMA-hint folios outside common memory
  mm/damon: restrict DAMON-native folio operations to common memory
  mm/hugetlb: restrict pool growth to common memory
  mm/page_alloc: count common memory nodes for kswapd recovery
  mm/oom_kill: compare OOM constraints against common memory
  tty/sysrq: use common memory for the manual OOM zonelist
  mm/vmscan: restrict reclaim to common memory
  mm/compaction: restrict compaction to common memory
  mm/migrate: restrict move_pages() destinations to common memory
  PM: hibernate: size the image from common memory
  mm/khugepaged: base the recommended min_free_kbytes on common memory
  nodemask: remove the now-unused first_memory_node/next_memory_node

 Documentation/ABI/stable/sysfs-devices-node | 16 +++++++
 Documentation/mm/physical_memory.rst        |  8 +++-
 drivers/base/node.c                         |  2 +
 drivers/tty/sysrq.c                         |  3 +-
 include/linux/mmzone.h                      | 46 +++++++++++++++++++++
 include/linux/nodemask.h                    | 38 +++++++++++++----
 kernel/power/snapshot.c                     |  7 +++-
 mm/compaction.c                             | 14 +++----
 mm/damon/ops-common.c                       |  7 ++--
 mm/damon/vaddr.c                            |  2 +-
 mm/hugetlb.c                                | 44 +++++++++-----------
 mm/internal.h                               | 18 ++++++++
 mm/khugepaged.c                             | 12 ++++--
 mm/ksm.c                                    |  8 ++--
 mm/memory-tiers.c                           | 23 ++++++-----
 mm/memory_hotplug.c                         | 25 ++++++-----
 mm/mempolicy.c                              | 30 +++++++-------
 mm/migrate.c                                |  2 +-
 mm/mm_init.c                                | 16 ++++---
 mm/oom_kill.c                               |  7 ++--
 mm/page_alloc.c                             | 43 +++++++++++++------
 mm/vmscan.c                                 | 26 ++++++------
 22 files changed, 266 insertions(+), 131 deletions(-)

-- 
2.53.1-Meta

