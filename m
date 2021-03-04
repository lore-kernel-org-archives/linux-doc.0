Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D0CC433E9
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 10:33:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D162864F36
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 10:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238668AbhCDKcd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Mar 2021 05:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238661AbhCDKcI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 05:32:08 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E41C0613E7
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 02:30:14 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id e23so7535086wmh.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ileJ8i8PtBYWO//WNWntFWU//j32QRx+BmjBpxepfLE=;
        b=tvmTdM0p73GfZuWLxHXiv2yDFa9iCw2qZ0WMOdYVQ/xrH0Detz9DXMI1vZ78cqq1rO
         FZJgQ1pFkmXtA7oDm61oRVjhgnQxG2Bexztzb171OBm6ll3JleAgBNUD54+Cux9bGGMs
         w4pUH0+gyWw7SI92E9v5XI+vV2rN+HRndqDl8PYgpzd2PPemcplAzZqeQS4grAknekbo
         YD74HYtEFaDRFtYPjGjI1ryuN4UTY9hJuj7q/fG3KkbN+37Jtr+QRay7IZdlw8mdNHn8
         BAzK3GoQf2cHJBO2XYoITa9Y3dyPQG411MRIiW2wOmfsXPVqVFbjcnNDqPYVRY4rroxa
         0gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ileJ8i8PtBYWO//WNWntFWU//j32QRx+BmjBpxepfLE=;
        b=bqPxMo2i5l6DHJ5hLtwc3iLVznTRQw+6yF6be8VabbhDIXyZJU2oYgL8p+MqsM39PM
         K+CYJcZDJP2nRk7ORMJXN5MxdkSTsNZLjj68wQB0+XoaKSK3u8gw3pH8Mr2+IYyEtmDd
         JX60lm5KpFm6/34VTHLnrQk1Kc5Y1+s/lihRPnKbpFaVz+4j/sJYxXr2TWwVRt0MN1d4
         3LnY5YXf71W9SUEOgJuqGl6tR7dbQXG/NpHYzNjrJLRhlFs9760BJ2b7wp9/9n0UXELh
         7/NRj+BCMHlPttMAMhqeyIMSnXnOIGiwCNIq6K/CKuNSarehDES2RCiR493fKSa7Ftob
         eLDw==
X-Gm-Message-State: AOAM530KZgl3k2yobXENZ3UreROH0d9d7/TFBr8QtHgWl7T6ZpOjfYvS
        2JqQaqaG0HFb6ExaG08L88CRo29XfEmM9Q==
X-Google-Smtp-Source: ABdhPJwkM34kJi5nQesphQNuYENooFAw7OGpfBJegp+yS/GnfmJ1rzXhNx1/ymXUxz5/gZVJNcl9WQ==
X-Received: by 2002:a1c:2e8f:: with SMTP id u137mr3197705wmu.178.1614853813151;
        Thu, 04 Mar 2021 02:30:13 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:12 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 08/12] drivers: export device_is_bound()
Date:   Thu,  4 Mar 2021 11:24:48 +0100
Message-Id: <20210304102452.21726-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Export the symbol for device_is_bound() so that we can use it in gpio-sim
to check if the simulated GPIO chip is bound before fetching its driver
data from configfs callbacks in order to retrieve the name of the GPIO
chip device.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/dd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9179825ff646..c62c02e3490a 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
 {
 	return dev->p && klist_node_attached(&dev->p->knode_driver);
 }
+EXPORT_SYMBOL_GPL(device_is_bound);
 
 static void driver_bound(struct device *dev)
 {
-- 
2.29.1

