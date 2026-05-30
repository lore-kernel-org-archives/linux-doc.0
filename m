Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7012030E85B
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 05:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780117419; cv=pass; b=FP2kkGB1hR5R1f13L/cvuU6uD2jT78gz+OXgnHb2pQS0p+QAi2W35Mr70KvrTqKcBM+I9F13hzSTb+007B+9kMw05R/CsItuJaajNCIShuNbrxs7tQL/kA6DKoR5K4pzRLl35Qsl5a1W0Nzr/0lMY4dsM+yHF6GX8B1tiEMTbdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780117419; c=relaxed/simple;
	bh=G76efax2b6NotgblMD3SxMZPGntTYDBC8CT38P8FKIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlXP+fEPBKNqg37MrXQumDdm6FamV8ctYVW00/UxpkQDdg64h619UgFumqcPyCDn+zlqY/bFpsTf6Cr883QulFX1FBtNAOde8XCGSJ8qnl2+s7MrT2ZMmoLxxIvf3Wv8k8v/kPdFLA2AXBC6aXWrQBP22ai/ckZkxoK/abIHPec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLMcKE0E; arc=pass smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLMcKE0E"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1378943cd4aso4820205c88.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 22:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780117417; cv=none;
        d=google.com; s=arc-20240605;
        b=Ec9M9y7tBHr1xT/4/Dr/HL7oEIs4pdBM8VraKOunYA1jFcDUuXd/Q3HAo8GHLbMo41
         WKaeKJnUtSSJZsGCjmx6v7y+7utRESciGS2W7stv446fTlOyvRynzNsZ2lz+vK6vB+Ao
         ZjYr9Ey93uCkNNWl3rkFf2YOkt6pl66zl+3Wzdm9UDit03zUigti/GrjJlJ7Xjey5EKP
         M5Q+LXSMXyFrB0Y0HcXWWTx9K7q/CYMfzj6NhD9AjMsxRli8MWrtvcXwXnGAV9KLzTr3
         UW+EL1XEZVCPOyZ1NlXux6Z7KNjK97ddnorl1MZkXVVv542rwRV4tjtrO7/N5bWeYff0
         pL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9n5VFTrMNd6YBtbd1bShwa8dQ8GLzFxXej7zql3nMRU=;
        fh=aUrACKm5202fBZGL7N+EJpzfn9X0kBcqAfJBu6O7vr0=;
        b=Fcxf1CKd1odZS0Ur5R7qUJLWdVWUuTO7yEOGMMSZOBsE4HP1VLPTAJCBAFPealIUif
         CEJEeURy8lwCWruQ/YwikFGBViqrtvtEqmf/ubJ1IsK8x0uaC2ApzKbiTxJH9y5K8RnM
         Rpp1lsQXrwzl9U91Ze2yxuFttt1a4TZItLGCp0ky1U065UnyEPEiKW2JWt9UMTogNmLV
         hftnnYYOk04hx+a9NqzF5fiNTPJxhudz4izbBCoce2BslZpfKqfR1kLIdioMtmqLgD0w
         y06Dj3eJ89Sw7JiRMWGmsbPQpwEPNndHYsQN22bx858XsEIVBBXku5HINrZwi0cxQkUj
         22yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780117417; x=1780722217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n5VFTrMNd6YBtbd1bShwa8dQ8GLzFxXej7zql3nMRU=;
        b=jLMcKE0Em6p7/zg7p2hWHKzHjdztAKVqrLi6nw9/KndAr6JC9pNwdHEeCazb4rUQ02
         n+gia1R8yYCOL9YM5fvXDWQamiJKxeyiWL5wTfaaSSNZRpmCGfEk/OSSLfyArTtaqj9f
         FtyVWrwiz5SuRsncyUG+ept4RubPlQ5u5FVK4DFXQSKg0KbUR27dxEOM1YRseW9+oceU
         6KYt4GGe3Z8mjIMiVQoTSEuIogo+cQysHJQ5ZD3G1Wvp+SQ92VwZF8FWRet0GEYvyLPW
         3sRl7P/06xMJJ3vLTLNjrCFtosyu0ChZCi9MMyaTkSUsLxuKzLrJu4HTN/QFeL9WekpW
         z3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780117417; x=1780722217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n5VFTrMNd6YBtbd1bShwa8dQ8GLzFxXej7zql3nMRU=;
        b=scGfCv3nEcKAKP0jzTqyShOOXnKFzG4ou3K6AkGb/czrarIKEiBrKDfh5aDm25gv6U
         lk+httE5Xc3lnfqgtsR/sqvKx04SevTLOTxFbpzszs2GwQ5jWvNau+qfQoHVR5U3cNgR
         6u/n4vvyEO3o49YZPWZ5uotf+GECLGz05OgI0/6zrMK7JqTBu+Bq3wmFbbinhcvN2HFG
         N2S5YrXi0CzfB50EOBU/kwBKUQJVXcy9XFSVjYrNrq0m9P/X8MRec9v0wFElAyM3Yrl/
         d3+aapjnLz7G1kEjFXVUkZQzPEb7SPNTRYNVlXmM8QFmnAUJtxFUp8CryxQz5vK508Kk
         U47w==
