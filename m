Return-Path: <SRS0=HYMc=6W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525B6C47254
	for <linux-doc@archiver.kernel.org>; Fri,  8 May 2020 14:10:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2971524955
	for <linux-doc@archiver.kernel.org>; Fri,  8 May 2020 14:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMlbQike"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgEHOKq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 May 2020 10:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726792AbgEHOKq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 May 2020 10:10:46 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D28C05BD43
        for <linux-doc@vger.kernel.org>; Fri,  8 May 2020 07:10:46 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b6so764733plz.13
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2020 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaKF6mC6f1LY/5yUoo/zMTdyx0PJPmP8np6E4nPHHJM=;
        b=RMlbQikeABV2b9Cp4V/M9+HEH/fuSMnaC3lPXK/mMu+OYdv6R5bF5z9mHEvUOeNuOX
         9Nt8Jq73Bpl9HdlSWI5MLYXOECu08QsFSuYCkJa0HgMMBus0BUE2pHmGmXaqtKkxRDcp
         fdNNSkJzkBF3LH4LWYk81fkibmqVhJKE9ggZC/Q8HEnm05ELUgxJk2dIUzdJryOntUgm
         1TZAIHMMa4/qM2a3AZDHBPQ5kaA/7v4xiRKgkKNQisPcSyawoaxmds7LJSodLUZ+9qNj
         Lyin3bGZ4fJ9vvv8qoMXpg3r3gqPdoR94+s3PUFFKbr6jErT5ND0pidGOz47a/zm2qHQ
         Yo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZaKF6mC6f1LY/5yUoo/zMTdyx0PJPmP8np6E4nPHHJM=;
        b=Cpmpncy2aQDcc4D/dyHa57d1rucJaBHt58GONncK53GV5fYh8KYGT5ksBEunh9AErA
         IjWk4Z9WUML/t1Z6MRuAmIIB7tn2eBECeb0d/9O7yrODARzkHqmocUnpIhiZRGDE3w4A
         pbXMJmAOnAmulZ41R47Ym0Wmp6Ie57U7nK4O0DKTmw+OoJWXuhsJuXKsRtR4VW4TBvsL
         m8ilSonf2q4q4XW++h4bA1Jy/kVv7Q+iLrzinh0RHhxgUzr5zCNjITNdUempaN2hblOu
         uFK3P87NyKc/S81cn9McVn7DFWh9kQjOPEA4nB97UkrCj0F+jcOgM2uSP3cyoIRvopah
         C7mA==
X-Gm-Message-State: AGi0PuZ12t1g3PFu4eZvXDHjOsBXZiImiRsF0N4PxOaMwfRswPs3X7ad
        7effjGGpIa7kAXlepQNl+xjU/kAJxVk=
X-Google-Smtp-Source: APiQypI6NVxA+BGbFjRFLdnd/D2ejBSYcZAVQvsi/OCtnZ5ziYqYUwDfeZd6Fqjxp7PdkVtUzNIetQ==
X-Received: by 2002:a17:902:70c6:: with SMTP id l6mr2709003plt.260.1588947045503;
        Fri, 08 May 2020 07:10:45 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id c14sm1472775pgi.54.2020.05.08.07.10.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 07:10:45 -0700 (PDT)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs: vm: page_frags.rst: Fix the reference of stale function
Date:   Fri,  8 May 2020 22:09:24 +0800
Message-Id: <20200508140924.18220-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The __netdev_alloc_frag() has been dropped by commit 7ba7aeabbaba ("net:
Don't disable interrupts in napi_alloc_frag()"). So replace it with
netdev_alloc_frag().

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 Documentation/vm/page_frags.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/vm/page_frags.rst b/Documentation/vm/page_frags.rst
index 637cc49d1b2f..7d6f9385d129 100644
--- a/Documentation/vm/page_frags.rst
+++ b/Documentation/vm/page_frags.rst
@@ -26,7 +26,7 @@ to be disabled when executing the fragment allocation.
 
 The network stack uses two separate caches per CPU to handle fragment
 allocation.  The netdev_alloc_cache is used by callers making use of the
-__netdev_alloc_frag and __netdev_alloc_skb calls.  The napi_alloc_cache is
+netdev_alloc_frag and __netdev_alloc_skb calls.  The napi_alloc_cache is
 used by callers of the __napi_alloc_frag and __napi_alloc_skb calls.  The
 main difference between these two calls is the context in which they may be
 called.  The "netdev" prefixed functions are usable in any context as these
-- 
2.26.0

