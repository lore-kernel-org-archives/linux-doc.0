Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55183AC0DE
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617311; cv=none; b=TI8m24zNej1uePFP+X5USSpwfD5Rzu/FjoXznSbdyMHGWRVCYwAUUtSyuu2SIVYyAnbfEQV/n7W2i/39wbUz1sEJk4Fet1YYyIwIpRuy4VZPDGEdNeX/OFbw7qh42RfSALLk3W4NkIclJcIhxQuRn7Go216f9LAPzCbSMxC6lkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617311; c=relaxed/simple;
	bh=ig53hfXLZhnnOYcVWzo/9m+ADZMcLmZw2ofGmkQ9Cy0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cQ4FJZ/YRbRXaoWlT7yW3HLdFSsCa+9TkPbgHarDxvnSteTkf83/07milLerEvb/6BEUvbmdMpgs6UizbACUiL/5qcgph1uG9Pgp0ZD3ML7l4wEVQtpoffFNECsLKvtM5jx8n8peJyKkPHHaPg5PyMPZMpDJC9yQCCkxAU6DAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mGOmKaKH; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mGOmKaKH"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so50952825e9.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617308; x=1791222108; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6dOIeR3pXAhPYZMt7PFHzXVozdl2RGhyvaCgErXxW0=;
        b=mGOmKaKHbUw1sYfRQvDjEzLatqm+Rku/L5P5egR6AnQPRclgKoM1PacXAnN/GFEVmN
         L9sEhIcloNQK/Jz893VhgwViG+txn9lIWBkh/ieMYFK62jDfobgu1jI25E/88P+IGuDx
         SUV+kRSFsV1pB1eIXTJaJvP4fZonN8wI5SE0E1EAVRH/eFY6W9F5m+QSVaSLboncDznM
         QxmPBp/ss9R1NMDcVfgffzTHycHjADLlDGjzuwFh4tYa649Z1ntRpgj4hSdeWjuRS1B8
         LNdR6ePaz9tFUWeyexlZRMZyDp/iEjSc1LsmRWEQBd79NcFQ6f7GDZXUwPt4TSejVusP
         ITgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617308; x=1791222108;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6dOIeR3pXAhPYZMt7PFHzXVozdl2RGhyvaCgErXxW0=;
        b=Qa3EvwuE+wOlxBp4fsHufP0oe7QfWGMnkEH/HkHWlWcYoOOKdKeRpWRKPkqBlCcb0y
         dvfN9A7t8fupDaQVm5sDQKJGhOY4LNkdN0XGcVrfI2euMjZBr508xQGDgMb/MlZ+BDpk
         OYnyVi7GW8jjTNVHGHK+mrpwdjnWXh06BKItqddy0tGqC/9sIkDBZsh2pnw06VFBa+J+
         W63oZ2/4PjPcNi+IzcMtrOJ7CWda3UhjerNSGxxAWQZC+tLu2sbli5t4Ri6jvMQntwiv
         b3uYrmLmoYQy4rDbjsMV0VKFIxtY0GAm/uey6No6KWtdvAZORl7KZoCAJ9D98KTWXTot
         fEFQ==
X-Gm-Message-State: AFuF++mqub06y1n/yprS63Mvu2vQKFUL06hOGQW+85/jgg9RPKnEGBsT
	fv9wyvMXa299qyOaaxwlJeQllcoO6Zn0fnVzJZlZZ7Hpj1tAflu4xcRuDWK1LhfsVE4o1rUTuLC
	/l3DinKFMtY2jdlsWm/a2Y0Xm27zKgthKwRmS+u7w2nVgWKJJV3l7zrQKB+XJO9NhLj9tQzTgE1
	hU0tVWyHymY3Zjrd5jGP0oQlO0EjHzuBbHA345nfLSEgbpLD097sk=
