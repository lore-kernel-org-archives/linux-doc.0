Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AC029ACC5
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303718; cv=pass; b=PGekVAb5/OzI5Xer1bdJPAQmadPzAWSphDo7YcwBIVoRSZR1b3hW/nZosltLKJ7Muq7A7NH0ViOLuH/gc71Ciablze0hhbv8JXjJiFOgVqi13Gcnh2xJ1B5+pOMFFZnLFu5gwKW5pvM7t9F4fwxOxzk6o964auva8OWip7LSnY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303718; c=relaxed/simple;
	bh=obsaj8SC1E5qlgbfkg/kI0Zl7VZyIGpD0bzyJAniCEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MR+oECxhNDgtmxHI1EexacSoDwoJeGerwpZf6u6RAzKK0q2SaMEAzmfCJlILC6kWmb6Fp8gGsCniRdTaSDBfYFSX1DR4iSE+AChRjvqwtylRq3U7qj96kU8LLN8Trlh5jIMmNckeKJcSHzfzllVulvAlKAE6DmNwXLcfPaNtv9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDWOR4az; arc=pass smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDWOR4az"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1357c851a48so5785177c88.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 12:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779303716; cv=none;
        d=google.com; s=arc-20240605;
        b=WE8B+5Mrt28prIrRSp6E+Ny8hDXXZsPyMpIqc7svetO2ZYnexspXOVa+jLXLbvzKe5
         QfJjiOAvp+omBHp2OOdVplcgkOTWNR5oE1pZ/++0/c+X3f0psl7drvxaZjn+LDGwGiOz
         u5Bw+8Ens6L+A1ShlJmb4SO3Ojw95yQ1B64QG0lanP5wtwySnJRj+qoDfBRhg8uKO2bU
         V0Fy+sipwS5fH24pb7xgRqLbuF74vQ1fIKPJ+vLpXkOWeXutpEGfjTwCxVGAxLL8CCqU
         YHpIkvZXUDfrj9fpaDbZjIKcJAOEQ8pRnmnzBsATFBaJc2Yye9faQ2Vs8kjB26FZ8Kdp
         xTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8wskmWgOJnbiOMNtnNeRCHNxmIGzn47RNTbCEm3fjg=;
        fh=oF8krkdgxMC00GBGJA6EVKO7QaJslbevjOFQc7bryH0=;
        b=dhiXT3P6S/G4AiBqgwAO2uJ4W7w5+iBINoqyOL91oYjqqXDwryVXF4YNSbvX1DJ52r
         2++sja+UfomgXpme6bEE9bclSuYlvmGRRa2CTfLjeTkYMisCK+y6YDpylOr0Z0iyiT4d
         Mpy4w0uJhrEkneYh6B1bSp0gvFHi1gRN6QSc86fEz93BfhvDOEdj6MpBxshto9J7Vbxr
         9tcj/sufwC3VdHg4npOucbriAwTBGty0D/pET94Gdwg5BiFTr/EjkzeVumVeXv9LnPXK
         UtsgsiAdMWYohGWKXcLXhrJ6VbFpbI34P5WxQENX2qtiNVHSAmC/LPjzfJ2FU/8ePydM
         K7xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779303716; x=1779908516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8wskmWgOJnbiOMNtnNeRCHNxmIGzn47RNTbCEm3fjg=;
        b=HDWOR4az9wA9xTItiW/sDc+Qj19/lqnJPAWKajRDhYMkj79Eq5EgYnOcIE0exhEqmO
         yZ7TI14cFSgPhLE53gYJZInI1DJtbfdom3mT3ddTyRnvD/Qcft6romiHBcekeexWIJQb
         iBoyznRGtwzNvc8Gxk+pZEafCK4hbxFmvq0TIp7ErqXbccWKixOZhffc3m8HCOPOsMeh
         tb+8ak9T6F9QNyXr211IoooCI0IEJD8txaIq6ZawkuGYP5AFGpgWKOzJUrrzBKK+cyEX
         7KbTl+o600uovdpHj1JEGmTqRZwKTbCUhPF2MetQdCm8bu5xxydQWTHYIucjp6adBL00
         QCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779303716; x=1779908516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8wskmWgOJnbiOMNtnNeRCHNxmIGzn47RNTbCEm3fjg=;
        b=Ll7UuVB/DCGeiV2SXEML25dBINKKr5qOj3CA1Ra3NMypdyHKj8YR2s5SWMjQr1xXcF
         k8Qu/Sv0+0UFlimqy7JIqgAPpNHFNd1aZSfo98R1mJB/S+bWFjCpBwklR0ByrdyLaHy+
         I9E9aPR/9rjzhMrNgPdDMYLmhTu9ArKlje+377QdAVPQsL6iumDte70fWkQ1DgMJ89Vt
         3Hw/GbHyNYk5s4vBvXD1F9bgQSQf2Phn7US6ALpTNe49oSMQBnWpO03kk9mRy0HBxqso
         zlBl741CWfcB8DCSPTf1vTGmrLZZ7IvjtiHFzpbHHIgiuWehpKqK1FeeLB1XzpjcFpUx
         nEqg==
