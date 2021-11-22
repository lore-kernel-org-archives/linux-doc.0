Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADBEC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 22 Nov 2021 07:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238847AbhKVHor (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 02:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238845AbhKVHop (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 02:44:45 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1565C061574
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:41:38 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id y7so13398129plp.0
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Ct+aawuSx9yZttGmaPxBr9XXLySNX24vW/KPBymGYg=;
        b=d7J86Sbn5Hjgqj4ydKbljglpPUK+8vysMlCfN+6jdfyo0VDWuozD/T7taiwBNHy5C3
         GxZo2WSgxq2JiVTeoVda2ASP8y0fEiHzMqE29tGase9s+4D7eGbMWNCD8uCXMjsEMVQV
         3tpYftEGkWHShIw8+nbTnEsNQ/cme5/ZNFj+IrKtrziUq0oqCH0vrndXcQbNaAbZHryR
         6Qpb2M0T0I3Tuq1KACZYcC4kQOGqTtuOX7LtH8w43goLK7cnNGawMhGImis1IaUl31/C
         CeIEXj8qoaBj+/Y7QDoaqMW3x6rleDSHPW05x3XiqCE7Z2bbHqCJlBkuRxLhX8IJzY+d
         CmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Ct+aawuSx9yZttGmaPxBr9XXLySNX24vW/KPBymGYg=;
        b=oXprBCI2UabTOd+/2r+o+G0ZdAcyQuN6VWifRPRXwy1bPFFyQYLgpeVS5OO64lcyfh
         VJ9Z+Qnl+raRMP+Lanu0n9yCkYPdY1nUM2+680+jOOGKpLuxeiZJHtp4KzjUioIQxD4j
         FHVmXFcUEuIsc5wmEdtpCXKHHtkZx/wm0LU4k43frstWQCVBpFcXWPcP5A+mtt9ho16w
         k0UsIQasgSwqlArJ+7zrWSJjcxB7tRECQjxO4dw0Sd4uFRE3+Qe9UHcN88l7DuuakbWs
         dikpkb76aDROPngjD+vrht3mNt6PMZvUQ4yHW9VG+QCmlzAtrDtyWBMuHxCmugCstTiY
         J3GA==
X-Gm-Message-State: AOAM533rp6XK+DK0RE77jLC0I2aoHRuGv9xIIbc4vN3eawRjbwkNrGzA
        CiqIoneFkqhaJv4/bqHobuvUuDLCnCNYJA==
X-Google-Smtp-Source: ABdhPJzvyjwAuIlz6ZOhAuZenRvvZfWGShme6AekYtB3B/ohj1izAJCoeuqo9gNopuQb2IPHk8ZYUA==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id mw10mr29267783pjb.89.1637566898353;
        Sun, 21 Nov 2021 23:41:38 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id x17sm7447712pfa.209.2021.11.21.23.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 23:41:38 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 1/2] docs/zh_CN: move sparse into dev-tools
Date:   Mon, 22 Nov 2021 15:40:28 +0800
Message-Id: <0f1182add7afe4e3b42398353a823d1b4dcf5147.1637565886.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1637565886.git.siyanteng@loongson.cn>
References: <cover.1637565886.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

../zh_CN/saprse.txt is alone at here, let's move it to ../zh_CN/dev-tools/sparse.rst.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/dev-tools/index.rst            | 2 +-
 .../translations/zh_CN/{sparse.txt => dev-tools/sparse.rst}     | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/translations/zh_CN/{sparse.txt => dev-tools/sparse.rst} (100%)

diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
index 0f770b8664e9..77a8c44cdf49 100644
--- a/Documentation/translations/zh_CN/dev-tools/index.rst
+++ b/Documentation/translations/zh_CN/dev-tools/index.rst
@@ -22,13 +22,13 @@ Documentation/translations/zh_CN/dev-tools/testing-overview.rst
    :maxdepth: 2
 
    testing-overview
+   sparse
    gcov
    kasan
 
 Todolist:
 
  - coccinelle
- - sparse
  - kcov
  - ubsan
  - kmemleak
diff --git a/Documentation/translations/zh_CN/sparse.txt b/Documentation/translations/zh_CN/dev-tools/sparse.rst
similarity index 100%
rename from Documentation/translations/zh_CN/sparse.txt
rename to Documentation/translations/zh_CN/dev-tools/sparse.rst
-- 
2.27.0

