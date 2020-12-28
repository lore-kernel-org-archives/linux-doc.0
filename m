Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CCCC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 29 Dec 2020 04:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D06EB207B2
	for <linux-doc@archiver.kernel.org>; Tue, 29 Dec 2020 04:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgL2EKT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Dec 2020 23:10:19 -0500
Received: from smtprelay01.ispgateway.de ([80.67.29.23]:9359 "EHLO
        smtprelay01.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgL2EKT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Dec 2020 23:10:19 -0500
X-Greylist: delayed 21739 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Dec 2020 23:10:18 EST
Received: from [79.249.9.239] (helo=pi.koderer.com)
        by smtprelay01.ispgateway.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92.3)
        (envelope-from <marc@koderer.com>)
        id 1ktldh-0002vD-8k; Mon, 28 Dec 2020 07:04:17 +0100
From:   Marc Koderer <marc@koderer.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        trivial@kernel.org, Marc Koderer <marc@koderer.com>
Subject: [PATCH] samples/kprobes: Remove misleading comment
Date:   Mon, 28 Dec 2020 07:04:15 +0100
Message-Id: <20201228060415.2194-1-marc@koderer.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Df-Sender: bWFyY0Brb2RlcmVyLmNvbQ==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The example file supports many architectures not only x86 and PPC.

Signed-off-by: Marc Koderer <marc@koderer.com>
Cc: trivial@kernel.org
---
 samples/kprobes/kprobe_example.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
index 365905cb24b1..192aa68db0c0 100644
--- a/samples/kprobes/kprobe_example.c
+++ b/samples/kprobes/kprobe_example.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * NOTE: This example is works on x86 and powerpc.
  * Here's a sample kernel module showing the use of kprobes to dump a
  * stack trace and selected registers when kernel_clone() is called.
  *
-- 
2.20.1

