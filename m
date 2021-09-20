Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B0DC4332F
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:06:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A594610CE
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239931AbhITOHr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 10:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236890AbhITOHq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 10:07:46 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8627EC061574
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:06:19 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x6so30025792wrv.13
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=f0NjFa0ICpmOy6mJy6ZsZplhHyydCU94Zej5JSP9XGx3f63aD7JkDhnUl/PQiZ5OVz
         a8KfewcJ4bjk9bfFwnDv/0Y0Law5wFx6P2JeGfnMis3tdhUbWkya8AV/fp0JehOvKQNA
         ywUEiyoNnkKXI8w7g6zpB2wKnpFn5513svDBs1e9Z4DDTfV6hrQQ6nppp0YcnnhQnT/f
         HlVeo8fC85zeQBOi8u5FIGAa7Pgv/pL1fVIKgSrEvwDO9sKFTkpi/Qtahuro5H9lIC6p
         CPri2/DZ48Ick1PxF68X/tsqN1CVMkSE1xmnpgUyEzWVs+Sfb0soSnvD8ik4cMqIJz7l
         VX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=T+2pSh7WWTUzcLgCu/vFKfuLpTYmu3Ab67w3wd605qaOxEWf6/1ps7TPTYBvOkRLIc
         eW7Cmo2ARnKVVT3VVJM8Iaa1bcMHVuSD+fKXQERbsvUJvxqkfTLB8pQlH5JwtkqlJWsG
         el8NPFL2QSmS5X15VY05jInw9mPjv7ODwLD8l0Rnmh4TYILU8Rv5dYpyq0EU7RH5ktSq
         GeNgYWR0l/au6DvzosOOyaK2yjRvzOBt+wB6/QCgsdSjNXe2YOtopl6Gv7ybesoV5sZC
         Yf2hsB+wbDWERxww27WplH47QMPXb2wngmv0G3o++LNrHzCkD6kIcFE5TyRN5obb86qr
         atYA==
X-Gm-Message-State: AOAM531AeoPwWchRDknOhPnOaR/0UvcC0WQERuQ601ro1+MiNNxAdr8l
        uT7utPN6tI2OTN7fY0OdEoOIlw==
X-Google-Smtp-Source: ABdhPJzN6BmCIpSs6souDrSrdMhgcmcvAj7+/HavXepIjwcdQITU2X2WeMzV4dpqmPFPsrfrTCdprw==
X-Received: by 2002:a5d:6ca2:: with SMTP id a2mr28449768wra.291.1632146778072;
        Mon, 20 Sep 2021 07:06:18 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id h18sm15801461wrb.33.2021.09.20.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:06:17 -0700 (PDT)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 1/8] configfs: increase the item name length
Date:   Mon, 20 Sep 2021 16:05:02 +0200
Message-Id: <20210920140509.5177-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210920140509.5177-1-brgl@bgdev.pl>
References: <20210920140509.5177-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

20 characters limit for item name is relatively small. Let's increase it
to 32 to fit '04-committable-children' - a name we'll use in the sample
code for committable items.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 97cfd13bae51..e398fb2e83b2 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -25,7 +25,7 @@
 #include <linux/kref.h>   /* struct kref */
 #include <linux/mutex.h>  /* struct mutex */
 
-#define CONFIGFS_ITEM_NAME_LEN	20
+#define CONFIGFS_ITEM_NAME_LEN	32
 
 struct module;
 
-- 
2.30.1

