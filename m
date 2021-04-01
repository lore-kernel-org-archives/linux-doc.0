Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5465CC43460
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 03:33:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 216096112E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 03:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbhDADcX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 23:32:23 -0400
Received: from mail-m118208.qiye.163.com ([115.236.118.208]:40834 "EHLO
        mail-m118208.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhDADcR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 23:32:17 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
        by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 4792AE0121;
        Thu,  1 Apr 2021 11:32:15 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Jonathan Corbet <corbet@lwn.net>, Joe Perches <joe@perches.com>,
        Wang Qing <wangqing@vivo.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stephen Kitt <steve@sk2.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Eric Biggers <ebiggers@google.com>,
        Qais Yousef <qais.yousef@arm.com>,
        Petr Mladek <pmladek@suse.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Santosh Sivaraj <santosh@fossix.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexey Budankov <alexey.budankov@linux.intel.com>,
        Andrey Ignatov <rdna@fb.com>
Cc:     gregkh@linuxfoundation.org
Subject: [PATCH V2 4/4] doc: watchdog: Modify the doc related to "watchdog/%u"
Date:   Thu,  1 Apr 2021 11:31:34 +0800
Message-Id: <1617247900-23813-5-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617247900-23813-1-git-send-email-wangqing@vivo.com>
References: <1617247900-23813-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZH0kYGE8fGEhJGR4YVkpNSkxJT0xCSE1LSE1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K1E6KSo5Cj8UDjRMIhMOPRY9
        KyxPCiJVSlVKTUpMSU9MQkhNT0tPVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISVlXWQgBWUFITU1JNwY+
X-HM-Tid: 0a788b7d1dc62c17kusn4792ae0121
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

