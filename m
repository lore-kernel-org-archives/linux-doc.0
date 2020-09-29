Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F047AC47423
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79F7121D7D
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YQlZfknS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729945AbgI2Nip (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729930AbgI2Nio (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 09:38:44 -0400
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC237C061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:38:43 -0700 (PDT)
Received: by mail-wr1-x449.google.com with SMTP id v5so1751233wrs.17
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=z1cXfrxOGzx7xyJIGn8IR6C4kJWaluaZ0MOMBbLzink=;
        b=YQlZfknSSvNvRczIa3w2KnrV406GAOWv4riuiKZDNf0muEq5IprfLHxEuf4QWG2X6v
         KVEafDVUZDZQ/lnlrbDUNKx/knoe0JXG3MFvQm3KqRbrBn5QRqhqvGhI0yC0xwPgNC+k
         Y4P7HPEPuFHow+cjpjzAfQn3BrGuvqTxF3SmyzIX4KIrgBxhqNT5NVw3qJ7UIdn9etXc
         UzivMLi+g3ro2cTRKuq3xjEFUtrcCDeVEgq/8uVv6TYifMgCu9AdmCnbkKnIgM6dpAYT
         cfPBKuaPXzQ+F6v8J2dAtTQTTOV2n/MRnS8WB1gJcHzeNwAwNLmiUohJWLw6JRw8ULih
         0Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=z1cXfrxOGzx7xyJIGn8IR6C4kJWaluaZ0MOMBbLzink=;
        b=nitTgpGDhcj5bC5lhpxvC4cDHx+0LSS2oEcVXeDSmE+JI4oj6mpROW0Kfy/cVx+LkV
         tF76tZsUdZ7k4KR5b2aPkSZiqhXAlzYAH0REWDxTKChflm8rTr+U3KYfuK8bnXJ0ZE4b
         Wqa7pyLttWYYUsxWuyJ/z5XMBRiZE9NS4Xy5qMihtIep6/OFl3LgvSlu/5gpM2ywdvp6
         QRzoUIEX0M+cmPdkpcHAs3AtXBc4o0TWJDE4l5Vfc5hnSaakpayshxIBOlau/XfD/T4a
         9H1wLUF0GN6A12yq/1JJ2HrYFiZbRaC5COnMbXTrIyi0PQwasgki8FVvPCrjf3Btl5U5
         S3GA==
X-Gm-Message-State: AOAM533S8VMbtgxxOs1nj72dq6zJZ27O/WNlPdZFSOU7NkFHnYyUyGE5
        CcRwyfUwsQ4Pd+iL19+9EP8Jz2n3pg==
X-Google-Smtp-Source: ABdhPJzLfb+1L+DLOD5HANT71QD+TvopcJoj2qHEWsAOEUajKuEbN72wT6s+YP/on4qsVc9AwMoyktwOfw==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a7b:cd08:: with SMTP id f8mr4611202wmj.124.1601386721987;
 Tue, 29 Sep 2020 06:38:41 -0700 (PDT)
Date:   Tue, 29 Sep 2020 15:38:03 +0200
Message-Id: <20200929133814.2834621-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 00/11] KFENCE: A low-overhead sampling-based memory safety
 error detector
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, hdanton@sina.com, mingo@redhat.com,
        jannh@google.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, keescook@chromium.org,
        mark.rutland@arm.com, penberg@kernel.org, peterz@infradead.org,
        sjpark@amazon.com, tglx@linutronix.de, vbabka@suse.cz,
        will@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds the Kernel Electric-Fence (KFENCE) infrastructure. KFENCE is a
low-overhead sampling-based memory safety error detector of heap
use-after-free, invalid-free, and out-of-bounds access errors.  This
series enables KFENCE for the x86 and arm64 architectures, and adds
KFENCE hooks to the SLAB and SLUB allocators.

KFENCE is designed to be enabled in production kernels, and has near
zero performance overhead. Compared to KASAN, KFENCE trades performance
for precision. The main motivation behind KFENCE's design, is that with
enough total uptime KFENCE will detect bugs in code paths not typically
exercised by non-production test workloads. One way to quickly achieve a
large enough total uptime is when the tool is deployed across a large
fleet of machines.

KFENCE objects each reside on a dedicated page, at either the left or
right page boundaries. The pages to the left and right of the object
page are "guard pages", whose attributes are changed to a protected
state, and cause page faults on any attempted access to them. Such page
faults are then intercepted by KFENCE, which handles the fault
gracefully by reporting a memory access error.

Guarded allocations are set up based on a sample interval (can be set
via kfence.sample_interval). After expiration of the sample interval,
the next allocation through the main allocator (SLAB or SLUB) returns a
guarded allocation from the KFENCE object pool. At this point, the timer
is reset, and the next allocation is set up after the expiration of the
interval.

To enable/disable a KFENCE allocation through the main allocator's
fast-path without overhead, KFENCE relies on static branches via the
static keys infrastructure. The static branch is toggled to redirect the
allocation to KFENCE.

The KFENCE memory pool is of fixed size, and if the pool is exhausted no
further KFENCE allocations occur. The default config is conservative
with only 255 objects, resulting in a pool size of 2 MiB (with 4 KiB
pages).

We have verified by running synthetic benchmarks (sysbench I/O,
hackbench) that a kernel with KFENCE is performance-neutral compared to
a non-KFENCE baseline kernel.

KFENCE is inspired by GWP-ASan [1], a userspace tool with similar
properties. The name "KFENCE" is a homage to the Electric Fence Malloc
Debugger [2].

For more details, see Documentation/dev-tools/kfence.rst added in the
series -- also viewable here:

	https://raw.githubusercontent.com/google/kasan/kfence/Documentation/dev-tools/kfence.rst

[1] http://llvm.org/docs/GwpAsan.html
[2] https://linux.die.net/man/3/efence

v4:
* MAINTAINERS: Split out from first patch.
* Make static memory pool's attrs entirely arch-dependent.
* Fix report generation if __slab_free tail-called.
* Clarify RCU test comment [reported by Paul E. McKenney].

v3: https://lkml.kernel.org/r/20200921132611.1700350-1-elver@google.com
* Rewrite SLAB/SLUB patch descriptions to clarify need for 'orig_size'.
* Various smaller fixes (see details in patches).

v2: https://lkml.kernel.org/r/20200915132046.3332537-1-elver@google.com
* Various comment/documentation changes (see details in patches).
* Various smaller fixes (see details in patches).
* Change all reports to reference the kfence object, "kfence-#nn".
* Skip allocation/free internals stack trace.
* Rework KMEMLEAK compatibility patch.

RFC/v1: https://lkml.kernel.org/r/20200907134055.2878499-1-elver@google.com

Alexander Potapenko (6):
  mm: add Kernel Electric-Fence infrastructure
  x86, kfence: enable KFENCE for x86
  mm, kfence: insert KFENCE hooks for SLAB
  mm, kfence: insert KFENCE hooks for SLUB
  kfence, kasan: make KFENCE compatible with KASAN
  kfence, kmemleak: make KFENCE compatible with KMEMLEAK

Marco Elver (5):
  arm64, kfence: enable KFENCE for ARM64
  kfence, lockdep: make KFENCE compatible with lockdep
  kfence, Documentation: add KFENCE documentation
  kfence: add test suite
  MAINTAINERS: Add entry for KFENCE

 Documentation/dev-tools/index.rst  |   1 +
 Documentation/dev-tools/kfence.rst | 291 +++++++++++
 MAINTAINERS                        |  11 +
 arch/arm64/Kconfig                 |   1 +
 arch/arm64/include/asm/kfence.h    |  39 ++
 arch/arm64/mm/fault.c              |   4 +
 arch/x86/Kconfig                   |   2 +
 arch/x86/include/asm/kfence.h      |  60 +++
 arch/x86/mm/fault.c                |   4 +
 include/linux/kfence.h             | 174 +++++++
 init/main.c                        |   2 +
 kernel/locking/lockdep.c           |   8 +
 lib/Kconfig.debug                  |   1 +
 lib/Kconfig.kfence                 |  78 +++
 mm/Makefile                        |   1 +
 mm/kasan/common.c                  |   7 +
 mm/kfence/Makefile                 |   6 +
 mm/kfence/core.c                   | 733 +++++++++++++++++++++++++++
 mm/kfence/kfence.h                 | 102 ++++
 mm/kfence/kfence_test.c            | 783 +++++++++++++++++++++++++++++
 mm/kfence/report.c                 | 225 +++++++++
 mm/kmemleak.c                      |   6 +
 mm/slab.c                          |  46 +-
 mm/slab_common.c                   |   6 +-
 mm/slub.c                          |  72 ++-
 25 files changed, 2631 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/dev-tools/kfence.rst
 create mode 100644 arch/arm64/include/asm/kfence.h
 create mode 100644 arch/x86/include/asm/kfence.h
 create mode 100644 include/linux/kfence.h
 create mode 100644 lib/Kconfig.kfence
 create mode 100644 mm/kfence/Makefile
 create mode 100644 mm/kfence/core.c
 create mode 100644 mm/kfence/kfence.h
 create mode 100644 mm/kfence/kfence_test.c
 create mode 100644 mm/kfence/report.c

-- 
2.28.0.709.gb0816b6eb0-goog

