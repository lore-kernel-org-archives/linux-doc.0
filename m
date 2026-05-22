Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F577358381
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 17:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471946; cv=none; b=bA7xsbaPpAsK++X3slkMAArW9YPuOmm5to5ccmFy24AQK5a+fHwlMKglwn5pt6MpqnFSdyQlMjfLvzKsBoy9q7Ac/SBZ8CMJz84eIyRstCbcjS53KvEx2Rz3BiKeOQg5fBFtbCtPBNUN6150Dw95PZbrNCVoIn6oYeNBkdHzaaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471946; c=relaxed/simple;
	bh=fjUUJbkfAqezKdE6dfx0M8Oahe/zQdqsRRNlhXBgI3o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cWyVVXDASdTc/P37krn44UU1AER+WWiPvnJ8wyK7s+nkEedqQQHr8UNH0jTuQxQ+doOJ6/oqStiuL6sv5RvkUEzCKh+phUoauATZ3pstcduuR3XhXzkFr39hfC452uv1mMBbMXxPQT4djFXK9SAx4+aqCSDqrQIFTOmQk2QjwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P56lvFQl; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P56lvFQl"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so12590739eec.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779471943; x=1780076743; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RUhGNhxD0QOUIs2ABS/Rux/YDmNy6ndLUdXOBB/mJ3M=;
        b=P56lvFQl6VgPHwAVrtIzXCd7BfJQZTFp74nE0FQJCWPH5HTLtOnOXh9iah5odNsSI2
         zgHhnhAvnFHAB3+a0KTgibfM/UrgNrLTtwJWWn/Dk5V2phnorCizzwFeZDGsWX+K0ZxU
         s3QsyMpRRXTF2Ggij4WeOxVVYF961Erd85z6bOo0npHlJfiEJP8Eb12ij/XlpHSLouHU
         RZHbXYwqzCHi9cNf79FBxQnOLmC3wHpN1cS72Z6bascMfEVER3O5A8kiTILthydu+Yj8
         Fe85CkIdkplz0TfGts4L/8C2da9Bi5HfXnwiSltNdAAZv2Yxu+4I1OIPrIDN1s7ZertF
         69vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471944; x=1780076744;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUhGNhxD0QOUIs2ABS/Rux/YDmNy6ndLUdXOBB/mJ3M=;
        b=T0Oe5AjM7gFWkvZupO9sKkPOTmxs3fKNVvvu9g15XZaHwQKXdNyWY8PgFtZdzgiG+/
         fcDGnXbCyzVJ50iinqmQfZA3hV1RrFgbNlYz8a7nP2cUcB5KOuVWb3JVv4HmZmH1kWl/
         mbtcXO4EooBBxBsbjcIn336KPVlgoHakLhOF/4F3FEyO/fSuQzQuxx9AeEiZmy+cUiWc
         rDHzb3d1XgvH38TAXJoF3A4zMyS7WKZsgX9jnEJ7UVhF4Dz4+xl+7rV+/HAbj83p9hfX
         BkoL7eyROBPn1+ABNH5pniF0MsYEGo5zYpO6OnmE5X61YPpO1YMC2rkQQVCCK4vZSPG6
         iP3A==
X-Forwarded-Encrypted: i=1; AFNElJ/EDLfNrCAaUMTXRoybQrdGS4p/besl2Rtn6mhBjUbTA/3dhzh2D6JNrUr33IkfMwUvEbxQLDBZ/eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHF2Rehdh7uJZbMORHOlP7A9P2xadVX3UD5Qy5wozM8VwVfXEj
	tp0LoIcCBKUMCRI3zBN1YjNEFGjN0+NonhNv11TdBzJ2mhpkIIIt64f7z78ljgIYfUrfJZjyWl/
	3IDNYB4neNt5MNFPcAP1Y90vZVKQP1uI1Iw==
X-Received: from dyev16.prod.google.com ([2002:a05:7300:4310:b0:303:c170:9611])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:6588:b0:2f2:1b3c:d824 with SMTP id 5a478bee46e88-3044904df42mr2422519eec.7.1779471943340;
 Fri, 22 May 2026 10:45:43 -0700 (PDT)
Date: Fri, 22 May 2026 17:45:32 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <cover.1779471082.git.abhishekbapat@google.com>
Subject: [PATCH v2 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
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
the amount of data transferred to userspace.

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

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   2 +
 include/linux/codetag.h                       |   1 +
 include/uapi/linux/alloc_tag.h                |  87 +++
 lib/alloc_tag.c                               | 303 ++++++++++-
 lib/codetag.c                                 |  11 +
 tools/testing/selftests/alloc_tag/Makefile    |   9 +
 .../alloc_tag/allocinfo_ioctl_test.c          | 505 ++++++++++++++++++
 8 files changed, 918 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/alloc_tag.h
 create mode 100644 tools/testing/selftests/alloc_tag/Makefile
 create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

-- 
2.54.0.746.g67dd491aae-goog

