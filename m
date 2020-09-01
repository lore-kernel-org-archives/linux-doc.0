Return-Path: <SRS0=Q+9j=CK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE27C433E2
	for <linux-doc@archiver.kernel.org>; Tue,  1 Sep 2020 07:57:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 745DB208DB
	for <linux-doc@archiver.kernel.org>; Tue,  1 Sep 2020 07:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598947053;
	bh=11/Oxr1bazlAq76B5EBL57MHTB+kilpynCiwLN3TQuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=R/sO4eob2Gpfr2SvR/wXSMcsgfyo2O7TP+lkGbXf/wVkm8WA/8VF549S+yha1ioLe
	 ZYs/HnmDa4Fmktch4ZM9YtYm05gJs6fedu0NtGPg45TCrMUbwT8rDLXqB8W+NpEccI
	 m9FfWbCkUn5DTQEUIrs4kaHkrw80O+oMCzbWrq0Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgIAH5d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Sep 2020 03:57:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:53532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgIAH52 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Sep 2020 03:57:28 -0400
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3489020684;
        Tue,  1 Sep 2020 07:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598947045;
        bh=11/Oxr1bazlAq76B5EBL57MHTB+kilpynCiwLN3TQuM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CL4D5siuAWjVRPq0diPBhug4iHUX72XG0PhrrYGGd0eAQ2CfkeUTfoqowIIFANwOK
         ZZpocfbxuYvgWHGCZ2mChx6iZZvM6Lpy7QEHFYaFnNiZd2I9VM2WZmucwPw0IMsdh+
         sv41GymYaovw9vp+8O6r7D/0V2Q8e4v404TuYDeA=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     mhiramat@kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 5/6] Documentation: tracing: Add %return suffix description
Date:   Tue,  1 Sep 2020 16:57:20 +0900
Message-Id: <159894704033.1478826.8727007789230325537.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <159894698993.1478826.2813843560314595660.stgit@devnote2>
References: <159894698993.1478826.2813843560314595660.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description of the %return suffix option for kprobe tracer.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 Changes in v2
  - Use a tab for indentation as other lines do.
---
 Documentation/trace/kprobetrace.rst |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/trace/kprobetrace.rst b/Documentation/trace/kprobetrace.rst
index c1709165c553..a18eb97a263c 100644
--- a/Documentation/trace/kprobetrace.rst
+++ b/Documentation/trace/kprobetrace.rst
@@ -30,6 +30,7 @@ Synopsis of kprobe_events
 
   p[:[GRP/]EVENT] [MOD:]SYM[+offs]|MEMADDR [FETCHARGS]	: Set a probe
   r[MAXACTIVE][:[GRP/]EVENT] [MOD:]SYM[+0] [FETCHARGS]	: Set a return probe
+  p:[GRP/]EVENT] [MOD:]SYM[+0]%return [FETCHARGS]	: Set a return probe
   -:[GRP/]EVENT						: Clear a probe
 
  GRP		: Group name. If omitted, use "kprobes" for it.
@@ -37,6 +38,7 @@ Synopsis of kprobe_events
 		  based on SYM+offs or MEMADDR.
  MOD		: Module name which has given SYM.
  SYM[+offs]	: Symbol+offset where the probe is inserted.
+ SYM%return	: Return address of the symbol
  MEMADDR	: Address where the probe is inserted.
  MAXACTIVE	: Maximum number of instances of the specified function that
 		  can be probed simultaneously, or 0 for the default value

