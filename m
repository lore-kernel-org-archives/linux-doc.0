Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27723397935
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 07:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038592; cv=none; b=GJXXpx1Ph9J6cJyvQWyrEFNYoIrz3vrTtySJHcol6AhreSJPzjK03dGoaT0DZW9XBrzqF7HE6yOtKhrWixrH6qUaGRMF+xeOoNqPP+VnYQ2ahzwvqtDvKUUWPxNQyJeSVGG7kVM4kV4ae+Kui5N/ZC/XMbC88s+6MGt9m33tm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038592; c=relaxed/simple;
	bh=KWwRjtVzRELD8spgzLKDCDsZL+1hk2V1jOhWcgfwoWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtPpRyJNbu4VKsyelSC/mj0HA5HHf1PKLZqf/8HF0o4oZjLLUAJ6J7MQ8IQnvBb91fC4jywPHaK/ugt20Pac8mB+/qxMd4mIVHv+ZzmE8KY1QDwZ/Q+PxtA8n1hQSm9ZGl6zjpZh4de1rJYOxai8CBD8VaFLsNMnXpmwjHGrVLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qW+isejF; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qW+isejF"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2467213a12.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 00:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787038590; x=1787643390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xA4rXRC20PbN1YuS6wZOV6o++xOt0Zef10yjQF/tkVk=;
        b=qW+isejFd6p0AS+gPQgFLMB8YIcA23hDBzo0qNA7AFta/V0dd0GaPbUZw/hKS668LN
         6PCpTFwpBelLFfIqF5De8cj3g9luzOePj1YZzn/zi4jwjX4mHBDn3YpFKdfwlEl2l6vV
         2T08YQPONK9bBJbgCASGrzYmBmn9BvDkzRV6krHcLXV0vZEiaU+E+Xx78qRrl4cm3MU3
         JIQyFKOEo4AqfBJlXNWJ9IF+ZAO9SNXhWyjWQwxFZXbzZmfq7i2AjbAyOGXAJ3Jg3rr8
         AYjZ+3hFICk5KtKA1L6DBXTGVuBPcmTpdb6CC9G7GhUKarfX6/pY40oBrX9GYrrp7vsQ
         ttkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787038590; x=1787643390;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xA4rXRC20PbN1YuS6wZOV6o++xOt0Zef10yjQF/tkVk=;
        b=VztshZS1ZHN3sxUPpg/qLFkp1vk6DERklTsrjXNyQ09QCdtire0ENQs7rAL0eFYf2f
         FPcPcEqU22pGE9RvCpzQQ4FCnLm1Jaiu61n/Mf8L2f4Uup4afALxClMEbjr8lOxDQVr4
         1A6elj1MfsBbcq37DSrFdWvcsBZJ/R2iWq04njtpLC3DnG4ilVnmMt4cGEFwyUVsKaiI
         xN4mJ0aWwWfZDB5v1qI/r0o1Fv1f+DGYe4EW8dV74EE6a18h56aBrI/wnOe3SIvPWrHW
         5rKfDhTbe9v+p7oTqyh8eiCZRB8Q7qEOiPhuuUoGg2vDNfoOSlvjye3kaGgOjFBSOx1u
         XvdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRXAUZ73cJIVCIEbyRTEFLf4zjjfqAvOiLQh1omWU1dRYmjhyUC+a956sXx/Aid8uwbgX+tL/Xa0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpxtUg+oX+oK6XWBil9naw0Pih/0FRXkYtfZWLmFHnNw7rhxrD
	QU1n/TK0sn/PUGV/7JPP0KiPQIZmwkccbfjznplrF6biThRsfn26IMur
X-Gm-Gg: AR+sD10u2EAkS5MfjO5O5a3s5HOizuNIl8cXoZ3o+ojz5IgXLdVP49NAJJYVpbxmvMA
	mlgJ2fXjpeQgEhoMXtF7G1CP3iWAw3GiYuKFWR1MvuRov53DsgdrhEg+tq/8+Ny919zXfVUcG/c
	T7YJuej3qWzMIcvxEEHiRzalIkZrGKs3abeqHBKy1QTTcCKmjmmoEn28r3Hf9M1vtJhENvQH9W+
	RZGUEWwqenB6TMR6VAje7iHANMAt5A4ATjefLywvRB9aSIvoXDIgDRMHIS195dsTzS4UpLn9BkL
	GF29dE6RT/57evmiIRCB8P0McPOE2oGu5n5g5Go4FEZohq15Tuq1ZuSFzPNR2tC1J9TLXRnH28x
	GhTNlMLJCRsED4VymTi4CPBy+cCF/faNuIyImCzFdbWkreWNkaUELM5uZX/0BzDis3nRRO9hYQx
	2N84Y8ImL8Vn1PVw/z8Hbl+mI1IaT1mtcKwPh3dSxg+mXaE3B+vm7OKQx6qmi5hMSgmVSfYMVr7
	qrkr2M=
