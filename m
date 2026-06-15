Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9433A8739
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 23:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564678; cv=none; b=O3Lxx/RVA/kR9xgWTy7Io7oWbgw/p724pFvyEh6YtP9fxe8F5KSXiJh5r4jJh2CjCm0DUG1Lr/Um0Lp8/8/MLRjZwCTV2UmoRDvkXn+EOD9JhSfTjOXLFHQVs9ZO+ecIkXoUrILM4/ez0uJG4pLvW1MKFMV0KsihyJvPanGFk9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564678; c=relaxed/simple;
	bh=GRqVPO9ReFPyfcX6N7KV9l/r3XMiwXKTzY00+O6FRM4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RtIAGPmuHhWaOUEnPmBiI0YwiBxB+AW2mtubqQq2DRFfBSVb8R8r3kqXvDuP0FujogbFs7U5C228luFWE2UFSsNIp/0FIPlGaZvPSOfWbubWGeFvVIDQh+Y40itTUk2mxITS4AYESQ+JnIT28qeyZ39a0OFPw6BYLWebPcYHrYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dlo/Sf2m; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dlo/Sf2m"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-13980b6561dso328355c88.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 16:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781564676; x=1782169476; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7GIBzJ7uSg3QIoKmsA84p6VYa0XwLi3J6iI9/k79LQI=;
        b=dlo/Sf2mYt72E9tisDdM9rQ2Vs90ptEGAwWA9al2ZAXRjnNJ4n+I/aZixJEsdLm7/F
         KubMz/HPtC8mb5iuTJ8tCabzqTvrlJtlZWsiftgl4lyKznyXhsxNkdrfKY07TBe5qurQ
         ry4S+AzxwJlrb9UUcjyMyVzUH3dRPtkGIuv9GNrhzThHbGiXLQASFyOJCwsZD6OazyR6
         CfQE5NKlcPa3cmWhI+msiSAkzeBUNkRg1RQP60t0chBrpxH+jnx06dR8Qgx2TdJB3VeF
         EVyapBAOVt3ZO+eI9ZPSvAZK9N6A1VHoOVxIu0bVptYIQ12qq6Ev7XPOGjjT2DinuCMk
         bi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564676; x=1782169476;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GIBzJ7uSg3QIoKmsA84p6VYa0XwLi3J6iI9/k79LQI=;
        b=RnqTqHu7XneireL8ZWARlsXSBBhA9l31dTdro3z/B0zdxTTmbQty+UM10l59aNUjf8
         hgciWn9SZxM5Ydw3E+hNFJX4jyTYHvTrMKdZ59CV0JlMwRbg5SEFZPYWGrtGTQc5qcCK
         yHIxOrJVyRCXj5VoR80+morlOkhQndC7KN6d2RBwwMWVER36tH79JyQSMcXFmokF0eLy
         zwnmSWNyK8OASIFOhiG8LmT5TgC5RECv4kVaz6jO6Oq/GMArj6a0sPtCzCZfxt48/HHm
         CQVVUmNnwFoNTt8vmUwxXwd6SEP36Ah+QLis4oJShhCUnOwRiFQjAZxfG0Yus/7hrp2s
         5spA==
X-Forwarded-Encrypted: i=1; AFNElJ9FLzowDJPHT9OGp9X/4gMybnM7mfXS6v8ene5HDS1uWGeDp2M7crJTiEvsHImTk7pBHF2llo5i5Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfgJJiYEMs4fvSjj6UGQHqfW5dxofsP0oEGBGeDOPx93m/aDtt
	xo4WNtTIjKFibedz4m9K68xGIjCJlY6IsA9rSuGrUZqeMZXoZm20J2yDNPC+TmuXQgpEVdLXa9Z
	j4Sz5GPGCzGsbmmuftjlo+QTMBbAYsNAIDQ==
X-Received: from dlea7-n2.prod.google.com ([2002:a05:701b:4207:20b0:137:f641:2dda])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:e0d:b0:136:c24a:7213 with SMTP id a92af1059eb24-13985ea8c91mr617567c88.11.1781564675076;
 Mon, 15 Jun 2026 16:04:35 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:04:25 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <cover.1781564384.git.abhishekbapat@google.com>
