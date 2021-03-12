Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23C5C4332D
	for <linux-doc@archiver.kernel.org>; Fri, 12 Mar 2021 09:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 951916512C
	for <linux-doc@archiver.kernel.org>; Fri, 12 Mar 2021 09:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhCLJ5o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Mar 2021 04:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbhCLJ5Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Mar 2021 04:57:24 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2DDC061574
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 01:57:24 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id y16so4460132wrw.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 01:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h87jccumC6oS/Oglf5H2ioMoJmQRJZD6wd7xhfpKIok=;
        b=k9uA7L8IBE1dLEjKA1rPfX2KHcldVoYzn2eOjFbWT8y0IRfeiEiAgKl9bFORFx31XJ
         nZoN752KT0y3/Ax7g9R3kTMvec5r3QQgdhrMbrs/G2OPqBncym7VnDxearbbafhpmEoJ
         oFE6pHOAaE93d/PsyW2nJNbZMJCw2dVSKyEJrZAjqtL6yAHrWrnWYcHTKzWeDoXsfX6L
         WP0n3QvhKi3yX27SWJHWWda3x+gxIWUNkC4NcOKdgSblO/Gn5bnWEvkChO6Ad+2wWAQc
         clVUU0t2p5IQlysAfWwthAM/ur8jBHgzGYAYXEsQv+mSc3DWrm2STj1EQJkNbCxnrV/O
         I+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h87jccumC6oS/Oglf5H2ioMoJmQRJZD6wd7xhfpKIok=;
        b=kAwqSe8bD2i7pJAtYIyHZ96fbeA6LWsu0XY76JM5Z3VWTduqFYVt7dHko3ebZVjc2F
         ehG0629e9ZoBsFeT2k+2x4JimOl/vqGyVkXKdHZ8ZfwzPrLs8vWHTfU9VSDgcEMl2q2E
         WWqYGfdxNfsHDWgykyjT3sDIVgo5Zpv1Ghykgonfy4H6YItWlk4fSO2FAPzDrBsj0O7C
         pYEl7R4me0TtWXBGNreLhlBXy69p2MyPwkTTCnmgsmwAjuI+1c4p18689NN2CoIRcMAa
         +lNYVVTmdC6JJ5XY1IhRkxJfdqX09PRLJOaBKd1zolYmfQI8PGQ+ZLCI5VDGMlcHM+7e
         1lxQ==
X-Gm-Message-State: AOAM531MLhmi/937Kh/zu051BOnv+vBTYfE2PGcOsTxsxJ6OrMqt3MA9
        lRcylY9XSA8j1WXDWUROSRoICA==
X-Google-Smtp-Source: ABdhPJwc3AB9reyfjzyfl77Ve4iOdbEW9ZNUJg2hIrx1noYkusPdsU12AJQoBdNC2hp2UF1JDuQfbg==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr13198246wrt.31.1615543042886;
        Fri, 12 Mar 2021 01:57:22 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id x13sm7031630wrt.75.2021.03.12.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:57:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 01/11] configfs: increase the item name length
Date:   Fri, 12 Mar 2021 10:56:50 +0100
Message-Id: <20210312095700.16277-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312095700.16277-1-brgl@bgdev.pl>
References: <20210312095700.16277-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

20 characters limit for item name is relatively small. Let's increase it
to 32 to fit '04-committable-children' - a name we'll use in the sample
code for committable items.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 2e8c69b43c64..4f76dcc08134 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -27,7 +27,7 @@
 #include <linux/kref.h>   /* struct kref */
 #include <linux/mutex.h>  /* struct mutex */
 
-#define CONFIGFS_ITEM_NAME_LEN	20
+#define CONFIGFS_ITEM_NAME_LEN	32
 
 struct module;
 
-- 
2.30.1

