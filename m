Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EB3C43470
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFFF6613CB
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbhDFHh4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 03:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbhDFHhz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 03:37:55 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D114FC06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 00:37:47 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a7so20352475ejs.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WQDJlaw0FtQm0N9dNhdmtBw67bwGouq09B/Vh9aj0v4=;
        b=G6sj94IIoTtt7IxmOGmJiXpTDYpwa0kvxB6wvAOg5C+LtbIs52DCng15hf+DFlyB38
         rVqLdBAO2DAAsmC/mGWFuUtLEwAUfdx7/xZhmXpbLcxPyOu9ylDno6jYEiptKz14ZLmk
         dOl6LLY6ULoK/2kOb7nvARMhTxbWdwmm0a56PE8Ua4wb09FI/cmNdKMwlYz+EQ5GvKeL
         r8eb18fkkwmA5v9WUB9MRXjF2ZNM02fUhS6UD3JuQyahArlWIiNlP2LST4THF0YgjSje
         2AWDdNYO/m2be2Hp7ktAVh6xiep3Na6qQhbkQzGWFoG8FpI0vBX3KFmlIejHx9G3fEuB
         LHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WQDJlaw0FtQm0N9dNhdmtBw67bwGouq09B/Vh9aj0v4=;
        b=hyADapWdijH21BMoyz2OVGYNQr3+dYq9vmZ/oOhDArUhOTiRkWrSRHRL9/JkMjPjp7
         Ktk8N3omkau0fXvH0NozFGW5IG+HSGwzceSZUT/HOkbisCKlNoS6eyCM+mcBnFQ6TBr5
         xx8APowrT8Q1UGmpugh4fRIMeWHszbXMssE8E7gXmNrZp8Ht9WIe9uvCBs/9Mw+5N6LT
         LdLtmtHdDRH9CAWHb3zyv0SGJUnArj9yzWQvGiOh+axxa/gmUPRMCrWa5rO4mWwEFP9W
         fPjIIGzoFtxPBZAo4QK089jvPsZJkIwHhhr117EOwnGPI54FRdxZvPmONJb3KVzcFXfD
         oD3A==
X-Gm-Message-State: AOAM531J1EgTcEdDz8eAF5cJS84Q4EXuPbvOKV1MfX/+ZafrZvFiwLEG
        FEkYT7NiG+3+6QQbclCFgEg6Tg==
X-Google-Smtp-Source: ABdhPJzNhg99FKLftecF7uaQKNlLMGFGYAm8LAv+c6Dxo3BIxf0CQPx8YGLQzibttwuEA2Rs09orCw==
X-Received: by 2002:a17:906:a51:: with SMTP id x17mr32914560ejf.25.1617694666608;
        Tue, 06 Apr 2021 00:37:46 -0700 (PDT)
Received: from gkim-laptop.fkb.profitbricks.net (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id o6sm12843305edw.24.2021.04.06.00.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 00:37:46 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>
Subject: [PATCH for-next 5/5] docs: Add RTRS/RNBD to the index of fault-injection
Date:   Tue,  6 Apr 2021 09:37:27 +0200
Message-Id: <20210406073727.172380-6-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406073727.172380-1-gi-oh.kim@ionos.com>
References: <20210406073727.172380-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Gioh Kim <gi-oh.kim@cloud.ionos.com>

Add new documents for RTRS and RNBD to the index file.

Signed-off-by: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 Documentation/fault-injection/index.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/fault-injection/index.rst b/Documentation/fault-injection/index.rst
index 8408a8a91b34..669d146af874 100644
--- a/Documentation/fault-injection/index.rst
+++ b/Documentation/fault-injection/index.rst
@@ -11,6 +11,8 @@ fault-injection
     notifier-error-inject
     nvme-fault-injection
     provoke-crashes
+    rnbd-fault-injection
+    rtrs-fault-injection
 
 .. only::  subproject and html
 
-- 
2.25.1

