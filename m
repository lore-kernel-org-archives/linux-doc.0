Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E73379ED6
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 03:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789530298; cv=none; b=fmKhpt+3td7mETE3S5l8r1mjGcLlPhtYTQ9E7RdRDtyAq56HnP/YRkJDzzOZg77+TfjSIrpZqlGskYlQnPSpVmLN2rwXGnf7DopcRdSjSfiPrMbPQCRq8c1nqJDT7xlxIHNMDVyCZGbWSROFu3nZz+RkmnBnFRVsIH72bTR5DEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789530298; c=relaxed/simple;
	bh=PQQSm3WvKwZR0U5KrYWkeIfK2l4EGt5o9TAzNYhKkUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hO+mphC9wgAYWONGm/5vk0RgMDsINrUBSlmJ9r6o5aA4E263R1qYVjf8cpXkp1KeL6QjQ/ooYXV4vxd4yYR9JEyzoWBiNKJ/ClR6Q4S1s1UopxtJsQFbHHe9mJMxd92OhxauXsnMYqBXj7cVSDXR1hoIN9tY2sML8Bm7z/txwno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxFpBOtU; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxFpBOtU"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so341212a12.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 20:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789530296; x=1790135096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnDdBBFYGdDerxU4AbUc/Vqzv/CMmRt4z5XHr/nlcM0=;
        b=YxFpBOtUzge3/LTLaGtqScI48+5vIUuA2krPSDR2fpGshOewAU9+bnh614unUbn4TG
         tRBIjbpw7e5cCe8Va1szN+S16LMVB3WDaLPSzaXbPDXud5JPGcQ8UdSRM5ENpqqEtTy9
         HuakcP9YJTawoyjn/s+QPtg3+sZ99yHuWfG+iaxEFThdf1bFXK7KB1jfQwiAHo6gPrZ8
         pATm2jttrK2gQAw5KvI1IsitvEDcvorsC/Z28pCFQXjm06l1DzuBUf8zKLNJw2pi/0fp
         x236Ilb1iFaTrX6NjlODjhVHdjk8tDlF0uTug6d94B1TC18IVMf784TUe8DnGM0Hw6Nv
         CA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789530296; x=1790135096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnDdBBFYGdDerxU4AbUc/Vqzv/CMmRt4z5XHr/nlcM0=;
        b=oHAoaokS62F7GirDSKA2YSL/zcPlhQB6eVncUySmRnTXEfsnHl6SxFRbG5Gnvmg9qn
         +1XhMuHsuLHpKCsIiUfspouffzqEsVTEpmtt+cxxizsIz/cXB1dJHL58BPB96ZyTECHR
         jBeufZqpm//Gpa4L+ojLI9I58oUStVwp/Hsaehcnv9nptRAqYtY6aK4ArCCJndW9APzL
         CyovIH/hOszGimJ1AMOtdqlJ8Jd7qJL42qnYMVUt3wMhJL1GTsDlCSv7FqDreTimn+6/
         B9NQXJXJ0E5dE/Iicmi4IsZ13Bkgt4Ir3sienUboEEarXg8AprwoyNtb9s3WmcoUbb8s
         h5eg==
X-Forwarded-Encrypted: i=1; AKwUvBzj2cgqnCkalfPyOqh2h72hWhLjR98gfjtEubLQxL8DAzVIpV0MFRJDnbYXgRyBc1Dqjzmz9UFdD0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ncXY52MVPW9GFzYGwi2kUwDRVFRATE39xd69+UsP3VyTgGXfiH
	/AetRryHEojytCTS9Gulquxt8XaMP4VqgVsFDz7lcEyca889kBQv/lQv
X-Gm-Gg: AYBFou28Tu/C8Wfxiq4MbuNuFAgNPiShF9vUs0cdyTW2EUcPL9y7pD2J0RQsEPFyvTU
	oSWZTIIavRMtvlX0d7jo5kjBPtb5sckPNWS6IkseVnqqLeNPA8hLQQyqnp+OOcJ0SsKtl+Y+uJt
	pAGU48fFGXGLXNC0ey/YW2ipNNnsCUlPxq+dVMjSu7SURqJ6EqRoC+39Cz+hI0d68cgaDKfZyTW
	CKWP1349I8ZRdKKvK9HNorzZDxu5Bdx7nAcHiIeYO8UWAUG/ZEDKb3IqVbwpjZhOjXacUegHR/W
	qpr5HSF1vYNcNZOQyJZGYMfQsxgYHHak/KiiK60f/TVqCw4kql3rRDRTWlgpjKEdcLAit1EBdtR
	4499jVnXM58S0XpUTO7CNqJ6FpGLKSgaC6grDF21aAu/WF8/wZDUk8flpfCpA1o1BbIp1q7ogEC
	5J43HxZR2P1vhuRPuoWFj0CxYQ9uNpebmhsXeSwe8AfPRIZfp4u9cvervIvlU1YYswb4i50ypLS
	yX+TcZF4/bo4PmIrYbGVw/gfovXiS4g6yBFdlIZ
