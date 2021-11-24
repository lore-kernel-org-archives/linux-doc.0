Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3230FC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 24 Nov 2021 19:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243078AbhKXTjT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Nov 2021 14:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238116AbhKXTjR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Nov 2021 14:39:17 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F0AC061574
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 11:36:08 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id y124-20020a623282000000b0047a09271e49so2053576pfy.16
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 11:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=l9t6ClhMMo4edSjmJdir8QUj58OMyUYJRTb0MJXDOKU=;
        b=i0/Ngz3cNacHmR60ZQrdeEnU5wK465ot7VF/quxdpABPcQ5rReQE4P1dvpSxwpUQ3m
         WJ7qE/WsmjAnexVyI5rsHFc8xD8POs/0ISZbs4ZJkhR+CYum1Q3AFocYRIxWrBtGPYyd
         kpGigPgr0Gy6viXOgyakF3EJmTn3zFz9OVVwTg9lIs9gTEHhaESQjUH4FFP+hPxZ3q3D
         aPs6s2Nsd5VhVbRR2vRo55J4x+AdhEx7XRnb2UkZLKv2t2yG6O4cp3R60tecsUAshY60
         boOQrsQpXPVxDlp5sBkCJxX+Cl7biSAKJg+KC20HTZUp3GnjLr+bKkhdo0e7k5hun9DX
         hd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=l9t6ClhMMo4edSjmJdir8QUj58OMyUYJRTb0MJXDOKU=;
        b=qVrKuGZ+QAoDq7sGTvZTE2Yqw+TyyrbWeEUCZ2KHkdwGd6oB9ojWA2nVcUlppsemNm
         Ej3AjoaIbXJ3TWGgKfHOHTG2kaEHiWLzVVIbwVTzPj2NepI0z8YcIK7+rddNah28eZES
         g0G0URsdg+W6F1EWQtCgRUptq1xscwpDRbC6E1dzP8QKStV+VGP1FrsFRw63r8iwQ0cp
         hIn2ZRcOBVgKZ32SsJlEpLDRf0si3ySfdO7C0kzHbhAcUHJby3C9JA0cE/MwdU9r+5A8
         8MrdKWK5fT1KfXeOQ5YpQBBJPsJsiE0KekY4oWZGe1DSGQjG3Qb3oj/8iNb0d3o5ixoU
         3Gog==
X-Gm-Message-State: AOAM533C9afZC6J8eV8zAfonWImeT4214hQxRX54yuT8t8l//e/2H/+7
        XiT77VvE88gP0FzZPtHlLDF6dTGORts=
X-Google-Smtp-Source: ABdhPJzIBX9oxqVPB6dAYbBGP63Ursk9otTuOWoAVdTYt8LpHs+DLkFQWjiFWGnpyjXSRzphENtqYSJ9moM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:ecf7:86c0:3b4d:493])
 (user=surenb job=sendgmr) by 2002:a63:914c:: with SMTP id l73mr12197689pge.184.1637782567590;
 Wed, 24 Nov 2021 11:36:07 -0800 (PST)
Date:   Wed, 24 Nov 2021 11:36:04 -0800
Message-Id: <20211124193604.2758863-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH 1/1] sysctl: change watermark_scale_factor max limit to 30%
From:   Suren Baghdasaryan <surenb@google.com>
To:     akpm@linux-foundation.org
Cc:     mhocko@suse.com, hannes@cmpxchg.org, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com,
        dave.hansen@linux.intel.com, vbabka@suse.cz,
        mgorman@techsingularity.net, corbet@lwn.net, yi.zhang@huawei.com,
        xi.fengfei@h3c.com, rppt@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For embedded systems with low total memory, having to run applications
with relatively large memory requirements, 10% max limitation for
watermark_scale_factor poses an issue of triggering direct reclaim
every time such application is started. This results in slow application
startup times and bad end-user experience.
By increasing watermark_scale_factor max limit we allow vendors more
flexibility to choose the right level of kswapd aggressiveness for
their device and workload requirements.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 2 +-
 kernel/sysctl.c                         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 5e795202111f..f4804ce37c58 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -948,7 +948,7 @@ how much memory needs to be free before kswapd goes back to sleep.
 
 The unit is in fractions of 10,000. The default value of 10 means the
 distances between watermarks are 0.1% of the available memory in the
-node/system. The maximum value is 1000, or 10% of memory.
+node/system. The maximum value is 3000, or 30% of memory.
 
 A high rate of threads entering direct reclaim (allocstall) or kswapd
 going to sleep prematurely (kswapd_low_wmark_hit_quickly) can indicate
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 083be6af29d7..2ab4edb6e450 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -122,6 +122,7 @@ static unsigned long long_max = LONG_MAX;
 static int one_hundred = 100;
 static int two_hundred = 200;
 static int one_thousand = 1000;
+static int three_thousand = 3000;
 #ifdef CONFIG_PRINTK
 static int ten_thousand = 10000;
 #endif
@@ -2959,7 +2960,7 @@ static struct ctl_table vm_table[] = {
 		.mode		= 0644,
 		.proc_handler	= watermark_scale_factor_sysctl_handler,
 		.extra1		= SYSCTL_ONE,
-		.extra2		= &one_thousand,
+		.extra2		= &three_thousand,
 	},
 	{
 		.procname	= "percpu_pagelist_high_fraction",
-- 
2.34.0.rc2.393.gf8c9666880-goog

