Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 074B97D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Nov 2019 16:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfKMQcl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Nov 2019 11:32:41 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:42734 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfKMQcl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Nov 2019 11:32:41 -0500
Received: by mail-ua1-f51.google.com with SMTP id 31so849236uas.9
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2019 08:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pDKKsEnNSRaRtnTtkPfEq2dSlMtAaoLWzVsslXGiAh0=;
        b=18309h9PFFwMrlS/XYWNpakfrkLyFf5WzDSkRkznyRjceSIwnZc1mNodE+ZWZjDd46
         XWqzYpymjBA7c11tSENL50ARuSWF8gsMk8nwGV2UHCn8Di5UFWpQKoq7Yq4HMsd/TJOT
         rtmfa2/1EKe7LrY8HjjxXWgSdRsQXlY49MIcfDyeV5fu/CprhZKmQuCPvazseo7f+DDp
         mbzQoBB/iYc1WEXsQLM7mfzHRYgsvPW5TrxNxbTbhuTL/J4EyOCh3t4+G9oYpQ8fW+kW
         g9VghxVQ6sELRogY0wGDB67jZlWDfPnzdBjcGmRj8Hi505v+Qzjqyu3JFuJUsfXGwA7H
         GF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pDKKsEnNSRaRtnTtkPfEq2dSlMtAaoLWzVsslXGiAh0=;
        b=aCOuRuxTH0Pct/TgK2O0HBBS1njGrXB9H+dns7coynV5t7TGPyI/6x82p+aPAfZN+X
         EcCm2Pm+Q6JOYz9gYHzs6E4qVAySvalRXpQA+i5cZAqJMsteJDDpdyHuqsi2UqL+QvTW
         yuzdRVq7q8BeZMYMOIw/HrAcgFETIrRf5TPMWP4qtMTJy9iJWzvZP8vuOg057laq8lP3
         v2iETw5jQm1reVLoTwlkKiBHUKhJUU4dPnXHxAV6rYQFL7l1cWeUUaLijkIrx0JMi3Vm
         uWs2NpU9eYwReDrchsKACiTvLSxFYxoP9o4iFS89pYQ1L4s9sycBrH5sY11vHxh8pGv/
         4/sA==
X-Gm-Message-State: APjAAAW2JN8RfScUUOGpAXKk6A5JRNhPXjaI82jGkpGdF/1iB9ycyiKv
        ivrmvtlNiSCqc/8/z+VwQOctTA==
X-Google-Smtp-Source: APXvYqx9moaQoSBbBI34MchfRiqFzHdBM7CLPKC6eS2MV1lVBMSwkkSDF+V4lf6h3qgkrlCcuUFuEQ==
X-Received: by 2002:a9f:3c13:: with SMTP id u19mr2369395uah.27.1573662758781;
        Wed, 13 Nov 2019 08:32:38 -0800 (PST)
Received: from ubuntu1804-desktop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id r15sm587351uap.19.2019.11.13.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 08:32:37 -0800 (PST)
Date:   Wed, 13 Nov 2019 11:32:36 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org
Subject: [RFC 1/2] docs: ftrace: Clarify the RAM impact of buffer_size_kb
Message-ID: <0e4a803c3e24140172855748b4a275c31920e208.1573661658.git.frank@generalsoftwareinc.com>
References: <cover.1573661658.git.frank@generalsoftwareinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1573661658.git.frank@generalsoftwareinc.com>
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current text could mislead the user into believing that the number
of pages allocated by each CPU ring buffer is calculated by the round
up of the division: buffer_size_kb / PAGE_SIZE.

Clarify that the number of pages allocated is the round up of the
division: buffer_size_kb / (PAGE_SIZE - BUF_PAGE_HDR_SIZE). Add an
example that shows how the number of pages allocated could be off by
5 pages more compared with how the current text suggests it should be.

Suggested-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Frank A. Cancio Bello <frank@generalsoftwareinc.com>
---
 Documentation/trace/ftrace.rst | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index e3060eedb22d..ec2c4eff95a6 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -188,8 +188,17 @@ of ftrace. Here is a list of some of the key files:
 	If the last page allocated has room for more bytes
 	than requested, the rest of the page will be used,
 	making the actual allocation bigger than requested or shown.
-	( Note, the size may not be a multiple of the page size
-	due to buffer management meta-data. )
+
+        The number of pages allocated for each CPU buffer may not
+        be the same than the round up of the division:
+        buffer_size_kb / PAGE_SIZE. This is because part of each page is
+        used to store a page header with metadata. E.g. with
+        buffer_size_kb=4096 (kilobytes), a PAGE_SIZE=4096 bytes and a
+        BUF_PAGE_HDR_SIZE=16 bytes (BUF_PAGE_HDR_SIZE is the size of the
+        page header with metadata) the number of pages allocated for each
+        CPU buffer is 1029, not 1024. The formula for calculating the
+        number of pages allocated for each CPU buffer is the round up of:
+        buffer_size_kb / (PAGE_SIZE - BUF_PAGE_HDR_SIZE).
 
 	Buffer sizes for individual CPUs may vary
 	(see "per_cpu/cpu0/buffer_size_kb" below), and if they do
-- 
2.17.1

