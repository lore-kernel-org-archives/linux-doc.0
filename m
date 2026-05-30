Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137B531690E
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 03:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110133; cv=pass; b=LSqiPmFJxEii6X82Xywk3ySdztNb2xCtoL2QQwB9tL59l8Pjew+8Z0CbMSf6nnLpTmWXma1APECP+RtOKmsDS5t5BPet+eCD8pjep0MuyFHsDe7N9z51Gz5J1lI4Ha3MT+/F7E3Qts5pI5mPXkFhwGtnKecre+0wzW9iOX6HJbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110133; c=relaxed/simple;
	bh=HSctdUdXH0lrjjbi0PONaF12A9abyLZaSoQUCUzH0g8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hza8ig0sdJwb9s5LwpyKxzEVohoAbrlMzB8/XkVwcL/SP4h8gHQxVVyPpFem8iYXzKqjNAj3UBTNy7GXfQ/b6pFSD/y4YqV3JVrAXMYSqgM1JT6ZVUu3qjRuWwHBkXPMd6yjk6cgu99nv+Ukqs1Zjj5kE+3BCd5MIYTkDlPIEOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0diP+9/; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0diP+9/"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51720674eb7so26053091cf.1
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 20:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780110130; cv=none;
        d=google.com; s=arc-20240605;
        b=dcwo0lxgkkJl+tSIIJRPt4Kink90MG2vr60mtJ9tPbg+0HxIMbC6IVEsx8CGxoHTkA
         Ls6gYnr270ovnOZw00HzVm5DrEYwbwKuF9HPiiMX/cprYCFKLk2wdgIPQ882ym8QTN41
         LnkzPHVaoGMZNaxbzgi8BE6Xyz8Eq3zo8ZIDAMM0GBsRMpDwhQnvu8gqMd7VVfdBwnXB
         C+BcWnhdRQXXktg3jD4DAJSes3BumNca77/FE75DPfceanlbI3dC3g6zbdNyHp3HRMdJ
         xIJ1/OcirOI+qFHjgpNUhNeXiWm+YKVf8E/YM/pNdt5elQGQOQ7geb9M3gFVKOZtxTDO
         6ynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dFnUlGJksSYSOwCKqq2mmNxuP1CCr0OgydxaPm40SIk=;
        fh=uY5sAOpbWJ48pwHJaJYXDdICfe6GfcJhUfSaiDvrN9M=;
        b=ZMlCgNs/Y/OmrSkjxM9Y/qtO0cB4nKiq4E66fWjoWPHVcZRFNDcp4zbrUTWHVMgpzs
         Bpg2CFETtpacQsVodEUO6fsFcZTI4diLIHIGtH33/S4pGk4ZAgtM5cd+TN+DMGeNdFiw
         Kqf82d51FrDqsUD66sjrlygsNNM9ReTXtnK3AfIHfc3J6CwQmeV/5q8bb6ai45QM3Psn
         dHD+ieWpoYhIW7se1zg4I9eGXnYVlNZVcx+vlYOi5VrbhZddjBEniAZ1XeoNEvRRPI2z
         BzosOgbdxQdAs4tIttO2A+eRvZIUBiZAha92NZRhFlFR/M4ed2RnRfYG5pqaSozO/27d
         rEmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780110130; x=1780714930; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dFnUlGJksSYSOwCKqq2mmNxuP1CCr0OgydxaPm40SIk=;
        b=X0diP+9/awFKpdmW88d6E8EZYGRZV9U9ngZI2YoW7TLRKsoskSV6s15On9n4F+n4eq
         CWRaOMMBDa3N+Py0leEZ3mFG1+b6pHdQzNxi0aGsoqGWKc9DJ5cM2wfMOehl3Dmgmk30
         SkiG208AtocBT92E1wYSNDzuZr6QCBB2HdB2iISPJD4blpRpkgMvPuAJsRlFdGPq6I3F
         3DyMJRcfKbTuYvP0Cw1svO6mRlFezesLLmqB1N3nhIP7eg8kXjHPP2RdO0D4Ta/7EX6y
         lBlIU9TnZE13yQ+k4KXD6RKUjR0tcP8T2aoYSxiwJJ3qyrfN6x/F/Bg7Tty368WASxvl
         VcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780110130; x=1780714930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFnUlGJksSYSOwCKqq2mmNxuP1CCr0OgydxaPm40SIk=;
        b=fQx8ugiypQk4mlLGa+GLLN7c8sr3QXreGOYXioBO8BO2pKwYc2LJoW/GaTK42ApIw7
         krM4L/jRLvQsV4QDV6Agk4BdFoRasp2Uz1ZCQNzy9N9Grd9FoYxHXDGzEdqQ49VdTjQF
         vQMEsY4leb2PXiMCv2nIdNAT5+2wOmclk0PfPRxHzmMV6LJXrwaTkUrHLz8WDsghQho2
         iry1wYRIZ2vlSPbMb4AZGsi7X0kCLmmIj+XROQ+rdyZ5kvI/FUZY4Tuo1C3s6O6OFhL5
         UT3zmHGBfUCRhqOcybZcHWAqq9r4uk96H1qjy0zDvm+Imu1dD+shBRJ7iVzzpEFQ1io9
         jJwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1CRvq+x+UEC6I9JPjQ8IPsOjh2t2mifbMEcvywDWFLvogdoauHzBjev890Gpy/7GjFXCzFNANFEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOEkv+oRwF+m2EUx1Zm9VkCNMLVf9N82jbmJN1exYenKpV/S78
	QajkU5eVFv8DIKPTXj8IqaK3F6i1rwFygZf/1T7vAufpaiqOn09FgrTUs6J1S9yLpQzW8Kla3i7
	00tB//ey13e+mNRu+H1NZKYYCTkINBc8=
