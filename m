Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E299DC4332F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 08:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1F1C61267
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 08:47:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234034AbhIVIt1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Sep 2021 04:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbhIVIt0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Sep 2021 04:49:26 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA06BC061756
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 01:47:56 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id w17so4411771wrv.10
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=DZoVchhLRFdzVUSe0yYXFAwpDBWfu1vFZ0e8QBzM0DJRTQ/1IIRN8+wkYnyQ675Stt
         fvnYdZ2fO47NjBy82ZYQNVLi07vzSSdAAQnhqqL6lxF/OHNJiXVVlMF4a7/Y/pqK5I/E
         XeTXT93CXdY3TWrNl1gQ3HfjfPgtdsfqOxY/x1O6NXBWcow6ZNvykFwMk1RpIILJug+z
         5JofUn0Vz7jdiul7TFF1XgvvJR8oJWfa2WJhCxyD2Mnz4jV7AYPOBwCno3ejcw1UhUwW
         wj0WCf7mJjiKIgZIy8hXOmM3jHoJWMRNfSkXyjeQW+HqCcm8cYBY20j120GHWI/t4/zh
         L2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=dy4Z7zaphrRXRmBiJP7EBAxB8q5YyyAZp3YUhUo85vvbpLmKBiaxKCfXhfEATFcfKu
         92/Nk4NQSm1bhSTRC074dAsM70f1mCA+xAhnbcg7OtDXhKEVulfAWWb77zz3a32U76UH
         l5d6vQMWAQTEVQdXmIWIuJG3kkVIOl7HG8fPs2r/wMH8jkX0B4t7ETrwKNVidVgiZy5E
         H2g4NVCS5BqwVSAHQHgWW1uGAOacRypcSihravMLE9rbGrIwD64xIw7CCKebQ50Z3a3k
         Kkb9kadKnImZuXRApxKcLh0ELdgJnaHYZREcQq9ZP4D0lSd64zlp3JnccK2UOPk9MalP
         QRfw==
X-Gm-Message-State: AOAM533S8J+0lrhMEm8w5T3ZQyr5aIbaQaZTkocP4LDxG4SPlpLhFWJf
        ic6qjlYB3LMmckWl4k13pqXTNw==
X-Google-Smtp-Source: ABdhPJxeOvXJdOxLLJLg+I0IFMJsUNCZoiM3vmEEn5yFUSosTs2xx+btmuYiAJ/mjC10thMN/vVaPQ==
X-Received: by 2002:a5d:58c9:: with SMTP id o9mr41027703wrf.279.1632300475255;
        Wed, 22 Sep 2021 01:47:55 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id v10sm1591048wri.29.2021.09.22.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 01:47:55 -0700 (PDT)
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
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v6 1/8] configfs: increase the item name length
Date:   Wed, 22 Sep 2021 10:47:26 +0200
Message-Id: <20210922084733.5547-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210922084733.5547-1-brgl@bgdev.pl>
References: <20210922084733.5547-1-brgl@bgdev.pl>
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