X-Forwarded-Encrypted: i=1; AFNElJ/skdk46g2/BJXgP0GzNW4cC1Mps6DMV/T4GZKDCGj3F+XfQSgcy4+Aj+VjIds+nW1NkvXvqSVpVnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPVQzd1rWFjJHFRwiD4hZS7XWgPXTIzZtfQdVreNCwbkC4jkzI
	CipCX1+Y+I+exT3mw6/JNkiogcv3QynXfge4S1pA2qebOipjtrEAhDip/ZpW7qex5lwsPWRz4bC
	vFzMmpTekEfxJ4rXiNmwnCZn9PlW4EQ==
X-Gm-Gg: Acq92OEfNEPGZ2EQCYOgF2S6WjBS+ki8Bj2a3mB9wR1fJ5hRsAlbzJHRDr+EucA9zDF
	7fiMiXcyji64oeJCHzhp32r2xEgAPKq9bf+MO3liHLJQMCQHCg6yrp/F41gOUsNyCLisKp51+At
	nPhLR+x52NUl+AiSGDxJSqS+OVG/5s5NxDsBiWmgPSrLgLV3sEdYThKhwdwUggnb9tGjcKd+dRd
	f9FVMurjEDhTswOyPEwFacXg7BebdWAxVx2u6vIPUXq4jHk9ugPvYofxNy81gNuHyTf3DcASphJ
	syiiaQ==
X-Received: by 2002:a05:7022:31a:b0:128:e693:b61c with SMTP id
 a92af1059eb24-13504744146mr10445535c88.27.1779303715384; Wed, 20 May 2026
 12:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516223439.4033-1-ravis.opensrc@gmail.com> <20260519061905.89681-1-sj@kernel.org>
In-Reply-To: <20260519061905.89681-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 20 May 2026 12:01:43 -0700
X-Gm-Features: AVHnY4IOAntwzQmGBj7zdfoy8PMwhjo75QeGCZqsNAY09ZN3ZddyxNlObQG4nQ0
Message-ID: <CALa+Y15fsgb1SU1xBq6BHsgk9QSJr39L5CZSCahpRu7udGuwKw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] mm/damon: hardware-sampled access reports + AMD
 IBS Op example
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com, bharata@amd.com, Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 11:19=E2=80=AFPM SeongJae Park <sj@kernel.org> wrot=
e:
>
> + Akinobu
>
> Hello Ravi,
>
> On Sat, 16 May 2026 15:34:25 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > Hi all,
> >
> > This is an RFC, not for merge.  The series exercises and validates
> > damon_report_access() -- the consumer API SeongJae introduced in [1]
> > -- as a substrate for ingesting access reports from hardware-sampling
> > sources.  The series includes one worked-example backend, an AMD IBS
> > Op module (damon_ibs.ko), that runs on Zen 3+ silicon via the
> > existing perf event subsystem.
>
> Thank you for sharing this great RFC series!
>
> [...]
> > Why a hardware-source primitive complements existing primitives
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [...]
> > Both primitives produce a view of hotness that converges to the
> > true distribution over the aggregation interval.  For systems where
> > the address space is small relative to the aggregation rate, this is
> > the right tool.  On large heterogeneous-memory systems with goal-
> > driven schemes asking the closed-loop tuner to converge on a target
> > distribution, a complementary lower-latency view of accesses can
> > tighten the loop -- reducing the time DAMON's nr_accesses takes to
> > reflect the workload's actual access distribution, which in turn
> > reduces ramp duration and oscillation amplitude during convergence
> > of goal-driven schemes.
> >
> > A hardware-sampling primitive provides this complementary view:
> > hardware retirement records each access at its natural event rate,
> > with a physical address per sample, independent of TLB state and
> > independent of the unmap/fault path.
>
> Yes, I fully agree.  Different multiple access check primitives have diff=
erent
> characteristics.
>
> [...]
>
> > Demonstration
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [...]
> > In both regimes, convergence to target is quick, and the workload's
> > measured DRAM share then holds within 1.3 percentage points of
> > target with standard deviation under 1.3 percentage points, sustained
> > over runs of 15-30 minutes per target.
>
> I understand this demonstration shows your AMD IBS-based version of DAMON=
 is
