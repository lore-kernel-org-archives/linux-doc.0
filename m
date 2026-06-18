Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55EF2D9EE4
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804201; cv=none; b=mk5AtKv8508wwcZJ6iojD+d426RuK9dqZALxAGR9gtT026ffiPLbYqb9e+3LDGtr8Lq4tbMN51u1CaeEmiHwuHd5xaU/8mVIYIzUHp5/R/J4KNkUdVkQqNEq0+rX4y6R65f55VYqcydp9ysYIFLq020686TUCEBKN7/qWcBTG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804201; c=relaxed/simple;
	bh=H2kDlpZPI1e2GuLSe0GbNGlu0yhhaAPSZmY7oaE3ZHg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PdfiuCte/9EiEroEteh7ODwX7CXoSmqhwYRfrJ0YYJ7ywEdGJfEAT2P6giH9J9WjPAxiideOYgLmMo4JK+c1FxOqgWU0m8xXDonGPJoFSNnN2XE8/uMx2d2/bCu01/5WzL2P3+fCMkreriVo3v0QN+/DnwrfSMsxcVdUuV5TFi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GZc+FnTn; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GZc+FnTn"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2247329eec.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781804199; x=1782408999; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GILE6yJhHTICx0l2wbXC+MI6Lt47OxwBJrXXhpJgIEk=;
        b=GZc+FnTnzskuLP8jOd/5wX44dQBKX8MIAs2i0NYY5lW4AxnOb9w2M0QGs+VsH+EIKd
         pMNPdL0Zp+/YVj9+BNBNFRvZRETp53CjY8RFB3ld2K5NT5u4Tx8C7NGpM35Yn0VOD0PB
         Ngyj85d87+N6k5uOflKcoteTAFHay1tAt0SFzOXLmegA9h2HwQuuc6WMj4WyHmFHkGmk
         74ImuDWSK+0YQMfanrAdxRkvqtW1+PYZMRq54zhbKL5nORF4Ki64Wy+B103j4LURlai7
         e3lh00AAVHnY9HnvaCjlgrNjx1I3fFRn+UenfQ3F4xvgcDEf0jCGSe8Qd1hQwI2yogMi
         1zgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781804199; x=1782408999;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GILE6yJhHTICx0l2wbXC+MI6Lt47OxwBJrXXhpJgIEk=;
        b=kX2Mic0ExIIOdEqxWo7O236/a65NxGLp7Y6lLnn1prs32deNmXAX6xpJaLrOCQoHou
         JrfPoiuoi7l5fh/tPUha8BrQ/to1DWQBKVGsL2elNZG/tsDGRSbWV6148lCjlJkk/4Nx
         hwxcHdPZ40y6G1GuAQi8wf/rCJ9vnU9a/ckR/B/4fd+JlGPMvoINHhAJoyjfHVcN2pcl
         4yfN7ckO47Cm+2QqrpNPvRf0v5iYMeglWyjTp4OejDDnpZJZzLoag0K3VyWSOrTqWpt7
         cOGGmLMxfJ9tNk2+QazZlp5BaxxUmjvSrZae6BEbmwLmPXbtO+LOY4ikBdydKmUsnJDS
         srKA==
X-Forwarded-Encrypted: i=1; AFNElJ8q+HEbJcWULC2CjxlKARsihQDoHN4AqN0899A1ELH7lg7hImXnmc4yqmKTFeylSn19gjkN2ewP3bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aO4mI3zxZheQOGcJOgq4TaGa6MalumtIVKjmbxAACuJ/mSLA
	a3pFE5HkQwyfbQArWVr4Ob9u8w4PpvdchmEi4zO836Qvnn9i69JOR6BPP71FnHvsJjUroCa08y6
	IC5dyI3cO+eUPqI4gyy7+5V+g+A7y2NL1vg==
X-Received: from dykb40.prod.google.com ([2002:a05:7300:8428:b0:30b:f5a1:fe8e])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3c8d:b0:30c:2d7:cabd with SMTP id 5a478bee46e88-30c070b3451mr141940eec.9.1781804198250;
 Thu, 18 Jun 2026 10:36:38 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:36:29 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <cover.1781803482.git.abhishekbapat@google.com>
Subject: [PATCH v6 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
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
 lib/alloc_tag.c                               | 344 +++++++++++-
 lib/codetag.c                                 |  18 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/alloc_tag/Makefile    |   9 +
 .../alloc_tag/allocinfo_ioctl_test.c          | 531 ++++++++++++++++++
 10 files changed, 1011 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/alloc_tag.h
 create mode 100644 tools/testing/selftests/alloc_tag/Makefile
 create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

-- 
2.55.0.rc0.786.g65d90a0328-goog

