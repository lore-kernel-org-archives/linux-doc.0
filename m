Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CFDC43334
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jun 2022 01:32:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiF2Bcw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 21:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiF2Bcw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 21:32:52 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86394201BA
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 18:32:51 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so14503350pjb.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 18:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypD0bFGrahWiUnry8ilBxekW6e/uVFm3C6e684/TnuY=;
        b=GvQC6kmMdA5yIReaKWl0Ik5TkspkC3XaBfadEnwIT8b7yMTD5Cyywmb94zwQUVNbLj
         Ei+bSpYGQcxwgwx9ON2q5bnhHjx1OzVI+4fFVjHmsgYDVm2w5yj4iuzhgUVoNjKwz+FU
         tQcmlshHpJD/SJs+iM3pr8TgDW+eonMJXFgJ62/CAh1aMn6qX33PTdLQCSjF3RF1hCiW
         +5sV00PXJGJvRBFy+iAf5aV9cOsDJowxltU1xkTeELhes8T73EW25aMPFHbOmeeyNNfk
         /U5KNC7EMFwx3njb1hWXvnpTVb3EhS0lpbk43p2e22mmLQ38p6AFrHC4yAzBRyXPoE1r
         0nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypD0bFGrahWiUnry8ilBxekW6e/uVFm3C6e684/TnuY=;
        b=e1s9fV0i1shWsjSey9VraDNH13edy/Zdmh07Z0AOPvJbpynKSJQQyulSQGzEqwa0aa
         LRl5yk2nD40I8TNjelY75xyfyPxORSs5d1Nu3r4eVrGPI3psl0msJq/ssDhONRnxpBqD
         V8cpw+df3N/VOsvngjgVcLzBKy2v+9MNwNIjrO/k0rAjc+5dopd58KOV4FgkxBmALcuY
         YgX54LyjF8/vzouuR3SXaOPo8SmtDuc+TzHIprytq/gBWR9miiwtD8C3+7wodB7xIv0i
         m63ATS2iPj8sAFiQcukp75B54KT/M5UakVNZa1EozZJTqqRKGusiQLwbOmD5MjbuSHPT
         Gu2Q==
X-Gm-Message-State: AJIora9SYkruCzB7CK+6faV7gNqVedq6P8VOyyBUqpUfui7xAkgjrQgP
        1pndt0nUSlfHANkuYFZPltlL7g==
X-Google-Smtp-Source: AGRyM1smGS5EjeEA0w0YEP8Vaucm48IfNmDoxwbLtbsTdPpSS1mIUSVI+6vC6xiCPYzHp6j37rYY5w==
X-Received: by 2002:a17:902:ecca:b0:16a:6b2e:2a78 with SMTP id a10-20020a170902ecca00b0016a6b2e2a78mr6565395plh.164.1656466371096;
        Tue, 28 Jun 2022 18:32:51 -0700 (PDT)
Received: from localhost.localdomain (bb119-74-120-80.singnet.com.sg. [119.74.120.80])
        by smtp.gmail.com with ESMTPSA id ij28-20020a170902ab5c00b0016223016d79sm9973581plb.90.2022.06.28.18.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 18:32:50 -0700 (PDT)
From:   yizhou.tang@shopee.com
To:     siyanteng@loongson.cn, alexs@kernel.org, seakeel@gmail.com,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, robin.lubin@shopee.com, huangh@sea.com,
        bobwxc@email.cn, Tang Yizhou <yizhou.tang@shopee.com>
Subject: [PATCH v2 1/2] docs/zh_CN: Show the Chinese translation of spinlocks
Date:   Wed, 29 Jun 2022 09:32:39 +0800
Message-Id: <20220629013240.65386-2-yizhou.tang@shopee.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220629013240.65386-1-yizhou.tang@shopee.com>
References: <20220629013240.65386-1-yizhou.tang@shopee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tang Yizhou <yizhou.tang@shopee.com>

Last time I forgot to edit locking/index.rst so the Chinese translation
of spinlocks hasn't been shown on web yet.

Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
---
 Documentation/translations/zh_CN/locking/index.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
index 700df8a2bb70..76a8be9bf78b 100644
--- a/Documentation/translations/zh_CN/locking/index.rst
+++ b/Documentation/translations/zh_CN/locking/index.rst
@@ -14,6 +14,8 @@
 .. toctree::
     :maxdepth: 1
 
+    spinlocks
+
 TODOList:
 
     * locktypes
@@ -24,7 +26,6 @@ TODOList:
     * rt-mutex-design
     * rt-mutex
     * seqlock
-    * spinlocks
     * ww-mutex-design
     * preempt-locking
     * pi-futex
-- 
2.34.1