Subject: [PATCH v5 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, memory allocation profiling data is primarily exposed through
/proc/allocinfo. While useful for manual inspection, this text-based
interface poses challenges for production monitoring and large-scale
analysis:

1. Userspace must parse large amounts of text to extract specific
fields.
2. To find specific tags, userspace must read the entire dataset,
requiring many context switches and high data copying.
3. The kernel currently aggregates per-CPU counters for every allocation
size, even those the user intends to filter out immediately.

This series introduces a new IOCTL-based binary interface for allocinfo
that supports kernel-side filtering. By allowing the user to specify a
filter mask, we significantly reduce the work performed in-kernel and
the amount of data transferred to userspace. The IOCTL mechanism was
chosen for allocinfo to address the per-CPU counter aggregation
bottleneck. A traditional read() operation must report the total
allocation count and sizes for every code tag in the system. Doing so
requires iterating across all CPUs to sum their per-CPU counters for
thousands of tags, which introduces substantial runtime overhead.

The IOCTL interface allows userspace to push selective filtering
criteria directly into the kernel before the per-CPU counter
aggregation. The kernel aggregates per-CPU counters only for a small
subset of tags that match the filter. This results in significant
performance improvement.

Beyond fast filtered retrieval, the IOCTL foundation allows introducing
a context capture mechanism in the future to capture the context for
specific allocations.

Performance measurements were conducted on an Intel Xeon Platinum 8481C
(224 CPUs) with caches dropped before each run.

The IOCTL mechanism shows a ~20x performance improvement for
filtered queries. The kernel avoids the expensive per-CPU counter
aggregation (alloc_tag_read) for any tags that fail the initial string
or location filters.

Scenario 1: Specific File Filtering (arch/x86/events/rapl.c)
1. Traditional (cat /proc/allocinfo | grep): 22ms (sys)
2. IOCTL Interface: 1ms (sys)

Scenario 2: Compound Filtering (Filename + Size)
1. Traditional: (cat ... | grep | awk): 21ms (sys)
2. IOCTL Interface: 1ms (sys)

Scenario 3: Size-Based Filtering (min_size = 1MB)
1. Traditional: (cat ... | awk): 21ms (sys)
2. IOCTL Interface: 14ms (sys)

v5 changes:
- Patch 1/6: Added explicit mutex_destroy.
- Patch 5/6: Self-contained file descriptors to avoid wrap-around errors
  in retry loops.
- Patch 6/6: Fixed minor issues raised by sashiko in v4.

v4 changes:
- Patch 1/6: Fixed a copyright comment inside
  include/uapi/linux/alloc_tag.h
- Patch 3/6: Among other nits, fixed the inadvertent build failure
  introduced in v3.
- Patch 4/6: Included a comment stating that the accurate field in
  struct allocinfo_tag is only used for filtering.
- Patch 5/6: Modified test to trim prefix and keep suffix for entries
  with filenames exceeding the size limit.
- Patch 6/6: Modified test_size_filter such that if content_id changes
  between the moment when procfs and ioctl entries are read, both
entries are invalidated and re-fetched. Removed the tags->count == 0
check from test_lineno_filter as it's virtually unreachable.

v3 changes:
- Patch 1/6: Modified Documentation to indicate that map supports
  ioctl(). Modified struct allocinfo_count to use
__attribute__((aligned(8))) instead of manual padding. Removed
redundance type-casting. Added comments for static functions in
lib/alloc_tag.c. Introduced a new seq counter for content_id that gets
bumped every time module is loaded / unloaded. Introduced logic to
validate user specified position is not greater than number of
allocation tags and return early if it is. Changed strscpy to
strscpy_pad to not echo arbitrary user data back to the user.
- Patch 2/6: Handled the case where user wants to specifically filter
  for built-in modules. Included some comments for static functions.
- Patch 3/6: Modified logic to only fetch per-CPU counters for codetags
  that satisfy other filters. Included some comments for static
functions.

v2 changes:
- Patch 1/6: Introduced locking for m->private. Also included the new uapi
header file in MAINTAINERS list.
- Patch 2/6: Handled the case where ALLOCINFO_FILTER_MASK_MODNAME is
passed but ct->modname is NULL.
- Patch 3/6: Moved min_size and max_size outside of struct allocinfo_tag
into struct allocinfo_filter. Added validation that min_size <=
max_size. Prefetched alloc_tag_counters if size based filter masks are
provided to avoid assimilating per-cpu counters twice.
- Patch 5/6: Removed the hardcoded logic to skip the header, instead the
test will skip lines that don't match the format. Also included the
newly added alloc_tag selftests directory in MAINTAINERS list.

Abhishek Bapat (5):
  alloc_tag: add ioctl filters to /proc/allocinfo
  alloc_tag: add size-based filtering to ioctl
  alloc_tag: add accuracy based filtering to ioctl
  kselftest: alloc_tag: add kselftest for ioctl interface
  kselftest: alloc_tag: extend the allocinfo ioctl kselftest

Suren Baghdasaryan (1):
  alloc_tag: add ioctl to /proc/allocinfo

 Documentation/mm/allocation-profiling.rst     |   5 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   2 +
 include/linux/codetag.h                       |   2 +
 include/uapi/linux/alloc_tag.h                |  94 ++++
 lib/alloc_tag.c                               | 344 +++++++++++-
 lib/codetag.c                                 |  18 +
 tools/testing/selftests/alloc_tag/Makefile    |   9 +
 .../alloc_tag/allocinfo_ioctl_test.c          | 526 ++++++++++++++++++
 9 files changed, 1000 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/alloc_tag.h
 create mode 100644 tools/testing/selftests/alloc_tag/Makefile
 create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

-- 
2.54.0.1136.gdb2ca164c4-goog