X-Received: by 2002:a05:6a00:408b:b0:82f:2b0:2809 with SMTP id d2e1a72fcca58-84fde3651cemr32909513b3a.1.1787038589851;
        Tue, 18 Aug 2026 00:36:29 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851c2fc690bsm306141b3a.14.2026.08.18.00.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 00:36:29 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
Date: Tue, 18 Aug 2026 15:35:21 +0800
Message-ID: <20260818073546.832476-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529165640.820-1-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 29 May 2026 09:56:34 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

Hi Ravi,

I've been building on your RFC [1] to add ARM SPE support to DAMON,
and wanted to share what we've implemented and where things stand.

Your series provides the vendor- and PMU-agnostic reporting substrate,
including the per-CPU SPSC ring and kdamond drain:

> This series introduces a vendor and PMU-agnostic substrate inside DAMON
> that consumes hardware-sampled access reports through the standard
> perf-event interface.  Userspace selects the PMU through sysfs (raw
> type/config knobs), driving either Intel PEBS L3-miss sampling or AMD
> IBS Op sampling.
> 
> Why a unified perf-event substrate
> 
> Earlier hardware-sampled access-monitoring proposal [1] took an AMD IBS
> specific module path backend, owning its own probe configuration,
> sysfs knobs, and lifecycle.
> 
> SeongJae Park has previously highlighted the advantage of Akinobu
> Mita's perf-event proposal [2]: let DAMON register kernel-counter perf
> events and consume samples from any sampling PMU that perf core knows
> about.  This series builds on that direction with the changes we
> needed to run it cross-vendor:
> 
>   - a per-CPU lockless ring between the NMI sample handler and the
>     kdamond drain,
>   - per-CPU events that follow CPU hotplug cleanly,
>   - events fire only while the monitor is running -- created disabled,
>     armed when kdamond starts, disarmed and drained when it stops,
>   - all-or-nothing init across CPUs: a partial-CPU create failure rolls
>     the whole event back rather than leaving silent gaps,
>   - safe handling of vendor sample-validity flags so a stale or
>     unpopulated address is never mistaken for a valid sample.
> 
> What the series adds
> 
> Patch 1 introduces the substrate's data types: a per-event
> configuration struct and a per-context list to hang them on.  A
> CONFIG_PERF_EVENTS=n build folds to no-op stubs.
> 
> Patch 2 exposes those types through sysfs.  Each entry maps to one
> perf event and lets userspace pick the PMU and how to sample it: the
> raw PMU type/config, addressing flags, and period or frequency.  The
> defaults are tuned for Intel PEBS; userspace overrides them for other
> PMUs.
> 
> Patch 3 wires the sysfs apply path so configured events get attached
> to the running monitoring context.
> 
> Patch 4 is the core of the series.  It replaces the mutex-protected
> report queue with a per-CPU lockless ring fed from NMI by the perf
> overflow handler and drained once per sample tick by the kdamond.
> Drained reports are matched to monitored regions by binary search
> over a per-tick snapshot.  The patch also wires the per-event
> lifecycle into kdamond: events arm when the monitor starts, disarm
> and drain when it stops, roll back cleanly when per-CPU init fails on
> some CPUs, and a second context that asks for the substrate while
> it is in use is rejected with -EBUSY.

ARM SPE delivers samples through the AUX trace buffer rather than the
regular perf overflow callback, so `perf_event_create_kernel_counter()`
does not provide a way to consume the SPE AUX trace stream directly.
To close this gap, we developed two pieces:

1. A perf AUX kernel-consumer API [2] that allows in-kernel code to
   consume AUX trace data.

2. A DAMON ARM SPE AUX backend [3] that feeds the decoded access reports
   into `damon_report_access()`.  This is a transport layer and does not
   change DAMON's matching logic; it provides another way for hardware
   samples to enter the existing reporting pipeline.

While bringing up the SPE backend, we kept hitting the same question:
"why does the PMU report zero accesses?"  The answer could be anywhere in
the pipeline — event creation, binding, enabling, the PMU itself, the
ring, or the drain — and without per-stage visibility, the only practical
way to debug this was to add printk instrumentation throughout the
pipeline.

So we also developed a lightweight PMU-agnostic observability framework
[4] that instruments the pipeline with per-CPU monotonic counters and
tracepoints.  It immediately helped diagnose the initial SPE issue:
event creation, binding and enabling all passed, while the PMU produced
no samples.  This pointed to a PMU-level issue rather than a DAMON
pipeline issue, and confirmed that SPE needed an AUX-based backend.

