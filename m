Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158303;
	b=PqO46qonXTYjIz0d2b3b7WnV7k9B9VHfOZIu+5nXIY5krtkNK2HUsHugGGf/PkjSHdxA
	 oWsGQhqPSRDPm9E/Z3fDeAqSzQPTd6q4vsksNT1tD4jmnFSH6VPywQjBsR0DnS9AtJRqO
	 n2NLGV+1mD4f2ERltdaq/qPU+vt/L3JHzcKT/6uNAjvgHZTrchFcROO29O7vQJ16a+n11
	 PH9kJnJmBm7Cz2TCSRINMBdC5cfZIafuaNgGBIlslXuee8RvRCCj3gGd/q8qiNpVl/wSl
	 jd6xK+9FWMnNZJbz5SuTuduFysoiOQK2r4v4oi6DcHu6xBvKuAGzhQZ7smaQzNBrRJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pAM/k5pso5Rh97rJEUAxgzfJJtw2xRFXFv7FuWc2YG8=;
	b=O63y8Mc4O+/LGaX4AHKm0XjJ/h+I51W3upVnSGzNkN90S56FmRxpPncJXXcgGXrpOMrv
	 Sf6oqhWyVJki7tJv7rASF0/1svwpPDVRy4P5k4fZUzb0xt1cnEvr1k38RrTavUp8Ks/FP
	 fh+MfVYiTnwqvH1FcO2i4evzg8+b2xFmnOtDu6lKmWiUnIrx6D0a1w+XSneDVkk0Eh0Be
	 5wGk1w2CCeUCmBMobxGv4IFra+ciYqOP+xuQrMJ9uTdCn3rSS4VH0pmM5A8dKNn5YUfVO
	 l2mZouH6u5kxl4IsmUvBn9S7LDf8ii6rCqziKy/359gfMo8Wzii3qAPRKMZ81n60yuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKtjJ26A;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2791F606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2791F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKtjJ26A
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso309130f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158300; x=1793763100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAM/k5pso5Rh97rJEUAxgzfJJtw2xRFXFv7FuWc2YG8=;
        b=TKtjJ26AyrOIvKgM9gSHFzJVttQbAz7K1tgJp45DycwwDWK02uZU6yUuN5GwZynQ2B
         ae0frFGOWjd309EoPcVd5OgqfbszpyuiYp5YrQrQG70TRaTJmHZC2TK8Z/FbQ7nptU32
         EcuTWSVYgfBHwyhMfr6qwDHMO9yMpAGpb1USH8bRFoIFUhF8aFBuDidcxuuU7/D2JMJs
         DdlXYlVBr1mCxKadUP++/8uDXOaWn4yyxoWoC6coD6uBtOFgSUfCOIBlTZdnTJ/geT/7
         Uy4dBpgUnPpx7rU6540gzKpyiG+bcPgbcYfUqiL3thAuUeGv8n054uxHYrnTHF1BhVGU
         CbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158300; x=1793763100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAM/k5pso5Rh97rJEUAxgzfJJtw2xRFXFv7FuWc2YG8=;
        b=INQtdIi4KjUKROf6/ziYAtnjbdHoa4l0TFVyt89MVy/PEt0jzG23jvrhrsADppm3Ss
         sPoDOZ4a4s9QXvV1qEqRHjpUmKDjRFfD82EXemIdjpcNt98cA7geP3y0UdkcuEwMBxY4
         /U13os23fqiNT3zpktKsHDPT5i/fDu0RDLz5OIw2lBCwhZRHHJFXvsny4ijEm4Nf3mVQ
         Ey685Apa87eGHQCexP58oj8Sg4reKrMcAFgSVwH3Laj6WqVI/CpmsrKxuyVZUEG8E/aL
         bGlBrKtmDDueVrH8uDOHpwmd5yMbZr32f5WKZeRsov7VBCfkUiIRNqwpjRMm8mgECXnU
         VSDw==
X-Forwarded-Encrypted: i=1; AKwUvByvYnWIPQfsKJm2awVTtGuuKonhVjg/iVWzuR72F3h5eAQGQqLpCEXtvUHkcyrUuN0+KsgTGCuStlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY5dqSJS+9gDM+kQXFiP4OP1OzPCpgccwWfiPcidn+j3/4ARue
	7fgr7dNDBmS2DcV0Gfl4EFPbTAMEnl81c2nHWeYMufL1GB5TP4VIoxMx
