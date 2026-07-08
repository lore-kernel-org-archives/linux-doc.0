Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300062DB794
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533693; cv=none; b=qpmwyRHUkC4eNSdUgvBsnyBq7JX/lmfkC9u9CkKCOJwqt/+TI346Dl50+EWW2WW1eloqz0Y+5+gt/O6SYMiEkmbyvhXO9w3pUbOHgulZLQdb7gyOQY7n0NW1wECAMQVd0PVLRB3FQIi036WlXLSqK9CGeYOiOLi3siCpkLK3yeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533693; c=relaxed/simple;
	bh=7fzBMlIiGKxzf/X7zVSPOeJhMIchczLomc2CJNvo1ec=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=n7S6DTVznHwyXERmvPwJzHgDnMG3+dyxApyCKRjRU7kTy/ny6yzZYrAKkSRyQ6bZML/hgvAsAuj/5LOJUGT1LNZusMfjwk++fmr9RdJ3xWmqJWozw02t6I4L6f5tdO37RIkuar5lFlsRXzDisfuJHFimHw9Anez6wdLQwSIwGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wMNdSbaS; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wMNdSbaS"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c98136ceff4so1361103a12.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 11:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783533690; x=1784138490; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L3mTA0gYhkAgxZHcuO+pnWAJxLkZ8vbuRIM5XQ6i/IM=;
        b=wMNdSbaSSGPOElxSi5ANLqt0o5qN5gtFEbFCcJvCuj7eIbHOWigOyflO2/yyJJ/MOb
         ZrXMPpAA8zDN8YY9cRiLCe1MTjiDqV4dH/L51Ij199pyzODWTJqcwQwZ95aAZFaoBbs8
         +5U7I//H4n/wmwBVYP67UnNaobovTSVHxbMLQ7ZAt4Gdoiq5k25T8M0MIe2YgQRXI8qb
         qjKuXyDS5bVuIomJSjEThOjN1GTRaMTlaWAHzPDVx2+DrO8JsG6/VhqLke7HIkpcQMDf
         CQ2JUP2MS1h5WMbJnBTX2Kj04cEytHpcr34Aa3F5jAhnYDar7SUf8GSpG92+4UXWUo0A
         op5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533690; x=1784138490;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3mTA0gYhkAgxZHcuO+pnWAJxLkZ8vbuRIM5XQ6i/IM=;
        b=fj9Vce5eN/REPmEE3IauEQwnD6QAzeP4mQZ/NL7f6k3s+MhOyptIb23ClnAK5xzJKF
         5ZSqtOrqbRV0zFOD3ORptBomxyW4VPRzV8QEQcsys8TTIOwCnJhlGz3gD8p1Q0ob5fDy
         tKHWme/DpvGKnXJO3NtnvmOmULSMl7rFkQAlRWOgsuA3fAKf+w0TbMepFL6QBMqvixVj
         XoDu8cpr852igbiXmQXhgLiQXNLwaT9jc4parjo/LY1LSL0KqSlTAuh4m4FzlenjaHla
         Bx71U8LuS0EzJz+IV56wSnpY4+ugSQ3uBuLVH+1ysx81SXb+qN7VfkpXDam+Ygqd8Tqj
         8HWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6zY0ORN4/9kh+vNyeRy9A9kYOG/u4TCtK+YdVM303lglRjVAdAixGV9uk03y5ZmIX6gZsG6oGjl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLs488okV6ljIBTT6Jm90uHBsD8F97arJJm0YAHP6gqTMUyXZa
	Uk87codh/4snB7zSqZSESYHIK/AiWKBj7M+AS5gRyPiM4COVMdaPsGxXnqfa15qpf7vOEbgoW0s
	SxEVYRYqANCMdq/xwct3UAeGAPh4+d3/SGQ==
X-Received: from dlbtp3.prod.google.com ([2002:a05:7022:3b83:b0:139:c6b6:f966])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6110:b0:3c0:b62a:2b89 with SMTP id adf61e73a8af0-3c0bd3137acmr4688169637.67.1783533690325;
 Wed, 08 Jul 2026 11:01:30 -0700 (PDT)
Date: Wed,  8 Jul 2026 18:01:22 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <cover.1783532853.git.abhishekbapat@google.com>
Subject: [PATCH v8 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
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

v8 changes:
- Patch 6/6: Changed KSFT_FAIL to KSFT_SKIP for scenarios where the test
  cannot run because the kernel wasn't built with
CONFIG_MEM_ALLOC_PROFILING.

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


base-commit: d11ba1f570615ec8d4814d6313ee1d7075a33787
-- 
2.55.0.795.g602f6c329a-goog

