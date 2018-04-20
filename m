Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2E207DD31
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 17:04:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753516AbeDTREQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 13:04:16 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:41485 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752337AbeDTREN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Apr 2018 13:04:13 -0400
Received: by mail-wr0-f193.google.com with SMTP id v24-v6so24712217wra.8
        for <linux-doc@vger.kernel.org>; Fri, 20 Apr 2018 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DzowARiO//9Ou3osh1Vl0e0zjhzdZWCKpEK8ivL1/7Y=;
        b=OrpM2qrwoPrr5SZ0shCBZ3R2w7ks3aob7maJZvKJ2U6rZZenxgT1AdaC7asRbUf1AG
         sVbNa+XVrcWSNv2J5gNT6syreArSHG1VFsZ53i6aoRnXIsF9AAI9Sx92IpAH0aZIgpAZ
         aqKORlM1GbJo+3mw5v2w/YKyXJi/xOAK3nUR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DzowARiO//9Ou3osh1Vl0e0zjhzdZWCKpEK8ivL1/7Y=;
        b=MX7HaLTXr0GLTpBjXKI5XiDAXo4wBQDE5d/vsD0qiwF3b3UPzzwkOodfbo5Zjt0CP3
         9A0LSTYTqDuk7kg4VG8STcuyUhtsJUBuGHNBUvodFWk6BZlM6YzNHTBJkyGksILbUnAD
         cvKKMGItHTPccvnwqXzl1qeymX6EJR87bjpoyGfGN1kjHMKIw70fCIAvLFUNdese3V4d
         A9PxLCPR5nvqYrHnMoIviTl0A7X6vE3kf82L5m9ZpHLkAwuVaRtum2883dMcG9nlQ1yp
         ZHXT1mKYO81uGDc3WnIsdbyPWJPVSIUw7xJvwLlswytAXp3eJn8fS94prw3pZ9Rqh7I6
         Jntw==
X-Gm-Message-State: ALQs6tBC7+LOE1ct45n1X8QBDK1yXLXs6nAe+WSzzvhc0AgsEa+a8rGb
        RVPwM91q9Uy2iw63LPs9GRZli69T
X-Google-Smtp-Source: AIpwx4+IER4BcXtIUWb7nxSFQKVUo9dQM7IMlOxR8wXRReq6MWWpXE1qzEjgVg1laGSKVGQ7lmGeDA==
X-Received: by 2002:adf:e843:: with SMTP id d3-v6mr1445116wrn.146.1524243852288;
        Fri, 20 Apr 2018 10:04:12 -0700 (PDT)
Received: from andrea ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id x70sm2606363wma.9.2018.04.20.10.04.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Apr 2018 10:04:11 -0700 (PDT)
Date:   Fri, 20 Apr 2018 19:04:05 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com
Subject: Re: [RFC PATCH v2 0/6] Documentation/features: Provide and apply
 'features-refresh.sh'
Message-ID: <20180420170405.GA14509@andrea>
References: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ingo, Jon,

