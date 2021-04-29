Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CF6C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 09:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2241161441
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 09:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240295AbhD2JGD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 05:06:03 -0400
Received: from mail-m17655.qiye.163.com ([59.111.176.55]:64246 "EHLO
        mail-m17655.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240247AbhD2JGC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Apr 2021 05:06:02 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.250.176.229])
        by mail-m17655.qiye.163.com (Hmail) with ESMTPA id B08B5400A7;
        Thu, 29 Apr 2021 17:05:12 +0800 (CST)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH V2,RESEND 4/4] doc: watchdog: Modify the doc related to "watchdog/%u"
Date:   Thu, 29 Apr 2021 17:04:28 +0800
Message-Id: <1619687073-24686-5-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619687073-24686-2-git-send-email-wangqing@vivo.com>
References: <1619687073-24686-2-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQhpOQ1ZDHx1PSU5NHRlMSUtVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAg6TSo6AT8JQ0kpTk0pFzYO
        HT5PCVZVSlVKTUpCTUNMSkpITkpLVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5LVUpMTVVJSUJZV1kIAVlBSEhMTDcG
X-HM-Tid: 0a791ce001d2da01kuwsb08b5400a7
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"watchdog/%u" threads has be replaced by cpu_stop_work. The current
description is extremely misleading.
---
 Documentation/admin-guide/sysctl/kernel.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 1d56a6b..32b0791
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1282,11 +1282,11 @@ This parameter can be used to control the soft lockup detector.
 = =================================
 
 The soft lockup detector monitors CPUs for threads that are hogging the CPUs
-without rescheduling voluntarily, and thus prevent the 'watchdog/N' threads
-from running. The mechanism depends on the CPUs ability to respond to timer
-interrupts which are needed for the 'watchdog/N' threads to be woken up by
-the watchdog timer function, otherwise the NMI watchdog — if enabled — can
-detect a hard lockup condition.
+without rescheduling voluntarily, and thus prevent the 'migration/N' threads
+from running, causing the watchdog work fail to execute. The mechanism depends
+on the CPUs ability to respond to timer interrupts which are needed for the
+watchdog work to be queued by the watchdog timer function, otherwise the NMI
+watchdog — if enabled — can detect a hard lockup condition.
 
 
 stack_erasing
-- 
2.7.4

