Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AB7C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 00:20:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3173464E41
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 00:20:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbhCSATo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 20:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbhCSATZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Mar 2021 20:19:25 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14396C06174A
        for <linux-doc@vger.kernel.org>; Thu, 18 Mar 2021 17:19:25 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso3959570pjb.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Mar 2021 17:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZKNqGcOFxnFSs+j920f1ACx3dBPREyNqpSB4Op9FM0=;
        b=Wwfmgkl3bG+O7E491clTkH0eDowPADxO1n6D+OrTTR30ODfRwtYMm7csN7XZ8yhHwe
         5UysRM0FEJhlAavRP3Ccc8I5S+SqKIWMXbYVp9FP/cG2khzhwhXccBOllTR7AzvmJ+JV
         GPjZc0oCqWIzH6bIP5JmKgyYnsuOMiH8dSETdpem0h0f+FcDIf5hA3sp9axDPaWGcKKj
         AG0b2z8KTb2IH+cwQaloDUAK/9BuLJTAbeiWySoiuNLXGZ98TGnzFypUTc/7x3Ka8r/r
         60eNhnzrHQEdkdiQ7uZBkeuYHaSZ4PHgjJFQw9YV5S5fpQ1HM8r3lAYCaX4MNhr9exMc
         wsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ZKNqGcOFxnFSs+j920f1ACx3dBPREyNqpSB4Op9FM0=;
        b=qaQOEyiXmZhtOhvahNusRF7anxv57rhbhwq8cAk6Mc26hTOb9NkmxVZ6ZmQAKRahqK
         NCy6YneQb49Jb9/7q+LjMswVED/sUEFH2Eph8LhVuOT8snVJv7wTA3TtMObjSkx06DMG
         1TpfEicYq5pC2dVZ2eiUEYkjZYsLE3eAgohPk2qnZesOqXdudP3NkP2nvExWzzYac5Rx
         MZkF87+TXZkCbJwTIz+fVWVCi2CYZt+Agg3V3qYn9/xhHftyw+1O1q+kAXrcH1Ajquck
         W3sww1x+Y6U/QrU38NW9ieIsjAU5ZRpnDA80+VOzUXhI2GC7yJqHGMEa2krPkD3p8F6J
         liHQ==
X-Gm-Message-State: AOAM533pr5BtxD68PV5r7UwqNHAQbykBk4IucK0vFTp8BrDcmjRkhfE1
        BvuAYNQ6iQt2IymticRuj88//g==
X-Google-Smtp-Source: ABdhPJy+uyjOXGMNwa+7j/841CLC8G7jeCZfYyhN4rmIXFvOQI92oX+2B9aundDKnp/uxMnfeJiY1A==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id q10mr6869944pjv.113.1616113164491;
        Thu, 18 Mar 2021 17:19:24 -0700 (PDT)
Received: from hermes.local (76-14-218-44.or.wavecable.com. [76.14.218.44])
        by smtp.gmail.com with ESMTPSA id 3sm3404458pfh.13.2021.03.18.17.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 17:19:23 -0700 (PDT)
From:   Stephen Hemminger <stephen@networkplumber.org>
X-Google-Original-From: Stephen Hemminger <sthemmin@microsoft.com>
To:     paulmck@kernel.org, corbet@lwn.net
Cc:     rcu@vger.kernel.org, linux-doc@vger.kernel.org,
        Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH] docs: Use my proper surname
Date:   Thu, 18 Mar 2021 17:19:16 -0700
Message-Id: <20210319001916.136666-1-sthemmin@microsoft.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Stephen Hemminger <stephen@networkplumber.org>

Fix my name in the RCU background file. I don't use Steve.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 Documentation/RCU/RTFP.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
index 3b0876c77355..588d97366a46 100644
--- a/Documentation/RCU/RTFP.txt
+++ b/Documentation/RCU/RTFP.txt
@@ -847,7 +847,7 @@ Symposium on Distributed Computing}
 	'It's entirely possible that the current user could be replaced
 	by RCU and/or seqlocks, and we could get rid of brlocks entirely.'
 	.
-	Steve Hemminger responds by replacing them with RCU.
+	Stephen Hemminger responds by replacing them with RCU.
 }
 }
 
-- 
2.30.2