We used the framework throughout the AUX backend development to verify
each stage of the pipeline.  With the completed AUX backend, the same
framework showed a functional end-to-end pipeline: 27/0/0 selftest
results, 47,248 callbacks, with all seven stages observed as expected.

One interesting observation is that the framework's ring counters showed
32,087 dropped reports.  This is about 68% of the 47,248 callbacks.  The
current `DAMON_REPORT_RING_SIZE=256` and drain interval were designed
around much lower sampling rates, while SPE can produce
samples at a much higher rate.  On the current Kunpeng 920 setup, the SPE
sample rate can fill the 256-entry ring much faster than the
current drain interval.

This looks more like a throughput/rate mismatch than a correctness
issue with the reporting path.  For high-rate PMUs such as SPE, do you
think the ring size or drain interval should eventually be tunable?

The observability framework is PMU-agnostic and is posted as a standalone
series [4], so that other PMU backends can reuse the same instrumentation.

The relationship between the pieces is roughly:

Ravi's hardware-sampled reporting infrastructure
                    |
          +---------+---------+
          |                   |
    perf overflow        ARM SPE AUX
          |                   |
          |             AUX kernel consumer
          |                   |
          |              SPE AUX backend
          |                   |
          +---------+---------+
                    |
          damon_report_access()
                    |
                report ring
                    |
                kdamond drain

The observability framework is orthogonal to these transport paths and
can observe both of them.

Everything has been tested on Kunpeng 920 (256 CPUs, ARM SPE).  The DAMON
AUX backend [3] and the observability framework [4] are separate RFC
series, both based on the infrastructure from [1].

Would appreciate any feedback on the approach, especially on extending
the reporting infrastructure from perf overflow samples to AUX-based
PMUs.

Thanks for the foundation — the per-CPU reporting and drain
infrastructure provided a useful base for the AUX path.

[1] https://lore.kernel.org/linux-mm/20260529165640.820-1-ravis.opensrc@gmail.com/
[2] https://lore.kernel.org/all/20260814144927.489172-1-kunwu.chan@linux.dev/
[3] https://lore.kernel.org/all/20260816142222.689624-1-kunwu.chan@linux.dev/
[4] https://lore.kernel.org/all/20260818061031.827057-1-kunwu.chan@linux.dev/


