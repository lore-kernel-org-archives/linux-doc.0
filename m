Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F6FC47096
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 14:06:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3F0D61361
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 14:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhFCOIh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Jun 2021 10:08:37 -0400
Received: from foss.arm.com ([217.140.110.172]:42256 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229744AbhFCOIh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Jun 2021 10:08:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4FE712FC;
        Thu,  3 Jun 2021 07:06:52 -0700 (PDT)
Received: from e120325.arm.com (unknown [10.57.85.170])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 624023F73D;
        Thu,  3 Jun 2021 07:06:50 -0700 (PDT)
From:   Beata Michalska <beata.michalska@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, valentin.schneider@arm.com,
        dietmar.eggemann@arm.com, corbet@lwn.net, rdunlap@infradead.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v7 1/3] sched/core: Introduce SD_ASYM_CPUCAPACITY_FULL sched_domain flag
Date:   Thu,  3 Jun 2021 15:06:25 +0100
Message-Id: <20210603140627.8409-2-beata.michalska@arm.com>
In-Reply-To: <20210603140627.8409-1-beata.michalska@arm.com>
References: <20210603140627.8409-1-beata.michalska@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introducing new, complementary to SD_ASYM_CPUCAPACITY, sched_domain
topology flag, to distinguish between shed_domains where any CPU
capacity asymmetry is detected (SD_ASYM_CPUCAPACITY) and ones where
a full set of CPU capacities is visible to all domain members
(SD_ASYM_CPUCAPACITY_FULL).

With the distinction between full and partial CPU capacity asymmetry,
brought in by the newly introduced flag, the scope of the original
SD_ASYM_CPUCAPACITY flag gets shifted, still maintaining the existing
behaviour when one is detected on a given sched domain, allowing
misfit migrations within sched domains that do not observe full range
of CPU capacities but still do have members with different capacity
values. It loses though it's meaning when it comes to the lowest CPU
asymmetry sched_domain level per-cpu pointer, which is to be now
denoted by SD_ASYM_CPUCAPACITY_FULL flag.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 include/linux/sched/sd_flags.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/sched/sd_flags.h b/include/linux/sched/sd_flags.h
index 34b21e971d77..57bde66d95f7 100644
--- a/include/linux/sched/sd_flags.h
+++ b/include/linux/sched/sd_flags.h
@@ -90,6 +90,16 @@ SD_FLAG(SD_WAKE_AFFINE, SDF_SHARED_CHILD)
  */
 SD_FLAG(SD_ASYM_CPUCAPACITY, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
 
+/*
+ * Domain members have different CPU capacities spanning all unique CPU
+ * capacity values.
+ *
+ * SHARED_PARENT: Set from the topmost domain down to the first domain where
+ *		  all available CPU capacities are visible
+ * NEEDS_GROUPS: Per-CPU capacity is asymmetric between groups.
+ */
+SD_FLAG(SD_ASYM_CPUCAPACITY_FULL, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
+
 /*
  * Domain members share CPU capacity (i.e. SMT)
  *
-- 
2.17.1