X-Forwarded-Encrypted: i=1; AFNElJ/CLBN2XNooudfzJnqbv/NHGQ2pEMZXtgbNV6IoPxCD8WNDYVyCkEth7quJnxfXnfkJIZFbL62nmv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1Q2HlvOw/UwFCrNgj5RhtQc5so7MfV1n5pw2w5lA/eagxO9q
	hlHXSj2Sx2Ui724vs1bHmQfRceE4+1IRv7aOvdIMQb+duPGuKHVGoIL6KrF4GXT7o1c5jRTXBDZ
	xRCcw6BxSFnKZaLVQlx0xMgKhovpuLQ==
X-Gm-Gg: Acq92OEMarriEa+9JKerT+hLAnw/k/SgIdGjlVG9l5f6Gg4v81O+BVzuNnbnuG58Yxe
	F97JQ1UBulGQlBgCCQMjRuQsI1WtINHcCy0OP7PORfzqI8vD7LVLeDQUGVpOaLMmt9+fDtZKETE
	vjPQ4frB+O2Mw0Xn0a1yCRFtB5ZldlOoGvpKZs+fiF0Haxj2tJ/YctuH+RsMShiT0bm3osW4P6b
	z1xQ+5CR8aXNvYMMD56hENwETgP2q8JIORqhCE0CHDOq7feI6rBaz1eERSnuc/1cEnReAlb59Ml
	RFOSW7llRE6uab8SpA==
X-Received: by 2002:a05:701a:c96f:b0:136:9ebf:3c04 with SMTP id
 a92af1059eb24-137d42618c3mr1072346c88.25.1780117417296; Fri, 29 May 2026
 22:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529165640.820-1-ravis.opensrc@gmail.com> <20260530000500.87407-1-sj@kernel.org>
 <CAC5umyhej9QKKOHcf5bbRw97gsoOfEOMLkpcAk-Lm_fL-4rHgA@mail.gmail.com>
In-Reply-To: <CAC5umyhej9QKKOHcf5bbRw97gsoOfEOMLkpcAk-Lm_fL-4rHgA@mail.gmail.com>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Fri, 29 May 2026 22:03:24 -0700
X-Gm-Features: AVHnY4JXS74PTwdU7Sx8vuVmvj4oiQo1ykOiRjgSM_AC7ERSn1VNxkdT75L30-A
Message-ID: <CALa+Y15eREjK-bdw1ekpp95tkjT+KJ-133GjvVENC-=TmVKsxw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, bijan311@gmail.com, 
	ajayjoshi@micron.com, honggyu.kim@sk.com, yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi SeongJae and Akinobu,

  Thank you both for the warm reception and for the clear direction.