> functioning as expected.  Thank you for sharing this!
>
> [...]
> > What's in this series
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >   Patch 1.  mm/damon/core: refcount ops owner module to prevent
> >             rmmod UAF
> >   Patch 2.  mm/damon/paddr: export damon_pa_* ops for IBS module
> >   Patch 3.  mm/damon/core: replace mutex-protected report buffer
> >             with per-CPU lockless ring
> >   Patch 4.  mm/damon/core: flat-array snapshot + bsearch in ring-
> >             drain loop
> >   Patch 5.  mm/damon: add sysfs binding and dispatch hookup for
> >             paddr_ibs operations
> >   Patch 6.  mm/damon/core: accept paddr_ibs in node_eligible_mem_bp
> >             ops check
> >   Patch 7.  mm/damon/damon_ibs: add AMD IBS-based access sampling
> >             backend
> >
> > Patches 1, 3, and 4 are general infrastructure that benefits any
> > consumer of damon_report_access().  Patches 2, 5, 6, and 7 are the
> > worked-example backend (paddr_ibs ops, sysfs binding, IBS module).
>
> I didn't read the detailed code of each patch.  But my high level underst=
anding
> is as below.
>
> Patches 1 and 2 are needed for supporting loadable module-based DAMON ope=
ration
> sets (access sampling backend).
>
> Patch 3 is needed for supporting access check primitives that can provide=
 the
> access information in only nmi context.  It can also speedup the access
> reporting in general, though.
>
> Patch 4 makes DAMON's internal reported access information retrieval fast=
er, so
> will help any reporting-based DAMON operation set use case.
>
> Patches 5-7 are required for only the IBS-based DAMON operations set
> (paddr_ibs).
>
> So I agree patch 4 is a general infrastructure improvement that benefits
> multiple use cases.
>
> Patch 3 is also arguably general infrastructure improvement, as it will m=
ake
> the reporting faster in general.
>
> Patch 1 is not technically coupled with paddr_ibs, and will be needed for
> general loadable module based access check primitives.  But, should we su=
pport
> lodable modules?  If so, why?
>
> Patch 2 is also not technically coupled with paddr_ibs, to my understandi=
ng, so
> should be categorized together with patch 1?  In other words, if we agree=
 we
