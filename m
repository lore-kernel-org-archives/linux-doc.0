Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA7DECAA24
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 16:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243261AbiHYQnW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 12:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243085AbiHYQnD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 12:43:03 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F0FBB925
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:42:35 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id w88-20020a17090a6be100b001fbb0f0b013so2368141pjj.5
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=OtUK9OLMWdL6AUc3ZfpyXK1kgh1agdbXcj5hc+979G8=;
        b=xHJiXgBT7PEkZdMevyBPSnrJlZZCDwl6ozciskiNf9lpSMP/BhlEA/uOVlntwEOMoP
         8AsYSYGjz+lts4hRawuyJ6l6j1hjlPAVOBqnpGUKXbtEw9ZdqEkFmWYzCoRhk5hEVMqd
         LookuDXfD+8p7qtuCBQ2Us57jbxcmrBlqm9sBNsMnW+PY5fnbQg7FmU8Pv54Ao1pZ+jO
         Qlv7oV81DA9EYTvqlGNwLjuuhXOAJPyHxTpLFABwb7wAi1ZGz+PtCwoQyKk7qJ6TBCwf
         YrTIDzukpS+oc/W+qzGWsltS5E3XkCXyR6vIOWTqg9xpCYf+3ygIVs+5KfRLmrQe7Qwx
         altQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=OtUK9OLMWdL6AUc3ZfpyXK1kgh1agdbXcj5hc+979G8=;
        b=JuBr2+gKJ3JgrXjwlScvqoBAydTrLnshFWEPNUTUAG8Wtkn8oV2kxUepblVSxRV+zF
         r/AP2Ig3mlqj7b4nU+dPPHasiZ9lMmV4v6mDY24mO5+tCtQL/WMYfKWqnKJpPFyx7yju
         2CrMtzCE5NhRT4sA1ox7O+AzL6foV6FvngXHW+8f2rKdQNIMdFG7NoDH8uJQfGa1ySFg
         xci3xnKsZmRXe83Yqs9BBNFklnI1KnBHzKmVl7ZcmSRPFcMt1iH0F7Q2Mkc5e7MM+Wf3
         fqvv78b8SCUyT/3RBO+6KCjGDFPqDX552/5AgVooI6hwdBoj37Ra/tE8CXB5St5hC+ju
         NdtQ==
X-Gm-Message-State: ACgBeo1vwvi+QrbXcWKO2R3K0urdNVDAgQTc0wwyEBZCeA3IkBuu1uvG
        9TNVMDWC9ZybmHrM0NKoAU6riA==
X-Google-Smtp-Source: AA6agR4gxE/7slArmuUtR05sZfHFLCh81St/simPA+TXbSjCOklqEF54v1qmnT+n3VjgviN6ahhCMg==
X-Received: by 2002:a17:902:f70f:b0:171:2572:4f5e with SMTP id h15-20020a170902f70f00b0017125724f5emr4422269plo.40.1661445754247;
        Thu, 25 Aug 2022 09:42:34 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id b18-20020a62a112000000b005362314bf80sm12779408pff.67.2022.08.25.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:42:33 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com,
        surenb@google.com
Cc:     mingo@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v4 00/10] sched/psi: some optimizations and extensions
Date:   Fri, 26 Aug 2022 00:41:01 +0800
Message-Id: <20220825164111.29534-1-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This patch series are some optimizations and extensions for PSI.

patch 1/10 fix periodic aggregation shut off problem introduced by earlier
commit 4117cebf1a9f ("psi: Optimize task switch inside shared cgroups").

patch 2-4 are some misc optimizations, so put them in front of this series.

patch 5/10 optimize task switch inside shared cgroups when in_memstall status
of prev task and next task are different.

patch 6/10 remove NR_ONCPU task accounting to save 4 bytes in the first
cacheline to be used by the following patch 7/10, which introduce new
PSI resource PSI_IRQ to track IRQ/SOFTIRQ pressure stall information.

patch 8-9 cache parent psi_group in struct psi_group to speed up the
hot iteration path.

patch 10/10 introduce a per-cgroup interface "cgroup.pressure" to disable
or re-enable PSI in the cgroup level, and we implement hiding and unhiding
the pressure files per Tejun's suggestion[1], which depends on his work[2].

[1] https://lore.kernel.org/all/YvqjhqJQi2J8RG3X@slm.duckdns.org/
[2] https://lore.kernel.org/all/20220820000550.367085-1-tj@kernel.org/

