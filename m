Return-Path: <SRS0=pwJD=2I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79641C43603
	for <linux-doc@archiver.kernel.org>; Wed, 18 Dec 2019 19:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A73A21D7D
	for <linux-doc@archiver.kernel.org>; Wed, 18 Dec 2019 19:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=generalsoftwareinc-com.20150623.gappssmtp.com header.i=@generalsoftwareinc-com.20150623.gappssmtp.com header.b="vn0WHtPs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfLRTP4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Dec 2019 14:15:56 -0500
Received: from mail-vs1-f44.google.com ([209.85.217.44]:41741 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbfLRTPz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Dec 2019 14:15:55 -0500
Received: by mail-vs1-f44.google.com with SMTP id f8so2121623vsq.8
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2019 11:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=E4X+tp6ZlTv3HTGbUp4WMcWmcsmZ7lp6RfccYvi6Rck=;
        b=vn0WHtPsCeyB7ZuaJQJMj9mWysnldTc9xeZIdeqP4+3+d6ztsAqgfknx/TbZf7tMiz
         dTatR/527dMLtlSjdJOoQdqXk0ck/fo8OdYWa4FOUxcWhnFRvDCZV2AU7D0W8vTLVOVy
         zRS9VZjW62b+l1LWQHOAAtPeQeokxxFaXe+Muz4UVhxdcnY1lkrsydWzcgo5wQXyYO2y
         I+vwWhlZWFPpHN7nh2J5kWgb3FomQueE2cxTLKyWLlmE51zMbNEPgQ+dfQnuZkAog/k8
         1DU2OP7LcPhyJ6etZfE6vMm+FVC9n5FQ37MyctT3tAfdTH1fPfUcDJZ8zFkA5pGlBly+
         qU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=E4X+tp6ZlTv3HTGbUp4WMcWmcsmZ7lp6RfccYvi6Rck=;
        b=Ex860LCoxrEQFlbS9XIrKZgOBsltSi/ZZQfcXnR+v5sjtamXxAdXiw03cuVT66P0yW
         48P7WllZTbA+f95T+k5GiM0EsHXutzA/FmzJn7noX+qjKEdgOjYSgdwEmyhAyhoF0Gl1
         p9q6YSQ0HWI/xbGYUcSwqIQQcmkAKUFw9Q/g2UeaB3XSOerZVV6ex663z5ewb3e5kY8E
         1Hu34kR9sJCw0aLb0Lvnf/yMWVuPG4ZHM7Oz3yKfLjfTRMUS7HNnJ/A6nr6q7AsQ8Bp9
         4lAlC7C6sIbUGPnoBABsIUDsLk1UyNTpb6Av6mx+OhagwjweSLFy6qh/2lUhDwP+zaKD
         bf9w==
X-Gm-Message-State: APjAAAVJ94gxngp4pmVUsYYwQLyzVk6C1/oIEZE+CFbW7RIzMSoPTBU5
        CPuvYUo6QHJOjrgjKp3wqJhYOw==
X-Google-Smtp-Source: APXvYqw/ttgnVScl28xFvl7VA6vFHiQp9lh7gssrEstHml3An690zz7rANxDuaUFIWc7ge2X7Jaygg==
X-Received: by 2002:a67:fe50:: with SMTP id m16mr2520466vsr.114.1576696554730;
        Wed, 18 Dec 2019 11:15:54 -0800 (PST)
Received: from frank-laptop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id p18sm788913vsq.0.2019.12.18.11.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 11:15:54 -0800 (PST)
Date:   Wed, 18 Dec 2019 14:15:53 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, nachukannan@gmail.com,
        saiprakash.ranjan@outlook.com
Subject: [PATCH v2] docs: ftrace: Specifies when buffers get clear
Message-ID: <20191218191553.q4lwyxmquvtjzjfz@frank-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Clarify a few places where the ring buffer and the "snapshot" buffer
are cleared as a side effect of an operation.

This will avoid users lost of tracing data because of these so far
undocumented behavior.

Signed-off-by: Frank A. Cancio Bello <frank@generalsoftwareinc.com>
---
Changes in v2:
  - Per Steven comment correct the fact that the "snapshot" buffer is
    not touched when writing in the "trace" file.
  - Use tab instead of spaces for alignment.

 Documentation/trace/ftrace.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index d2b5657ed33e..46df39300d22 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -95,7 +95,8 @@ of ftrace. Here is a list of some of the key files:
   current_tracer:
 
 	This is used to set or display the current tracer
-	that is configured.
+	that is configured. Changing the current tracer clears
+	the ring buffer content as well as the "snapshot" buffer.
 
   available_tracers:
 
@@ -126,7 +127,8 @@ of ftrace. Here is a list of some of the key files:
 	This file holds the output of the trace in a human
 	readable format (described below). Note, tracing is temporarily
 	disabled when the file is open for reading. Once all readers
-	are closed, tracing is re-enabled.
+	are closed, tracing is re-enabled. Opening this file for
+	writing with the O_TRUNC flag clears the ring buffer content.
 
   trace_pipe:
 
@@ -490,6 +492,9 @@ of ftrace. Here is a list of some of the key files:
 
 	  # echo global > trace_clock
 
+	Setting a clock clears the ring buffer content as well as the
+	"snapshot" buffer.
+
   trace_marker:
 
 	This is a very useful file for synchronizing user space
-- 
2.17.1

