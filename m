Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF22C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 25 Nov 2021 13:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345812AbhKYNFx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355048AbhKYNDw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Nov 2021 08:03:52 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3D9C0613F3
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 04:55:31 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so6226528pjb.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 04:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0wALueqVJkUlYgQFeFk8RjzpXfEG0QJPfjMxwWpoyn0=;
        b=YRDaBH62IqKyqSFDRNT2SMfotPwpyTBhPdndj0e97vHTJ80FqmeiqOHgQOEEprQa6n
         qi7E4dUu28UQM1NKiZGJLzwTCzi8y7atnU42SopTBf0nlzXvaoxEbrMHtHy6Ba8sxxgb
         tdwVwDb66c2D8jfSKXuBQcgQEYsiUGBdcOMK6WAqhmPRcnZIRDh1QlpJM1csKaBM37EU
         wmLcsfMuGylCrwo7wUktDbR+y/XJJ3DczCiifCDpsa2ltWdbgSHM2HmZTGmSK9xGkJYD
         +3DOUkgln3pqqaBoMpY69kbE7lJ54ol0xX2DE96CGRB4Xwqmt6c8bmLbSCXdxQfSfcSL
         L4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0wALueqVJkUlYgQFeFk8RjzpXfEG0QJPfjMxwWpoyn0=;
        b=PxP6LyEtYNUafI3Yt4/08qcihMXIsHwloXHmSc//IQjp06NHEEmNXzTLRLQDIKpMca
         ZF0WKXSiYmulHKddTF+Sk2FfSe4kcrA+K1QXUab4lJ4C0cyPLnuIeTZzsPAAZbwkMqid
         zBQSLREJZyCI+/tkkcDscYltsILOm8KyBJ9oeFdB56Bcw7HH2dKk7vMgC4IPDmQgNB3s
         o4BD7yyF79+vemZD0aT8vovNtXyJFqVm38jQdJA6UtaM68wNLG78yKdZfea1xKts/twt
         rThGKs02JK1NM4fR2EN7SDMWdaBKrPjeA9qobvm2WZh8GkvBc/NNNyiHCgRl5elAZZTY
         lYjg==
X-Gm-Message-State: AOAM530iBfzzCQ+r8ty3N/CiFNIXIqdeUy4S8WNRnDaNKRRwFtbWr6Fb
        klmRRZi24wu0mI8yMXoJpWI=
X-Google-Smtp-Source: ABdhPJxHiBBhZR+7GXzgrnrqeOahWXtzjuofepjzFwg9Io1IBp066talpRj4N14jcujgAc3Cf8ZQ1Q==
X-Received: by 2002:a17:902:b78b:b0:143:baac:2ebc with SMTP id e11-20020a170902b78b00b00143baac2ebcmr29442971pls.77.1637844931508;
        Thu, 25 Nov 2021 04:55:31 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id d7sm3694923pfj.91.2021.11.25.04.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 04:55:31 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Subject: [PATCH 3/3] docs/scheduler: fix typo and warning in sched-bwc
Date:   Thu, 25 Nov 2021 20:54:05 +0800
Message-Id: <434b1a86545b393bfa764d6ae310c77408367e08.1637843107.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1637843107.git.siyanteng@loongson.cn>
References: <cover.1637843107.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

a) since d73df887b6b8 ("sched/fair: Add document for burstable CFS bandwidth")
[cpu.cfs_quota_us: the total available run-time within a period (in] shoud be removed,
let's delete it.

b) Add a period.

c) fix a build warning:

   linux-next/Documentation/scheduler/sched-bwc.rst:243: WARNING: Inline emphasis
   start-string without end-string.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

