Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F9CC433F5
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 02:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B54060E9B
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 02:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhKCCuB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Nov 2021 22:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhKCCt7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Nov 2021 22:49:59 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666E0C061714
        for <linux-doc@vger.kernel.org>; Tue,  2 Nov 2021 19:47:23 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id bg25so1045165oib.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Nov 2021 19:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7NeBd3Xyn8wLUzd8KhXHaf5WXvPMSoCFtu1Hmk9UI7Q=;
        b=XvhYWsF5ZbBaFAhofZYI00hT51K1z6QXCshHaPoOEoilcGaXIMsyMSH/I8ZWvnQHCO
         5mnyCjpqMTY4tRJ8J1lwrcIxbD3DufmEEkP/biBm7FqAAnydlfcf6c3ODD49CzHZ/fWn
         Gopgkvw0yv9ojjB9OmELtf6pvT1H5q/fkWDHMk6nQph9nZolvrj4TpZQ1ycTpEP+rXHz
         +FnNycUQ6YAcQpy5rrk0CI10h1pA2y/kXXf34PT84JG7hvWeCx2pNWI1MFbQorCrzMnz
         93fckqkGWu/7ZmFuXz9SEJZYxwQhrdE3kUggH1HPqvOD0bd46YnjM3jnGilID6i+2q3A
         /9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7NeBd3Xyn8wLUzd8KhXHaf5WXvPMSoCFtu1Hmk9UI7Q=;
        b=T7ndL7D6fgTnY06DsATXMnkaWxm5aewIUgPk/szxfcu03TzjIG3Q5rSWuWkI+ubpO+
         62xrvhTfsAW3hXKbNclk8NBGxNGtlDf9yGTMm2aqqBpz4EaZT34yJMtGjoKPrPEQLcnk
         J2XyK+TAJDWv9Au5JERuSO3nnKzNHy2cWSptDdLkKw3FpedqwC/dQpA/903SdRPgpeZp
         qladBPGNnV63yfnbHfpHybhIiIGPZNmmsavD+7Rpkl36ujUSG85GtxMQlZLbXqz9SABN
         kSH/msRuo+PzDylEU9zq5krN8JtODRABLBpMcMNUFdlayqGsNj0khEKwd7Q0tLwJjqMs
         SKug==
X-Gm-Message-State: AOAM530buexO1J3oMafilRq5lBpzqqT7H6fMwDnMyD0l6EWrCMEx1vX/
        n/JvJc12br3wOt/IAZ26b1DjVFjsySpKE1LM
X-Google-Smtp-Source: ABdhPJylN3vkgxYfMEU7L0S5ESVAiASJ13PGyAzALWji2gOQmOjj5PB78Pz5M31bF/UtlfZuarpbvQ==
X-Received: by 2002:a05:6808:1151:: with SMTP id u17mr8153006oiu.38.1635907642847;
        Tue, 02 Nov 2021 19:47:22 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id y4sm220303ots.73.2021.11.02.19.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 19:47:22 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, src.res@email.cn, wanjiabing@vivo.com,
        bernard@vivo.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/2] docs/zh_CN: move sparse into dev-tools
Date:   Wed,  3 Nov 2021 10:46:31 +0800
Message-Id: <7189503a545b8452ce5a8b5f9ce4b0df1711128a.1635907089.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635907089.git.siyanteng@loongson.cn>
References: <cover.1635907089.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

../zh_CN/saprse.txt is alone at here, let's move it to ../zh_CN/dev-tools/sparse.rst.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

