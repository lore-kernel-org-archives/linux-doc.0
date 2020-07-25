Return-Path: <SRS0=WvMf=BE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFBAC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 25 Jul 2020 02:25:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6336D206D8
	for <linux-doc@archiver.kernel.org>; Sat, 25 Jul 2020 02:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLgWNucl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgGYCZM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jul 2020 22:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgGYCZM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jul 2020 22:25:12 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67686C0619D3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2020 19:25:12 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id il6so701949pjb.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2020 19:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=plNbccrGNuKgYL7jCXUuhHMq/5cuypXgcbP/jbp0W68=;
        b=TLgWNuclqVMP1kwksgnFc3VDTZawBo7RFaPea885RjfO9TaGfEhf2WKRCpTMxonXeI
         CHfr/3oh1b86+LIz5zLO01qU8YMSMmWEhxpK9gnuaX2+BIFtFQ2wrFzGIJHpPuAhhAWa
         Hfm2QeKO8SIQiZlo44mI5EngszSanhLJ3B4lsbGd5jq67PrNTQIPhPF3wPvQg6Mjn5pb
         qTGVT1lyfMgiY1TrLF/NJ9JwRJntWduWD+AnQi7M7HLRax++Yw5NXeWkd7CtvefF/7NE
         3YQmRpz99f8xIyR42K335zKCEOueZbqTvPP0QJ/qgabYlt3UvzEHl9Ym3jMTFCfQ4Hsh
         TLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=plNbccrGNuKgYL7jCXUuhHMq/5cuypXgcbP/jbp0W68=;
        b=HRJOeULnPZmE1fEdrgyIvqOZGFesl3MVMOsjq8sPLyLeSkwsy0WuaZsgCT4Gh0z/Na
         HrZCnfo0MBZP+Yzkw75v5nSm9XjvYsAdVI5U0fvsYgn+9WJiXqXfgXOs2oGk7PZIfTZZ
         lLZTNa3JttpWKmHRAAemftrKCHHaCagMiCkX9WtVT0nH9u6qTgxVYHAd2W59dHhC6vES
         3re3G0xQk5LQT0zSo7b1pvZUoQzl9vI8vP01OP05rr/3PaM0SsaL5yHNuhtEneeqdOVK
         4WLmJrRu5t/q8L1S7iD16t62eQUv5DkOzOnMVAe3Lsexnlcnj7PrS7ruebVl6pMXhJcA
         J4ew==
X-Gm-Message-State: AOAM5306XJDxA89vbpkAJ3drHfTSrdEXThcSQOssebsFgF2Q9jTelv82
        3eYi4tUc9jgXonlYZLHnmt2kiWDr
X-Google-Smtp-Source: ABdhPJxiSC0RwFLKPixkyjDq12bShS6h/pD9rpD1fhS2btXJcztBKp/QEhfiZDxtDB1elNqZ/0pQog==
X-Received: by 2002:a17:902:6194:: with SMTP id u20mr10848465plj.68.1595643911804;
        Fri, 24 Jul 2020 19:25:11 -0700 (PDT)
Received: from huyue2.ccdomain.com ([103.29.143.67])
        by smtp.gmail.com with ESMTPSA id o10sm6847507pjs.27.2020.07.24.19.25.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jul 2020 19:25:11 -0700 (PDT)
From:   Yue Hu <zbestahu@gmail.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, huyue2@yulong.com
Subject: [PATCH] Documentation/admin-guide: tainted-kernels: fix spelling mistake
Date:   Sat, 25 Jul 2020 10:24:44 +0800
Message-Id: <20200725022444.10976-1-zbestahu@gmail.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yue Hu <huyue2@yulong.com>

Fix typo "tis" -> "this".

Signed-off-by: Yue Hu <huyue2@yulong.com>
---
 Documentation/admin-guide/tainted-kernels.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index 71e9184..0fbaa0f 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -38,7 +38,7 @@ either letters or blanks. In above example it looks like this::
 
 	Tainted: P        W  O
 
-The meaning of those characters is explained in the table below. In tis case
+The meaning of those characters is explained in the table below. In this case
 the kernel got tainted earlier because a proprietary Module (``P``) was loaded,
 a warning occurred (``W``), and an externally-built module was loaded (``O``).
 To decode other letters use the table below.
-- 
1.9.1