X-Gm-Gg: Acq92OF9PvmEhGBXWTuo62RGJyMfQat5UUU0XFy84RrSuPgIgqM6xlZRjolc85xxqZO
	OTcpwvYRbcm6OzZUulfdj7DwomPtv4oHwN8HioPFYJibKlBFb9LZngV6FNIPZb+YvPzXz/Olm75
	oEJSvns2ME9efVWo+oMQOWlQCp9SjLJKOVDeSTMuB6milI214EOnyel9RnFnquMk+0Dgam9FhI3
	zzZGJj3rhwt+72itdRszUfpj9UcUoSmtjaPVQESYdpLUj+wCBgHXVsnJHbRe6j8Qb0y7uE13uLJ
	4JS27XaErwbQYInQs/UOk3GFZj3HslPLnDdn1WPv0vLT3A==
X-Received: by 2002:a05:622a:2289:b0:516:e833:64f2 with SMTP id
 d75a77b69052e-5173a61b308mr35165141cf.12.1780110129871; Fri, 29 May 2026
 20:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529165640.820-1-ravis.opensrc@gmail.com> <20260530000500.87407-1-sj@kernel.org>
In-Reply-To: <20260530000500.87407-1-sj@kernel.org>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Sat, 30 May 2026 12:01:58 +0900
X-Gm-Features: AVHnY4IOaEk-LMA2tNNfp68UTFhBewxlgDEMjypO9pe34LsPseJjoV905YQ2OdI
Message-ID: <CAC5umyhej9QKKOHcf5bbRw97gsoOfEOMLkpcAk-Lm_fL-4rHgA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
To: SeongJae Park <sj@kernel.org>
Cc: Ravi Jonnalagadda <ravis.opensrc@gmail.com>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, bijan311@gmail.com, 
	ajayjoshi@micron.com, honggyu.kim@sk.com, yunjeong.mun@sk.com
Content-Type: multipart/mixed; boundary="000000000000f3e0330653002fca"

--000000000000f3e0330653002fca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ravi and SeongJae,