> should support lodable modules based DAMON operation sets, this should be
> useful for not only paddr_ibs but more general cases.
>
> Correct me if I'm wrong.
>
> >
> >
> > Patches worth folding into damon/next
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Patches 1, 3, and 4 are not specific to IBS or to this RFC's
> > backend.  Each is preparatory infrastructure that any consumer of
> > damon_report_access() will need:
> >
> >   - Patch 1 (refcount ops owner) -- any modular ops set, including
> >     out-of-tree backends, needs clean module unload to avoid UAF
> >     on damon_unregister_ops.
> >   - Patch 3 (per-CPU lockless ring) -- damon_report_access() cannot
> >     be called from NMI context with the current mutex-protected
> >     buffer.  Hardware samplers all need NMI-safe submission.
> >   - Patch 4 (flat-array snapshot + bsearch drain) -- the linear-
> >     scan drain is O(reports x regions) and exceeds the sample
> >     interval at high-CPU x large-region products.  Bsearch brings
> >     it to O(reports x log regions).
> >
> > If these belong directly on damon/next as preparatory patches for
> > damon_report_access() rather than living inside an IBS-specific
> > track, we are happy to rebase and resend them that way.
>
> So I'm bit unsure about patch 1.  If we don't have a plan to support loda=
ble
> modules based DAMON operations set, we might not need it for now.
>
> For patches 3 and 4, I agree those will be useful in general.  Nonetheles=
s, I'd
> slightly prefer to do that optimizations at the later part of the long te=
rm
> project.
>
> >
> >
> > Relation to prior and ongoing work
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > The IBS sampling pattern in patch 7 -- attr.config=3D0 to use IBS Op
> > default config, dc_phy_addr_valid filter, NMI-safe sample submission
> > -- is derived from concepts in Bharata B Rao's pghot RFC v5 [3].
> > The attribution header is in mm/damon/damon_ibs.c and the patch
> > carries a Suggested-by: trailer.
> >
> > Bharata's pghot v7 [4] introduces a different IBS driver targeting
> > the new IBS Memory Profiler (IBS-MProf) facility, which Bharata
> > describes as a facility "that will be present in future AMD
> > processors" -- a separate IBS instance from the one this RFC's
> > backend uses. This version of driver based out of v5 [3] is an
> > example of how DAMON can be benefited from AMD IBS Hardware
> > source and validates importance of IBS information indepedently.
> > It is not meant to be merged in the current form.
> > @Bharata if you see a path where IBS samples can be consumed
> > by DAMON at some point, will be happy to collaborate.
> >
> > Akinobu Mita's perf-event-based access-check RFC [5] explores a
> > configurable perf-event-driven access source for DAMON.  IBS has
> > vendor-specific MSR setup beyond what perf_event_attr alone
> > expresses (e.g. dc_phy_addr_valid filtering on the produced sample,
> > not on the perf attr), so the IBS path here appears complementary
> > to [5] -- operators choose based on whether their hardware sampler
> > fits stock perf or needs additional kernel-side setup.
>
> So apparently there are multiple approaches to develop and use h/w-based =
access
> monitoring.  Akinobu and you are trying to do that using DAMON as the fro=
ntend,
> and already made the working prototypes.  There were more people who show=
ed
> interest and will to contribute to this project other than you, too.  I 1=
00%
> agree h/w-based access monitoring can be useful, and I of course thinking=
 using
> DAMON as the fronend is the right approach.  I'm all for making this
> upstreamed.
>
> I was therefore spending time on thinking about in what long-term maintai=
nable
> shape this capability can successfully be upstreamed.  I suggested
> damon_report_access() as the internal interface between DAMON and the h/w=
-based
> access check primitives, and apparently we all (I, Ravi and Akinobu in th=
is
> context) agreed.  Akinobu thankfully revisioned his implementation based =
on
> damon_report_access() interface.  Ravi also implemented this RFC based on=
 the
> interface.
>
> After making the consensus with Akinobu, I was taking time on the user sp=
ace
> interface.  When I was discussing with Akinobu, my idea was extending the=
 user
> interface for the page faults based monitoring v3 [1].  But, recently I d=
ecided
> to make this more general, so proposed data attributes monitoring extensi=
on [2]
> at LSFMMBPF.  The patch series for the initial change [3] is merged into =
mm-new
> for more testing, today.  The cover letter of the patch series is also sh=
aring
> how it will be extended for h/w based access monitoring in long term.
>
> I of course want us to go in this direction.  I believe you already had c=
hances
> to take a look on the long term plan and didn't make some voice because y=
ou
> don't strongly disagree about the plan.  If not, please make a voice.
>
Hi SJ,

One layering question I'd like to flag before the plan is written,
since it affects how this RFC's substrate slots in:

  In [3], .apply_probes is a periodic per-region classifier driven
  from kdamond_fn after .check_accesses, in process context, that
  applies a (folio -> bool) predicate to each region's sampling_addr
  and accounts the results in r->probe_hits[].  damon_report_access()
  on the other hand is a per-event delivery callback into a per-CPU
  buffer, called from the access source (NMI for IBS / PEBS / SPE,
  process context for page-fault-based sources).  These appear to
  me to sit at different layers - delivery vs. classification.

  The reason I want to confirm this: NMI context for HW samplers
  precludes the operations .apply_probes can do today (no mutex, no
  kmalloc, no sleep, no folio lookup that touches pte_lock).  And
  the data shape is inverted - .apply_probes asks "does region R's
  sampling_addr have attribute A?", evaluated on the kdamond-chosen
  address; an HW sample announces "PA Y was accessed at retirement
  time T", arriving asynchronously and needing to find the region
  it falls into.  If access events end up routed through
  .apply_probes in the long-term plan, the IBS / PEBS / SPE
  backends would each need a deferral path under it (per-CPU ring
  for NMI-safe submission, region mapping at drain time).

  Happy to be wrong here if you see a unified shape that handles
  both - just want to surface the constraint before the plan is
  written.