On Fri, May 29, 2026 at 8:02=E2=80=AFPM Akinobu Mita <akinobu.mita@gmail.co=
m> wrote:
>
> Hello Ravi and SeongJae,
>
> 2026=E5=B9=B45=E6=9C=8830=E6=97=A5(=E5=9C=9F) 9:05 SeongJae Park <sj@kern=
el.org>:
> >
> > On Fri, 29 May 2026 09:56:34 -0700 Ravi Jonnalagadda <ravis.opensrc@gma=
il.com> wrote:
> >
> > > This series introduces a vendor and PMU-agnostic substrate inside DAM=
ON
> > > that consumes hardware-sampled access reports through the standard
> > > perf-event interface.  Userspace selects the PMU through sysfs (raw
> > > type/config knobs), driving either Intel PEBS L3-miss sampling or AMD
> > > IBS Op sampling.
> > >
> > > Why a unified perf-event substrate
> > >
> > > Earlier hardware-sampled access-monitoring proposal [1] took an AMD I=
BS
> > > specific module path backend, owning its own probe configuration,
> > > sysfs knobs, and lifecycle.
> > >
> > > SeongJae Park has previously highlighted the advantage of Akinobu
> > > Mita's perf-event proposal [2]: let DAMON register kernel-counter per=
f
> > > events and consume samples from any sampling PMU that perf core knows
> > > about.  This series builds on that direction
> >
> > Ah great, so we have no unclear challenge (additional loadable module s=
upport
> > and conflicts with other IBS modules) on our road for now!  That is, we=
 can
> > reuse the stable perf event interface and achieve all our goals!  As I
> > previously shared [1], it would take time, but I'm very optimistic abou=
t the
> > success of this project.  I don't like promising too much, but this pro=
ject
> > looks like something that we can "consider it done".
> >
> > We can also say that the current candidate of the first
> > damon_report_access()-based data attributes monitoring (milestone 2 [1]=
 final
> > deliverable) is the perf event based monitoring.

Glad this aligns with the milestone roadmap.

>
> That's good!
>
> From a quick look, it seems to have all the features I need, so I'd like =
to
> evaluate it based on Ravi's patch.  If any extensions require changes, I =
will
> let you know as feedback.

Great, please do.  Happy to fold any feedback into v2.

>
> Ravi,
> You can also add my Co-developed-by and Signed-off-by tags to the appropr=
iate
> patch, so please post to the mailing list.
>

Will do.  In v2 will add Co-developed-by and Signed-off-by tags
  to patches 1, 4, and 5:

    - Patch 1 (`struct damon_perf_event{,_attr}` + per-ctx list)
    - Patch 4 (per-CPU SPSC ring drain + perf-event lifecycle)
    - Patch 5 (vaddr/paddr perf-event backend)

Patches 2 and 3 are the sysfs surface that will move to the
probes/filters interface; patch 6 is the unrelated
`damos_node_eligible_mem_bp` tracepoint.

