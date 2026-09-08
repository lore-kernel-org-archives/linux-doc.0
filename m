Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4250C285
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870331; cv=none; b=T6Bcucu+gOdWE9+Cht63CwURftTziCzMdbiRqxcC+VFGMk7hXrXGQAUG18RwWRTaxfjH5340lUbTMdiZYLP37tFmA+kZILnKSsGi0eYLBZLKYWQH3R66ATgyHevlkjOqRJKgZvO1YKSJ3V5FPCVjrNhoimkv2PJTAIrZQap04Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870331; c=relaxed/simple;
	bh=hUzuUTNOFhR/A4BaEtVARGxaXDasQMcVugeOxYj2Cis=;
	h=Cc:From:Subject:To:Message-Id:Date:Mime-Version:Content-Type; b=BbKqWQq4QC0Ew/7rImVcUhtFlUgWCyJx39yC8NMNBF6HnLYAZlqy/k80f6br07lL9Wufn0EVy2lAuKNq1AigCVSV6+nKidHsarRTm4S+WeVbt/KnbBGjPB63bv89eILavllkqXPzWtzpz4LXAOGnOZd+mFRRGPPF3prZkixGotg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BIgA5YV1; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BIgA5YV1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788870325; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=PjiWNtV7h8427Vndh2RRgsXxBUNXl01Wd+sWYfBV+Qw=;
 b=BIgA5YV1we4m9IF0mW5ZAeWE/qPNwj299XeKChNUon5wCHPeOMiYjGJvEXYX5JOBVvnOYp
 hMRa4ih3YCDaQClaTb+GCl6awXQxXNlaJUXalko7HYUokuebvWivpmTFQ6qbJPdWFEhptg
 9UOhGrlBnAEVSTouTpOD+um3SqpGTs7g2wirdKGOy09VPV6AJA9ktZC7zl0mg3mooXMGIf
 UOU/H9iXcepRUCE96toiiFJP6yqgV2QHtbnjXnkm6FOSMYUnqfxzpXG575ho5bSnVl71ui
 0HuG6mmZYcKokwEkhxkI5R20pSFbvkq+vwagiGiFkyVl3InlIbpG4q7RsY781g==
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, 
	<linux-doc@vger.kernel.org>, <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH 0/4] sched/numa: Add per-process automatic NUMA balancing control
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26a9ffea9+18a5b3+vger.kernel.org+lizhe.67@bytedance.com>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>, 
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>, 
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>
Message-Id: <20260908122446.56708-1-lizhe.67@bytedance.com>
Date: Tue,  8 Sep 2026 20:24:42 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8

Automatic NUMA balancing is controlled globally through the
kernel.numa_balancing sysctl and can be influenced indirectly through
memory policy. That works well as a system default, but it is too coarse
for workloads where a launcher wants most processes to use the default
policy while a selected process opts out because it already manages NUMA
placement or cannot afford the sampling overhead.

A recent per-cgroup proposal tried to address this by adding a
cgroup-local enable knob plus a NUMA_BALANCING_CGROUP mode where
balancing was disabled by default and then enabled for selected cgroups
[1]. The discussion also noted that automatic NUMA balancing already
operates at task/process granularity, that the knob is not a resource
control attribute, and that task/process controls such as sched_setattr()
or prctl() may be a better fit while cgroups and cpusets continue to
describe workload grouping and placement domains.

There is also prior art from 2023 prctl() proposals [2][3]. Those
versions used a per-mm mode with disabled/enabled/default states, added
NumaB_mode to /proc/<pid>/status, and changed the global static key
handling so a per-process enable could override the global sysctl.

This series takes a more conservative variant to preserve existing
administrator and workload expectations. Keeping the global sysctl as a
hard off switch means an administrator can still disable all automatic
NUMA balancing activity with one knob. Using a weak two-state
per-process opt-out/allow ABI avoids exposing a "default" state whose
meaning depends on global policy and is therefore easy to misinterpret.
Storing the configured mode in signal_struct gives the control explicit
thread-group semantics and avoids making unrelated non-thread CLONE_VM
users share the policy merely because they share an mm.

The series implements a per-process interface: a thread group may use
prctl() to set or get its configured automatic NUMA balancing mode. A
process can opt out of new periodic NUMA scan scheduling and NUMA
scheduler accounting, or opt back in. Existing hinting faults and queued
work are allowed to drain naturally as the disabled state takes effect.
When kernel.numa_balancing is 0, a process-local enable request does not
override it.

A separate task_struct scheduler snapshot is used by enqueue/dequeue
accounting so the scheduler can consistently account the state that was
in effect when a task entered the runqueue. This avoids changing
historical task accounting while still allowing a process mode change to
take effect through the normal dequeue/update/enqueue path.

The series also exposes the process NUMA balancing mode in
/proc/<pid>/status and documents the new prctl() ABI and its interaction
with the global sysctl.

[1]: https://lore.kernel.org/all/20250625102337.3128193-1-yu.c.chen@intel.com/
[2]: https://lore.kernel.org/all/20230412140701.58337-1-ligang.bdlg@bytedance.com/
[3]: https://lore.kernel.org/all/20230412141127.59741-1-ligang.bdlg@bytedance.com/

Li Zhe (4):
  sched/numa: Track per-process automatic NUMA balancing mode
  sched/numa: Add prctl controls for process mode
  proc: Report process NUMA balancing mode
  Documentation: Describe per-process NUMA balancing control

 Documentation/admin-guide/sysctl/kernel.rst | 16 ++++++++
 Documentation/filesystems/proc.rst          |  6 +++
 fs/proc/array.c                             | 16 ++++++++
 include/linux/sched.h                       |  6 +++
 include/linux/sched/numa_balancing.h        | 42 +++++++++++++++++++++
 include/linux/sched/signal.h                |  8 ++++
 include/uapi/linux/prctl.h                  |  6 +++
 init/init_task.c                            |  4 ++
 kernel/fork.c                               |  8 ++++
 kernel/sched/core.c                         | 39 +++++++++++++++++++
 kernel/sched/fair.c                         | 36 ++++++++++++++++--
 kernel/sys.c                                | 18 +++++++++
 12 files changed, 201 insertions(+), 4 deletions(-)

-- 
2.20.1
