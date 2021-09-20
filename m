Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC43BC4332F
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C66A6610CE
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239996AbhITOHt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 10:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236667AbhITOHs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 10:07:48 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C693C061762
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:06:21 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u18so28334320wrg.5
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rszgw5+IRIgYIPRstooWxKsmYzcY2UPUcD6wOQW0cPI=;
        b=5UaL8BsTYUZbOKDQrCIvaPzk34AxuvACSJQz/wk8lCg+Pz0jvWdb+21i2xY//Mvq+n
         4+YnDj9KcXPnxWh1wf/+V04qW2hvgf8GscgZzLUmGgLb4KrdscL5Y7+q5Xf+GiU0+UA4
         EfvmalOT2k/lBwCSu6oickOYj4/buGBS/W+1xmNVrKFoxqNcZyVjt9aTNul9zqFd1u/Y
         MjjKJmzRQNu6GoRuh2Uv+hdxeRO9JPR+GX/8R42MmQASkO8uc6wA7IDD5hKVayviK2zr
         SEAtBlGanLD1rhPDlp/4o4Hf1JSAcuYC33CenuUR4kzlqEuGFWtfYtqisljjH+4u6j2a
         LgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rszgw5+IRIgYIPRstooWxKsmYzcY2UPUcD6wOQW0cPI=;
        b=BHLCKAtWcS8ngMFtwUkcpARoCW6cdS4k0XiPur4OB6r4QJQCirAGKnYzKJxIfphXAd
         SmQXsWuGOsV1PrD1r+lPmzB/8tSbLqkTvM679XKuSUOV+52oHeMzXDOHwNvrdw6lJyKP
         0VQ0eh5/ZKKAFj6cPoy18eXHpI5efV+W7TYWo6krIQ7u3GhD/vro8xkXbzvGtOdVOA/L
         ZG6+zrR/5y0pu9ymxNLfFmf0rMICArvVXQHJCAE5gVC94IxthcBgiwOhMKXnV4FLKCuY
         qf+muTA/x10HSrQCcxKSSsVjbm1yzK7Fu2MspKE62beYifcHGYGEF7dBDeSQx655zzzJ
         ZVtA==
X-Gm-Message-State: AOAM530PFOoylvgh76/noDuPr3TQXHkrIrkGEmUmJErYnIULl1Q+wTke
        tdGxwvpMBM+Hlar0LoQQW+UnFg==
X-Google-Smtp-Source: ABdhPJxNJaonz8rJNT2fVelx3xvSR9rveyJaW2eDOvXsWBtajaRnXFJ+PKoI+OAyV4GuoYrN5pnZhA==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr29248602wro.42.1632146778976;
        Mon, 20 Sep 2021 07:06:18 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id h18sm15801461wrb.33.2021.09.20.07.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:06:18 -0700 (PDT)
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
Subject: [PATCH v5 2/8] configfs: use BIT() for internal flags
Date:   Mon, 20 Sep 2021 16:05:03 +0200
Message-Id: <20210920140509.5177-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210920140509.5177-1-brgl@bgdev.pl>
References: <20210920140509.5177-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For better readability and maintenance: use the BIT() macro for flag
definitions.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 fs/configfs/configfs_internal.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/configfs/configfs_internal.h b/fs/configfs/configfs_internal.h
index c0395363eab9..b1b2a43f6130 100644
--- a/fs/configfs/configfs_internal.h
+++ b/fs/configfs/configfs_internal.h
@@ -44,16 +44,16 @@ struct configfs_dirent {
 	struct configfs_fragment *s_frag;
 };
 
-#define CONFIGFS_ROOT		0x0001
-#define CONFIGFS_DIR		0x0002
-#define CONFIGFS_ITEM_ATTR	0x0004
-#define CONFIGFS_ITEM_BIN_ATTR	0x0008
-#define CONFIGFS_ITEM_LINK	0x0020
-#define CONFIGFS_USET_DIR	0x0040
-#define CONFIGFS_USET_DEFAULT	0x0080
-#define CONFIGFS_USET_DROPPING	0x0100
-#define CONFIGFS_USET_IN_MKDIR	0x0200
-#define CONFIGFS_USET_CREATING	0x0400
+#define CONFIGFS_ROOT			BIT(0)
+#define CONFIGFS_DIR			BIT(1)
+#define CONFIGFS_ITEM_ATTR		BIT(2)
+#define CONFIGFS_ITEM_BIN_ATTR		BIT(3)
+#define CONFIGFS_ITEM_LINK		BIT(5)
+#define CONFIGFS_USET_DIR		BIT(6)
+#define CONFIGFS_USET_DEFAULT		BIT(7)
+#define CONFIGFS_USET_DROPPING		BIT(8)
+#define CONFIGFS_USET_IN_MKDIR		BIT(9)
+#define CONFIGFS_USET_CREATING		BIT(10)
 #define CONFIGFS_NOT_PINNED	(CONFIGFS_ITEM_ATTR | CONFIGFS_ITEM_BIN_ATTR)
 
 extern struct mutex configfs_symlink_mutex;
-- 
2.30.1

