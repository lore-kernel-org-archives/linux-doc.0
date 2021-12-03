Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AD1C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  3 Dec 2021 08:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379114AbhLCIIU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Dec 2021 03:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379105AbhLCIIU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 03:08:20 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BE6C06173E
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 00:04:56 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id x5so2194384pfr.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 00:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ex+QLxKwkL15yN9pntbGN4YJck6h2qn8p5ldofDpbas=;
        b=SjiLFII+X3WlKen2l0X7yHRGukPWgQS0DdfPgSPyWcydkWMtFI2jE23kqN6UW4505b
         nQJz0rp00FFZ1pIVQnARHko5lpkU0S9fFhf7qbUB/gUTMbRTew9WX9nFIC6NalygKVft
         tQbtQXtn/Xx5lfK2q7T782LUskDIjMgEP9wPr9HYxwyZochaTzeT8awONaUrpJ6541iZ
         46T5qcmSvcFA1BK9mgfXv0LawoUOAPOGutg9I9r0gz4ktKpHDNTUkB1GKzn5kPfN+1ay
         u5TKAmV7MHAGDarkk3ZYNn2COzAV2a4d6Lpr4Gja9lTo8ptCnBscE1qM9aeH4beJGTC4
         FA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ex+QLxKwkL15yN9pntbGN4YJck6h2qn8p5ldofDpbas=;
        b=Q8KEORx1PMNAmjY9CL8CsAmulPKtlOGC3aSie7ehN9yfMyv9VvfKzOwnj69QVsNn7d
         AXP3FMgZNNxaJH5y5rieHcT04ohJkmaG32wXoGSD9bTiDPXw/X6fkR2PGLLiZxXqLrMB
         guRlZGmcJjRfVHjG6rGhNAyPPCsQXbl1MkUM43P+CCM8YTH6IaxQV6ywZ7IrOlL0WBba
         f5I3eKWQYHizHBsr7GcN9W1ezJRahs3Q27YAUPG6pWv09WlnRmuI5T+fPb7czb4OCOfy
         Z9h5np4UaLm4rkiM42wWgevmInWamTnUQKtLwxbtLt+EqgYxXdyHaudNzz8K7nvE4Ha9
         MLmw==
X-Gm-Message-State: AOAM532aP5V6XtOHABzEPbPUWvir+BktVXq7qu2W3tXMmcEJ6frebtct
        mJUh+yL54vHhhwASg/Z1EoE=
X-Google-Smtp-Source: ABdhPJxCy5WX1bT3QKIhf0NXwG3Yr2o1zNqOLG3+fgmWuZyIZfMwP4d6l63z7dZ/TlnhbjhBJ98xOg==
X-Received: by 2002:a05:6a00:2313:b0:49f:d9ec:7492 with SMTP id h19-20020a056a00231300b0049fd9ec7492mr17998314pfh.25.1638518695900;
        Fri, 03 Dec 2021 00:04:55 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id h6sm2543332pfh.82.2021.12.03.00.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 00:04:55 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 3/3] docs/scheduler: fix typo and warning in sched-bwc
Date:   Fri,  3 Dec 2021 16:03:22 +0800
Message-Id: <163a4dde20b8c4b68d668977a668e281d18fcf92.1638517064.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638517064.git.siyanteng@loongson.cn>
References: <cover.1638517064.git.siyanteng@loongson.cn>
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

