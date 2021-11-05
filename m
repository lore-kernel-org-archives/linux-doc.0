Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6940C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:23:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4579610FD
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhKEC0P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 22:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbhKEC0P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 22:26:15 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FB6C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 19:23:36 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id q124so12409498oig.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Ct+aawuSx9yZttGmaPxBr9XXLySNX24vW/KPBymGYg=;
        b=camC/Mt7JbMYBrfBE/qFF7s40L2cw5peba3CVk1ZANtGyr6TSMuCFJGPPk7j00PPtd
         Z2PC3BGriWb1Wazpv9GZD3KolidNSh8kJKiar3jkTHyTFMWy48hk7h6E+VwJEfDkiJDn
         RhQpt+GB9g7v6fE/bwxDYjTb8HvIBaafTcs3bfGQAhlY4xvVpJewEcgspzy82127828x
         y1rPc3BjmjMLn+66IGAocv+zlNnepUVUnquduFtoryJYJOqNRygTdqZ7DbFQblNM2OC3
         Wieflu/nNCxDPu+YKfb8CuJ9puNnoXMeGGEOeIpICXL3BEG/0Hd2XZeBdSp28HlCw3l+
         arfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Ct+aawuSx9yZttGmaPxBr9XXLySNX24vW/KPBymGYg=;
        b=FGhrprHTGDpH+77x0+tXE35XCHIf7Y2t2aQhReExsNyZmrnH1OLj3/rYMUNTDEjj4r
         rdW2dS0NqFd+AWqrK/kzcgIt7ipn2vPgLK+Yt3Kbvry0PxtlFbaXwfmZ7ejKF0NYQ39d
         FLN1DKjpOLfxHQ1F3D0rpFlGyTp1avW9FKK7UIvzYMruhW/8XVIGSw8VKn49YwftOEH8
         fp+EciYXVP6IxgoLKgtbt6/GgHffX3As5mJa39ZDlyM3CZa8T4QmiYQKA+B6i4nQUNia
         0XzOGjTGL/2YEYNplVEdnzfv6J71pCqiJQvrkWIqlsKGZ3PfvYDYWqdvc76tpt/ONLMA
         YvQg==
X-Gm-Message-State: AOAM531ggnOjr80bbkb23bVEaNrEI7rlx2tv4R7CWJhItr2CHtnbmSx+
        vqAtXOLTOb3Tbg5wGIRQ7Tk=
X-Google-Smtp-Source: ABdhPJwqXzdP550vnnaMSFQiFpfJysZEG72pinP/W095ddHsyvrAZV6Qu4iKms/Ya4aLO1yikxvJIg==
X-Received: by 2002:a05:6808:1814:: with SMTP id bh20mr20026819oib.0.1636079016100;
        Thu, 04 Nov 2021 19:23:36 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id m23sm1801160oom.34.2021.11.04.19.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 19:23:35 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, src.res@email.cn, wanjiabing@vivo.com,
        bernard@vivo.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 1/2] docs/zh_CN: move sparse into dev-tools
Date:   Fri,  5 Nov 2021 10:22:49 +0800
Message-Id: <651e8f0d523a9da51124d06c4cd53d540c67a457.1636078637.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1636078637.git.siyanteng@loongson.cn>
References: <cover.1636078637.git.siyanteng@loongson.cn>
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

