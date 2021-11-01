Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28662C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 07:51:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 074BD60E8C
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 07:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhKAHxs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Nov 2021 03:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhKAHxk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Nov 2021 03:53:40 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71A9C061714
        for <linux-doc@vger.kernel.org>; Mon,  1 Nov 2021 00:51:07 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id g125so23803693oif.9
        for <linux-doc@vger.kernel.org>; Mon, 01 Nov 2021 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IlxU2qWbScZVRsBajtjXKWOZUMMGb/gG15EQTHp/C8g=;
        b=oNhIv0Mur0d9B5L2FFn7N1h/NmFxV6ZVS8zIuqB2C7n7Ayn5+mz+sXRulK7in661oi
         RcRzJGYoQ36xqPpQJUIkTZJz5H6FGkjEP6k0p8zyTqgLKE3X/F2ip8w7h4xnGm8NU9UY
         tHubbrhtKbSCLURDPzL0b5cnDMSMJlD8s5DWTc3J91sczZBPxlhmiq+Vcl86u5vVWNmI
         RRPmdnNqLuGXvnZlVXYk1b3ulTblMzqgFOHAtLoJBDZm1KHWpN3el0G5CzCDpNQQ7VDV
         jTfIQyPZiRpwXIysg7+nP3gXOnwZE+snQA9kQ5QcY01JPcwdcdecyTDzLn4x4+25WraD
         2MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IlxU2qWbScZVRsBajtjXKWOZUMMGb/gG15EQTHp/C8g=;
        b=zC70oMEE2xo5BoLHwUQ0H2sakbRmtVneiAcbs/Y8v680zETvX7SaTp2+xHZzCag0FA
         OWzw4Djg28Mbk8LhwcCUVrbqzbsUq9kmx+74/kKyT+/q6Taf8B4lbBzRdPPNk2NZsBOk
         O7xkeyy7TXVytnLQ2+eZBoxWBl1IIjOF7BOvmekmL88UZkBlfIakniIMEdjSVehHqlcy
         +95fILWljlG/REpJqNOZ8VgRo+jkPZzNvIkP1QocjzcFYrOLJOi7VY/1Jq+DyScIzeNu
         1Joxxsx+zO0LSJDoqygglgB5n6l1DzSfqCCc2buXGHpsk/ycR1wWjHLzJqaOTCJrv19H
         Ho3Q==
X-Gm-Message-State: AOAM531H33DUv1C8lIV0sECMNKxsYPlPkccL4tOXLzdza2thS4rsFd7I
        3icHLAJlwIkvYehWRqA9IMw=
X-Google-Smtp-Source: ABdhPJwY8miBZdArcmLsaS6Hq7qavAwPAp571DEqkoEJWoNywUXDaWhqiwT9hJ+sBiHZNnuoiN2fZA==
X-Received: by 2002:a05:6808:1794:: with SMTP id bg20mr9487608oib.103.1635753067194;
        Mon, 01 Nov 2021 00:51:07 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id f18sm3921431otl.28.2021.11.01.00.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 00:51:06 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        wanjiabing@vivo.com, bernard@vivo.com
Subject: [PATCH 1/2] docs/zh_CN: move sparse into dev-tools
Date:   Mon,  1 Nov 2021 15:50:21 +0800
Message-Id: <94193474a4ad8c9a4dc5d379728c1d8bb06d3a97.1635752631.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635752631.git.siyanteng@loongson.cn>
References: <cover.1635752631.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