> 
> Patch 5 is the perf-event backend.  Two stateless overflow handlers
> (one vaddr-keyed, one paddr-keyed) are picked at event creation time
> and submit samples into the per-CPU ring.  Vendor-specific sample
> validity is honored at this layer.
> 
> Patch 6 adds a tracepoint at every node_eligible_mem_bp quota-goal
> evaluation so userspace can watch goal convergence without polling
> sysfs.
> 
> Userspace setup model
> 
> Userspace selects the sampling PMU by pointing the perf event's
> `type` / `config` at it, and chooses the scheme topology that suits
> the address space the PMU reports on.  No module load or unload step
> is involved; `echo on > state` arms the substrate, `echo off > state`
> disarms it.
> 
> Two configurations were used for validation.
> 
> Configuration A: AMD IBS Op, paddr ops, system-wide PULL+PUSH tiering
> 
>   IBS Op stamps samples with physical addresses, so DAMON reasons over
>   every backing page in the system regardless of which task or guest
>   touched it -- the substrate becomes a system-wide tiering controller.
> 
>   Setup (abridged; `D=/sys/kernel/mm/damon/admin/kdamonds/0`):
> 
>     echo 1     > /sys/kernel/mm/damon/admin/kdamonds/nr_kdamonds
>     echo 1     > $D/contexts/nr_contexts
>     echo paddr > $D/contexts/0/operations
> 
>     # Two regions, one per NUMA node (DRAM + CXL).  PA ranges
>     # are derived per host from /proc/iomem; omitted here.
>     echo 1 > $D/contexts/0/targets/nr_targets
>     echo 2 > $D/contexts/0/targets/0/regions/nr_regions
>     echo <DRAM_LO> > $D/contexts/0/targets/0/regions/0/start
>     echo <DRAM_HI> > $D/contexts/0/targets/0/regions/0/end
>     echo <CXL_LO>  > $D/contexts/0/targets/0/regions/1/start
>     echo <CXL_HI>  > $D/contexts/0/targets/0/regions/1/end
> 
>     # IBS Op event, period-based, paddr-stamped:
>     PE=$D/contexts/0/monitoring_attrs/sample/perf_events
>     echo 1 > $PE/nr_perf_events
>     echo $(cat /sys/bus/event_source/devices/ibs_op/type) > $PE/0/type
>     echo 0      > $PE/0/config
>     echo 1      > $PE/0/sample_phys_addr
>     echo 0      > $PE/0/freq
>     echo 262144 > $PE/0/sample_period
>     echo 0      > $PE/0/exclude_kernel
>     echo 0      > $PE/0/exclude_hv
> 
>     # PULL scheme: migrate_hot toward DRAM, gated on
>     # node_eligible_mem_bp(nid=DRAM) goal target_value=TARGET_BP.
>     # addr filter restricts source to the CXL range.
>     # PUSH scheme: migrate_hot toward CXL, gated on
>     # node_eligible_mem_bp(nid=CXL) target_value=10000-TARGET_BP.
>     # addr filter restricts source to the DRAM range.
>     # Both schemes are migrate_hot; they converge from opposite
>     # directions on the same hot working set.
> 
>     echo on > $D/state
> 
>   Userspace tunes the steady-state DRAM:CXL split by writing the goal
>   `target_value`s; DAMON's quota autotuner drives migration intensity
>   to match.
> 
>   Workload: a QEMU/KVM guest pinned to one NUMA node, running 32
>   multichase multiload threads each touching a 4 GiB working set
>   (~128 GiB aggregate) with the memcpy-libc kernel.  The guest sees
>   a flat single-NUMA layout and has no direct view of the host's
>   tiering topology, yet its hot pages are migrated to DRAM and cold
>   pages pushed to CXL by host-side DAMON acting on IBS-stamped
>   physical addresses -- the application inside the guest benefits
>   from tiering it never had to be aware of.  Validated on AMD Turin
>   (132-CPU EPYC).  The configuration converged to its target ratio
>   in seconds and remained stable for 7+ hours continuously, with no
>   perf core auto-throttle and no measurable drift in the achieved
>   interleave ratio.
> 
> Configuration B: Intel PEBS L3-miss, vaddr ops, per-PID weighted-dest
> 
>   PEBS reports vaddr samples in the context of the running task.
>   DAMON's vaddr ops monitors a specific PID.
> 
>   Setup (abridged):
> 
>     echo 1     > /sys/kernel/mm/damon/admin/kdamonds/nr_kdamonds
>     echo 1     > $D/contexts/nr_contexts
>     echo vaddr > $D/contexts/0/operations
> 
>     echo 1     > $D/contexts/0/targets/nr_targets
>     echo $PID  > $D/contexts/0/targets/0/pid_target
>     echo 0     > $D/contexts/0/targets/0/regions/nr_regions
> 
>     # PEBS MEM_LOAD_RETIRED.L3_MISS, frequency-based, vaddr-stamped:
>     echo 1      > $PE/nr_perf_events
>     echo 4      > $PE/0/type           # PERF_TYPE_RAW
>     echo 0x20d1 > $PE/0/config         # umask=0x20 event=0xd1
>     echo 0      > $PE/0/sample_phys_addr
>     echo 1      > $PE/0/freq
>     echo 5003   > $PE/0/sample_freq
>     echo 2      > $PE/0/precise_ip
>     echo 1      > $PE/0/wakeup_events
> 
>     # Single migrate_hot scheme with two weighted destinations
>     # (DRAM + CXL).  Userspace tunes the steady-state interleave by
>     # writing dests/{0,1}/weight.
> 
>     echo on > $D/state
> 
>   Workload: 32 multichase multiload threads with a 4 GiB working set
>   each (~128 GiB aggregate) running directly on the host, monitored
>   by DAMON via the multiload PID.  Validated on Intel Granite Rapids
>   (144-CPU).  Convergence is fast and the system is stable.
> 
> [1] https://lore.kernel.org/linux-mm/20260516223439.4033-1-ravis.opensrc@gmail.com/
> [2] https://lore.kernel.org/20260423004211.7037-1-akinobu.mita@gmail.com
> 
> Ravi Jonnalagadda (6):
>   mm/damon: add struct damon_perf_event{,_attr} and per-ctx perf_events
>     list
>   mm/damon/sysfs-sample: expose perf_events configuration via sysfs
>   mm/damon/sysfs: install perf_events on apply
>   mm/damon/core: per-CPU SPSC ring drain and damon_perf_event lifecycle
>   mm/damon/vaddr: implement perf-event access check
>   mm/damon: add damos_node_eligible_mem_bp tracepoint
> 
>  include/linux/damon.h        |  80 +++++
>  include/trace/events/damon.h |  49 +++
>  mm/damon/core.c              | 403 ++++++++++++++++++++----
>  mm/damon/ops-common.h        |  39 +++
>  mm/damon/sysfs-common.h      |   6 +
>  mm/damon/sysfs-sample.c      | 579 +++++++++++++++++++++++++++++++++++
>  mm/damon/sysfs.c             |   3 +
>  mm/damon/vaddr.c             | 267 ++++++++++++++++
>  8 files changed, 1370 insertions(+), 56 deletions(-)
> 
> 
> base-commit: 4c8ad15abf15eb480d3ad85f902001e35465ef18
> -- 
> 2.43.0
> 
> 

Sent using hkml (https://github.com/sjp38/hackermail)
