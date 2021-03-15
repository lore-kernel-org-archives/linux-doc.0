Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F3EC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 10:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FFDD64EAE
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 10:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbhCOJ7c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Mar 2021 05:59:32 -0400
Received: from mail-m118208.qiye.163.com ([115.236.118.208]:46780 "EHLO
        mail-m118208.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhCOJ7F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Mar 2021 05:59:05 -0400
X-Greylist: delayed 590 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Mar 2021 05:59:05 EDT
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.250.176.228])
        by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 46EA2E012A;
        Mon, 15 Mar 2021 17:49:10 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Jonathan Corbet <corbet@lwn.net>, Wang Qing <wangqing@vivo.com>,
        Joe Perches <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] doc: admin-guide: remove explanation of "watchdog/%u"
Date:   Mon, 15 Mar 2021 17:49:03 +0800
Message-Id: <1615801744-31548-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSkJMTBpMTUMfGR8YVkpNSk5DS0pMTktNSU5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKSktOSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nhg6NDo4Nz8PIUsYKA8SKzYM
        HzwwFDZVSlVKTUpOQ0tKTE5KT0NMVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5LVUpMTVVJSUNZV1kIAVlBSU9OQjcG
X-HM-Tid: 0a78354a141e2c17kusn46ea2e012a
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"watchdog/%u" threads has be replaced by cpu_stop_work, 
which will mislead the reader.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 .../admin-guide/kernel-per-CPU-kthreads.rst          | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/Documentation/admin-guide/kernel-per-CPU-kthreads.rst b/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
index 531f689..5e51ee5
--- a/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
+++ b/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
@@ -332,23 +332,3 @@ To reduce its OS jitter, do at least one of the following:
 	kthreads from being created in the first place.  However, please
 	note that this will not eliminate OS jitter, but will instead
 	shift it to RCU_SOFTIRQ.
-
-Name:
-  watchdog/%u
-
-Purpose:
-  Detect software lockups on each CPU.
-
-To reduce its OS jitter, do at least one of the following:
-
-1.	Build with CONFIG_LOCKUP_DETECTOR=n, which will prevent these
-	kthreads from being created in the first place.
-2.	Boot with "nosoftlockup=0", which will also prevent these kthreads
-	from being created.  Other related watchdog and softlockup boot
-	parameters may be found in Documentation/admin-guide/kernel-parameters.rst
-	and Documentation/watchdog/watchdog-parameters.rst.
-3.	Echo a zero to /proc/sys/kernel/watchdog to disable the
-	watchdog timer.
-4.	Echo a large number of /proc/sys/kernel/watchdog_thresh in
-	order to reduce the frequency of OS jitter due to the watchdog
-	timer down to a level that is acceptable for your workload.
-- 
2.7.4
