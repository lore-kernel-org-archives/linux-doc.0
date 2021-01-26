Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E40BC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 18:53:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF3E322228
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 18:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbhAZRNL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 12:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731568AbhAZHfy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jan 2021 02:35:54 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092FCC0613D6;
        Mon, 25 Jan 2021 23:25:29 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id h15so6827530pli.8;
        Mon, 25 Jan 2021 23:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aohcwg8DR0mGqPnA2wGL/jF/7WarDGkJWJQzk9Pkb10=;
        b=ui7OcrgZjLBLtaSfolPOJiLY5AqCZBOCRz3aSpTVj9W6U/Q4qww0M0bRUImrJ/2Q1g
         VhlzDRflaQlITcnoWZ9MwCmzzw5T3+KwqFQq/OBTsVjHtT74toAn+KYhrgZvcTshdWTv
         IcBIzIhHZnJ8veqzc54ViIIGykESwRs0OySQR4GCmslHLNmKX1Cq0WRkwqJAsHFfpazX
         NXZCUvxv9E0fOL0JIDKUBKnBb5OWCnht7hLoC0RwHJx2qDV24C34/r+XbDb5O5t1kvX/
         klFWUS3tacoRk+jPmi/4rHuV0/lF5u30Oir57FZJ/mnfvy6+Z/oblDRWuAdv9UEPyipJ
         h9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aohcwg8DR0mGqPnA2wGL/jF/7WarDGkJWJQzk9Pkb10=;
        b=nar437ZRuZHdKxbrgYuTxkGURRQkG5HsvL6q7LmZfjuLrTugjjgClvItQU9tM7U2YW
         pxKfChwTqSPqpwS+MuHwzX+lGhSgugWncvgjDCAWHJSt46ymYym80WOzLv1qWR30Htkm
         iRJCQlZVvx4YbFWI2UM5XiNtP3a+igHkKoe0qy3IdmXzTcgoBi6SbsLo3csmu5U/KHhW
         4uy3Y06Gu90tgxq0yoCYB8PLrXj3zPeGENQk1qL1Alaf7O1MFaeIO4wEFSghEO8PPOUr
         31dhtkOa4NgaUb6JEWS7dPPby2Kt2Dw88suSW3rGvGVYUbfPzaeAgzshQ9O1kucdltWp
         wfWw==
X-Gm-Message-State: AOAM532kXfxg9h8vEusesTooPvuavrqQ7hb9ac0/FRnHcKu05/KnL41P
        COZbTDPf5Rwu3OEPYoN7LLo=
X-Google-Smtp-Source: ABdhPJxNiklQASFnT4ODBKhjcSNV5b9rhHIfyEk3n2QQW9U8zbEVO4HbHgbLjABrLXJicX3N+zHLhw==
X-Received: by 2002:a17:90a:470b:: with SMTP id h11mr4644535pjg.186.1611645928595;
        Mon, 25 Jan 2021 23:25:28 -0800 (PST)
Received: from cl-arch-kdev.. (cl-arch-kdev.xen.prgmr.com. [2605:2700:0:2:a800:ff:fed6:fc0d])
        by smtp.gmail.com with ESMTPSA id l12sm1320256pjg.54.2021.01.25.23.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 23:25:28 -0800 (PST)
From:   Fox Chen <foxhlchen@gmail.com>
To:     corbet@lwn.net, vegard.nossum@oracle.com, viro@zeniv.linux.org.uk,
        rdunlap@infradead.org, grandmaster@al2klimov.de
Cc:     Fox Chen <foxhlchen@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] docs: path-lookup: update path_mountpoint() part
Date:   Tue, 26 Jan 2021 15:24:34 +0800
Message-Id: <20210126072443.33066-4-foxhlchen@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126072443.33066-1-foxhlchen@gmail.com>
References: <20210126072443.33066-1-foxhlchen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

path_mountpoint() doesn't exist anymore. Have been folded
into path_lookup_at when flag is set with LOOKUP_MOUNTPOINT.
check out commit:161aff1d93abf0e5b5e9dbca88928998c155f677

Signed-off-by: Fox Chen <foxhlchen@gmail.com>
---
 Documentation/filesystems/path-lookup.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index 2ad96e1e3c49..4e77c8520fa9 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -492,7 +492,8 @@ not try to revalidate the mounted filesystem.  It effectively
 contains, through a call to ``mountpoint_last()``, an alternate
 implementation of ``lookup_slow()`` which skips that step.  This is
 important when unmounting a filesystem that is inaccessible, such as
-one provided by a dead NFS server.
+one provided by a dead NFS server.  In the current kernel, path_mountpoint
+has been merged into ``path_lookup_at()`` with a new flag LOOKUP_MOUNTPOINT.
 
 Finally ``path_openat()`` is used for the ``open()`` system call; it
 contains, in support functions starting with "``do_last()``", all the
-- 
2.30.0