Performance test using mmtests/config-scheduler-perfpipe in
/user.slice/user-0.slice/session-4.scope:

                                 next                patched       patched/only-leaf
Min       Time        8.82 (   0.00%)        8.49 (   3.74%)        8.00 (   9.32%)
1st-qrtle Time        8.90 (   0.00%)        8.58 (   3.63%)        8.05 (   9.58%)
2nd-qrtle Time        8.94 (   0.00%)        8.61 (   3.65%)        8.09 (   9.50%)
3rd-qrtle Time        8.99 (   0.00%)        8.65 (   3.75%)        8.15 (   9.35%)
Max-1     Time        8.82 (   0.00%)        8.49 (   3.74%)        8.00 (   9.32%)
Max-5     Time        8.82 (   0.00%)        8.49 (   3.74%)        8.00 (   9.32%)
Max-10    Time        8.84 (   0.00%)        8.55 (   3.20%)        8.04 (   9.05%)
Max-90    Time        9.04 (   0.00%)        8.67 (   4.10%)        8.18 (   9.51%)
Max-95    Time        9.04 (   0.00%)        8.68 (   4.03%)        8.20 (   9.26%)
Max-99    Time        9.07 (   0.00%)        8.73 (   3.82%)        8.25 (   9.11%)
Max       Time        9.12 (   0.00%)        8.89 (   2.54%)        8.27 (   9.29%)
Amean     Time        8.95 (   0.00%)        8.62 *   3.67%*        8.11 *   9.43%*

Big thanks to Johannes Weiner, Tejun Heo and Michal Koutný for your
suggestions and review!


Changes in v4:
 - Collect Acked-by tags from Johannes Weiner.
 - Add many clear comments and changelogs per Johannes Weiner.
 - Replace for_each_psi_group() with better open-code.
 - Change to use better names cgroup_pressure_show() and
   cgroup_pressure_write().
 - Change to use better name psi_cgroup_restart() and only
   call it on enabling.

Changes in v3:
 - Rebase on linux-next and reorder patches to put misc optimizations
   patches in the front of this series.
 - Drop patch "sched/psi: don't change task psi_flags when migrate CPU/group"
   since it caused a little performance regression and it's just
   code refactoring, so drop it.
 - Don't define PSI_IRQ and PSI_IRQ_FULL when !CONFIG_IRQ_TIME_ACCOUNTING,
   in which case they are not used.
 - Add patch 8/10 "sched/psi: consolidate cgroup_psi()" make cgroup_psi()
   can handle all cgroups including root cgroup, make patch 9/10 simpler.
 - Rename interface to "cgroup.pressure" and add some explanation
   per Michal's suggestion.
 - Hide and unhide pressure files when disable/re-enable cgroup PSI,
   depends on Tejun's work.

Changes in v2:
 - Add Acked-by tags from Johannes Weiner. Thanks for review!
 - Fix periodic aggregation wakeup for common ancestors in
   psi_task_switch().
 - Add patch 7/10 from Johannes Weiner, which remove NR_ONCPU
   task accounting to save 4 bytes in the first cacheline.
 - Remove "psi_irq=" kernel cmdline parameter in last version.
 - Add per-cgroup interface "cgroup.psi" to disable/re-enable
   PSI stats accounting in the cgroup level.


Chengming Zhou (9):
  sched/psi: fix periodic aggregation shut off
  sched/psi: don't create cgroup PSI files when psi_disabled
  sched/psi: save percpu memory when !psi_cgroups_enabled
  sched/psi: move private helpers to sched/stats.h
  sched/psi: optimize task switch inside shared cgroups again
  sched/psi: add PSI_IRQ to track IRQ/SOFTIRQ pressure
  sched/psi: consolidate cgroup_psi()
  sched/psi: cache parent psi_group to speed up groups iterate
  sched/psi: per-cgroup PSI accounting disable/re-enable interface

Johannes Weiner (1):
  sched/psi: remove NR_ONCPU task accounting

 Documentation/admin-guide/cgroup-v2.rst |  23 ++
 include/linux/cgroup-defs.h             |   3 +
 include/linux/cgroup.h                  |   5 -
 include/linux/psi.h                     |  12 +-
 include/linux/psi_types.h               |  29 ++-
 kernel/cgroup/cgroup.c                  | 106 ++++++++-
 kernel/sched/core.c                     |   1 +
 kernel/sched/psi.c                      | 280 +++++++++++++++++-------
 kernel/sched/stats.h                    |   6 +
 9 files changed, 362 insertions(+), 103 deletions(-)

-- 
2.37.2

