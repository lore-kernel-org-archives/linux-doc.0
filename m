Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCD7C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 20:57:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 915E261100
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 20:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbhITU7Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 16:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44194 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232249AbhITU5R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 16:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632171350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S4VKFLtrv5F+Sqia58aIUV8mMMq0gd6yS5dG8Lafx1o=;
        b=Dry+zZXZgH26hSGHq0Gr1gdn+QBbTX9N+617rNfPIfEwTSbwNjBfsG4rQVmDGmzxHPs2p/
        RZOQyjVNLDAdocM3bGa4SCFEtNxrVs8cxqj0mki1GGdfDzAipb54atXFe946uYCaSTgiPW
        GFGoj8GQvdIKhIJ0XXsc+Z294EPUh2I=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-3ZllR6oLOEuQXei-R61_lw-1; Mon, 20 Sep 2021 16:55:46 -0400
X-MC-Unique: 3ZllR6oLOEuQXei-R61_lw-1
Received: by mail-io1-f69.google.com with SMTP id g8-20020a05660203c800b005d58875129eso24434360iov.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 13:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S4VKFLtrv5F+Sqia58aIUV8mMMq0gd6yS5dG8Lafx1o=;
        b=wGpfqz3iX0KPlmj8OxA5ZE34SkAGHNqBxJD65QcMRT84cKMw4FXKyK2CD9/r0ndVc+
         cK2f3WCChwWwvhrPbBBtRkwr7hAKjrq7N1vX/BjChrcR3riixDo/Pibw/O1wWqrcv4pA
         KnKvAlO+lXNpGqhPppolCaLectsgM1lEkt6MwH2VGEmJfMdJ1zW4UdW86zPnYjP9PuG3
         Kx7Yq6CV5etqkgifBF4pgY9dhykN+/XCvp5x9cAVGxamNRo5lDEHCnMnc1fJzosZI0VO
         rvXt9GO0m/2W6rvAbsGjYFd+HAak7UWeTqa5djiSb60zJIHM2QamP7XGofassBIxNzSj
         8fIQ==
X-Gm-Message-State: AOAM5335K7D0ZnY6yVYYjHtGCIdQenqcxpgjUR2Keb0BIc9E1bqtwyPp
        p/gr9kmWv6aY4iOzgvGZUYZ45DGWkVDbzffP9wcYfiecCnZr2IbXfNAh/qdTAZxR/P8ADKUpniE
        vtf9AKVTOl5ZKzlzVsruy
X-Received: by 2002:a6b:cd01:: with SMTP id d1mr17336331iog.88.1632171346329;
        Mon, 20 Sep 2021 13:55:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe95i2375dC+5VC3FwfOiZ49FuXMNgnAsnCt+5yXxUVqT8mSI59DRcKPEVF0316d9KBE3J2w==
X-Received: by 2002:a6b:cd01:: with SMTP id d1mr17336329iog.88.1632171346122;
        Mon, 20 Sep 2021 13:55:46 -0700 (PDT)
Received: from halaneylaptop.redhat.com (068-184-200-203.res.spectrum.com. [68.184.200.203])
        by smtp.gmail.com with ESMTPSA id v9sm9268905ilc.16.2021.09.20.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:55:45 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Jason Baron <jbaron@akamai.com>, Jonathan Corbet <corbet@lwn.net>,
        Jim Cromie <jim.cromie@gmail.com>
Cc:     Andrew Halaney <ahalaney@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] Documentation: dyndbg: Improve cli param examples
Date:   Mon, 20 Sep 2021 15:54:44 -0500
Message-Id: <20210920205444.20068-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920205444.20068-1-ahalaney@redhat.com>
References: <20210920205444.20068-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jim pointed out that using $module.dyndbg= is always a more flexible
choice for using dynamic debug on the command line. The $module.dyndbg
style is checked at boot and handles if $module is a builtin. If it is
actually a loadable module, it is handled again later when the module is
loaded.

If you just use dyndbg="module $module +p" dynamic debug is only enabled
when $module is a builtin.

It was recommended to illustrate wildcard usage as well.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
Suggested-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index d0911e7cc271..ae264aab42b6 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -357,7 +357,10 @@ Examples
   Kernel command line: ...
     // see whats going on in dyndbg=value processing
     dynamic_debug.verbose=1
-    // enable pr_debugs in 2 builtins, #cmt is stripped
-    dyndbg="module params +p #cmt ; module sys +p"
+    // enable pr_debugs in the btrfs module (can be builtin or loadable)
+    btrfs.dyndbg="+p"
+    // enable pr_debugs in all files under init/
+    // and the function parse_one, #cmt is stripped
+    dyndbg="file init/* +p #cmt ; func parse_one +p"
     // enable pr_debugs in 2 functions in a module loaded later
     pc87360.dyndbg="func pc87360_init_device +p; func pc87360_find +p"
-- 
2.31.1

