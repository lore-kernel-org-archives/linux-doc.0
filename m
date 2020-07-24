Return-Path: <SRS0=Lhqp=BD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7C3C433DF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jul 2020 14:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A19B2063A
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jul 2020 14:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmdib/XC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGXOPe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jul 2020 10:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgGXOPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jul 2020 10:15:33 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEA1C0619D3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2020 07:15:33 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w17so4479166ply.11
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2020 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d58aIu4Dp6v66ExV1HC6GhdiwV5NKi862vsB1gXmiJ0=;
        b=rmdib/XCBvhLyrmkwusRRPP6n4JYdvrCUzNb2+2UTePNCD+ri17rYtUfx/2GGcWKP7
         zKC6EV7J9Tn2cJ9RmWA6gdC+DsGVDsooDkdJyjY5h6T62108Ch1P55xWQWc1xnoFk1Ce
         OZfAZ20Yg3pR0hxrVspo9ewzmN1DgALwto4tnLYGPWahrejBbSIPR3diyxwOquDZtMxh
         fASbkDjluM2/ZEmPfs58cwNTz9U5HHVhhSYE1ZQRa7blnBdKkUp02vuxoGrAJ22dYQmf
         p7UQOnvbc+Ef8BYrJM7/gcvibw+CV7jPFyd7beTmKUOfUrOBN7XiyYxNV8NSmymKN19P
         LBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d58aIu4Dp6v66ExV1HC6GhdiwV5NKi862vsB1gXmiJ0=;
        b=CwXXzqdGlXIk/n7Q8/pYQsbQgjBLAQ1dHX5o3k1w8rdhOuWX2K8ZahkJFN95676XDg
         kp1GrvsclE4LwNjDumTNbUvl302S+kKS7uDwUEgMy0CCWxDuT6K3mKpELOfJWYScDBuG
         4MDRhorHnrDLoh3GY6uKa1YH3nJQ1XDChenQMN6aivlCyeHkbcilp3yeqMF0WAmrGwAg
         dsdU/zqPxgnZ8HpnDTiBoijk0/x63uEKELnfjicEJYlKM8k1+YsrUK8oGV22OnXezTH+
         D767c7XZ/ixw8D9tfOerBBemtlWsiV7bYYYdl27aGUtqoDi9d7E/JT+cTGfKHLLGNXsF
         kZKQ==
X-Gm-Message-State: AOAM530/zY3mYDsUsY2ODVzjfH/SxGOGz7V7etequb5jkiQpcocZqcSv
        K/hjryEWNbSYjJZ9Z4tmdKk=
X-Google-Smtp-Source: ABdhPJzgc/rIP1cCwrQ3oroSd0Fmg9kdJ7uiLsXNWAKZfGQJRwl0kcQennFvGmrmIObWn2+khRb+Lw==
X-Received: by 2002:a17:90a:290e:: with SMTP id g14mr5793753pjd.85.1595600133285;
        Fri, 24 Jul 2020 07:15:33 -0700 (PDT)
Received: from localhost.localdomain ([185.212.170.182])
        by smtp.gmail.com with ESMTPSA id t1sm6393700pgq.66.2020.07.24.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 07:15:32 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     corbet@lwn.net
Cc:     mchehab@kernel.org, linux-doc@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] docs/binfmt-misc:Change backtick to apostrophe
Date:   Fri, 24 Jul 2020 19:42:09 +0530
Message-Id: <20200724141209.32627-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch changed the backtick to apostrophe.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
Jon,
 I have changed as per your suggestion.Sorry about picking all the nits.

 Documentation/admin-guide/binfmt-misc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
index 0f5f82236853..e2abd08b985c 100644
--- a/Documentation/admin-guide/binfmt-misc.rst
+++ b/Documentation/admin-guide/binfmt-misc.rst
@@ -83,7 +83,7 @@ Here is what the fields mean:
       ``F`` - fix binary
             The usual behaviour of binfmt_misc is to spawn the
 	    binary lazily when the misc format file is invoked.  However,
-	    this doesn`t work very well in the face of mount namespaces and
+	    this doesn't work very well in the face of mount namespaces and
 	    changeroots, so the ``F`` mode opens the binary as soon as the
 	    emulation is installed and uses the opened image to spawn the
 	    emulator, meaning it is always available once installed,
-- 
2.26.2