X-Gm-Gg: AYBFou1eKMGzw3TVvCOz7tME6GD45Ig5vaMnI/r4a1cWYD3Cep7ZKFzwMM5lsrmuZSc
	43JDPSKLP70DFx23AVVRGicx5HqlryURP40eju14eGzIGmRBlGTtHloBEMd0qwTW9rB3aoU0Ovp
	DhFa+pLLrTxYYbU88xX4lIaPKW/z0LVbV3Sdaawzlt0WVN1xV/w2945x9ECKyTMpAeKTqwana9Z
	eQLROcw6da4mG5Up6Y7PVQ4LEc+2qaCsUXkKQWtLHLYkgAoZQqOw/W00QDlPhq/lbenRl1xN6cl
	aEqNcY8cHPGFixt4wVGysLG8wXVu99PI55YSZrPcSH3iBjRpJq4LQL90chVPdGstmlBVu62aK4b
	EiVIRC8jmkWF+2K+o2CBHFE59UoG7CLMufCmJdiMVtHa4tXKlJkvieNyWBnP4EbS+k59xxgV3Kv
	Kd0oDYaqfoOYGkDOWjg2Kwa/QWL7vCpb4g0Gn/kLF5Nq2l3HLcSid8vV2auxXckJYnya7Xu0hX2
	ghpEK7BsEmU3wtxl2K+myomUE6ciVziZBnyz0/h/MOsIi8G8QLjW4epsqlYkycr0oNljAMq44MI
	One1dVnd8P8XSu0qi2qdN5ZPxCngN3RuDJDhySucF/gM07IP0F8WrClH02sdGXmkaVeVuEj3f6M
	ygW6nADNYKYQF3SW6R7qF5apodPPWhsmfl3G1+VCUg5VVkuNhvQA0ddiN13B4dDFMYn2dFFkTnR
	MKR5p5Ps3LmXRXJ5hB79TCEUArEszOBwdiG74SGMAvEBAKjR+v6NmGWQ==
X-Received: by 2002:adf:e011:0:10b0:487:930:8acc with SMTP id ffacd0b85a97d-48e5d5c275bmr1961357f8f.16.1793158300262;
        Tue, 27 Oct 2026 20:31:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:39 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 00/13] entry: Classify very early hardirq entry and return-tail callbacks
Date: Wed, 28 Oct 2026 04:31:14 +0100
Message-Id: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tracing still needs a transition recursion allowance because a callback can
run after architectural hardirq entry but before generic entry updates
preempt_count(). Steven asked whether HARDIRQ_OFFSET could be installed
early enough for those callbacks to observe hardirq context. This RFC
implements that contract for arm64.

arm64 must first distinguish ordinary interrupts from pseudo-NMIs. For an
ordinary interrupt, stage the raw preempt-count addition and establish
lockdep state immediately after that decision and before instrumentable
entry work. Keep time, tick, RCU and IRQ accounting at the existing generic
boundary. With DEBUG_PREEMPT and without separate reschedule bits, an
already-negative count preserves the legacy DEBUG_LOCKS_WARN_ON() oops short
circuit, attempts deferred reporting at the instrumentable finish, and skips
post-add bookkeeping and the matching subtraction when rejected.

The exit side has a second gap. Keep any applied hardirq count and lockdep
classification through traceable generic exit work, then remove them before
a possible schedule. Carry ordinary-hardirq provenance through that schedule
in a compact three-state byte, keeping irqentry_state_t two bytes wide, and
restore a classification-only tail around architecture tracing, deferred
hrtimer work, IRQ-on preparation and context-tracking preparation. The tail
does not repeat RCU, tick or IRQ accounting.

This is a design RFC, not a merge-ready proposal. The questions are:

  - Should generic entry expose separate raw-update and bookkeeping phases?
  - Are preempt-count and lockdep state sufficient for the return tail?
  - Is arm64 a suitable first user of this contract?

