Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4C3C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 03:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244829AbhK2DIM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Nov 2021 22:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245333AbhK2DGM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Nov 2021 22:06:12 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B3CC06175D
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:51 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id b68so15276358pfg.11
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ex+QLxKwkL15yN9pntbGN4YJck6h2qn8p5ldofDpbas=;
        b=i0jpvfkMa+qoKRNjImPnw86cwFhpmCYGnyQ2nSYoWQpGXyYvw/8vDjA/qaxXh1+kKm
         XWYZK6lkQ+y4lgptB+tT0TdBv2iDeHTJfu/aamlBBrH2QAbiLrKv4zz1S2bAWswU9+S4
         RKOWQVM5nLpLYStxXmiDlYAGc090OD3tgmExQ7DWC6lcJ+Io7xMUxbvT40ntL1QhTn4h
         Ot46w/F3S8FANsJZjv0mNRm0mDEzDThcl3fkwyu5TAETzda8xhywKbQs9n52GPquT9Wg
         e+hAupuIKr94XMVxbzHr9T4JBQ1IUTH0NYYfgxLcQnbMmlb32j7wXB3h1YTJrlI6XOYz
         TSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ex+QLxKwkL15yN9pntbGN4YJck6h2qn8p5ldofDpbas=;
        b=HcL+yY8ZEq4qVUi3KK91XiCJtpXyqLne28KE3OChL5L0DoIum5IrqRvqKqfytMcO9l
         548OL5g9/sqw0LoJDV/y4dJznON8nJA4l5SIoSIktAGaexijszpMy/ojM6QHIa2lY29g
         fdKq2gSnIHWeNa3xbT3GPsa6Jy1ozVGhwWJD2BcwCwjn0GnXZWT6/ROSMqkbBiIHpoiC
         Cd4RyAuMvw6xM+gjldzboHp2dTAvROSZ8SiubeKHMq2C8HRuP7d8CTg2pTYohSoUHg/8
         +ciLHjeqmvNeKdzAZKPoZq2Ldop4rAw0lCV+kLMDjve8v7oEGtvTIIxkm6IFMLOxQYYQ
         4yHg==
X-Gm-Message-State: AOAM533LzybdO5mEQknnLgEkw6ieLfQFAwKVCdmjzYiRR55kNxAy6LUJ
        8X0O+ogGxdhKkcFYI3WG7yM=
X-Google-Smtp-Source: ABdhPJy2ZV/5OPaFHOpTNXF4POcdUAjDRiUqOY7hvROgJSarUNRIldHA56Vkeu5goEPZrY5hJ51fnQ==
X-Received: by 2002:a63:8c0a:: with SMTP id m10mr33256976pgd.142.1638154910714;
        Sun, 28 Nov 2021 19:01:50 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id y23sm10066271pgf.86.2021.11.28.19.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 19:01:50 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 3/3] docs/scheduler: fix typo and warning in sched-bwc
Date:   Mon, 29 Nov 2021 11:00:23 +0800
Message-Id: <f6fc755ab2c587d26aac3e141f6eb69830791a34.1638154485.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638154485.git.siyanteng@loongson.cn>
References: <cover.1638154485.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

a) since d73df887b6b8 ("sched/fair: Add document for burstable CFS bandwidth")
[cpu.cfs_quota_us: the total available run-time within a period (in] shoud be removed,
let's delete it.

b) Add a period.

c) fix a build warning:

   linux-next/Documentation/scheduler/sched-bwc.rst:243: WARNING: Inline emphasis
   start-string without end-string.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/scheduler/sched-bwc.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
index 173c14110c85..f166b182ff95 100644
--- a/Documentation/scheduler/sched-bwc.rst
+++ b/Documentation/scheduler/sched-bwc.rst
@@ -74,7 +74,6 @@ Quota, period and burst are managed within the cpu subsystem via cgroupfs.
    to cgroup v1. For cgroup v2, see
    :ref:`Documentation/admin-guide/cgroup-v2.rst <cgroup-v2-cpu>`.
 
-- cpu.cfs_quota_us: the total available run-time within a period (in
 - cpu.cfs_quota_us: run-time replenished within a period (in microseconds)
 - cpu.cfs_period_us: the length of a period (in microseconds)
 - cpu.stat: exports throttling statistics [explained further below]
@@ -135,7 +134,7 @@ cpu.stat:
   of the group have been throttled.
 - nr_bursts: Number of periods burst occurs.
 - burst_time: Cumulative wall-time (in nanoseconds) that any CPUs has used
-  above quota in respective periods
+  above quota in respective periods.
 
 This interface is read-only.
 
@@ -238,7 +237,7 @@ Examples
    additionally, in case accumulation has been done.
 
    With 50ms period, 20ms quota will be equivalent to 40% of 1 CPU.
-   And 10ms burst will be equivalent to 20% of 1 CPU.
+   And 10ms burst will be equivalent to 20% of 1 CPU::
 
 	# echo 20000 > cpu.cfs_quota_us /* quota = 20ms */
 	# echo 50000 > cpu.cfs_period_us /* period = 50ms */
-- 
2.27.0

