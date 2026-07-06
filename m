Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A183F5BE4
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362358; cv=none; b=jawBGz6F51bY3eCtxdXOma7sRxqX3Ddc1NNP1vNfTt8Onxocmsd0fSDxS8GUHdTipE7+6jK/ofaoavHfe8bGawIseZUjaZ3XANZ5hgsyZsWNSIYJoH2KYlMdkKRd65E2cuhi/Sd5pRDihk6nugy4h5XXPGYkBOBrTvFbdqevPhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362358; c=relaxed/simple;
	bh=JPx51r5+iKu2FP3u9Zlx8iDiXrXkZOi9oZzoO8CG8YY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KR+gKNKA/kbm35f3LYRExbMCubJiPNjhmi9+5Pliu867es/q3drhVNd3Xob0TGzIe4487khkNLknr/aEp5vnW9Vwf35lWpbVLOANnPaQIWk6SO+6hpHD8ZSMVQ1Z0PT31Fe+1qo8d/zcUV0qC8rnnQfXJNZQZyByt3UoZszzO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fn3VINei; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fn3VINei"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso2810432a91.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 11:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783362354; x=1783967154; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qc2L6Kdu/a/xe4gb6oPGtuJlo6tOjRnEmbZIgntO/B0=;
        b=Fn3VINeiQX1qOuuOrioo8/d9WOb9Isrmt9rXi6dnHnmDVI5rxgBI3J/WRlteJ/JEus
         oMT+QXNEohbdqH9WlnnF8pANqYfDN2svgFIA4zr42mMpPBzdWehe1x0jpt56HFH3fX/Y
         4e8HohzW6nSE9VhHNYHeIE7DJQ2+m+NBlgHvZWK50f3p14P5eCxhWqt5vZ78lUbDB3s4
         KqmhUZMp38AZqt1lsb65xhUaUOJGPjRDMDG5xrBTnv4XQX8KCsE6pgvLraP91X7uoB8m
         HCfxOBpmMjIBz2iBGtn2lNbk6PgExBYDvnzkOEnrlFurucJMDj0R5JmX8vIby2blyFsH
         qfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362354; x=1783967154;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qc2L6Kdu/a/xe4gb6oPGtuJlo6tOjRnEmbZIgntO/B0=;
        b=AxXPtWclvfBsXlCslb6VoGcLoWCPNkCslpS+W3cFDAAA1ofS62VQrpsjSDoVZOuXko
         P5L3s3DVAK1MxRGOf6QMiGwz4edtieT0Ixc6MrVdlfoTWib7u/7frdZtga4y9jbx/Ut+
         GskU50KMw2SpSICOciNBSqk3XkDu4ze7El5Yc5VrZMh2Z0ovpLJXtzzVFiOP6wZm1jUD
         SVThnLfhuKMOD8BgZ4fj9hiOjSiYNdvw9mYvLVXYBNpiGLfbWZ6RtL9UliI3W3jXNJy+
         /cXmtjqs4Jc+bHX/OLPGgloSI3wcmfT/OPTZRd0TheaOHNk2AFxkXK0rnpgNqhdsBUJP
         eMyA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9vsQoeqqfupggUWxC9oVRNrqbv/N4XPUQYqhX05MjwO5wS23Riv80sSYIl3kcu9fdssJf3yEw6O0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOPtkDclYbgIX/POtkzkEEgbNwudtjtSFRl8hHjVEPxhZ3G151
	QczOkx2/bZ7w0a5PfnRY+w1Yi6JY7Mx3VENBLSCUQh7F0aJ7Vgq1vCYZTd7hsMYsByzKbqJUu1G
	dNxeRs77TOabx7Tv6L3uFe1SkXzfAj5VYfA==
X-Received: from dycop6.prod.google.com ([2002:a05:7301:9bc6:b0:30e:ee3a:f2f1])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:48c1:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38756ce281dmr1653545a91.20.1783362354324;
 Mon, 06 Jul 2026 11:25:54 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:25:43 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <cover.1783361692.git.abhishekbapat@google.com>
Subject: [PATCH v7 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
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

v7 changes:
- Patch 5/6: Used $KHDR_INCLUDES in the kselftest Makefile. Replaced
  goto statetments with break in get_filtered_ioctl_entries function.
- Patch 6/6: In test_size_filter, added a verification step to validate
  the size of the found tag matches target_size. In test_lineno_filter,
improved the comment, and verified that ioctl retrieves the original tag
that was used to record target_lineno.

v6 changes:
- Patch 1/6: Added comments explaining why last 64 characters are
  compared in the filter.
- Patch 3/6: Moved allocinfo_prefetch_counters outside of
  allocinfo_to_params
- Patch 5/6: Fixed fd leak in get_filtered_ioctl_entries() function.
  Added alloc_tag selftest to the top-level Makefile.
- Patch 6/6: Moved include for errno.h to this patch.

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
 include/uapi/linux/alloc_tag.h                |  99 ++++
 lib/codetag.c                                 |  18 +
 mm/alloc_tag.c                                | 344 ++++++++++-
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/alloc_tag/Makefile    |   9 +
 .../alloc_tag/allocinfo_ioctl_test.c          | 548 ++++++++++++++++++
 10 files changed, 1028 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/alloc_tag.h
 create mode 100644 tools/testing/selftests/alloc_tag/Makefile
 create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

