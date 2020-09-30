Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB29C4727E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBB842075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472486;
	bh=a/Hxd9dkI+XnFblcclJEsVRLi4FwAVR6yKgG79VJyzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Xy8IUdk+Ixsa87lcFiZ9i531hEfE3PbS+qfJxy3VRRwNL0Abv75hxt4yuUFDAQu1x
	 kXabKnhH6MApIUDLVOFQEJofEwdWksHTHP/3RuDqNSowL6Wo+DzklD6zMF56bFluEh
	 2GA2Y+SzQSFccyS3Sa2yOZivDyyLBmsUcPlMqz80=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbgI3N17 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:27:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:39164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730217AbgI3NZV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:21 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DE762220C;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472320;
        bh=a/Hxd9dkI+XnFblcclJEsVRLi4FwAVR6yKgG79VJyzg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LrW06e2HocWX2/HiNYCzwE3EAji/kOiW0nhqHVWIZkLmDRYoXVDrXTLPza+p3X0Gr
         G6tj37pO2CTNYpOd6I3h5hiMeV6d4reZ3770vhVlj1L3XEEAET6Uvtr3E2TlR3yHEm
         l1NstfS5495n3DTDgLnF9q2yAq7lrBITstlLwUwg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6g-001XJs-Oe; Wed, 30 Sep 2020 15:25:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 23/52] docs: trace-uses.rst: remove bogus c-domain tags
Date:   Wed, 30 Sep 2020 15:24:46 +0200
Message-Id: <f1d8fc4bb976f8c25c6fb444b0b675d9a849ba06.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are some c-domain tags that are wrong. While this won't
cause problems with Sphinx < 3.0, this cause troubles with
newer versions, as the C parser won't recognize the contents
of the tag, and will drop it from the output.

Let's just place them at literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/trace/ftrace-uses.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/trace/ftrace-uses.rst b/Documentation/trace/ftrace-uses.rst
index 2a05e770618a..a4955f7e3d19 100644
--- a/Documentation/trace/ftrace-uses.rst
+++ b/Documentation/trace/ftrace-uses.rst
@@ -55,17 +55,17 @@ an ftrace_ops with ftrace:
 
 Both .flags and .private are optional. Only .func is required.
 
-To enable tracing call:
+To enable tracing call::
 
-.. c:function::  register_ftrace_function(&ops);
+    register_ftrace_function(&ops);
 
-To disable tracing call:
+To disable tracing call::
 
-.. c:function::  unregister_ftrace_function(&ops);
+    unregister_ftrace_function(&ops);
 
-The above is defined by including the header:
+The above is defined by including the header::
 
-.. c:function:: #include <linux/ftrace.h>
+    #include <linux/ftrace.h>
 
 The registered callback will start being called some time after the
 register_ftrace_function() is called and before it returns. The exact time
-- 
2.26.2

