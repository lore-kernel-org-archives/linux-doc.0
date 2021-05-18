Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EDBC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 17:53:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68A576112F
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 17:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351260AbhERRzJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 13:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351188AbhERRzJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 13:55:09 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19453C061573;
        Tue, 18 May 2021 10:53:51 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id l70so7568668pga.1;
        Tue, 18 May 2021 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zW7NFRkMuQE7Xcq1YVWOhyvBHrzp8Wh/Vsrhh71Nr7o=;
        b=d/HbfcBLVMUPSoYprjKvKAih7Yl55sbm9MPj2sScdzp9a0m2pJwmob8D2o90qEFmwR
         Pxg6Ad4VxXWfEBb8cPYbhATavazADnfrXM8B5x1I4jbzRgXTU1bLTBULOzEwzDc/7sQx
         JGQbtfoULKNYwz9xaC7PP0KCuXQev6ikaa+PELQMz18X/Cv8G2AdiOzyW+6CfEizZl5x
         QpLWmHhVwjkKvLLZ/uCWmK1xbPMcuUc9PF2HOQ0GbYkhlVA4/4JmhZLxxzHePHQ/o/gA
         bEGTIce+psg9LkdV539q7C30aQ3nbe+cRz6uIlOuEVxUf5d0uCIvk2g6mKrIPmaoT7zi
         WSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zW7NFRkMuQE7Xcq1YVWOhyvBHrzp8Wh/Vsrhh71Nr7o=;
        b=tOaqPREsNXTwbDxlNLIl/MXgzyfF13QMEp0D1F6It18lLnM1MLedW59/JuCvt7opDf
         UnbVW7UOM0POYESOQ1Ovqplg9eRjbr+crZwfTB5R7ZCMv/ISQe61AP6rGVNln29RedQJ
         O9z2hk4ZjCyejrrqr3TsCZGe9mmWJB+mr3Wzg/YjVisDemDyzv2AtT55BmNZIVY/vkWf
         xCFhEaeow+gfq4YEeFOlWtRsFgmV8nojpSIWu1y9Zd4tBDfk9MJVu7m8mZT02Bu/MfBp
         oRY7jpwyLuyG5GqsjthSJl1kKm13+FbkDNPCgKOEOnVBj/7g9qGXSc6GqzvyLslhfVaC
         3SQQ==
X-Gm-Message-State: AOAM531qUdi1QaHrwDaF+zyFuQOl7ZWe4mH28ztQNvzV3kDb2j8TBWkL
        v2684eatspD8PHb2ecqLWkQwewBvbMZuaw==
X-Google-Smtp-Source: ABdhPJyH9El/7sLZfmceVPhBkIm4R1WySdPKPd+coyyg0WR6fxUM6uoP7k7yh0LcfxsWTpkv4kTGYA==
X-Received: by 2002:a63:652:: with SMTP id 79mr6354688pgg.293.1621360430387;
        Tue, 18 May 2021 10:53:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:e998:b72d:dcc8:8823])
        by smtp.googlemail.com with ESMTPSA id n8sm12429908pff.167.2021.05.18.10.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 10:53:49 -0700 (PDT)
From:   Aditya Srivastava <yashsri421@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     yashsri421@gmail.com, lukas.bulwahn@gmail.com,
        rdunlap@infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
Subject: [PATCH] gpio: fix kernel-doc syntax in file header
Date:   Tue, 18 May 2021 23:23:39 +0530
Message-Id: <20210518175339.12399-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for include/linux/nsc_gpio.h follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: Cannot understand    nsc_gpio.c
 on line 3 - I thought it was a doc line

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210514

 include/linux/nsc_gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/nsc_gpio.h b/include/linux/nsc_gpio.h
index d7a04a6e3783..342ce97975e8 100644
--- a/include/linux/nsc_gpio.h
+++ b/include/linux/nsc_gpio.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
    nsc_gpio.c
 
    National Semiconductor GPIO common access methods.
-- 
2.17.1

