Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC0CC433B4
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 09:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CE3F6143D
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 09:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240260AbhD2JFz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 05:05:55 -0400
Received: from mail-m17655.qiye.163.com ([59.111.176.55]:64146 "EHLO
        mail-m17655.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240247AbhD2JFx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Apr 2021 05:05:53 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.250.176.229])
        by mail-m17655.qiye.163.com (Hmail) with ESMTPA id A2623400B1;
        Thu, 29 Apr 2021 17:05:03 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Jonathan Corbet <corbet@lwn.net>, Wang Qing <wangqing@vivo.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Joe Perches <joe@perches.com>, Stephen Kitt <steve@sk2.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Qais Yousef <qais.yousef@arm.com>,
        Petr Mladek <pmladek@suse.com>,
        Santosh Sivaraj <santosh@fossix.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lepton Wu <ytht.net@gmail.com>
Subject: [PATCH V2,RESEND 3/4] doc: watchdog: Modify the explanation related to watchdog thread
Date:   Thu, 29 Apr 2021 17:04:27 +0800
Message-Id: <1619687073-24686-4-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619687073-24686-2-git-send-email-wangqing@vivo.com>
References: <1619687073-24686-2-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0sYSVYZT0NDGR4fHx4YGE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRw6PRw5NT8SKElCN0IsFytD
        LEwwFDJVSlVKTUpCTUNMSktPTklLVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5LVUpMTVVJSUJZV1kIAVlBSE9PTTcG
X-HM-Tid: 0a791cdfde86da01kuwsa2623400b1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"watchdog/%u" threads has be replaced by cpu_stop_work. The current 
description is extremely misleading.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 Documentation/admin-guide/lockup-watchdogs.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/lockup-watchdogs.rst b/Documentation/admin-guide/lockup-watchdogs.rst
index 290840c..3e09284
--- a/Documentation/admin-guide/lockup-watchdogs.rst
+++ b/Documentation/admin-guide/lockup-watchdogs.rst
@@ -39,7 +39,7 @@ in principle, they should work in any architecture where these
 subsystems are present.
 
 A periodic hrtimer runs to generate interrupts and kick the watchdog
-task. An NMI perf event is generated every "watchdog_thresh"
+job. An NMI perf event is generated every "watchdog_thresh"
 (compile-time initialized to 10 and configurable through sysctl of the
 same name) seconds to check for hardlockups. If any CPU in the system
 does not receive any hrtimer interrupt during that time the
@@ -47,7 +47,7 @@ does not receive any hrtimer interrupt during that time the
 generate a kernel warning or call panic, depending on the
 configuration.
 
-The watchdog task is a high priority kernel thread that updates a
+The watchdog job runs in a stop scheduling thread that updates a
 timestamp every time it is scheduled. If that timestamp is not updated
 for 2*watchdog_thresh seconds (the softlockup threshold) the
 'softlockup detector' (coded inside the hrtimer callback function)
-- 
2.7.4