On Sun, Apr 08, 2018 at 06:30:21PM +0200, Andrea Parri wrote:
> Hi,
> 
> This series provides the script 'features-refresh.sh', which operates on
> the arch support status files, and it applies this script to refresh the
> status files in place; previous discussions about this series are at [1].
> 
> The series is organized as follows.
> 
>   - Patch 1/6 adds the script to 'Documentation/features/scripts/'.
> 
>   - Patch 2/6 presents the results of running the script; this run
>     also printed the messages
> 
>        WARNING: 'HAVE_BPF_JIT' is not a valid Kconfig
>        WARNING: '__HAVE_ARCH_STRNCASECMP' is not a valid Kconfig
>        WARNING: 'Optimized asm/rwsem.h' is not a valid Kconfig
>        WARNING: '__HAVE_ARCH_PTE_SPECIAL' is not a valid Kconfig
> 
>     to standard output.
> 
>   - Patches 3-6/6 fix each of these warnings.
> 
> (Applies on today's mainline.)
> 
> Cheers,
>   Andrea
> 
> [1] https://marc.info/?l=linux-kernel&m=152223974927255&w=2
>     https://marc.info/?l=linux-kernel&m=152277458614862&w=2
> 
> Changes in v2:
>   - support negation operators in Kconfig (suggested by Ingo Molnar)
>   - reorder patches 2/6 and 3/6 (suggested by Ingo Molnar)
>   - add patches 4-6/6 (suggested by Ingo Molnar)
> 
> Andrea Parri (6):
>   Documentation/features: Add script that refreshes the arch support
>     status files in place
>   Documentation/features: Refresh the arch support status files in place
>   Documentation/features/core: Add arch support status files for
>     'cBPF-JIT' and 'eBPF-JIT'
>   Documentation/features/locking: Use '!RWSEM_GENERIC_SPINLOCK' as
>     Kconfig for 'rwsem-optimized'
>   Documentation/features/lib: Remove arch support status file for
>     'strncasecmp'
>   Documentation/features/vm: Remove arch support status file for
>     'pte_special'

I understand that you didn't get the chance to look into this yet ;D
please let me know if you'd like me to rebase and re-send the series.

Thanks,
  Andrea


> 
>  .../features/core/BPF-JIT/arch-support.txt         | 31 -------
>  .../features/core/cBPF-JIT/arch-support.txt        | 33 ++++++++
>  .../features/core/eBPF-JIT/arch-support.txt        | 33 ++++++++
>  .../core/generic-idle-thread/arch-support.txt      |  4 +-
>  .../features/core/jump-labels/arch-support.txt     |  2 +
>  .../features/core/tracehook/arch-support.txt       |  2 +
>  .../features/debug/KASAN/arch-support.txt          |  4 +-
>  .../debug/gcov-profile-all/arch-support.txt        |  2 +
>  Documentation/features/debug/kgdb/arch-support.txt |  4 +-
>  .../debug/kprobes-on-ftrace/arch-support.txt       |  2 +
>  .../features/debug/kprobes/arch-support.txt        |  4 +-
>  .../features/debug/kretprobes/arch-support.txt     |  4 +-
>  .../features/debug/optprobes/arch-support.txt      |  4 +-
>  .../features/debug/stackprotector/arch-support.txt |  2 +
>  .../features/debug/uprobes/arch-support.txt        |  6 +-
>  .../debug/user-ret-profiler/arch-support.txt       |  2 +
>  .../features/io/dma-api-debug/arch-support.txt     |  2 +
>  .../features/io/dma-contiguous/arch-support.txt    |  4 +-
>  .../features/io/sg-chain/arch-support.txt          |  2 +
>  .../features/lib/strncasecmp/arch-support.txt      | 31 -------
>  .../locking/cmpxchg-local/arch-support.txt         |  4 +-
>  .../features/locking/lockdep/arch-support.txt      |  4 +-
>  .../locking/queued-rwlocks/arch-support.txt        | 10 ++-
>  .../locking/queued-spinlocks/arch-support.txt      |  8 +-
>  .../locking/rwsem-optimized/arch-support.txt       | 10 ++-
>  .../features/perf/kprobes-event/arch-support.txt   |  6 +-
>  .../features/perf/perf-regs/arch-support.txt       |  4 +-
>  .../features/perf/perf-stackdump/arch-support.txt  |  4 +-
>  .../sched/membarrier-sync-core/arch-support.txt    |  2 +
>  .../features/sched/numa-balancing/arch-support.txt |  6 +-
>  Documentation/features/scripts/features-refresh.sh | 98 ++++++++++++++++++++++
>  .../seccomp/seccomp-filter/arch-support.txt        |  6 +-
>  .../time/arch-tick-broadcast/arch-support.txt      |  4 +-
>  .../features/time/clockevents/arch-support.txt     |  4 +-
>  .../time/context-tracking/arch-support.txt         |  2 +
>  .../features/time/irq-time-acct/arch-support.txt   |  4 +-
>  .../time/modern-timekeeping/arch-support.txt       |  2 +
>  .../features/time/virt-cpuacct/arch-support.txt    |  2 +
>  .../features/vm/ELF-ASLR/arch-support.txt          |  4 +-
>  .../features/vm/PG_uncached/arch-support.txt       |  2 +
>  Documentation/features/vm/THP/arch-support.txt     |  2 +
>  Documentation/features/vm/TLB/arch-support.txt     |  2 +
>  .../features/vm/huge-vmap/arch-support.txt         |  2 +
>  .../features/vm/ioremap_prot/arch-support.txt      |  2 +
>  .../features/vm/numa-memblock/arch-support.txt     |  4 +-
>  .../features/vm/pte_special/arch-support.txt       | 31 -------
>  46 files changed, 279 insertions(+), 128 deletions(-)
>  delete mode 100644 Documentation/features/core/BPF-JIT/arch-support.txt
>  create mode 100644 Documentation/features/core/cBPF-JIT/arch-support.txt
>  create mode 100644 Documentation/features/core/eBPF-JIT/arch-support.txt
>  delete mode 100644 Documentation/features/lib/strncasecmp/arch-support.txt
>  create mode 100755 Documentation/features/scripts/features-refresh.sh
>  delete mode 100644 Documentation/features/vm/pte_special/arch-support.txt
> 
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
