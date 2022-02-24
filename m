Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEB8C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 21:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234730AbiBXVY2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 16:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234707AbiBXVYZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 16:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AE9A31A1C59
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 13:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645737824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BY7N70q7sXGBDdrQKQWopMeqmb4Jr71LPGZFNt/ZGqQ=;
        b=KRogMAUMzGH4l7DdfYCt2dNv2QHeQb3CTLhhV57h8tH1o68rgOC2Fv/r6vL0xpslMJx3io
        Xv4ZTiCT9/h1BPfE2gxLJT2rDu4gjXv7ocipi5HsjpYZws/GeXpZAFay8n+VIDacfu3Nrs
        Yl0beAD6CEDtBhcvhMQs5gz4YnJFeeE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-auCoF7F9OuCbm3E96bccbw-1; Thu, 24 Feb 2022 16:23:43 -0500
X-MC-Unique: auCoF7F9OuCbm3E96bccbw-1
Received: by mail-qt1-f198.google.com with SMTP id c2-20020ac81102000000b002de4af72dcbso633987qtj.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 13:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BY7N70q7sXGBDdrQKQWopMeqmb4Jr71LPGZFNt/ZGqQ=;
        b=ld0EpEmrwRahmJwcv9SwzuboLq1nuqfC0gy4mnoRLN8Hx4DmR39uFUpd0jLkv9EE04
         +8hRCsPSsC4f6Q4koVHpAvCkhcncr2nLU71hOtIg8PtWOgkzGnuhP8Mx1UvCN4kZUdag
         iRkrlGcUIuLsvPaGwcqu9/+fdFf9Q/j6PutZyBZForLpjOr0cf6v+7N7+FHB48xQCKJF
         AQ0pdtihWrERSrQJ1CY7rvWUxwKDyRlx5kf7u95XhPNOD1MkLrSh+Ip6hKuKW5I+G2PB
         Saek7qQFE0346RHVVtSGyK5rmp+rrxxK18jNcB8xaHtrP5nCcjeKLqa6elbAPdgr6lUB
         AkFw==
X-Gm-Message-State: AOAM533/SDhyc9Qj1LD6W/VXck3sv02B7FKWkc5oU39BA88KL6YYdE8G
        SeOv0blSs7THMrsjbPHky0H/gRWbZf5/3OFA3/M3G6oJflFrhNNQ8RvKKAEtZU+bsRxTd2eFcnL
        ipbvhO3YGKf0gXmp45/JN
X-Received: by 2002:ac8:5b0d:0:b0:2dd:d99a:9b6e with SMTP id m13-20020ac85b0d000000b002ddd99a9b6emr4144679qtw.643.1645737822550;
        Thu, 24 Feb 2022 13:23:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCZfIYg09SRdJR3eRunjCHeN4Ra4Qf2OqWmWgdEOCswGYk7JiiMJOOGgH5rjNSKefuUMHdug==
X-Received: by 2002:ac8:5b0d:0:b0:2dd:d99a:9b6e with SMTP id m13-20020ac85b0d000000b002ddd99a9b6emr4144664qtw.643.1645737822344;
        Thu, 24 Feb 2022 13:23:42 -0800 (PST)
Received: from halaneylaptop.redhat.com (068-184-200-203.res.spectrum.com. [68.184.200.203])
        by smtp.gmail.com with ESMTPSA id l7-20020a37f507000000b0047b528ef416sm340999qkk.93.2022.02.24.13.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 13:23:41 -0800 (PST)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     corbet@lwn.net
Cc:     peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        longman@redhat.com, boqun.feng@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>,
        Leah Leshchinsky <lleshchi@redhat.com>
Subject: [PATCH] Documentation/locking/locktypes: Fix PREEMPT_RT _bh() description
Date:   Thu, 24 Feb 2022 15:23:12 -0600
Message-Id: <20220224212312.2601153-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With PREEMPT_RT the _bh() version of a spinlock leaves preemption
enabled, align the doc to say that instead of the opposite.

Reported-by: Leah Leshchinsky <lleshchi@redhat.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 Documentation/locking/locktypes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/locking/locktypes.rst b/Documentation/locking/locktypes.rst
index 4fd7b70fcde1..bfa75ea1b66a 100644
--- a/Documentation/locking/locktypes.rst
+++ b/Documentation/locking/locktypes.rst
@@ -247,7 +247,7 @@ based on rt_mutex which changes the semantics:
    Non-PREEMPT_RT kernels disable preemption to get this effect.
 
    PREEMPT_RT kernels use a per-CPU lock for serialization which keeps
-   preemption disabled. The lock disables softirq handlers and also
+   preemption enabled. The lock disables softirq handlers and also
    prevents reentrancy due to task preemption.
 
 PREEMPT_RT kernels preserve all other spinlock_t semantics:
-- 
2.35.1

