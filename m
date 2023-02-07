Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06D7C636CC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Feb 2023 11:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbjBGLpa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Feb 2023 06:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjBGLp3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Feb 2023 06:45:29 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C521359A
        for <linux-doc@vger.kernel.org>; Tue,  7 Feb 2023 03:45:01 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id y1so13283390wru.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Feb 2023 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVX+TpCcMgKWMfF13P/1xSiJxqs3IaOghijzEHBL02Q=;
        b=fYH4Tu1PRIpBrT723Ad22c6A/AvDvTrQ4qKhcvZB4vpnDMvYvOQC4xqK+a/6WCT167
         B8G93OOLfOH1XHpy/fII60QMD5Z052LjibbHbFHZxBsZ2AslzyBfZKaj1Sbg3NptXb1A
         MDy4ECTuUHzbpTnOOYkno6p4U0wB6I6gMjCpkyXW9MPL3nFxBPJ9l1McIpE0PgKmrAYA
         qXYRjQXvUBA87LrOu1+vI0ePubeSDvjBgXYW6dTUoSYtb4a7qJLdCc1EYKHiMhCcOFXI
         kah8nXhEMPS2vw0A5t07Cyo5NbCSGD0tgYgwZhSCZTw/ldha2ENB1pW3N5ARKrL7AkX1
         da+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVX+TpCcMgKWMfF13P/1xSiJxqs3IaOghijzEHBL02Q=;
        b=0nmDEgoD7HylQ/1s2rU3Hmvp5h2AqfuhSvWA1h8NVK7ch/Uu+XS1T8bnBIRw8T2Ppd
         AXBdtzdYgmgeTOW9A3Fygf8GvQxKsKL44JnC6XpxW9GasnuxJAUeChTetTWx+9U/87gn
         qHfJAhle3MqYS5XhH/BxWy4swPmyO/XbLnd3JcA0/RHlbWO8Xcbd7CjqZTIrpyU++tYZ
         WX+8vPtOD+9ZAHC7NgwJL+QHtO7TT43kXCL+fDSJMWxDxYfh7i97lCXPQCjXnnzNDEZb
         i5JEYFu7wui3pGw9ywO/t4de5PRk2j4fktgqtXX2ttO8GVM1LidCxuYmvOIynTwVZj3t
         LSvQ==
X-Gm-Message-State: AO0yUKW7AQVjLMpvycxq4EI/Us/y64QmmXNOO2fhSbsfcMrvzb+BqnbE
        sbXQ2VetZO+S0clVi3XjUkV+GdbS6j81/Lwx
X-Google-Smtp-Source: AK7set+Ez1H2zbNuov8yNoBE/j9lun0UQrkKfNkULRyHIbcUAacyqoj0sPI3nVN6xF1nHw4KYHMZIw==
X-Received: by 2002:a05:6000:4d:b0:2bf:b506:e0eb with SMTP id k13-20020a056000004d00b002bfb506e0ebmr2026077wrx.51.1675770299988;
        Tue, 07 Feb 2023 03:44:59 -0800 (PST)
Received: from usaari01.cust.communityfibre.co.uk ([2a02:6b6a:b566:0:c04f:2463:c151:8b87])
        by smtp.gmail.com with ESMTPSA id i14-20020a0560001ace00b002bfb8f829eesm11726612wry.71.2023.02.07.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 03:44:59 -0800 (PST)
From:   Usama Arif <usama.arif@bytedance.com>
To:     songmuchun@bytedance.com
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, fam.zheng@bytedance.com,
        liangma@liangbit.com, Usama Arif <usama.arif@bytedance.com>
Subject: [PATCH] docs: mm: Fix number of base pages for 1GB HugeTLB
Date:   Tue,  7 Feb 2023 11:44:56 +0000
Message-Id: <20230207114456.2304801-1-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

1GB HugeTLB page consists of 262144 base pages.

Signed-off-by: Usama Arif <usama.arif@bytedance.com>
---
 Documentation/mm/vmemmap_dedup.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index a4b12ff906c4..689a6907c70b 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -1,3 +1,4 @@
+
 .. SPDX-License-Identifier: GPL-2.0
 
 =========================================
@@ -17,7 +18,7 @@ HugeTLB pages consist of multiple base page size pages and is supported by many
 architectures. See Documentation/admin-guide/mm/hugetlbpage.rst for more
 details. On the x86-64 architecture, HugeTLB pages of size 2MB and 1GB are
 currently supported. Since the base page size on x86 is 4KB, a 2MB HugeTLB page
-consists of 512 base pages and a 1GB HugeTLB page consists of 4096 base pages.
+consists of 512 base pages and a 1GB HugeTLB page consists of 262144 base pages.
 For each base page, there is a corresponding ``struct page``.
 
 Within the HugeTLB subsystem, only the first 4 ``struct page`` are used to
-- 
2.25.1

