Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E06379EDA
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965445; cv=none; b=pzsPepiaEv6CSOQsg81Z2j/g8+HgVbfzJsBHkeEzlblBAAsYOlphfpGreYxl9Cuw8kfBxcBoSWNr9WAEicCsEVoQxYxfxRLa8vFi7lADZV8Em/t86bq1jyXCaL3+OBda0KV2fjB6dtB1PvQ1gnptWjf5o0qKMlSUZA4ogj99Iq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965445; c=relaxed/simple;
	bh=JnBv0xQzTOMlPkAuQK4QJmqgQKl7ST4anVP64Y/xlXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PfzHmGbMIEuMfimnTGQmuWNZYG0ZCI71jZNvXhJHkwO1NXyKCQ3468UD5p+15kPv/H6jK5FZmNwi/gAzqckp3uJMcKKrFJSVEULHd08P28DUQhCbyDUbxsxNyDsPEqCo6dJwj/+vM92k4jWoyjcJLInKlN4XRXzYeqJMnCg7MFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPHQS0Zb; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPHQS0Zb"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-7b4ee3a88e1so4999787b3.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965442; x=1779570242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yKlsY6+9+MZ7mU7SmEl9YWbtOg8xFpSDNXLhXZWgGQ=;
        b=bPHQS0ZbfYn1LTHUG6FggHqO6f1ZmSNvqCgHEwe9/n7Eb6d+0FOe1V5BIpabl7LRGI
         6mql8F7xXdvc3spdb4B3rnf5UAuiDGGNeo2XBXfSZY5I+yQgHJ/Op+qFN4JQ3Hhnyety
         LwB39mBvPvLaDiN1o1nZY38tJ7TluKcrjI/Oa0TG5Snofu9Ur/3HnF9XpHNaFIN4dQJ6
         /+/umbvQSaSR3WLMrN9CA5BSEwnZfXrR/KtJ4Xk17U9unmdIcvH1l2+mY1yiM4aUiOiD
         5LZ0Ie8SJF3G5FkaoM6HIYMYyWrBrs7i+dAQmSkCovwf/OlYCJgEE9qmxdIIzaiDQEm4
         90rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965442; x=1779570242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yKlsY6+9+MZ7mU7SmEl9YWbtOg8xFpSDNXLhXZWgGQ=;
        b=LI9IiEg6wc6z9qTHBvFZ2hF8/uaHBvlzTAeOZkfMpetz2uEKWzmfVP0knE9E0mrdfA
         e63qIfwgvbXqqlCncVdH54hAeeL0uOQREoclc6rl0f1NJmVviV9YYyh3IAfZ7VfBTIrp
         xlzmT9RTXLlE4Uffyr8YfwoLC/Z/voBCSnSdP+3BxxTsmSFyxch4fHcA5VMdz7t9T1kA
         VTp7RYExxD/1G4+rd0kMz/uAqlZWVL5nE3p6BQDsD6KU8WYw/rnIWhM9T6kW4p76rqkM
         +CyZ3Lo8Oq0IlPLWfAvt0zJPAxgk5N2gtiVAkpjVqfc6K+VSdd5bf1yrJU2LLF4/rXl0
         vJ3A==
X-Forwarded-Encrypted: i=1; AFNElJ8zhzlQUV1mGh1StvPiovnzFDXcgh0rvKnyFxBzv6S7MtB2BZC65hLQDfi4lCxfWJq2w88SSI8pQ0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX5atpLdcxEksaUnKKUgQDSdwj0KpVOq0L0LIbt0kMTsRcYVUV
	RLonLwjtyVLx4HsoUyYxcS2baQ+dtFo/bQe4RTwJCQI2AEWZQsiibTg=
X-Gm-Gg: Acq92OEldkBnI0y3YmK5SBLFBf+0vS3YUpAGp7UUI3Ih77jguH8kJyVwFglDrAxGN1E
	oCrzwlVnVHP7p/wPYZP0GEBInGJFVBN/HCNmL+OED0ZFp6r5fVgRei1KKtqH/7MWtVK/wMJH6rg
	SmUGhHDsRY1jO8NZExEGcxvIhnyzGJeHHvGj7W2sakVylwpJQzYd685I+g/0neL0o9WgOc90iv5
	Fa2gLUKC9AT9ItMt/qXjjX+yt7FDaPEIJ+q8Q7ONpny3MAJX5S+f5T3ITQhz3UVvCKDNJxuMvl8
	QbbbIqKyFOIGfYI9l3LCplX0EtZAZx8RTiow+/gqMSHu8scS7DHgzIgVFfy5oHFRaoMdmebwMRR
	PW9ri4kDWPHnJ0j2q91z7JyFH5p6wuKQEw7XxDEoLeJ1uhBauWAkEMoQknq9MGCVIVDaNBgUJYn
	u5Y3kT+TLxlohZ42d5JrfHd+Oj+gAzIMPawrSs706slrhXQlVjFNQPwa24b712CMfRSzY9TOwMp
	3ARF+cZOpNu
X-Received: by 2002:a05:690c:6d84:b0:7bd:7b55:ebe1 with SMTP id 00721157ae682-7c959f80c19mr97174407b3.1.1778965441933;
        Sat, 16 May 2026 14:04:01 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f5e89bd4sm48605287b3.49.2026.05.16.14.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:04:01 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com
