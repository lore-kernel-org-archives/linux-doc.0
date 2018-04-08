Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E753E7DD32
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 16:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752502AbeDHQbI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 12:31:08 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:50643 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752498AbeDHQbH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 12:31:07 -0400
Received: by mail-wm0-f65.google.com with SMTP id t67so13121347wmt.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Apr 2018 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KKuDdeQktTH0iYOCWiVx269tq2dPxC6ItQvkO162mvE=;
        b=rX3I8DiVSBcdJ3OomGtqMiKhFzRLVTj1HbGh3DmFBPq9C1CXosXCCmFjZfAXRC6fSP
         1bupnwDFADLtP6JZQWXVjj4cSinTAt5y7box249+159hykq7SXrDq5hHMe7ssKbAmqKQ
         spVXChOwdyP46Tw1LKl/zShwuin+sKFS6+wSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KKuDdeQktTH0iYOCWiVx269tq2dPxC6ItQvkO162mvE=;
        b=LZjwHoRfVXr81/AthtYoENHVO06WX2iWVzRJjhOfciXTkjjjRX06RIfBrxyb2IXykQ
         XSLf58F3h0BBdNXEAC1/yiYu6y/sJE8Ln/SkeQnxoSXENZ2WPEzte4frYnmzFqD8vunE
         sst1K0hbl9GQxmpFFNW+vEVtu7J3cki+Ye1K7D0iu9zoKdYeN927xusR6N3+9KbywPZ+
         84RQdWQ7ZTY4UCe1mKNp0yelFsHGDASYQnE4CoVmB48t79o8CFpglEMsOFaxfEjxxW1k
         0syk6zo8piLY/2ITNYqdVc4NTgKGOYkf06GDWA4E8Mn/cpkCfKCV73jzEbBn3OciemHr
         IKpw==
X-Gm-Message-State: AElRT7FeuKAyapkcTHDYm+GUtOoJXo6vtnho7QaQlwIWGFc3DUo4odVd
        SBkJRlQMMKxZgO3F6XMUXwApiQ==
X-Google-Smtp-Source: AIpwx49wXBx9VeNg3TsHs2eFXfUvXvTNQPLSNSuAWNpLIPoLHt3P8imRLIk9awxRC062HQIy28zPvA==
X-Received: by 10.28.236.76 with SMTP id k73mr16210886wmh.122.1523205065566;
        Sun, 08 Apr 2018 09:31:05 -0700 (PDT)
Received: from localhost.localdomain ([95.235.67.87])
        by smtp.gmail.com with ESMTPSA id 10sm5335894wrz.58.2018.04.08.09.31.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Apr 2018 09:31:04 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v2 0/6] Documentation/features: Provide and apply 'features-refresh.sh'
Date:   Sun,  8 Apr 2018 18:30:21 +0200
Message-Id: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This series provides the script 'features-refresh.sh', which operates on
the arch support status files, and it applies this script to refresh the
status files in place; previous discussions about this series are at [1].

The series is organized as follows.

  - Patch 1/6 adds the script to 'Documentation/features/scripts/'.

  - Patch 2/6 presents the results of running the script; this run
    also printed the messages

       WARNING: 'HAVE_BPF_JIT' is not a valid Kconfig
       WARNING: '__HAVE_ARCH_STRNCASECMP' is not a valid Kconfig
       WARNING: 'Optimized asm/rwsem.h' is not a valid Kconfig
       WARNING: '__HAVE_ARCH_PTE_SPECIAL' is not a valid Kconfig

    to standard output.

  - Patches 3-6/6 fix each of these warnings.