The series is based on d135ab453a74 ("Merge tag 'backlight-next-7.4' of
git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight"). Patches 1
and 2 include two arm64 noinstr inlining prerequisites so the series
applies directly to mainline:

  - "arm64: Always inline raw preempt count updates"
    provenance: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
  - "arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'"
    provenance: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org

The first is the relevant hunk extracted from Hongyan Xia's larger posted
RFC. The second is a current-mainline rebase of Will Deacon's posted patch.
They preserve the authorship and links of the original submissions.

Repository: https://github.com/kmehltretter82/linux

  prerequisites: steve-early-hardirq-arm64-prereqs-v2-20261027
                 8bdce63fa17d
  generic core:  steve-early-hardirq-core-v2-folded-20261027
                 8651af55ecbc
  arm64 RFC:     steve-early-hardirq-arm64-rfc-v2-folded-20261027
                 56016d197e1b

The transition recursion slots remain unchanged. A separate
recursion-lifetime series keeps the task recursion bit inside one
preemption-disabled interval. A development-only patch removed the slots
for a matched experiment. Neither that removal nor the lifetime series is
part of this RFC.

All three kernels in the experiment contained this early-hardirq series.
On a native 16-vCPU Google Axion system, matched arm64 debug kernels
completed 100 deterministic ftrace callback and IPI overlaps per cell:

                                done  litmus  mixed  collisions
  Slots kept, lifetime fix   100/100       0      0           0
  Slots removed, no fix      100/100      33     60          13
  Slots removed, lifetime    100/100       0      0           0

The litmus and mixed columns count ftrace recursion records. The collisions
column counts transition-sensitive scheduler and return-tail records.
Complete dmesg captures were clean in all three cells.

The second cell is a counterexample to removing the slots without the
lifetime fix in the tested path. The third supports the combined design on
this machine. It does not establish every architecture-specific early-entry
interval, so this RFC retains the slots and keeps the lifetime work
separate.

Before this rebase, the patch-identical tree was validated across a
nine-cell cross-architecture W=1 full-link matrix: RISC-V 64, i386,
powerpc64le, arm64, x86-64 and ARM32 with GCC 13.3 and Clang/LLD 18.1.3. It
also passed 600-second arm64 SMP8 and RISC-V SMP14 stress gates, a RISC-V
AIA/IMSIC SMP1/SMP2/SMP8 gate under QEMU 11.1.50, and a focused four-row
DEBUG_PREEMPT staged-add oops oracle with 403 of 403 locking selftests.

An ARM64 PREEMPT_RT SMP4 build passed targeted return-tail tasklet and
forced-thread timer closure tests, three SMP2 priority-masked pseudo-NMI
return runs, and an SMP1 NO_HZ_IDLE and RCU_EQS_DEBUG return gate with 386
Startirq-to-Endirq intervals and 1,229 IRQ-disable/enable pairs. All
patches remain unchanged according to git range-diff after the rebase.

Changes since v1:

  - rebase onto d135ab453a74 and include the two arm64 noinstr inlining
    prerequisites as patches 1 and 2 so the series applies directly to
    mainline
  - keep the recursion-lifetime change in a separate series
  - carry a scoped hardirq-entry cookie across staged count updates so
    !HAS_SEPARATE_PREEMPT_RESCHED_BITS && DEBUG_PREEMPT configurations
    preserve the legacy DEBUG_LOCKS_WARN_ON() oops decision and skip
    post-add work and teardown when rejected
  - encode ordinary-hardirq provenance and staged-count application in a
    three-state byte so irqentry_state_t remains two bytes wide
  - fully initialize the arm64 EL1 debug entry state before provenance is
    added
  - retain irqentry_exit_pcpu_adjust() ordering across the return tail
  - accept and test nonzero nested lockdep hardirq depth in the tail
  - add a matched native test of the separate recursion-lifetime work and
  - tighten the contract and documentation wording

v1: https://lore.kernel.org/all/20261022051654.79224-1-kmehltretter@gmail.com/

Assisted-by: LLM

Hongyan Xia (1):
  arm64: Always inline raw preempt count updates

Karl Mehltretter (11):
  sched: Split preempt-count bookkeeping from raw updates
  lockdep: Use raw access for pinned hardirq state
  entry: Add the pre-counted ordinary-hardirq entry/exit contract
  entry: Skip inactive IRQ-return reschedule calls
  context_tracking: Split IRQ-exit preparation from the EQS transition
  lockdep: Prepare IRQ-on state from a hardirq return tail
  entry: Carry ordinary-hardirq provenance through kernel return
  entry: Classify ordinary hardirq return-tail work as hardirq context
  arm64: Use the pre-counted hardirq lifecycle
  Documentation: entry: Describe the pre-counted hardirq lifecycle
  locking/selftest: Exercise hardirq return-tail preparation

Will Deacon (1):
  arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'

 Documentation/core-api/entry.rst     |  89 +++++++++++--
 arch/arm64/include/asm/percpu.h      |   2 +-
 arch/arm64/include/asm/preempt.h     |   6 +-
 arch/arm64/kernel/entry-common.c     |  34 +++--
 include/linux/context_tracking_irq.h |  32 ++++-
 include/linux/hardirq.h              |  33 +++++
 include/linux/interrupt.h            |   2 +-
 include/linux/irq-entry-common.h     | 130 +++++++++++++++++--
 include/linux/irqentry_hardirq.h     |  81 ++++++++++++
 include/linux/irqflags.h             |  14 ++-
 kernel/context_tracking.c            |  78 +++++++++---
 kernel/entry/common.c                |  45 ++++++-
 kernel/locking/lockdep.c             |  49 +++++---
 kernel/sched/core.c                  | 101 +++++++++++++--
 kernel/softirq.c                     | 181 +++++++++++++++++++++++----
 lib/locking-selftest.c               |  53 ++++++++
 16 files changed, 828 insertions(+), 102 deletions(-)
 create mode 100644 include/linux/irqentry_hardirq.h


base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.39.5 (Apple Git-154)
