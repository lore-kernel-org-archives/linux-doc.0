Return-Path: <SRS0=2lNs=2P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA606C2D0C3
	for <linux-doc@archiver.kernel.org>; Wed, 25 Dec 2019 00:07:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D21C206CB
	for <linux-doc@archiver.kernel.org>; Wed, 25 Dec 2019 00:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=generalsoftwareinc-com.20150623.gappssmtp.com header.i=@generalsoftwareinc-com.20150623.gappssmtp.com header.b="nuhXrToY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfLYAHA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Dec 2019 19:07:00 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41721 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfLYAHA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Dec 2019 19:07:00 -0500
Received: by mail-vs1-f68.google.com with SMTP id f8so13226161vsq.8
        for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2019 16:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4E/2wqIKz28ubvLgIUjPVPO4AakvBg1lZqS8m4r8eSs=;
        b=nuhXrToYH2l1mEXzplPPqfL6jwJrwy9KF80nJRH5RWc4AU31fHL/OGAHHUR/NHNM3w
         J3r9UTPegPr47BrebbAJlRXOKMkdvuk0EmPKAnUrCprtSuvFLpjaw6wvdR9o3k+K2Zc5
         1lvFoV84SnxPC1O7qr8i8ze4i195NU92/OUxvIxK2uB6CN7r+6hw1/53IVVt6h2X/lbx
         Xpl9OHwhvtGjWg0kXKA5ORBfc1EOK1SaWg8LBA21yLABF8Hc+xgxUaDNdSD14x26HoBM
         lJcGkTrA3DoW4veW18jEr9IT7TkXHaSzLQBEjdrnIMTRHQ11aqhZkqPpGSEeeQnIOg43
         +1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4E/2wqIKz28ubvLgIUjPVPO4AakvBg1lZqS8m4r8eSs=;
        b=feBqk7pMekIIKpIwc3CePlwc1T3nDQUcmLBsf6qry/AopcxIoq+0gEIHB4vVZJAJF4
         Ox+AoGv0odHa5u81jxN2oVugXT16/n35lzBSK27XP8RlInwhr2HbURZfM1xzrbkEI9mI
         tCr0FSSMZK9NrwejNmN3XNmt2acrI5+3K4+mdHvT9c4Rt4Icagb8fWTNhgqht6+1/k3V
         ywFP5rb9Kiqa6XrP9qfVrd/07wfr5YpPDmXdySW6A+nsVotiXDHj1vTL3RtPdZg/7Yai
         9ZRn/T9Ykd4cMQpORhZKc8zXCBYz0sILgI+j5OWiGCxTINvEmhGAzRvm7Cm2HIml8PEg
         JZpQ==
X-Gm-Message-State: APjAAAXZNKvZJluJKDJwWYulduFuvT30wiMveo8El5J0nnC64ZLDqACn
        iotWkafWRtU5ZAdk4QERECk9FG0kbj77KA==
X-Google-Smtp-Source: APXvYqxgrDJsBlsG+ACW6Z1O/nWXxOCl2c1kv0M06tZGE8UbMCYqsjLof1+9MoxDj8wgV636kHbmpg==
X-Received: by 2002:a67:6282:: with SMTP id w124mr17314621vsb.191.1577232418899;
        Tue, 24 Dec 2019 16:06:58 -0800 (PST)
Received: from frank-laptop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id o132sm3627487vke.2.2019.12.24.16.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 16:06:58 -0800 (PST)
Date:   Tue, 24 Dec 2019 19:06:57 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org,
        nachukannan@gmail.com, rdunlap@infradead.org
Subject: [PATCH v3 3/3] docs: ftrace: Fix small notation mistake
Message-ID: <22f9a98a972c3155c7b478247a087a5efafde774.1577231751.git.frank@generalsoftwareinc.com>
References: <cover.1577231751.git.frank@generalsoftwareinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1577231751.git.frank@generalsoftwareinc.com>
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The use of iff ("if and only if") notation is not accurate in this case.

Suggested-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Frank A. Cancio Bello <frank@generalsoftwareinc.com>
---
 Documentation/trace/ring-buffer-design.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/ring-buffer-design.txt b/Documentation/trace/ring-buffer-design.txt
index ff747b6fa39b..2d53c6f25b91 100644
--- a/Documentation/trace/ring-buffer-design.txt
+++ b/Documentation/trace/ring-buffer-design.txt
@@ -37,7 +37,7 @@ commit_page - a pointer to the page with the last finished non-nested write.
 
 cmpxchg - hardware-assisted atomic transaction that performs the following:
 
-   A = B iff previous A == C
+   A = B if previous A == C
 
    R = cmpxchg(A, C, B) is saying that we replace A with B if and only if
       current A is equal to C, and we put the old (current) A into R
-- 
2.17.1

