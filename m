Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E816F5B1EB
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 00:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781050392; cv=none; b=gNykc1UgcEZWoqBk+kSnE/UzMHzShmaOCtmA3fbcdJMMd/CbwIohYo51YMx/3+DQ6jXYNOiVC9Zh3FlqDKpgYPsWOsHG9sWunRmGrX93pLhyuTHCpc62i1m1W5BouLg063EZorN1WhE3VyQVG0EYUaNlT6fnn0cb8IS0LtRXFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781050392; c=relaxed/simple;
	bh=tYh1OtS0skxpyAPrvZqhtUxVQsFZdH0xcBM38draFdk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fAk9U0BplsQ+hOLr9cJ+zismM/l8YCINw3AH+TT1cyXwMkYOx17vJ3j2Wr4Frj6IcuquKu7/Ns0pYp4QM/qLuUHLwXfxIrBbLF8nUZdo7asSZ9cWeImLb33JVtLzxXtIKmnlfb0Nwy4OGrP6rngZaBSnG3vujWchrtIw2JX8NTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d8pY2yvN; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d8pY2yvN"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-3074797dfa9so8779073eec.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 17:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781050389; x=1781655189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+KurXsmQkrjxNctSa6vetDbe6+yRllRZmR+Fu8BSvHE=;
        b=d8pY2yvNpOit8hswvBfUbsjw9/miMk3c7KxXXrj4nrOn3Ts+u8njYzdgnfTI4DjkOi
         angPeINtVNp1nlN6Jz0jIvGiMV8XCkw/WTG4E4N6HQSKfwM7HPKZTKM9TRGkO2o8ogRY
         YqsQq9Il577XA8gVYBWa9D8taIwW+Hp+uN8rIjj9PxYH2HmKwHMHb152Y+5kmQJT8qRu
         ZoQNXMZIvOVMvqYrb31ksy6WIfxjGU8iPr7uHm3mtxnQvUKTuShGhf0xJ5+mMrmb2fHc
         DGUtXJhcUgN2Ym0yupjfifLWb69ypbkBy7c1mFuPHaygxBEmx272CEwTeCmYjFFkEs5+
         cFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781050389; x=1781655189;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KurXsmQkrjxNctSa6vetDbe6+yRllRZmR+Fu8BSvHE=;
        b=N5I0ljO+QTmh60uzdNikpqiAZQ8g7SFkhM+3TS16h4mJ/ZCGhY7SOde3RoUjRyBRhH
         5ZNkHNXeJAgV0AfBDrqv+zFP9hHRcxsTEbNu2rTO7Uq4gw1D4vNUUzFgNA9qF3wtIF/p
         nqIz4I/xkwj4J78uk0ckr/x+PqD0ac9qZGEr9CxqC+PuzbkVBXihKbnvN+3C19x/lmqn
         pMfAjAujdB6fr01fU1r+6spTNQlRgNpyh8S9sfwUAOnxiqtb/ft68qEW6qWTuITPwL/C
         tmnDhX7oSMH+K9z1W8GdKmpPPLYcvYBRZNHmsJaFB0gmNAxORDzoQeqnzp3VZM17MBBw
         tv0g==
X-Forwarded-Encrypted: i=1; AFNElJ+h98RvX4+LlMcN7c8lVmz4B4OczLBKjXGl56Eqhslp67Sh8DiHVNtqDkxNwgJhPqTmeWM7jelD6AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL4hfRSu1qqShViAjFPcud0ZsRdJFmKXMTS2GRRGpBcobBP98c
	NTLfL5v8mi6eUZyVY9FohWQ+7VFUDYLnP6VT1IecXyABvUQ9pVJUzXZ/6w3TdAnnmI23p3/eJDD
	hMCzvrLH8UoAAoESX7RBJxgGPmDqL2ze3Rw==
X-Received: from dyej22.prod.google.com ([2002:a05:7300:3256:b0:304:cffc:fdf7])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:5f14:b0:304:4f23:542d with SMTP id 5a478bee46e88-3077aef8be4mr14537902eec.11.1781050388874;
 Tue, 09 Jun 2026 17:13:08 -0700 (PDT)
Date: Wed, 10 Jun 2026 00:12:53 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <cover.1781042698.git.abhishekbapat@google.com>
Subject: [PATCH v4 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
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
 include/uapi/linux/alloc_tag.h                |  94 +++
 lib/alloc_tag.c                               | 341 ++++++++++-
 lib/codetag.c                                 |  18 +
 tools/testing/selftests/alloc_tag/Makefile    |   9 +
 .../alloc_tag/allocinfo_ioctl_test.c          | 535 ++++++++++++++++++
 9 files changed, 1006 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/alloc_tag.h
 create mode 100644 tools/testing/selftests/alloc_tag/Makefile
 create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

-- 
2.54.0.1099.g489fc7bff1-goog

