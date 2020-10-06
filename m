Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8BBC4727E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C7142078E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993221;
	bh=ANwSfHlYycUaZxzUwSyDQzW5wFbqluFd7ZfalvckhQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=1JyMzhmlM5pE2iclmK0D0Q7gE2YR9ubXYvlF9vk47O3YKFVuR1q0DOI/+0EdiupPo
	 4f1TNY74FhTteAnloGY+TKcPqYJzDbD5o2tDlja44A7j39oRW0ZVs7J6MCd7Mcxi3C
	 zPjVeuk6s4qB4mFdX9o1IwQLVDvvc64EeDNLAJZA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgJFOHA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:07:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbgJFODz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:55 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34DEC21897;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993034;
        bh=ANwSfHlYycUaZxzUwSyDQzW5wFbqluFd7ZfalvckhQQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bkkGiDV0gTH9/a5UtrBYmH3E9rYygbBUZdv2Wvylq+FQm1mPZOZdGRPioFWdUk9DC
         UgpPCliqVMHQqOYwp4ZOrvNkm7EzSc42TTNv+NsY/r1bl0JFa7gWINi/XpoKN0gaXm
         5FoVuQ40qkMx9tO9mDlYef0j8mV3sFUNgYeKARnI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019FW-52; Tue, 06 Oct 2020 16:03:52 +0200
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
Subject: [PATCH v5 23/52] docs: trace-uses.rst: remove bogus c-domain tags
Date:   Tue,  6 Oct 2020 16:03:20 +0200
Message-Id: <b82613b38d76e228676ca2e9d66b66f3a1c68cc3.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
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