> I am currently working on a change to allow selecting perf events from th=
e damo
> tool by specifying the event name, similar to the perf record -e option (=
e.g.,
> "cpu/mem-loads,ldlat=3D30,freq=3D5000/P" or "cpu/mem-stores,freq=3D5000/P=
").
>
> I'll share the progress once it reaches a certain point.  A change to the=
 perf
> file, as shown in the attachment, will be necessary, but I believe it can=
 be
> handled without changing Ravi's current patch set.

Nice. When the damo side is ready I will rerun the existing AMD IBS
and Intel PEBS configurations through it.

>
> > > with the changes we
> > > needed to run it cross-vendor:
> > >
> > >   - a per-CPU lockless ring between the NMI sample handler and the
> > >     kdamond drain,
> > >   - per-CPU events that follow CPU hotplug cleanly,
> > >   - events fire only while the monitor is running -- created disabled=
,
> > >     armed when kdamond starts, disarmed and drained when it stops,
> > >   - all-or-nothing init across CPUs: a partial-CPU create failure rol=
ls
> > >     the whole event back rather than leaving silent gaps,
> > >   - safe handling of vendor sample-validity flags so a stale or
> > >     unpopulated address is never mistaken for a valid sample.
> > >
> > > What the series adds
> > >
> > > Patch 1 introduces the substrate's data types: a per-event
> > > configuration struct and a per-context list to hang them on.  A
> > > CONFIG_PERF_EVENTS=3Dn build folds to no-op stubs.
> > >
> > > Patch 2 exposes those types through sysfs.  Each entry maps to one
> > > perf event and lets userspace pick the PMU and how to sample it: the
> > > raw PMU type/config, addressing flags, and period or frequency.  The
> > > defaults are tuned for Intel PEBS; userspace overrides them for other
> > > PMUs.
> > >
> > > Patch 3 wires the sysfs apply path so configured events get attached
> > > to the running monitoring context.
> > >
> > > Patch 4 is the core of the series.  It replaces the mutex-protected
> > > report queue with a per-CPU lockless ring fed from NMI by the perf
> > > overflow handler and drained once per sample tick by the kdamond.
> > > Drained reports are matched to monitored regions by binary search
> > > over a per-tick snapshot.  The patch also wires the per-event
> > > lifecycle into kdamond: events arm when the monitor starts, disarm
> > > and drain when it stops, roll back cleanly when per-CPU init fails on
> > > some CPUs, and a second context that asks for the substrate while
> > > it is in use is rejected with -EBUSY.
> > >
> > > Patch 5 is the perf-event backend.  Two stateless overflow handlers
> > > (one vaddr-keyed, one paddr-keyed) are picked at event creation time
> > > and submit samples into the per-CPU ring.  Vendor-specific sample
> > > validity is honored at this layer.
> > >
> > > Patch 6 adds a tracepoint at every node_eligible_mem_bp quota-goal
> > > evaluation so userspace can watch goal convergence without polling
> > > sysfs.
> > >
> > > Userspace setup model
> > >
> > > Userspace selects the sampling PMU by pointing the perf event's
> > > `type` / `config` at it, and chooses the scheme topology that suits
> > > the address space the PMU reports on.  No module load or unload step
> > > is involved; `echo on > state` arms the substrate, `echo off > state`
> > > disarms it.
> > >
> > > Two configurations were used for validation.
> > >
> > > Configuration A: AMD IBS Op, paddr ops, system-wide PULL+PUSH tiering
> > >
> > >   IBS Op stamps samples with physical addresses, so DAMON reasons ove=
r
> > >   every backing page in the system regardless of which task or guest
> > >   touched it -- the substrate becomes a system-wide tiering controlle=
r.
> > >
> > >   Setup (abridged; `D=3D/sys/kernel/mm/damon/admin/kdamonds/0`):
> > >
> > >     echo 1     > /sys/kernel/mm/damon/admin/kdamonds/nr_kdamonds
> > >     echo 1     > $D/contexts/nr_contexts
> > >     echo paddr > $D/contexts/0/operations
> > >
> > >     # Two regions, one per NUMA node (DRAM + CXL).  PA ranges
> > >     # are derived per host from /proc/iomem; omitted here.
> > >     echo 1 > $D/contexts/0/targets/nr_targets
> > >     echo 2 > $D/contexts/0/targets/0/regions/nr_regions
> > >     echo <DRAM_LO> > $D/contexts/0/targets/0/regions/0/start
> > >     echo <DRAM_HI> > $D/contexts/0/targets/0/regions/0/end
> > >     echo <CXL_LO>  > $D/contexts/0/targets/0/regions/1/start
> > >     echo <CXL_HI>  > $D/contexts/0/targets/0/regions/1/end
> > >
> > >     # IBS Op event, period-based, paddr-stamped:
> > >     PE=3D$D/contexts/0/monitoring_attrs/sample/perf_events
> > >     echo 1 > $PE/nr_perf_events
> > >     echo $(cat /sys/bus/event_source/devices/ibs_op/type) > $PE/0/typ=
e
> > >     echo 0      > $PE/0/config
> > >     echo 1      > $PE/0/sample_phys_addr
> > >     echo 0      > $PE/0/freq
> > >     echo 262144 > $PE/0/sample_period
> > >     echo 0      > $PE/0/exclude_kernel
> > >     echo 0      > $PE/0/exclude_hv
> >
> > FYI, and as you may already know, the current plan [1] is to use the at=
tributes
> > probe interface.  With it, the above IBS Op event setup part would look=
 like,
> >
> > mon_attr=3D/sys/kernel/mm/damon/admin/kdamonds/0/contexts/0/monitoring_=
attrs
> > echo 1 > $mon_attr/probes/nr_probes
> > probe=3D$mon_attr/probes/0
> > echo 1 > $probe/filters/nr_filters
> > filter=3D$probe/filters/0
> > echo perf_event > $filter/type
> > echo ibs_op > $filter/perf_event_type
> > echo Y > $filter/allow
> >
> > Of course, more details could change later.

Understood. will hold for milestone 1.

> >
> > >
> > >     # PULL scheme: migrate_hot toward DRAM, gated on
> > >     # node_eligible_mem_bp(nid=3DDRAM) goal target_value=3DTARGET_BP.
> > >     # addr filter restricts source to the CXL range.
> > >     # PUSH scheme: migrate_hot toward CXL, gated on
> > >     # node_eligible_mem_bp(nid=3DCXL) target_value=3D10000-TARGET_BP.
> > >     # addr filter restricts source to the DRAM range.
> > >     # Both schemes are migrate_hot; they converge from opposite
> > >     # directions on the same hot working set.
> > >
> > >     echo on > $D/state
> > >
> > >   Userspace tunes the steady-state DRAM:CXL split by writing the goal
> > >   `target_value`s; DAMON's quota autotuner drives migration intensity
> > >   to match.
> > >
> > >   Workload: a QEMU/KVM guest pinned to one NUMA node, running 32
> > >   multichase multiload threads each touching a 4 GiB working set
> > >   (~128 GiB aggregate) with the memcpy-libc kernel.  The guest sees
> > >   a flat single-NUMA layout and has no direct view of the host's
> > >   tiering topology, yet its hot pages are migrated to DRAM and cold
> > >   pages pushed to CXL by host-side DAMON acting on IBS-stamped
> > >   physical addresses -- the application inside the guest benefits
> > >   from tiering it never had to be aware of.  Validated on AMD Turin
> > >   (132-CPU EPYC).  The configuration converged to its target ratio
> > >   in seconds and remained stable for 7+ hours continuously, with no
> > >   perf core auto-throttle and no measurable drift in the achieved
> > >   interleave ratio.
> > >
> > > Configuration B: Intel PEBS L3-miss, vaddr ops, per-PID weighted-dest
> > >
> > >   PEBS reports vaddr samples in the context of the running task.
> > >   DAMON's vaddr ops monitors a specific PID.
> > >
> > >   Setup (abridged):
> > >
> > >     echo 1     > /sys/kernel/mm/damon/admin/kdamonds/nr_kdamonds
> > >     echo 1     > $D/contexts/nr_contexts
> > >     echo vaddr > $D/contexts/0/operations
> > >
> > >     echo 1     > $D/contexts/0/targets/nr_targets
> > >     echo $PID  > $D/contexts/0/targets/0/pid_target
> > >     echo 0     > $D/contexts/0/targets/0/regions/nr_regions
> > >
> > >     # PEBS MEM_LOAD_RETIRED.L3_MISS, frequency-based, vaddr-stamped:
> > >     echo 1      > $PE/nr_perf_events
> > >     echo 4      > $PE/0/type           # PERF_TYPE_RAW
> > >     echo 0x20d1 > $PE/0/config         # umask=3D0x20 event=3D0xd1
> > >     echo 0      > $PE/0/sample_phys_addr
> > >     echo 1      > $PE/0/freq
> > >     echo 5003   > $PE/0/sample_freq
> > >     echo 2      > $PE/0/precise_ip
> > >     echo 1      > $PE/0/wakeup_events
> > >
> > >     # Single migrate_hot scheme with two weighted destinations
> > >     # (DRAM + CXL).  Userspace tunes the steady-state interleave by
> > >     # writing dests/{0,1}/weight.
> > >
> > >     echo on > $D/state
> > >
> > >   Workload: 32 multichase multiload threads with a 4 GiB working set
> > >   each (~128 GiB aggregate) running directly on the host, monitored
> > >   by DAMON via the multiload PID.  Validated on Intel Granite Rapids
> > >   (144-CPU).  Convergence is fast and the system is stable.
> >
> > Thank you so much for sharing the great prototype implementation and te=
st
> > results!
> >
> > I will try to make fast progress on milestone 1.  I will hold reviewing=
 details
> > of this series for now, as there could be more changes.  But in the hig=
h level,
> > this looks promising.
> >
> > >
> > > [1] https://lore.kernel.org/linux-mm/20260516223439.4033-1-ravis.open=
src@gmail.com/
> > > [2] https://lore.kernel.org/20260423004211.7037-1-akinobu.mita@gmail.=
com
> >
> > [1] https://lore.kernel.org/20260525225208.1179-1-sj@kernel.org/
> >
> >
> > Thanks,
> > SJ
> >
> > [...]

Thanks,
Ravi.
