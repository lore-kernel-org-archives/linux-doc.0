Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1058DC43334
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jul 2022 04:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbiGUEFn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jul 2022 00:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbiGUEFX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jul 2022 00:05:23 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F535FFB
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 21:05:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id bk6-20020a17090b080600b001f2138a2a7bso3549264pjb.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 21:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iTBK+C00vRPG4JDueYyv7EqFsWvxIqsN3waJE+O/isA=;
        b=QHIvOf/vF7cxWQOSppu23p6vElDHp0+ZqYuQj3IE6sYMS6UGWgb8VpdRJEDv/3fmgK
         EBsyNAQs2eSnCL8T+CYX5Ge6nLSOCZhoT7717mCb3PYoGzDPZvxo0RttCkMybvV+RiqR
         7lSJrgu7/rcXtElobuMaOqMSQk4MZHbvh0tkYM8/N8UBVTGiNPK+sk0l0Q1No0nSuCne
         +ICLWxXj78VcKThofLCbfIwAuz7LBngg0/wfa0zSvrleB7AUxs7BkQP92oCOqUvaFR9q
         96tnMKzLbOOur2qTlrlpvcq9bAVMyNMH61VFRD89X5LBADuZX1NXdhUgyrLX/EYl/Du0
         N72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iTBK+C00vRPG4JDueYyv7EqFsWvxIqsN3waJE+O/isA=;
        b=sb7RMDzLFCRBHkFSN+44afG1bj2dkcJ03VaGc5DfI2tl/ESdOqDo2fKuEGsSVKG7UT
         sCDjELrQ+x1Vladca6C0fSafCtOTSyVcW5FuC1zztFZPopPLYLvDoyL3Hu5gqLF7WH4R
         n2fKP0kJwBvXddAclLQX1FH3eEYLeDc9JlGMzvuQE23JsmyEJS+a8pFpgpRYae2lANwl
         3DVTkvq1nKh/WN0Rrcy5r938x50P9qMqDayrbVKN/gFoy35oWsPZpEOA+pTQmYuaJh9M
         rTn/XCaDhymowJZHsEWGoLDJ0dwIFGbPHoVAhLZD7uD9UKYzxokfv3PVa9Uf2EVRNEyu
         Ne4Q==
X-Gm-Message-State: AJIora+sSZF5qEB9U0S/r/LqeVIaU5dLOJ54vF3ropQ+6yRlk8xqKtn9
        3WtII0oZITkcX7QNNuHQvuWw0g==
X-Google-Smtp-Source: AGRyM1tD8ydLFbzp0WwR7EaNXDsuFnSu/q0Me8fNNp8ZZt3K7hT+RDgBX5aStMP8YvI5v0abrO21vQ==
X-Received: by 2002:a17:903:44b:b0:16c:b112:7f74 with SMTP id iw11-20020a170903044b00b0016cb1127f74mr35436361plb.149.1658376319603;
        Wed, 20 Jul 2022 21:05:19 -0700 (PDT)
Received: from C02CV1DAMD6P.bytedance.net ([139.177.225.228])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902684400b0016bdf0032b9sm384368pln.110.2022.07.20.21.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 21:05:19 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, surenb@google.com, mingo@redhat.com,
        peterz@infradead.org, tj@kernel.org, corbet@lwn.net,
        akpm@linux-foundation.org, rdunlap@infradead.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        songmuchun@bytedance.com, cgroups@vger.kernel.org,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH 5/9] sched/psi: don't create cgroup PSI files when psi_disabled
Date:   Thu, 21 Jul 2022 12:04:35 +0800
Message-Id: <20220721040439.2651-6-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721040439.2651-1-zhouchengming@bytedance.com>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

commit 3958e2d0c34e ("cgroup: make per-cgroup pressure stall tracking configurable")
make PSI can be configured to skip per-cgroup stall accounting. And
doesn't expose PSI files in cgroup hierarchy.

This patch do the same thing when psi_disabled.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 kernel/cgroup/cgroup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 1779ccddb734..1424da7ed2c4 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3700,6 +3700,9 @@ static void cgroup_pressure_release(struct kernfs_open_file *of)
 
 bool cgroup_psi_enabled(void)
 {
+	if (static_branch_likely(&psi_disabled))
+		return false;
+
 	return (cgroup_feature_disable_mask & (1 << OPT_FEATURE_PRESSURE)) == 0;
 }
 
-- 
2.36.1