X-Received: from wmdv19.prod.google.com ([2002:a05:600c:12d3:b0:49f:f099:7fc3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c494:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-49fe7bab979mr230718305e9.22.1790617307210;
 Mon, 28 Sep 2026 10:41:47 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:07 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-1-smostafa@google.com>
Subject: [RFC PATCH 00/15] arm64: Set kernel stack size from cmdline
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Summary
=======
This patch series adds the ability to configure the kernel stack size
for arm64 from the kernel command line.

On some systems (specifically, Android), this provides a mechanism to
reduce the kernel memory consumption, as the default kernel stack size
of 16kB (with 4kB pages) can result in ~100MB of allocated memory,
despite the fact that most threads do not come close to exhausting
their allocation [1].

There have been multiple alternative attempts to improve this
situation, including for x86 and cloud workloads. However, these
have typically focussed on more dynamic behaviours such as allocating
kernel stack pages lazily (based on faults) [2] or reclaiming unused
stack pages from blocked tasks [1], whereas this series focusses on
making the kernel stack size configurable without changing the way in
which it is allocated.
It also permits a 12kB stack size, which is currently not supported
by arm64's stack overflow checking logic.

This series re-uses the first part of the dynamic stack patches which
makes it possible to partially back the VA space of the stack
(THREAD_SIZE) with memory, but never attempts to dynamically grow the
stack.

The size of the stack (<= THREAD_SIZE) is determined from the kernel
command line and is not further configurable at runtime, all threads
on the system (except the init_task, see below) will use the size set
from the command line.

Patches
=======
The patches have dependency on the ongoing arm re-work[3] to move the
overflow stack to sp_el1 allowing the early kernel exception to use it
without clobbering any registers.

- Patches 01-09: have no functional change, they abstract the code
  dealing with the stack to avoid hardcoding the stack size
- Patches 10-13: Introduce the new ARCH_HAS_VARIABLE_STACK_SIZE and
  make the kernel deal with stack sizes set in the run time.
- Patches 14-15: arm64 selecting ARCH_HAS_VARIABLE_STACK_SIZE and
  setting the kernel stack size from the command line.

KASAN
======
The KASAN stack helpers keep unpoisoning the whole THREAD_SIZE area.
As they only write shadow memory which is populated for the whole vmap
area.

init_task
=========
init_task is the only kernel thread that has a full stack allocation
as it is allocated statically. However, the additional stack pages are
not usable because the overflow check on exception entry will continue
to check against the configured stack size.

Future work
===========
There are multiple paths that can build on this
- Per task stack size (either via an in-kernel API for kthreads or
  potentially a prctl() for userspace to configure)
- It is still possible to build on top of this on the fault path to
  add dynamic stacks if the challenges raised in [2] can be solved.

Will Deacon will host a discussion at LPC next week [4]

Testing
=======
I tested on Lenovo Mini-x gen 10 (Qualcomm X1 CPU).

With configs KMEMLEAK, DEBUG_STACK_USAGE, SCHED_STACK_END_CHECK.

1) 4kB kernel - 16kB stack (default)
2) 4kB kernel - 8kB stack
3) 4kB kernel - 12kB stack
4) 64kB kernel - 64kB stack

With running VMs with KVM, stress-ng and LKDTM.

16kB tests done on Qemu.

[1] https://lore.kernel.org/all/20260827232948.2520558-1-stevensd@google.com/
[2] https://lore.kernel.org/all/20260424191456.2679717-1-stevensd@google.com/
[3] https://lore.kernel.org/all/20260918161407.2300-1-will@kernel.org/
[4] https://lpc.events/event/20/contributions/2419/

David Stevens (3):
  fork: Don't assume fully populated stack during reuse
  fork: Move vm_stack to the beginning of the stack
  fork: Move vmap stack freeing to work queue

Mostafa Saleh (9):
  sched/task_stack: Add helpers for stack high/low
  exit: Don't assume the kernel stack size
  usercopy: Don't assume the kernel stack size
  mm: kmemleak: Don't assume the kernel stack size
  arm64: Don't assume the kernel stack size
  sched/task_stack: Introduce ARCH_HAS_VARIABLE_STACK_SIZE
  fork: Implement partial VMAP stack allocation
  arm64: mm: Relax kernel stack alignment
  arm64: mm: Set stack size from the kernel command line

Pasha Tatashin (3):
  fork: Remove assumption that vm_area->nr_pages equals to THREAD_SIZE
  fork: Separate vmap stack allocation and free calls
  mm/vmalloc: Add a get_vm_area_node()

 .../admin-guide/kernel-parameters.txt         |   7 +
 arch/Kconfig                                  |  10 ++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/memory.h               |  19 ++-
 arch/arm64/include/asm/stacktrace.h           |   4 +-
 arch/arm64/kernel/entry.S                     |  91 ++++++++++--
 arch/arm64/kernel/setup.c                     |  24 ++++
 arch/arm64/kernel/traps.c                     |   5 +-
 include/linux/sched/task_stack.h              |  61 +++++++-
 include/linux/thread_info.h                   |   8 ++
 include/linux/vmalloc.h                       |   3 +
 kernel/exit.c                                 |   2 +-
 kernel/fork.c                                 | 134 +++++++++++++++---
 mm/kmemleak.c                                 |   2 +-
 mm/usercopy.c                                 |   4 +-
 mm/vmalloc.c                                  |  24 ++++
 16 files changed, 348 insertions(+), 51 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

