Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D87FC48BDF
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:01:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73CC1613AE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhFKDDY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 23:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhFKDDY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 23:03:24 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF16C0617AE
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:01:11 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id 11so2083383plk.12
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x1eS59fE1UIuaVsG7ADEI9qj+tPY7EsVLy/zdUS33TA=;
        b=LL8u6+aGTc8hE7aNAmp+N8uStij8ycLllztHv+iZNaF1Y6wJi0KvmekR9KK/pDA8Pl
         uURS+pBjYEE+eg/dZdSNBOezlsoh780BgUu1QGldIQjBMgYNRnIm5KnbC6Lr5sZkAtvv
         m0KCZ/08nk1B0bv6qKZoesz+YQn1H93MiQ3y8/jxcCghS4XA8mBJbSNqK+U8aNo/Vl+C
         zGLwqzVFT0taHgcxaGO9UlQm+xL9Gzb6N0begyrIgDLqHcS4HrYnU15eogjPczsTuLsu
         lNAvmgV/Mxw0RXJng5jjL3O3PkPHLvqVTKFFjC0DhJ1luildWrLrNWdc6dujqN0LJwLo
         lLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x1eS59fE1UIuaVsG7ADEI9qj+tPY7EsVLy/zdUS33TA=;
        b=Ty80Hbd7fLbksFiuRllJH189Y7PXTC04ENXh4uWu7tlPE2RCV1fU2zG5SiAFDfI89D
         Ln2/yGoNoU8Q1iarK4nRuTpwJiPckJINadw8oEow0jAS0SX+a+4tIAuLFr/qRCXDHuHf
         EfPO/riWoLXxKwdz6oq5sZLKzGccX0hMf6PXkPgtVEe0g2qbtI/VN3O3Ry34o6jzirNq
         T9j5jmDGrp3bjM3zXNxk6ziryOiZHqngOFIYPRVgoY0DaMswFUQas2EHgDNMwYDUesK/
         F4n7D/Z64FCj6dtqnEOcI/ljvOa58mP99+3YG0PuS567UMjBDJYf97eZH3QdCrGJ428f
         13vQ==
X-Gm-Message-State: AOAM532lA+qH3e9ISf8AauGuNpfFDbvCtvSZrAGRnDrJ4r5PrUGJ7vM/
        ttU8VoEWWYCaLzkqIsLw0d8txiOYpKImEg==
X-Google-Smtp-Source: ABdhPJzfWbQj3s7TdTq3WBf7dxl2XCIjFp6FBPBcU233IFD6KdtlFNt5qM3vWO7blMx6a+9pXzE3lw==
X-Received: by 2002:a17:90a:8581:: with SMTP id m1mr2081341pjn.47.1623380470324;
        Thu, 10 Jun 2021 20:01:10 -0700 (PDT)
Received: from kir-rhat.redhat.com (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id ev11sm8856748pjb.36.2021.06.10.20.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:01:09 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kir Kolyshkin <kolyshkin@gmail.com>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: [PATCH 3/3] docs: fix a cross-ref
Date:   Thu, 10 Jun 2021 20:00:44 -0700
Message-Id: <20210611030044.1982911-4-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210611030044.1982911-1-kolyshkin@gmail.com>
References: <20210611030044.1982911-1-kolyshkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit acda97acb2e98c9 changes dax.txt to dax.rst.
Fix the references accordingly.

Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 Documentation/admin-guide/ext4.rst | 2 +-
 Documentation/filesystems/ext2.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/ext4.rst b/Documentation/admin-guide/ext4.rst
index d2795ca6821e..4c559e08d11e 100644
--- a/Documentation/admin-guide/ext4.rst
+++ b/Documentation/admin-guide/ext4.rst
@@ -392,7 +392,7 @@ When mounting an ext4 filesystem, the following option are accepted:
 
   dax
         Use direct access (no page cache).  See
-        Documentation/filesystems/dax.txt.  Note that this option is
+        Documentation/filesystems/dax.rst.  Note that this option is
         incompatible with data=journal.
 
   inlinecrypt
diff --git a/Documentation/filesystems/ext2.rst b/Documentation/filesystems/ext2.rst
index c2fce22cfd03..154101cf0e4f 100644
--- a/Documentation/filesystems/ext2.rst
+++ b/Documentation/filesystems/ext2.rst
@@ -25,7 +25,7 @@ check=none, nocheck	(*)	Don't do extra checking of bitmaps on mount
 				(check=normal and check=strict options removed)
 
 dax				Use direct access (no page cache).  See
-				Documentation/filesystems/dax.txt.
+				Documentation/filesystems/dax.rst.
 
 debug				Extra debugging information is sent to the
 				kernel syslog.  Useful for developers.
-- 
2.31.1

