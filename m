Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CBB37D135
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 23:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780702617; cv=none; b=ZQbl6kpzQA/LNqMqKF9axHnNrnI4OC/gD2qc0V/qaw/cuBHP/Y8MZ0Du8afyXi0mPN298KzeA0rYlrYxVExTGP0KHc2KmloiayG1jx9a+K1GoXPDBxCbh5DBSiTbgpyFyPZCeVPcjbuoDEJdervK4XCY4b0ntAViqhnVhZn11lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780702617; c=relaxed/simple;
	bh=eXRtvDonELVSUBfr/dF+X1aj9t1NoF8TQiTZc77Z3Cs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e2fFJHJcivoibVUzPGzNALeg9hL1M0hfygIM1CsDReouujFo/RCzzqpY753QGnLjxGl48h8JSVEVe6l01Yy98rR3N9AcH74txWBXcb5+9cudUtOZ3BvFk6C2l5l6KZ9sTa07HZuRuSD6roxpoi00KeV+Y1IL3QcEBy3B2f2oDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZTiKK6xW; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZTiKK6xW"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-13709ab38a8so2897986c88.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 16:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780702615; x=1781307415; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TP1Gw/FZpMqPW7LfLc3jMLRgJ8WESnfISTEPmikAWZE=;
        b=ZTiKK6xWeem7O3yVDLRbY1GUcaoUNqH0JSlPvOjXnyYK+ccV/X3vyTxisoYUNes80H
         vmkch/q2IFCGN41Y2Mda5zCTlRzRAW7+N7r7gwajKM67BjOaBf+kBYrdkYfl4zJn7CdM
         Mbnp1lNh0Q5FIkdM/dn8o1YVzX1rocPG2N4FLN3QFGJ9g6P2YqJsZ7ulzBwcPsoZvrqK
         GWDbeoelQm7vaMtjhXMQTiUMCoLVpIJaVZVmUSx3zn84/KdUjgn0ictCzFaaAWPVK+s/
         MC+2kp7vrd6ILgmbkDHQfe/mgiVDr23f0Mk7kONRpS51wsxPc6FVDuTjCsl9AsjXAsmN
         wwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780702615; x=1781307415;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TP1Gw/FZpMqPW7LfLc3jMLRgJ8WESnfISTEPmikAWZE=;
        b=lqw5UlGe/+TRbFwPl5AVAJHXLHgp5nEsxjCnyx4Aw4OHwZ2C0ypyYadH5KQ2AkALuQ
         1b0TPCFyjl9KaJ5S63Q15bsX1o1bKcmDm3CkuhUpCAzDldv85tu4GUBphwX5k1zgrfq4
         C6ifUix2+1eKf1EL7fsb6bDdBo87gjZ7uYLkTQe6gamKF6g6lso4G4dt7uVrBDZdtZGT
         PxFuszsZX+XZTYSkiAW9i/iT3VLg/5hUWM5rIEX1+GUUc+hGvR9zKu7DVzVagGBIaRBC
         RaFSe8dwxz1nj3vfxUK0SGhMlnT2bQkXKQk2I1Iof7kSojYtQy/vUZ3/jdfSW3fKHNrn
         faSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yBygTrJ96f7TIE1L4F+JsU1yeKYJ/UaJz7pffnoQRScWl0hukQMkOQ2VuniUexnFsU2J5+1KFN+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXttF429Cp8HPnAfdACGKLOEWrolCSI3JvFcSNTCDJ+4JX1Y67
	XY3aRy8y/XHA1ElylISx7fKgcRw+Lt1khH0vp+cd37UekRZMC4DjynC6jLLFuErnZLzR87S3AUE
	TBi42acs0PI4QWyjrmNgVn47ZJ1qa1N/d3A==
X-Received: from dyvp27.prod.google.com ([2002:a05:693c:885b:b0:303:3f37:eaf5])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:1287:b0:136:e639:9c05 with SMTP id a92af1059eb24-1380670db9fmr2750057c88.31.1780702615144;
 Fri, 05 Jun 2026 16:36:55 -0700 (PDT)
Date: Fri,  5 Jun 2026 23:36:45 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <cover.1780701922.git.abhishekbapat@google.com>
Subject: [PATCH v3 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
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
 include/uapi/linux/alloc_tag.h                |  87 +++
 lib/alloc_tag.c                               | 342 +++++++++++-
 lib/codetag.c                                 |  18 +
 tools/testing/selftests/alloc_tag/Makefile    |   9 +
 .../alloc_tag/allocinfo_ioctl_test.c          | 505 ++++++++++++++++++
 9 files changed, 970 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/alloc_tag.h
 create mode 100644 tools/testing/selftests/alloc_tag/Makefile
 create mode 100644 tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c

-- 
2.54.0.1032.g2f8565e1d1-goog

