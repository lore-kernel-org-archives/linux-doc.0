Return-Path: <SRS0=fuR8=7O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6DDC433E0
	for <linux-doc@archiver.kernel.org>; Mon,  1 Jun 2020 00:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9427120707
	for <linux-doc@archiver.kernel.org>; Mon,  1 Jun 2020 00:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG8zzWMR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgFAApC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 31 May 2020 20:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFAApB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 31 May 2020 20:45:01 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEC2C061A0E;
        Sun, 31 May 2020 17:45:00 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id q11so9819770wrp.3;
        Sun, 31 May 2020 17:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4C9k8kFGqsKzytGdT3Ij/9Jf8pu4ulztWOTpQlL7jE=;
        b=CG8zzWMRvMHva2ZKEx6QfquhsjIwr0YZbMbQQyig8+AuQryUk5cEyW2KB+FJUbHckD
         yM8GYpmO8PtnzfSco8Vig13bTp+JcpS1JXQFFYO3RgV3Pgp/TRZf2cTGVnPDDd0TjMci
         jRkpjfUe7v3TNvWbbj2I2A4DFGVxUn9WiiNjX1XdVTPr4bEAtZNsAG/cxmMDkhFjwFrS
         7+nqbwJfJtjI3F4nOvGvjVKFWFWlglrMOVogbM77Sb+yxDfPoAJNd8453ntv89+h/b78
         O/V2QuRbZJaXYQ2OmJxTMMjwA4jaX9gYJ87x+188UzR8fnO5gFZINTM+AOSUn15y+SSP
         9WOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4C9k8kFGqsKzytGdT3Ij/9Jf8pu4ulztWOTpQlL7jE=;
        b=uM08YP2xc62fnkcPXvJFZc6xv/Xz4VRhBBMkuR9gGWw2IMFYEADLxljPG9ChabBDzY
         G9RqHa5vyMgnycYIB3W5FzqbcxzFWNG8TGk2odcZXe6wNCpqyBBycA1hw/kfWIu81s5W
         Ihyl0gaf2ra1qAJ/wBxyWB4UvZAmqtmKWt+E/bq15Gs6JQzxu/EqcP2bWX4Y/FO4UeZ+
         IycqpcZbbXpDHkl48/WH+ZKYgR07RmiebRTDH86NVu2nbHBTXDa7QPv8aF7u3+n1QTvq
         F9XSnBmQOX8Q3kXSMuujWNnHvIjB0Z+4mzzOhJyGw8rr3c8qT6z1xC8xuXapgPeC3tDB
         hFvQ==
X-Gm-Message-State: AOAM533H0s3TKYGNupUZrg1Ak0793v5cpipuRIl70h4cL2jjVZNhFgfZ
        WVGj8UdJOWeAfUDejG77qcQ=
X-Google-Smtp-Source: ABdhPJxjqlW5NUI3pgSeZt1ha6nqIVwavVw0580zFjcxp2XHLLkByiXNcw5cQmkdJ0d/i12b96rSGQ==
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr19794214wrj.415.1590972298911;
        Sun, 31 May 2020 17:44:58 -0700 (PDT)
Received: from localhost ([46.114.110.178])
        by smtp.gmail.com with ESMTPSA id j190sm10314123wmb.33.2020.05.31.17.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 17:44:58 -0700 (PDT)
From:   Sedat Dilek <sedat.dilek@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vitaly Wool <vitaly.wool@konsulko.com>,
        "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        linux-doc@vger.kernel.org, inux-kernel@vger.kernel.org
Cc:     Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH] zswap: docs/vm: Fix typo accept_threshold_percent in zswap.rst
Date:   Mon,  1 Jun 2020 02:44:49 +0200
Message-Id: <20200601004449.13962-1-sedat.dilek@gmail.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Recently, I switched over from swap-file to zramswap.

When reading the Documentation/vm/zswap.rst file I fell over this typo.

The parameter is called accept_threshold_percent not accept_threhsold_percent
in /sys/module/zswap/parameters/ directory.

Fixes: 45190f01dd402 ("mm/zswap.c: add allocation hysteresis if pool limit is hit")
Cc: Vitaly Wool <vitaly.wool@konsulko.com>
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 Documentation/vm/zswap.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/vm/zswap.rst b/Documentation/vm/zswap.rst
index f8c6a79d7c70..d8d9fa4a1f0d 100644
--- a/Documentation/vm/zswap.rst
+++ b/Documentation/vm/zswap.rst
@@ -140,10 +140,10 @@ without any real benefit but with a performance drop for the system), a
 special parameter has been introduced to implement a sort of hysteresis to
 refuse taking pages into zswap pool until it has sufficient space if the limit
 has been hit. To set the threshold at which zswap would start accepting pages
-again after it became full, use the sysfs ``accept_threhsold_percent``
+again after it became full, use the sysfs ``accept_threshold_percent``
 attribute, e. g.::
 
-	echo 80 > /sys/module/zswap/parameters/accept_threhsold_percent
+	echo 80 > /sys/module/zswap/parameters/accept_threshold_percent
 
 Setting this parameter to 100 will disable the hysteresis.
 
-- 
2.27.0.rc2