Subject: [RFC PATCH 0/5] mm/damon: DAMOS quota controller and paddr migration walk fixes
Date: Sat, 16 May 2026 14:03:52 -0700
Message-ID: <20260516210357.2247-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series carries five fixes for the DAMOS quota controller and the
paddr migration walk.  All five were surfaced during closed-loop tiering
testing on a heterogeneous-memory system (DRAM + CXL on a separate
NUMA node), but each fix is in code paths that benefit any caller --
not scoped to closed-loop tiering or to any specific goal metric.

Test envelope: AMD EPYC dual-socket host with CXL.mem on a separate
NUMA node, two-scheme migrate_hot PULL+PUSH setup driven by
node_eligible_mem_bp (now in linux-next)[1].

What each patch does
====================

Patch 1 - mm/damon/core: fix nr_accesses_bp underflow in damon_moving_sum

  damon_moving_sum() can underflow when a region's access rate drops
  to zero faster than the moving-sum window length.  The internal
  accumulator subtracts an outgoing sample without a lower bound,
  producing a sentinel-large nr_accesses_bp that mis-classifies a
  cold region as hot.  Affects every DAMOS scheme, since
  nr_accesses_bp is used on every access-rate update for every
  region regardless of which scheme or goal metric is active.

Patch 2 - mm/damon/core: cap effective quota size to total monitored memory

  The DAMOS quota tuner can compute an effective size (esz) larger
  than the total monitored memory, because the tuner integrates over
  cumulative deltas without bounding by the actual workload size.
  Once esz exceeds total monitored memory the per-tick "remaining
  quota" arithmetic stops being meaningful: any scheme can apply to
  the entire monitored space and "remaining" stays positive
  indefinitely.  Cap esz at total monitored memory so the controller
  remains within physically realisable bounds.  Tuner-shape and
  goal-metric agnostic.

Patch 3 - mm/damon/core: floor effective quota size at minimum region size

  Symmetric to patch 2: the tuner can also compute esz < min_region_sz,
  causing schemes to attempt zero-byte migrations for many ticks before
  the tuner ramps esz back up.  Observed under the CONSIST tuner with
  a node_eligible_mem_bp goal: ftrace traced esz stuck at 1 byte for
  96 seconds before the first region was tried; the first acted-on
  region appeared at t=113s when esz crossed the min_region_sz
  threshold.  Floor esz at min_region_sz so schemes always have at
  least one region's worth of quota when the tuner asks them to act.

Patch 4 - mm/damon/paddr: skip free pageblocks in migration walk

  damon_pa_migrate() walks every 4KB PFN in a region.  On
  sparsely-populated lower-tier extents (e.g., a 549GB CXL region
  with only ~8GB populated), this is ~144M PFN iterations per scheme
  tick at ~40ns each = ~5.6 seconds of walk per tick.  Use
  pageblock-level free-page detection to skip unpopulated runs of
  pages: only enter the per-page loop for pageblocks that contain at
  least one allocated page.  This brings the walk to
  O(region_size / pageblock_size) skip-check cost plus
  O(populated_pages) per-page work.  On x86 pageblocks are 2MB, so
  the same 549GB/8GB example becomes ~281K pageblock skip-checks
  (microseconds total) plus ~2M per-page visits for the populated
  pages -- ~80ms expected.  Helps any migrate_hot/migrate_cold scheme
  on paddr ops, regardless of what drives them.

Patch 5 - mm/damon/paddr: add time budget to migration page walk

  Densely populated regions (e.g., a busy DRAM range where most
  pageblocks contain at least one allocated page) can still consume
  full ticks even with patch 4 applied.  Add a 100ms wall-clock
  budget with a ktime_get() check every 4096 pages walked
  (~16MB worth).  When the budget expires before reaching the end of
  a region, kdamond returns control; subsequent ticks re-walk the
  region from the start.  Folios already on the target node are
  dropped at migration time, so re-walks only re-do collection work,
  not the migrate itself.  Together with the per-scheme quota cap,
  per-tick work is bounded and the workload converges over multiple
  ticks for dense regions.

  Worst-case migration walk contribution to a tick is bounded at
  100ms per scheme regardless of region size or population density,
  preserving kdamond's ability to service other DAMOS schemes and
  user-space sysfs operations during heavy migration phases.


Testing context
===============

  Hardware:  AMD EPYC dual-socket, CXL.mem on a separate NUMA node.
  Workload: 32GB hot working set across DRAM and CXL nodes.
  DAMON config: paddr ops, two migrate_hot schemes (PULL CXL->DRAM,
                PUSH DRAM->CXL) with complementary address filters,
                node_eligible_mem_bp goal per scheme, temporal
                quota tuner, 1s reset interval.

Each fix in this series was reproduced under the above setup, then
verified via ftrace and per-scheme stats after the fix landed.

References
==========

[1] mm/damon: add node_eligible_mem_bp goal metric
https://lore.kernel.org/damon/20260428030520.701-1-ravis.opensrc@gmail.com/

Ravi Jonnalagadda (5):
  mm/damon/core: fix nr_accesses_bp underflow in damon_moving_sum
  mm/damon/core: cap effective quota size to total monitored memory
  mm/damon/core: floor effective quota size at minimum region size
  mm/damon/paddr: skip free pageblocks in migration walk
  mm/damon/paddr: add time budget to migration page walk

 mm/damon/core.c  | 29 ++++++++++++++++++++++++++++-
 mm/damon/paddr.c | 40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 4 deletions(-)


base-commit: 0cec77cfd5314c0b3b03530abe1a4b32e991f639
-- 
2.43.0

