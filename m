Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7B3C4727E
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 11:39:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B588C238A1
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 11:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="a7KuNLrw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbgIXLj0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 07:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgIXLiv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 07:38:51 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004C3C0613D3
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:38:50 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e2so3255393wme.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bCsr6AFFHdHhAugFVMGJohC8JN0hd4nL8k90M/6i7xA=;
        b=a7KuNLrwlM7cvptfMtEqtc5CpObOWJJFH9henQqs6idqfzL5qx7a9wLt2qGL4rT1Qz
         HutCQ1XrFdOs4pQA/nDIfdY6FMVAIEQsMDZlU5mc/CuxvUbDh/zIlSkAGsP6NFHhhnNd
         4p6qhRDO0u8+AeeHYDV1nzUhpue9ar8pyt3JB0SRwKUyE3yfGvNtDXvkGzKkIQnMjJmI
         BXn0xVBLk0iwWyTAtoRm2eP+V4REcHuv7huXbBX3HW4qyd0PxDCNQAo6QX1K6rz6SS8y
         TFsyKVS7ba824hLFuu3AlRdnQMNyxc8FI06nsImBXaOtWSfuZWrgZvoGNTJFCAk3LEzO
         8tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bCsr6AFFHdHhAugFVMGJohC8JN0hd4nL8k90M/6i7xA=;
        b=rKFheshYvVrcge10V/pIYT4/zBYtt9L+djVRPl8MTP+e12O7ZJVl89hW323F3jjWfx
         HsfCbB8WtQgnEawVwoksIvdUW03DEaUX1y4YgthGl1fefeukrvPXpScnWjwdiFZkIdF+
         YC0tnkZzAFw1N+RRZlWXYozWU2LDdZhcz6LQZhApFpqkqo1lfhiDUeL5u6JUXeAVQYCk
         396RJ/K17w51JCOoZpnANjzdJ5zGtGD82WIXAqx43frMnUE27aVwimDN2+gt3o059l29
         DCI3ZcrEpB6vr9nVKnUexYnKq/oIdiJYs6m/0vPulU9fTH8yXWgsxOxIDiNuoPuwV2/1
         PGRg==
X-Gm-Message-State: AOAM532Y8SLDjBHddyy2iUbUYQnpZLWeKEiiHHjTVKcfFvEXhhb/myJr
        vIoMVBv022O5aL8okSGl1wGFyA==
X-Google-Smtp-Source: ABdhPJyE32p6WO+xWXo7rVqwDl6I0AjipMB9OZdrBkbmGOJUcH79pPsUmdL65eiq3Ag6J9S6fIqm7g==
X-Received: by 2002:a1c:b608:: with SMTP id g8mr4552385wmf.106.1600947529507;
        Thu, 24 Sep 2020 04:38:49 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id y207sm3390133wmc.17.2020.09.24.04.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 04:38:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/9] lib: string_helpers: provide kfree_strarray()
Date:   Thu, 24 Sep 2020 13:38:34 +0200
Message-Id: <20200924113842.11670-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200924113842.11670-1-brgl@bgdev.pl>
References: <20200924113842.11670-1-brgl@bgdev.pl>
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
 lib/string_helpers.c           | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

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
index 963050c0283e..56c01ec8a076 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -649,3 +649,25 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
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
+ * Passing a non-null str_array and num_str == 0 as well as NULL str_array and
+ * num_str == 0 are valid use-cases.
+ */
+void kfree_strarray(char **str_array, size_t num_str)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_str; i++)
+		kfree(str_array[i]);
+	kfree(str_array);
+}
+EXPORT_SYMBOL_GPL(kfree_strarray);
-- 
2.26.1

