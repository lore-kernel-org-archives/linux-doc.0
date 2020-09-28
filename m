Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88DEC2D0A8
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 10:42:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83D3D2080A
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 10:42:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="YJAh43x/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgI1KmD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 06:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1KmC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 06:42:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2AEC061755
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:01 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k18so621745wmj.5
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HJxyTfrnsVopFxd6wdGP2V3s+TOdQlFPIRoGsXdX7TI=;
        b=YJAh43x/7YALxC/MBRgMjoUjy6KvQ5nmSmrWAGPSmA8CAoFN5Z9yjKirb0OgckpsFV
         73MiUBgz7Pn72N3e9mhgzfl+1RCg3XYEG/Y6rkCEdgw470cAAdiC8Rdbn3FsyQFQiK0k
         07llSY+rmGXla/Aveg5uqpnSjiFD7z3gHt1mqVu6SeeyZf8fGNPqYmUN4Bkyp4bQy2bB
         jvosPX+57HkMBh9MRtLBOX69kMEZjfM1q6DoSZs2TpfgnMTHDEpDG883o8im78mzWBNt
         5rAzy6321VEl/nGT26MbNWLxT24mYsF9z17KcJwVusGlqbswauol094nkEeCee9S9YUs
         D5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HJxyTfrnsVopFxd6wdGP2V3s+TOdQlFPIRoGsXdX7TI=;
        b=VRQmPRMQp5YsD985Qd3aYp65dyxTYEYEYnpyUwC2NKADEetfmy8XsXOp1IUV4vwdlb
         cvdHKAyxXid1PQp+z5g/9VHJmIRhjALrTfsBW5bmDiXUo+86QmQxmAzCz2lgY6tQDuEG
         BIS+7dn266dCB6+LrvOE78woUAhGhojC4jVDXwQbiR3ByfpqBbwRChx7TRlAvkUJCdCg
         S7Jt9cuCRh+9NsIXgPjk/XsfnWurvHPeG5JZQninj9YIi2wRo1wn8XcdjFwT/D3Y1qHr
         LTS2qCMks5/H+KJb06DmrIVF5qqQdzT5XXs0y6Ocl0T2hACYxy7bahS/isxLlS6yCLxt
         Tr2A==
X-Gm-Message-State: AOAM532TgB2le+WQr5chIgLISVO9GI4z1Ox+zqMZ8N2dqz+SWlEpXPlh
        EYtm3nrQxr0TMBpJrfkF823+zg==
X-Google-Smtp-Source: ABdhPJy7HYyDOpIMIkwKLN/DnCF60YJUQIIpnG0t84ueEj63J6ApVr2I3i9LXCoZK5i6kHETvL2NYA==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr910311wmj.171.1601289720594;
        Mon, 28 Sep 2020 03:42:00 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
Date:   Mon, 28 Sep 2020 12:41:47 +0200
Message-Id: <20200928104155.7385-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's a common pattern of dynamically allocating an array of char
pointers and then also dynamically allocating each string in this
array. Provide a helper for freeing such a string array with one call.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/string_helpers.h |  2 ++
 lib/string_helpers.c           | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 86f150c2a6b6..55b25120a1c6 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -94,4 +94,6 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
 char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
 char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
+void kfree_strarray(char **str_array, size_t num_str);
+
 #endif
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 963050c0283e..bfa4c9f3ca0a 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -649,3 +649,28 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
 	return pathname;
 }
 EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
+
+/**
+ * kfree_strarray - free a number of dynamically allocated strings contained
+ *                  in an array and the array itself
+ *
+ * @str_array: Dynamically allocated array of strings to free. If NULL - the
+ *             function does nothing.
+ * @num_str: Number of strings (starting from the beginning of the array) to
+ *           free.
+ *
+ * Passing a non-null str_array and num_str == 0 as well as NULL str_array
+ * are valid use-cases.
+ */
+void kfree_strarray(char **str_array, size_t num_str)
+{
+	unsigned int i;
+
+	if (!str_array)
+		return;
+
+	for (i = 0; i < num_str; i++)
+		kfree(str_array[i]);
+	kfree(str_array);
+}
+EXPORT_SYMBOL_GPL(kfree_strarray);
-- 
2.26.1