2026=E5=B9=B45=E6=9C=8830=E6=97=A5(=E5=9C=9F) 9:05 SeongJae Park <sj@kernel=
.org>:
>
> On Fri, 29 May 2026 09:56:34 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > This series introduces a vendor and PMU-agnostic substrate inside DAMON
> > that consumes hardware-sampled access reports through the standard
> > perf-event interface.  Userspace selects the PMU through sysfs (raw
> > type/config knobs), driving either Intel PEBS L3-miss sampling or AMD
> > IBS Op sampling.
> >
> > Why a unified perf-event substrate
> >
> > Earlier hardware-sampled access-monitoring proposal [1] took an AMD IBS
> > specific module path backend, owning its own probe configuration,
> > sysfs knobs, and lifecycle.
> >
> > SeongJae Park has previously highlighted the advantage of Akinobu
> > Mita's perf-event proposal [2]: let DAMON register kernel-counter perf
> > events and consume samples from any sampling PMU that perf core knows
> > about.  This series builds on that direction
>
> Ah great, so we have no unclear challenge (additional loadable module sup=
port
> and conflicts with other IBS modules) on our road for now!  That is, we c=
an
> reuse the stable perf event interface and achieve all our goals!  As I
> previously shared [1], it would take time, but I'm very optimistic about =
the
> success of this project.  I don't like promising too much, but this proje=
ct
> looks like something that we can "consider it done".
>
> We can also say that the current candidate of the first
> damon_report_access()-based data attributes monitoring (milestone 2 [1] f=
inal
> deliverable) is the perf event based monitoring.

That's good!

From a quick look, it seems to have all the features I need, so I'd like to
evaluate it based on Ravi's patch.  If any extensions require changes, I wi=
ll
let you know as feedback.

Ravi,
You can also add my Co-developed-by and Signed-off-by tags to the appropria=
te
patch, so please post to the mailing list.

I am currently working on a change to allow selecting perf events from the =
damo
tool by specifying the event name, similar to the perf record -e option (e.=
g.,
"cpu/mem-loads,ldlat=3D30,freq=3D5000/P" or "cpu/mem-stores,freq=3D5000/P")=
.

I'll share the progress once it reaches a certain point.  A change to the p=
erf
file, as shown in the attachment, will be necessary, but I believe it can b=
e
handled without changing Ravi's current patch set.

