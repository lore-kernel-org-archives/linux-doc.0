Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157BEC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 09:33:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C121661428
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 09:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238126AbhD1Jds (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 05:33:48 -0400
Received: from foss.arm.com ([217.140.110.172]:37988 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238222AbhD1Jds (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Apr 2021 05:33:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E9BC1042;
        Wed, 28 Apr 2021 02:33:03 -0700 (PDT)
Received: from e113131-lin.cambridge.arm.com (e113131-lin.cambridge.arm.com [10.1.195.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 464213F70D;
        Wed, 28 Apr 2021 02:33:02 -0700 (PDT)
From:   Beata Michalska <beata.michalska@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, valentin.schneider@arm.com,
        dietmar.eggemann@arm.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 1/3] sched/core: Introduce SD_ASYM_CPUCAPACITY_FULL sched_domain flag
Date:   Wed, 28 Apr 2021 10:32:41 +0100
Message-Id: <1619602363-1305-2-git-send-email-beata.michalska@arm.com>
In-Reply-To: <1619602363-1305-1-git-send-email-beata.michalska@arm.com>
References: <1619602363-1305-1-git-send-email-beata.michalska@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introducing new, complementary to SD_ASYM_CPUCAPACITY, sched_domain
topology flag, to distinguish between shed_domains where any CPU
capacity asymmetry is detected (SD_ASYM_CPUCAPACITY) and ones where
a full range of CPU capacities is visible to all domain members
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
---
 include/linux/sched/sd_flags.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/sched/sd_flags.h b/include/linux/sched/sd_flags.h
index 34b21e9..57bde66 100644
--- a/include/linux/sched/sd_flags.h
+++ b/include/linux/sched/sd_flags.h
@@ -91,6 +91,16 @@ SD_FLAG(SD_WAKE_AFFINE, SDF_SHARED_CHILD)
 SD_FLAG(SD_ASYM_CPUCAPACITY, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
 
 /*
+ * Domain members have different CPU capacities spanning all unique CPU
+ * capacity values.
+ *
+ * SHARED_PARENT: Set from the topmost domain down to the first domain where
+ *		  all available CPU capacities are visible
+ * NEEDS_GROUPS: Per-CPU capacity is asymmetric between groups.
+ */
+SD_FLAG(SD_ASYM_CPUCAPACITY_FULL, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
+
+/*
  * Domain members share CPU capacity (i.e. SMT)
  *
  * SHARED_CHILD: Set from the base domain up until spanned CPUs no longer share
-- 
2.7.4

