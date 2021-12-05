Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4201C433FE
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbhLENtR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbhLENtQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:49:16 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564BEC061751
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:49 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id m15so7864904pgu.11
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RUj/ZXyHdmeYl1nvZB/1bmK1ByWw3AsgGNIWUtOKeA4=;
        b=dLwuUCtDR4DVcR2ar7QLRDHF4ftMm0pY6mgHeYaXT3e7QZaq7CfzDU9TQS+g8FCjvV
         MD4bjwzzoxc6Qf9Fy3AFvl4PnSEtPTq82poGM7QGzveWJYWwjBHk1WEq9fNOr2K1QDv3
         uo53WcGi9cZGP+FQGBMxVWtP0EvY7fS+qr0fYYRN9PpvXFuA2qW3TEeBOA9CNQoE0jlQ
         ElkS98oOdy4pervx6lUB+HKwwdFByNPAQgHwlhCEl7iJb/poQdZTY7u8KQIF8EHDp6Yq
         BtHakK8fPPQBQHE9oSzRMc9dr0unlYudgw5uc3i3uknZ1YtTo3KlsElcU05lu2s+5Htb
         KHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RUj/ZXyHdmeYl1nvZB/1bmK1ByWw3AsgGNIWUtOKeA4=;
        b=YdVUcch5SGCYNfSMh+C3Vp5INSkEv8oSHvv05cban1nYuMnGaK8WdQDdNtd0BAsf55
         M9fsp6pcpVYHMLGwsTUF7motovNzwbWIqxEjIYgDNoe8mbZLB6jBWXrD8B27IR+5NDgv
         bIAbW6DbEz1E2dW/sfvAtxBTXOSP7CiSZ5yi8VN10VXSKOT8xnqY49wVzOfk5R8JA8JS
         gsyMk456sHsUmwvkx3ycLHojZYyYcEjNmjPX7X1gb9IQs5ABWvLT4/Wb6XaFmrfDWiYq
         Os/kHiF1wA0VDAeVEIEEVvyHQQ+fGsDTbUOBMvpDhfA5S3sNlDXefjUq7cyriYQcVkHM
         gyjg==
X-Gm-Message-State: AOAM530SdGTiCsdW54KU75uM6iBr+bo0xfLEBdq+isokln5ZcA6RIrq0
        jO6ILhuSKsnmtSLxwHei6UI=
X-Google-Smtp-Source: ABdhPJzF7aymWtTOtwEZPaEdqO2FS5BYiHMHKN64Mvt7OUl4Cou3F6+f0QaF0uw1rXc1edRL30WwaQ==
X-Received: by 2002:a63:904a:: with SMTP id a71mr13771394pge.241.1638711948909;
        Sun, 05 Dec 2021 05:45:48 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:48 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 10/11] docs/trace: fix a label of boottime-trace
Date:   Sun,  5 Dec 2021 21:43:59 +0800
Message-Id: <b97a64d10f8d2b9c0ff550c6a7049a21a2ef9d1a.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/trace/boottime-trace.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
index 6dcfbc64014d..efb75ec5bf48 100644
--- a/Documentation/trace/boottime-trace.rst
+++ b/Documentation/trace/boottime-trace.rst
@@ -133,7 +133,7 @@ action option, there are tree-style options under per-event 'hist' subkey
 for the histogram actions. For the detail of the each parameter,
 please read the event histogram document [3]_.
 
-.. [3] See :ref:`Documentation/trace/histogram.rst <histogram>`
+.. [3] See :histogram: Documentation/trace/histogram.rst
 
 ftrace.[instance.INSTANCE.]event.GROUP.EVENT.hist.[N.]keys = KEY1[, KEY2[...]]
   Set histogram key parameters. (Mandatory)
-- 
2.27.0