X-Received: by 2002:a17:90b:3b91:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e1e380e12mr2394470a91.11.1789530295541;
        Tue, 15 Sep 2026 20:44:55 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbfdd49sm1915990a91.11.2026.09.15.20.44.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Sep 2026 20:44:54 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Lian Wang <lianux.mm@gmail.com>,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>,
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
	yunjeong.mun@sk.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: Re: [RFC PATCH v2 0/9] mm/damon: hardware-sampled access reports
Date: Wed, 16 Sep 2026 11:44:30 +0800
Message-ID: <20260916034439.28517-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916005810.101606-1-sj@kernel.org>
References: <20260915025514.2434-1-lianux.mm@gmail.com> <20260916005810.101606-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

Thank you for the questions.  I mixed the original field scenario and our
controlled reproducer in my previous mail.  I also jumped from the observation
problem to PMD mapping demotion before explaining why the deployment needs both
huge pages and finer-grained observation.  That made it sound as if our goal
was simply to stop using huge pages.

> The observation makes sense.  However, does the sparse access pattern
> realistic?  If so, what is the purpose or expected benefit of using huge page
> for workloads having such access pattern?

The original case is not a lab-created request to use huge pages for a sparse
microbenchmark.  It was reported by SXF from a KVM/QEMU deployment where the
VM has a large memory allocation backed by a shared tmpfs file, host THP is
enabled, and Oracle runs inside the guest.  They use host-side DAMON to measure
the VM's hot-memory proportion.  With the same business memory use, they
observed a much larger hot proportion when THP was enabled.

The guest tmpfs 4 KiB/2 MiB writer is their controlled diagnostic case for
isolating that observation; it is not a claim that the Oracle workload is
exactly a one-page-per-2-MiB loop.  We then reproduced and quantified the same
effect on a PC and on the x86 server.

For this deployment, keeping large pages is a real requirement at the host
virtualization layer.  QEMU owns a large resident guest-RAM mapping.  Host THP
allows that mapping to use PMDs and allows KVM to use large secondary mappings,
reducing host page-table memory, TLB and nested-page-walk pressure, and KVM
mapping/fault overhead.  These benefits are independent of whether every 4 KiB
page inside a particular 2 MiB range is hot at one observation time.

This host configuration should also not be confused with the guest database
page policy.  Oracle may separately use explicit HugePages for its SGA inside
the guest; the guest policy and the host THP backing of QEMU RAM are different
translation layers.  The requirement reported to us is to retain the host
large-page benefit while measuring the guest working-set proportion from the
host.  Disabling host THP merely to make DAMON's number smaller would change
the deployed VM configuration and remove the benefit the user is trying to
keep.

The monitoring requirement is different: DAMON is expected to estimate how
much of the guest memory is actually hot.  A host PMD is a translation unit for
guest RAM, not a semantic hotness unit for Oracle.  Guest allocation can place
small accessed pages across many guest-physical 2 MiB ranges, and one access
then makes each corresponding coarse mapping look accessed.

Our latest capture makes this mechanism concrete.  The sparse diagnostic
touched 24,576 guest 4 KiB pages spread over 24,575 guest-physical 2 MiB
buckets, while the dense control touched 12,582,912 pages.  They are 0.146%
and 75% of the monitored 64 GiB backend, respectively, but host DAMON reported
about 75% for both.  This is why the user needs huge-page mapping for VM
performance and, independently, finer-grained observation for a meaningful
hot-memory ratio.

The performance requirement and monitoring use case come from the deployment,
not from our lab model.  We will also report the measured Oracle/VM benefit and
the production access distribution when those data are ready.  The diagnostic
result establishes the observation mechanism, but it should not substitute for
those workload-level measurements.

> I'm not very sure if this is the right direction.  PMD mapping demotion sounds
> like you just don't want to use huge pages.  If so, you could disable huge
> pages.

I agree.  My reasoning in the previous mail was too jumpy: I went from a coarse
observation directly to a possible MM response, and that obscured the actual
goal.  PMD mapping demotion is not part of our current proposed solution.  The
current direction is to keep both the huge folio and PMD mapping unchanged and
use a genuinely fine-grained access primitive to improve the observation and
the stat-only decision.  We should first find out whether that is sufficient
before discussing any mapping change at all.

> technically speaking, it is not the report semantics.  Reporting allows any
> information to be reported.  Page faults like information could be coarse
> grained, same to the current page table accessed-bit based one.  Only finer
> grained access primitive reports, like those from perf events, would increase
> the accuracy for the sparse access pattern monitoring.

Agreed.  The report interface is the transport, not the source of accuracy.
Our recorded-address replay is intended only to test whether the DAMON
consumer and decision can use complete fine-grained address evidence.  The
eventual accuracy has to come from a fine-grained primitive such as an
appropriate perf event source, with its coverage and loss accounted for.  We
will use that terminology in the follow-up results.

With this context clarified, we will return to the immediate work: use the
existing IBS/perf-event proposal as the concrete strategy under test, and see
whether its fine-grained evidence can improve the observation and DAMOS
decision for this case.  We will use the results to test and review this series,
report both improvements and remaining gaps, and not assume in advance that it
is the final solution.

I hope this clarifies why keeping huge pages and requesting finer-grained
observation are not contradictory requirements in this case.

If I am still misunderstanding any part of your questions, or if any part of
this explanation remains unclear, please continue to correct me.  We will keep
sharing our findings and would like to make sure we are aligned before going
further.

Thanks,
Lian
