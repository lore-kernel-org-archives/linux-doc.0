Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F328C43603
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 04:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05F5420684
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 04:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=generalsoftwareinc-com.20150623.gappssmtp.com header.i=@generalsoftwareinc-com.20150623.gappssmtp.com header.b="rfEhQFDi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfLPE17 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 15 Dec 2019 23:27:59 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:45039 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfLPE17 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Dec 2019 23:27:59 -0500
Received: by mail-vk1-f193.google.com with SMTP id y184so1247246vkc.11
        for <linux-doc@vger.kernel.org>; Sun, 15 Dec 2019 20:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=t+XRxHVrP9U17siccMaQ+m4HAah0KCw9evb79XHQSbE=;
        b=rfEhQFDihRv6E2ioKZN90QnWaa10oUN0+pBCvB+Pe4DWE9C86YsOoFqzCMpbPaDHoB
         eZshE7lGmNmvIoqJO80qDiqPSQUoeHw7cZNsrSk6f53WpqIz4iyKRXdNmF+X4PiRlsPx
         1iTMjLOSWhnEYSnA2Nf4+iuGewqFWFdAtAh6X+nDLAD+S5kc2juzVx+XcUpfRFy5vOPK
         soCt9Fpg79r6hXA8UUdFGzH2OVcKw5t7iv2vX5hnv2n05DlQ2F0VSFk1R1KINcIU1++1
         9/edRvzJyMy9bR+qcDYH8AFd+/b+pKZAQKB9xFsFmX2jEsh2tNTZtjwysXtDaD9XS3Gg
         zixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=t+XRxHVrP9U17siccMaQ+m4HAah0KCw9evb79XHQSbE=;
        b=aDk8FDv1Ysfc79SUm+vVNQPIZv/tpn5KwHX5/WkIHesNi2Y7MvwUaAMfZfl/zV9gxP
         UEjpi+t6FdNaJBlyb1mkB++K6fnWdugsFD2TvS+pqlPD2OKMp9wQuIHYdm91bQiwoq2r
         Ws/u0Z4Lods4Z03+tx5U4CrtEcVyvZRhy+cVIMFVXb0QYNJNzDV5OYYRsJ80Z0fW07Yl
         rwUtpSsFdNfr7cQW7I2dfyW1UaVVQ/RgxBUTGy99zUxds1cmU3V5njyDRYMSV20r7ABx
         swuSwjHb9BZl3QtNTVbHjtIWrOc2e0utTdd23HKylrTAsb1eXc/k0VCXDZMmFblbI8SL
         2tBg==
X-Gm-Message-State: APjAAAUEGSk9irc+gGr9g9NT4vT/OO8Ci6QgEV3RZnYGxI5YNQ9bXbdH
        33hT7LodMVh09EHJjHNsDe/2Cg==
X-Google-Smtp-Source: APXvYqw2N+LM/vdcn5AER3Ms5ZoSIyNZAqrZP0V5FuAy9A2SF01zP9VSfOK/wVM7wJDtYr+aajqZzQ==
X-Received: by 2002:a1f:434b:: with SMTP id q72mr23125511vka.53.1576470477855;
        Sun, 15 Dec 2019 20:27:57 -0800 (PST)
Received: from frank-laptop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id l21sm6786902vsi.1.2019.12.15.20.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 20:27:57 -0800 (PST)
Date:   Sun, 15 Dec 2019 23:27:56 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, nachukannan@gmail.com,
        saiprakash.ranjan@outlook.com
Subject: [PATCH] docs: ftrace: Specifies when buffers get clear
Message-ID: <20191216042756.qnho3v2upqg4wm7o@frank-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Clarify in a few places where the ring buffer and the "snapshot"
buffer are cleared as a side effect of an operation.

This will avoid users lost of tracing data because of these so far
undocumented behavior.

Signed-off-by: Frank A. Cancio Bello <frank@generalsoftwareinc.com>
---
 Documentation/trace/ftrace.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index d2b5657ed33e..5cc65314e16d 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -95,7 +95,8 @@ of ftrace. Here is a list of some of the key files:
   current_tracer:
 
 	This is used to set or display the current tracer
-	that is configured.
+	that is configured. Changing the current tracer clears
+        the ring buffer content as well as the "snapshot" buffer.
 
   available_tracers:
 
@@ -126,7 +127,9 @@ of ftrace. Here is a list of some of the key files:
 	This file holds the output of the trace in a human
 	readable format (described below). Note, tracing is temporarily
 	disabled when the file is open for reading. Once all readers
-	are closed, tracing is re-enabled.
+	are closed, tracing is re-enabled. Opening this file for
+        writing with the O_TRUNC flag clears the ring buffer content
+        as well as the "snapshot" buffer.
 
   trace_pipe:
 
@@ -490,6 +493,9 @@ of ftrace. Here is a list of some of the key files:
 
 	  # echo global > trace_clock
 
+        Setting a clock clears the ring buffer content as well as the
+        "snapshot" buffer.
+
   trace_marker:
 
 	This is a very useful file for synchronizing user space
-- 
2.17.1

