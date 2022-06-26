Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE96C43334
	for <linux-doc@archiver.kernel.org>; Sun, 26 Jun 2022 12:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234385AbiFZMWV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Jun 2022 08:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbiFZMWV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Jun 2022 08:22:21 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C46DE029
        for <linux-doc@vger.kernel.org>; Sun, 26 Jun 2022 05:22:20 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id h9-20020a17090a648900b001ecb8596e43so6889588pjj.5
        for <linux-doc@vger.kernel.org>; Sun, 26 Jun 2022 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypD0bFGrahWiUnry8ilBxekW6e/uVFm3C6e684/TnuY=;
        b=ip0UNMdGiFhdlHsaRrtQfzrVOlDnkXW0L9xAEvhRpjWqMLoG9Iv5GZSNH72ZKNB3Wq
         7avrwCFpjq3b3ThXC2hlXiM/Cz+HxzQatvxipQZMtAgB1KBoaJRFXorSqV8V8OpbbkMC
         2X9/f5mqTxSZuquPkjybP3yivLX3EWXqNSs/1lQXh47rHMDSOgaiylKbffwbXmrQDaY0
         VYlRvQUbofznYRh4tzrfLbOLLcqUJg4cD6JbDjmyK5jvcRuSfLbJ6lJBWphcoRDX3zxV
         FS8cgVxd4W/76R17J8eMSVUOcfPfygV8C2OBq5kVreeAbjQ2cdfO7fZCPBN5qXVYv1Zi
         Tfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypD0bFGrahWiUnry8ilBxekW6e/uVFm3C6e684/TnuY=;
        b=j++ByUtpR6BMfordczo8JcRh8ClsUna8MNqipu9SzkSxY1q8qMI8pBTTuA2ce44UkD
         Pd/73UBs+GRSWzqmB5QEqGx2QOfExUEzOveCxOtD4OF0EK6W32blg0fj0eCD/I7K7OxQ
         2NjGX2T4/B5OG34vm4+JaN6ie9B8DcHYf6hono6cTQTafBljOH11bSgaMjKcBX4ojvTC
         TvWta1EuMSfjpT5Dmqb3Srnfd4T2JP4FWYvmgF2OZbkW8Gv8ytoqTnnojzZue1Tb3R05
         eYyjk2YZFeml17E5At2EBm+qpzk2z+Iwn/iTFynac2EOkmC7QSgBbtvggtnPC2xSBpFi
         M2eg==
X-Gm-Message-State: AJIora9hfGfm6JOFADmRJkVpjaO2Xb57CNcTuqrldOHcltbGvnGFmtVI
        usbxTrAORiYwX3pSozatyPcsIw==
X-Google-Smtp-Source: AGRyM1uILuyL8k6vDjI5juK0eMH++iNl5A/0jD4wA3yBiAdVuJzOrtp+wY6JSd1zm0BSfZMqnwOKxA==
X-Received: by 2002:a17:90b:2407:b0:1ec:dd93:511a with SMTP id nr7-20020a17090b240700b001ecdd93511amr15170264pjb.212.1656246140026;
        Sun, 26 Jun 2022 05:22:20 -0700 (PDT)
Received: from localhost.localdomain (bb119-74-120-80.singnet.com.sg. [119.74.120.80])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709027e0700b0016a4f3ca28bsm5051994plm.274.2022.06.26.05.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 05:22:19 -0700 (PDT)
From:   yizhou.tang@shopee.com
To:     siyanteng@loongson.cn, alexs@kernel.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, robin.lubin@shopee.com, huangh@sea.com,
        Tang Yizhou <yizhou.tang@shopee.com>
Subject: [PATCH 1/2] docs/zh_CN: Show the Chinese translation of spinlocks
Date:   Sun, 26 Jun 2022 20:22:09 +0800
Message-Id: <20220626122210.56704-2-yizhou.tang@shopee.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220626122210.56704-1-yizhou.tang@shopee.com>
References: <20220626122210.56704-1-yizhou.tang@shopee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tang Yizhou <yizhou.tang@shopee.com>

Last time I forgot to edit locking/index.rst so the Chinese translation
of spinlocks hasn't been shown on web yet.

Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
---
 Documentation/translations/zh_CN/locking/index.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
index 700df8a2bb70..76a8be9bf78b 100644
--- a/Documentation/translations/zh_CN/locking/index.rst
+++ b/Documentation/translations/zh_CN/locking/index.rst
@@ -14,6 +14,8 @@
 .. toctree::
     :maxdepth: 1
 
+    spinlocks
+
 TODOList:
 
     * locktypes
@@ -24,7 +26,6 @@ TODOList:
     * rt-mutex-design
     * rt-mutex
     * seqlock
-    * spinlocks
     * ww-mutex-design
     * preempt-locking
     * pi-futex
-- 
2.34.1