> > with the changes we
> > needed to run it cross-vendor:
> >
> >   - a per-CPU lockless ring between the NMI sample handler and the
> >     kdamond drain,
> >   - per-CPU events that follow CPU hotplug cleanly,
> >   - events fire only while the monitor is running -- created disabled,
> >     armed when kdamond starts, disarmed and drained when it stops,
> >   - all-or-nothing init across CPUs: a partial-CPU create failure rolls
> >     the whole event back rather than leaving silent gaps,
> >   - safe handling of vendor sample-validity flags so a stale or
> >     unpopulated address is never mistaken for a valid sample.
> >
> > What the series adds
> >
> > Patch 1 introduces the substrate's data types: a per-event
> > configuration struct and a per-context list to hang them on.  A
> > CONFIG_PERF_EVENTS=3Dn build folds to no-op stubs.
> >
> > Patch 2 exposes those types through sysfs.  Each entry maps to one
> > perf event and lets userspace pick the PMU and how to sample it: the
> > raw PMU type/config, addressing flags, and period or frequency.  The
> > defaults are tuned for Intel PEBS; userspace overrides them for other
> > PMUs.
> >
> > Patch 3 wires the sysfs apply path so configured events get attached
> > to the running monitoring context.
> >
> > Patch 4 is the core of the series.  It replaces the mutex-protected
> > report queue with a per-CPU lockless ring fed from NMI by the perf
> > overflow handler and drained once per sample tick by the kdamond.
> > Drained reports are matched to monitored regions by binary search
> > over a per-tick snapshot.  The patch also wires the per-event
> > lifecycle into kdamond: events arm when the monitor starts, disarm
> > and drain when it stops, roll back cleanly when per-CPU init fails on
> > some CPUs, and a second context that asks for the substrate while
> > it is in use is rejected with -EBUSY.
> >
> > Patch 5 is the perf-event backend.  Two stateless overflow handlers
> > (one vaddr-keyed, one paddr-keyed) are picked at event creation time
> > and submit samples into the per-CPU ring.  Vendor-specific sample
> > validity is honored at this layer.
> >
> > Patch 6 adds a tracepoint at every node_eligible_mem_bp quota-goal
> > evaluation so userspace can watch goal convergence without polling
> > sysfs.
> >
> > Userspace setup model
> >
> > Userspace selects the sampling PMU by pointing the perf event's
> > `type` / `config` at it, and chooses the scheme topology that suits
> > the address space the PMU reports on.  No module load or unload step
> > is involved; `echo on > state` arms the substrate, `echo off > state`
> > disarms it.
> >
> > Two configurations were used for validation.
> >
> > Configuration A: AMD IBS Op, paddr ops, system-wide PULL+PUSH tiering
> >
> >   IBS Op stamps samples with physical addresses, so DAMON reasons over
> >   every backing page in the system regardless of which task or guest
> >   touched it -- the substrate becomes a system-wide tiering controller.
> >
> >   Setup (abridged; `D=3D/sys/kernel/mm/damon/admin/kdamonds/0`):
> >
> >     echo 1     > /sys/kernel/mm/damon/admin/kdamonds/nr_kdamonds
> >     echo 1     > $D/contexts/nr_contexts
> >     echo paddr > $D/contexts/0/operations
> >
> >     # Two regions, one per NUMA node (DRAM + CXL).  PA ranges
> >     # are derived per host from /proc/iomem; omitted here.
> >     echo 1 > $D/contexts/0/targets/nr_targets
> >     echo 2 > $D/contexts/0/targets/0/regions/nr_regions
> >     echo <DRAM_LO> > $D/contexts/0/targets/0/regions/0/start
> >     echo <DRAM_HI> > $D/contexts/0/targets/0/regions/0/end
> >     echo <CXL_LO>  > $D/contexts/0/targets/0/regions/1/start
> >     echo <CXL_HI>  > $D/contexts/0/targets/0/regions/1/end
> >
> >     # IBS Op event, period-based, paddr-stamped:
> >     PE=3D$D/contexts/0/monitoring_attrs/sample/perf_events
> >     echo 1 > $PE/nr_perf_events
> >     echo $(cat /sys/bus/event_source/devices/ibs_op/type) > $PE/0/type
> >     echo 0      > $PE/0/config
> >     echo 1      > $PE/0/sample_phys_addr
> >     echo 0      > $PE/0/freq
> >     echo 262144 > $PE/0/sample_period
> >     echo 0      > $PE/0/exclude_kernel
> >     echo 0      > $PE/0/exclude_hv
>
> FYI, and as you may already know, the current plan [1] is to use the attr=
ibutes
> probe interface.  With it, the above IBS Op event setup part would look l=
ike,
>
> mon_attr=3D/sys/kernel/mm/damon/admin/kdamonds/0/contexts/0/monitoring_at=
trs
> echo 1 > $mon_attr/probes/nr_probes
> probe=3D$mon_attr/probes/0
> echo 1 > $probe/filters/nr_filters
> filter=3D$probe/filters/0
> echo perf_event > $filter/type
> echo ibs_op > $filter/perf_event_type
> echo Y > $filter/allow
>
> Of course, more details could change later.
>
> >
> >     # PULL scheme: migrate_hot toward DRAM, gated on
> >     # node_eligible_mem_bp(nid=3DDRAM) goal target_value=3DTARGET_BP.
> >     # addr filter restricts source to the CXL range.
> >     # PUSH scheme: migrate_hot toward CXL, gated on
> >     # node_eligible_mem_bp(nid=3DCXL) target_value=3D10000-TARGET_BP.
> >     # addr filter restricts source to the DRAM range.
> >     # Both schemes are migrate_hot; they converge from opposite
> >     # directions on the same hot working set.
> >
> >     echo on > $D/state
> >
> >   Userspace tunes the steady-state DRAM:CXL split by writing the goal
> >   `target_value`s; DAMON's quota autotuner drives migration intensity
> >   to match.
> >
> >   Workload: a QEMU/KVM guest pinned to one NUMA node, running 32
> >   multichase multiload threads each touching a 4 GiB working set
> >   (~128 GiB aggregate) with the memcpy-libc kernel.  The guest sees
> >   a flat single-NUMA layout and has no direct view of the host's
> >   tiering topology, yet its hot pages are migrated to DRAM and cold
> >   pages pushed to CXL by host-side DAMON acting on IBS-stamped
> >   physical addresses -- the application inside the guest benefits
> >   from tiering it never had to be aware of.  Validated on AMD Turin
> >   (132-CPU EPYC).  The configuration converged to its target ratio
> >   in seconds and remained stable for 7+ hours continuously, with no
> >   perf core auto-throttle and no measurable drift in the achieved
> >   interleave ratio.
> >
> > Configuration B: Intel PEBS L3-miss, vaddr ops, per-PID weighted-dest
> >
> >   PEBS reports vaddr samples in the context of the running task.
> >   DAMON's vaddr ops monitors a specific PID.
> >
> >   Setup (abridged):
> >
> >     echo 1     > /sys/kernel/mm/damon/admin/kdamonds/nr_kdamonds
> >     echo 1     > $D/contexts/nr_contexts
> >     echo vaddr > $D/contexts/0/operations
> >
> >     echo 1     > $D/contexts/0/targets/nr_targets
> >     echo $PID  > $D/contexts/0/targets/0/pid_target
> >     echo 0     > $D/contexts/0/targets/0/regions/nr_regions
> >
> >     # PEBS MEM_LOAD_RETIRED.L3_MISS, frequency-based, vaddr-stamped:
> >     echo 1      > $PE/nr_perf_events
> >     echo 4      > $PE/0/type           # PERF_TYPE_RAW
> >     echo 0x20d1 > $PE/0/config         # umask=3D0x20 event=3D0xd1
> >     echo 0      > $PE/0/sample_phys_addr
> >     echo 1      > $PE/0/freq
> >     echo 5003   > $PE/0/sample_freq
> >     echo 2      > $PE/0/precise_ip
> >     echo 1      > $PE/0/wakeup_events
> >
> >     # Single migrate_hot scheme with two weighted destinations
> >     # (DRAM + CXL).  Userspace tunes the steady-state interleave by
> >     # writing dests/{0,1}/weight.
> >
> >     echo on > $D/state
> >
> >   Workload: 32 multichase multiload threads with a 4 GiB working set
> >   each (~128 GiB aggregate) running directly on the host, monitored
> >   by DAMON via the multiload PID.  Validated on Intel Granite Rapids
> >   (144-CPU).  Convergence is fast and the system is stable.
>
> Thank you so much for sharing the great prototype implementation and test
> results!
>
> I will try to make fast progress on milestone 1.  I will hold reviewing d=
etails
> of this series for now, as there could be more changes.  But in the high =
level,
> this looks promising.
>
> >
> > [1] https://lore.kernel.org/linux-mm/20260516223439.4033-1-ravis.opensr=
c@gmail.com/
> > [2] https://lore.kernel.org/20260423004211.7037-1-akinobu.mita@gmail.co=
m
>
> [1] https://lore.kernel.org/20260525225208.1179-1-sj@kernel.org/
>
>
> Thanks,
> SJ
>
> [...]

