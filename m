Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA1FC433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 03:09:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67939610CC
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 03:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhDIDJV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 23:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233214AbhDIDJS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 23:09:18 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C40C061760;
        Thu,  8 Apr 2021 20:09:04 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id 7so4536223qka.7;
        Thu, 08 Apr 2021 20:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DeoFKgDzb/PHpz6A47B2kvtL5R6Ovuwi47NQyXGXcro=;
        b=BCD/Y6A8089U4z2vz3smj4AAmNwpa2GEv99aXOMtYpLbtEZ1b+GcUeUREWWCKOANvv
         ifif1dyPiK+m+Bv1cUHYi2uwacrJhody9VsKNYvKziEKfW/t2LhH7mNseeFtrh8jLXlg
         UHBSuTdYKcg9Pqf6GniN0yVQ2Z/jfeVmBZuwOZMTKE6A5pr2xaUN73BoqMZPS49TobUz
         Wxd2B7HtN/66xEHPla7tzYNz6Zw0ZsFYVdIcZY3O4jnhD3wunPfwtvFajCzPqkb9oJ6H
         K+0VUggeY8odkHI8roH6LVO8xYxEg53dRR1Px9mZtvRoTGeQg8F1VEKXN0RZUJFiGVx1
         r1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DeoFKgDzb/PHpz6A47B2kvtL5R6Ovuwi47NQyXGXcro=;
        b=SzUtaB+JSICMrCHLbV7mvkDCTvpzQRwYwJxVjZDquJiogLczmXtoF+u+zGKeDFXubf
         h8gwmcdsD5hU97dkvVUlW0feIY7IAmxA/M7TJBOZB4UZOYfMoDA48NAEQP9otSbKdO/Q
         UTnCWmc2nbUZ0SsYKfhQTA7/Gi56/pBpKAdi+NnZK+kRKz4qMaHkFOoiNT+QHT/khTki
         nXDIt6i0Bhmy4R7Ba5ZYNycCZj74D1NhvrxH08rCCuJ0UENe9zXzcygRUHOoSqx9W+GA
         OITx/XsndkS3Fm5pZRlqyb+HiIHYRh1TLRRqp2rnLXL1aU4YcAroHX/kfta+NbskyCOv
         +TfA==
X-Gm-Message-State: AOAM5329vazlWHPGbtqR/SonIo4Ec0eRE5IdHxd0Bg/253hdEpUQBIGn
        DxvOCD4UpfvhDknWN4YUNq0=
X-Google-Smtp-Source: ABdhPJwuFDtwektrH7OD0JfjKrcdFt0JV1cz3gN7K6RLdK/WS9qYe+UmrBzgqLhOT37KU8PmbsUq1g==
X-Received: by 2002:a37:bc43:: with SMTP id m64mr11908200qkf.186.1617937744223;
        Thu, 08 Apr 2021 20:09:04 -0700 (PDT)
Received: from LuizSampaio-PC.localdomain ([2804:14d:5c21:af45:3b27:576c:7dde:37f1])
        by smtp.gmail.com with ESMTPSA id c5sm925408qkl.21.2021.04.08.20.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:09:04 -0700 (PDT)
From:   Luiz Sampaio <sampaio.ime@gmail.com>
To:     zbr@ioremap.net
Cc:     corbet@lwn.net, rikard.falkeborn@gmail.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luiz Sampaio <sampaio.ime@gmail.com>
Subject: [PATCH v5 3/6] w1: ds2438: fixed a coding style issue
Date:   Fri,  9 Apr 2021 00:09:39 -0300
Message-Id: <20210409030942.441830-4-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210409030942.441830-1-sampaio.ime@gmail.com>
References: <20210405105009.420924-1-sampaio.ime@gmail.com>
 <20210409030942.441830-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changed the permissions to preferred octal style.

Signed-off-by: Luiz Sampaio <sampaio.ime@gmail.com>
---
 drivers/w1/slaves/w1_ds2438.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
index 56e53a748059..ccb06b8c2d78 100644
--- a/drivers/w1/slaves/w1_ds2438.c
+++ b/drivers/w1/slaves/w1_ds2438.c
@@ -388,7 +388,7 @@ static ssize_t vdd_read(struct file *filp, struct kobject *kobj,
 	return ret;
 }
 
-static BIN_ATTR(iad, S_IRUGO | S_IWUSR | S_IWGRP, iad_read, iad_write, 0);
+static BIN_ATTR(iad, 0664, iad_write, 0);
 static BIN_ATTR_RO(page0, DS2438_PAGE_SIZE);
 static BIN_ATTR_RO(temperature, 0/* real length varies */);
 static BIN_ATTR_RO(vad, 0/* real length varies */);
-- 
2.30.1