(Applies on today's mainline.)

Cheers,
  Andrea

[1] https://marc.info/?l=linux-kernel&m=152223974927255&w=2
    https://marc.info/?l=linux-kernel&m=152277458614862&w=2

Changes in v2:
  - support negation operators in Kconfig (suggested by Ingo Molnar)
  - reorder patches 2/6 and 3/6 (suggested by Ingo Molnar)
  - add patches 4-6/6 (suggested by Ingo Molnar)

Andrea Parri (6):
  Documentation/features: Add script that refreshes the arch support
    status files in place
  Documentation/features: Refresh the arch support status files in place
  Documentation/features/core: Add arch support status files for
    'cBPF-JIT' and 'eBPF-JIT'
  Documentation/features/locking: Use '!RWSEM_GENERIC_SPINLOCK' as
    Kconfig for 'rwsem-optimized'
  Documentation/features/lib: Remove arch support status file for
    'strncasecmp'
  Documentation/features/vm: Remove arch support status file for
    'pte_special'

 .../features/core/BPF-JIT/arch-support.txt         | 31 -------
 .../features/core/cBPF-JIT/arch-support.txt        | 33 ++++++++
 .../features/core/eBPF-JIT/arch-support.txt        | 33 ++++++++
 .../core/generic-idle-thread/arch-support.txt      |  4 +-
 .../features/core/jump-labels/arch-support.txt     |  2 +
 .../features/core/tracehook/arch-support.txt       |  2 +
 .../features/debug/KASAN/arch-support.txt          |  4 +-
 .../debug/gcov-profile-all/arch-support.txt        |  2 +
 Documentation/features/debug/kgdb/arch-support.txt |  4 +-
 .../debug/kprobes-on-ftrace/arch-support.txt       |  2 +
 .../features/debug/kprobes/arch-support.txt        |  4 +-
 .../features/debug/kretprobes/arch-support.txt     |  4 +-
 .../features/debug/optprobes/arch-support.txt      |  4 +-
 .../features/debug/stackprotector/arch-support.txt |  2 +
 .../features/debug/uprobes/arch-support.txt        |  6 +-
 .../debug/user-ret-profiler/arch-support.txt       |  2 +
 .../features/io/dma-api-debug/arch-support.txt     |  2 +
 .../features/io/dma-contiguous/arch-support.txt    |  4 +-
 .../features/io/sg-chain/arch-support.txt          |  2 +
 .../features/lib/strncasecmp/arch-support.txt      | 31 -------
 .../locking/cmpxchg-local/arch-support.txt         |  4 +-
 .../features/locking/lockdep/arch-support.txt      |  4 +-
 .../locking/queued-rwlocks/arch-support.txt        | 10 ++-
 .../locking/queued-spinlocks/arch-support.txt      |  8 +-
 .../locking/rwsem-optimized/arch-support.txt       | 10 ++-
 .../features/perf/kprobes-event/arch-support.txt   |  6 +-
 .../features/perf/perf-regs/arch-support.txt       |  4 +-
 .../features/perf/perf-stackdump/arch-support.txt  |  4 +-
 .../sched/membarrier-sync-core/arch-support.txt    |  2 +
 .../features/sched/numa-balancing/arch-support.txt |  6 +-
 Documentation/features/scripts/features-refresh.sh | 98 ++++++++++++++++++++++
 .../seccomp/seccomp-filter/arch-support.txt        |  6 +-
 .../time/arch-tick-broadcast/arch-support.txt      |  4 +-
 .../features/time/clockevents/arch-support.txt     |  4 +-
 .../time/context-tracking/arch-support.txt         |  2 +
 .../features/time/irq-time-acct/arch-support.txt   |  4 +-
 .../time/modern-timekeeping/arch-support.txt       |  2 +
 .../features/time/virt-cpuacct/arch-support.txt    |  2 +
 .../features/vm/ELF-ASLR/arch-support.txt          |  4 +-
 .../features/vm/PG_uncached/arch-support.txt       |  2 +
 Documentation/features/vm/THP/arch-support.txt     |  2 +
 Documentation/features/vm/TLB/arch-support.txt     |  2 +
 .../features/vm/huge-vmap/arch-support.txt         |  2 +
 .../features/vm/ioremap_prot/arch-support.txt      |  2 +
 .../features/vm/numa-memblock/arch-support.txt     |  4 +-
 .../features/vm/pte_special/arch-support.txt       | 31 -------
 46 files changed, 279 insertions(+), 128 deletions(-)
 delete mode 100644 Documentation/features/core/BPF-JIT/arch-support.txt
 create mode 100644 Documentation/features/core/cBPF-JIT/arch-support.txt
 create mode 100644 Documentation/features/core/eBPF-JIT/arch-support.txt
 delete mode 100644 Documentation/features/lib/strncasecmp/arch-support.txt
 create mode 100755 Documentation/features/scripts/features-refresh.sh
 delete mode 100644 Documentation/features/vm/pte_special/arch-support.txt

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