On the loadable-module question for patches 1 and 2: agreed it's a
genuinely open architectural call, not just a paddr_ibs convenience.

  - paddr_ibs (this RFC) targets the existing IBS Op facility on
    Zen 3+ silicon via the perf event subsystem and uses a
vendor-specific
    overflow-handler filter that perf_event_attr cannot express
    (dc_phy_addr_valid in IBS_OP_DATA3).  Bharata's pghot v7
    [pghot-v7] introduces a separate IBS driver targeting the new
IBS-MProf
    facility on future AMD silicon via direct MSR programming -
    not perf at all.  These are two AMD-specific HW samplers with
    non-overlapping silicon coverage and non-overlapping kernel
    paths.  A distro shipping a single kernel image to a fleet
    with mixed silicon needs runtime-selectable backends, which
    obj=3Dy can't do across exclusive `depends on` chains.
  - Akinobu's perf-event RFC v3 [akinobu-v3] is a useful contrast:
    it stays builtin because it's a generic configurable
    perf_event_attr passthrough, no vendor-specific code in the
    overflow handler.  The tristate case is specifically for the
    backends that need vendor logic outside perf_event_attr
    (IBS dc_phy_addr_valid, future ARM SPE record-format
    handling, future Intel PEBS DLA quirks if they need
    kernel-side filtering beyond what perf delivers).

Bharata, would value your perspective on two related questions: in
your long-term plan for pghot, do you see the legacy IBS Op path
(this RFC) staying as a DAMON-side backend, while the new IBS-MProf
path lands under pghot?  Or do you envision both IBS facilities
eventually feeding through a common HW-sampler primitive (pghot or
DAMON), with frontend selectable by user config?  And on existing
Zen 3+ silicon: is the legacy IBS Op driver in this RFC the right
home for those processors going forward.

Thanks,
Ravi

> Assuming you don't have concern on the long term plan yet, I will take ti=
me to
> write down more formal and detailed plan.  It will explain the overall ro=
admap,
> timeline and how we could collaborate.  On top of that, we could further
> discuss.
>
> >
> >
> > Specific asks
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > To SeongJae:
> >
> >   1. Patches 1, 3, and 4 are infrastructure that benefits any consumer
> >      of damon_report_access(), not just the IBS backend in this RFC.
> >      Would these belong directly on damon/next as preparatory patches
> >      for damon_report_access(), rather than living inside an
> >      IBS-specific track?  Happy to rebase and resend them that way if
> >      you'd prefer that shape.  Tested-by: tags can come along.
>
> I'm still thinking about how we can collaborate well.  The answer for the=
 above
> question would be a part of that.  In other words, I have no good answer =
right
> now, sorry.  Could you please give me more time to think more and share t=
he
> plan?  I will share the plan as another mail.  On the thread, we could fu=
rther
> discuss.  Of course, we could have DAMON beer/coffee/tea chats [4] like
> additional discussions before/after/during the plan discussion.
>
> So, long story short, we agreed this project (h/w-based data access monit=
oring)
> should be upstreamed.  But give me little more time on thinking about how=
 we
> will do it and collaborate.  It will take some time.  Please bear in mind=
.
> Sorry for making you wait, but I pretty sure and promise that we will
> eventually make it.
>
> [1] https://lore.kernel.org/20251208062943.68824-1-sj@kernel.org
> [2] https://lwn.net/Articles/1071256/
> [3] https://lore.kernel.org/20260518234119.97569-1-sj@kernel.org
> [4] https://docs.google.com/document/d/1v43Kcj3ly4CYqmAkMaZzLiM2GEnWfgdGb=
ZAH3mi2vpM/edit?usp=3Dsharing
>
>
> Thanks,
> SJ
>
> [...]
