Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72240C433E9
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 21:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4420A65250
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 21:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbhCIU7j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 15:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbhCIU7f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 15:59:35 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB8CC06174A
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 12:59:34 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id i9so3814350wml.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 12:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h87jccumC6oS/Oglf5H2ioMoJmQRJZD6wd7xhfpKIok=;
        b=fZVB/QGG9EbB5+T+UR94Xnpw6QNQ921+Fz8r5lwjpB9Khl+Tow82FJsb9Io2XFA5SA
         bR9K9JlxSqYTckTQ3Ts7ONMkXbCR5kGgUKjI0JzOwAnGvXUCTr8Rvi5CA3aoEdGUYinl
         TsgIAftrebZgUyQXtW2B3vq+l6m8gX55cEDN19ZPrpQIejK7HV4eVB/BO4a1pztV21rs
         0SOoqh2pJcdVdlx6ge/S62DsUY3VqZkqx8jcUuM5p7gXS2J6/Uye4re3fJnHwa+69osm
         j8fCAxmQe0CKoNhp3WpA/DyfgxmwqRwtzbympBm/v3uMd/BybE/xDuYS4RR+dnOioZkP
         U92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h87jccumC6oS/Oglf5H2ioMoJmQRJZD6wd7xhfpKIok=;
        b=FSzg4DHydErO8d0dJe/z7Honlnwc2GAn0vTsyiJlycGKpxFtrrPbKVLxdSI+2Zvd65
         qhPZ69tSOlKcU2Svz1fTIUSIY6Zo2lvyW8yVAc9NY6QLnFzBNqdj7xHhBfsbQV2Xmm5B
         UFVt0K7EGuYJ7gALBrzD6eCpIltgolVNg81tZQVZsQ0mvl7oJJWKB7XDaK3qJbQD62aH
         1ehyeVhDXZVbAEb/Naje1gX//pnaVoMrMuhcLy/AhvECZWuHgTxiQNzPeouqZ3iSLjfL
         48RwRnXYW07unO+DECaHjKhySNzryN5dG9WoXrYsKVGRq2VNgQU8jl+d/frV7CIIoo+m
         E67Q==
X-Gm-Message-State: AOAM5308zyKXXkAv3ssE4h+N0i76TPmx41Nh8xdw18NNpPaD4ff9sXOc
        0ZdaV/t7XWDljMb024HFaMPW7A==
X-Google-Smtp-Source: ABdhPJwj2H2vR6x+JBM8OMVIat1b7I4XyvRBqoZlPgrqY7coics7xEB+cMJzqKv3wVFqDlnCyVkg2g==
X-Received: by 2002:a1c:a5cb:: with SMTP id o194mr5962641wme.129.1615323573594;
        Tue, 09 Mar 2021 12:59:33 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:33 -0800 (PST)
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
Subject: [PATCH v3 01/11] configfs: increase the item name length
Date:   Tue,  9 Mar 2021 21:59:11 +0100
Message-Id: <20210309205921.15992-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
References: <20210309205921.15992-1-brgl@bgdev.pl>
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