--000000000000f3e0330653002fca
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0010-perf-python-Add-member-access-to-config1-and-config2.patch"
Content-Disposition: attachment; 
	filename="0010-perf-python-Add-member-access-to-config1-and-config2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mprrim1a0>
X-Attachment-Id: f_mprrim1a0

RnJvbSBiMTFiYjQ0ZDIyOGQ1MTI3MmM2MTM4NTU5Y2I3NzIyOTdiYTQ3MWFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBa2lub2J1IE1pdGEgPG1pdGFAZml4c3RhcnMuY29tPgpEYXRl
OiBXZWQsIDI3IE1heSAyMDI2IDE5OjAwOjQxICswOTAwClN1YmplY3Q6IFtQQVRDSCAxMC8xMF0g
cGVyZiBweXRob246IEFkZCBtZW1iZXIgYWNjZXNzIHRvIGNvbmZpZzEgYW5kIGNvbmZpZzIKIG9m
IGV2c2VsCgpUaGlzIGNoYW5nZSBpcyBuZWNlc3NhcnkgdG8gc3BlY2lmeSB0aGUgc2FtZSBQTVUg
ZXZlbnQgc2VsZWN0aW9uIGFzIHRoZQoncGVyZiByZWNvcmQnIC1lIG9wdGlvbiBmcm9tIERBTU9O
J3MgdXNlcnNwYWNlIHRvb2xzLgoKRm9yIGV4YW1wbGUsIGEgUHl0aG9uIHNjcmlwdCBsaWtlIHRo
ZSBmb2xsb3dpbmcgd2lsbCBhbGxvdyB5b3UgdG8gb2J0YWluCnRoZSB2YWx1ZXMgdG8gYmUgc2V0
IGluIHRoZSB0eXBlLCBjb25maWcsIGNvbmZpZzEsIGFuZCBjb25maWcyIG1lbWJlcnMgb2YKcGVy
Zl9ldmVudF9hdHRyIGJ5IHByb3ZpZGluZyBhIHN5bWJvbGljIGV2ZW50IG5hbWUuCgppbXBvcnQg
cGVyZgoKaWYgX19uYW1lX18gPT0gJ19fbWFpbl9fJzoKICAgIGV2bGlzdCA9IHBlcmYucGFyc2Vf
ZXZlbnRzKCJjcHUvbWVtLWxvYWRzLGxkbGF0PTMwL1AiKQogICAgZm9yIGV2c2VsIGluIGV2bGlz
dDoKICAgICAgICBwcmludChmIntldnNlbH06IHR5cGU9e2V2c2VsLnR5cGV9IGNvbmZpZz17ZXZz
ZWwuY29uZmlnfSIsCiAgICAgICAgICAgICAgZiJjb25maWcxPXtldnNlbC5jb25maWcxfSBjb25m
aWcyPXtldnNlbC5jb25maWcyfSIpCgpTaWduZWQtb2ZmLWJ5OiBBa2lub2J1IE1pdGEgPGFraW5v
YnUubWl0YUBnbWFpbC5jb20+Ci0tLQogdG9vbHMvcGVyZi91dGlsL3B5dGhvbi5jIHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYv
dXRpbC9weXRob24uYyBiL3Rvb2xzL3BlcmYvdXRpbC9weXRob24uYwppbmRleCBjYzEwMTlkMjlh
NWQuLjU2OTAzNjE3YmE0YyAxMDA2NDQKLS0tIGEvdG9vbHMvcGVyZi91dGlsL3B5dGhvbi5jCisr
KyBiL3Rvb2xzL3BlcmYvdXRpbC9weXRob24uYwpAQCAtMTI0MSw2ICsxMjQxLDggQEAgc3RhdGlj
IFB5TWVtYmVyRGVmIHB5cmZfZXZzZWxfX21lbWJlcnNbXSA9IHsKIAlldnNlbF9hdHRyX21lbWJl
cl9kZWYoc2FtcGxlX3R5cGUsIFRfVUxPTkdMT05HLCAiYXR0cmlidXRlIHNhbXBsZV90eXBlLiIp
LAogCWV2c2VsX2F0dHJfbWVtYmVyX2RlZihyZWFkX2Zvcm1hdCwgVF9VTE9OR0xPTkcsICJhdHRy
aWJ1dGUgcmVhZF9mb3JtYXQuIiksCiAJZXZzZWxfYXR0cl9tZW1iZXJfZGVmKHdha2V1cF9ldmVu
dHMsIFRfVUlOVCwgImF0dHJpYnV0ZSB3YWtldXBfZXZlbnRzLiIpLAorCWV2c2VsX2F0dHJfbWVt
YmVyX2RlZihjb25maWcxLCBUX1VMT05HTE9ORywgImF0dHJpYnV0ZSBjb25maWcxLiIpLAorCWV2
c2VsX2F0dHJfbWVtYmVyX2RlZihjb25maWcyLCBUX1VMT05HTE9ORywgImF0dHJpYnV0ZSBjb25m
aWcyLiIpLAogCXsgLm5hbWUgPSBOVUxMLCB9LAogfTsKIAotLSAKMi40My4wCgo=
--000000000000f3e0330653002fca--
