Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B25AC47435
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 20:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B22A6206D9
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 20:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20150623.gappssmtp.com header.i=@smile-fr.20150623.gappssmtp.com header.b="UgbWx+QL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgI2UnB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 16:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgI2UnA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 16:43:00 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72071C061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 13:43:00 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so6924412wrx.7
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 13:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxgmFTxkf8Q7snkiRmdFU3li5pqox2TGA0gnwiFInxo=;
        b=UgbWx+QLzIaXuWGj5Ky/C2Dh/s+6ClhTiU6nRCRCCG20Ucbaw5PclR+ti4GKk1j6hL
         NofBXmiD6yIiLMFyhMH3RjbPc+RNM/1FW/q6az8FGjQHm3++YOp1Pv+HcKrfVcU9/F2A
         TF0cltucY5XzKDSvLpA+BNJB7ZmkaYuBI6ihPuSvYpaGZiOYHrhikW9LlzVLUQq/O7rx
         rwWQZvd0t65zBXomYpYV0yU+Dv+qRr8+/cEAwaGzelE5JwgYRiPhYqJAbVkp3tdl1zz9
         n2XQeXgqPY+KipSXI1az0+ZSFubPhOWpaAMOiIKE+5UKO6YpC4c+0jZqGGDkj931pc+j
         oxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yxgmFTxkf8Q7snkiRmdFU3li5pqox2TGA0gnwiFInxo=;
        b=f/FxcLyGA+mf/qqEZUGY7swrxD48ncUDrXgQo0OmbtPdI5MmTI4V1/BSJLj7YMFqlJ
         53b1kNiP1q/T+v+X7GxQR/YqZHoG+gnEOeTdCgPjPcxboe8xR9AF+r1x2RaffYnBuvME
         MKX/QmC5b0BYRaL/I++T8imWI/lO2tUy13ksL3vaEKAAR8ssCvPUSnlAcX3HQzZlHyre
         dwf3zl5F0dGT+yi256h9UuHGu/lenS/OthhzLka33Z5lFIFhOPQdvw3bO5pAdw+naIeg
         gOyLZmxpxNYBhVUAMI/HfGZ2c/qxUvmoTlO2Y8PZ7wLwC1Rhkqcxy48rLnMNq0SoMNOV
         vXHw==
X-Gm-Message-State: AOAM531Ep54nbi2PRi3B9IycXzmtIEX1Au2AT1UWX5nO/qbUtXYSQ+sz
        gH9JxABXVqr0uZ1H8HZr7CoaJtfd1DTwuQ==
X-Google-Smtp-Source: ABdhPJw9IC5utvm4ax9rkKU/A7/jQf1cuLDFaUdt5CEfnkoqvrM2W2ynFzUbR7P/w7Jw/uEaYSl2xw==
X-Received: by 2002:a5d:56cd:: with SMTP id m13mr6120637wrw.261.1601412179072;
        Tue, 29 Sep 2020 13:42:59 -0700 (PDT)
Received: from P-ASN-KEVALD.idf.intranet (85-170-108-21.rev.numericable.fr. [85.170.108.21])
        by smtp.gmail.com with ESMTPSA id a10sm6780755wmj.38.2020.09.29.13.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 13:42:58 -0700 (PDT)
From:   Yoann Congal <yoann.congal@smile.fr>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] Documentation: PM: Fix a reStructuredText syntax error
Date:   Tue, 29 Sep 2020 22:41:58 +0200
Message-Id: <20200929204157.26127-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a reStructuredText syntax error in the cpuidle PM admin-guide
documentation: the ``...'' quotation marks are parsed as partial ''...''
reStructuredText markup and break the output formatting.

This change them to "...".

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 Documentation/admin-guide/pm/cpuidle.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/cpuidle.rst b/Documentation/admin-guide/pm/cpuidle.rst
index e70b365dbc60..191cfa4a450b 100644
--- a/Documentation/admin-guide/pm/cpuidle.rst
+++ b/Documentation/admin-guide/pm/cpuidle.rst
@@ -690,7 +690,7 @@ which of the two parameters is added to the kernel command line.  In the
 instruction of the CPUs (which, as a rule, suspends the execution of the program
 and causes the hardware to attempt to enter the shallowest available idle state)
 for this purpose, and if ``idle=poll`` is used, idle CPUs will execute a
-more or less ``lightweight'' sequence of instructions in a tight loop.  [Note
+more or less "lightweight" sequence of instructions in a tight loop.  [Note
 that using ``idle=poll`` is somewhat drastic in many cases, as preventing idle
 CPUs from saving almost any energy at all may not be the only effect of it.
 For example, on Intel hardware it effectively prevents CPUs from using
-- 
2.20.1

