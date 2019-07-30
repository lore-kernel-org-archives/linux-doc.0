Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F2DF7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 21:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387672AbfG3VU6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 17:20:58 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33595 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387480AbfG3VUv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 17:20:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id c14so29316222plo.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 14:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44ONowdSlztBIQEZ8M7KxSw1b2hoFMAz6PJ/0W+xxXg=;
        b=MYdDGpp4U8oIsvbKVIe106xriDXDt2HsL7ey1BlQ47Ueozytcr9m4K0kD1zTuiDIUr
         s81G9I+zLn6mpHlhRusMyJTXhU0xiQKG6H1w+TjpUsvrxZP2UJ6+xTm3wvFvOwal8vuW
         Kw41DfrD39NC3wbOQq+/iHnnwakNPOXJMDv1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44ONowdSlztBIQEZ8M7KxSw1b2hoFMAz6PJ/0W+xxXg=;
        b=K96MgzOzGSajIjPckh5qED2oU65bfX95PCvN6junkfiW8cd1DZIklseVlAjeCEJG24
         E484/rXPjo4G1ljO13JRhVs5e7b0JlxPTn/+lxh0vYvrmU0xCIH86pTQZcTbWvtjsWJM
         rLANTzD/USgLJi9UnzCskzmHYgwAmn+Zrc3SZ6kv8O39MtMY8pQ3PXWQ22J0SjIrf2ft
         ZcQcJImkU7uPsokgFurs9q77IBbQ0oV1jG5KSyxj/xL3l/GP/Bse/TuhCJ1G6atG61Jh
         tqmzrF7j54/CsuW3w3gWhAsnfGPP9tDEHy0GaMLHRrxt5PP8/VwKGBcAYFNeGrBZBNlD
         lUDg==
X-Gm-Message-State: APjAAAXqgYTCBXDA3AiPFnFvofRgPxPHVRZHquIhT0cO2Ddd6m1qyxLI
        V+hWgTgffg7Je+8Cgog2e02Lyw==
X-Google-Smtp-Source: APXvYqwSvLy4JdF9PJDCx8oAd5LCxJAQBDlp7X/T7IjGLK5mMyOmj16cBEiWsPXuNBpZ5ITHvwqSmA==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr116375727pla.89.1564521650056;
        Tue, 30 Jul 2019 14:20:50 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n140sm68205686pfd.132.2019.07.30.14.20.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 14:20:49 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Tri Vo <trong@android.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] idr: Document calling context for IDA APIs mustn't use locks
Date:   Tue, 30 Jul 2019 14:20:47 -0700
Message-Id: <20190730212048.164657-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documentation for these functions indicates that callers don't need
to hold a lock while calling them, but that documentation is only in one
place under "IDA Usage". Let's state the same information on each IDA
function so that it's clear what the calling context requires.
Furthermore, let's document ida_simple_get() with the same information
so that callers know how this API works.

Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Tri Vo <trong@android.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 include/linux/idr.h | 9 ++++++---
 lib/idr.c           | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/linux/idr.h b/include/linux/idr.h
index 4ec8986e5dfb..5bb026007044 100644
--- a/include/linux/idr.h
+++ b/include/linux/idr.h
@@ -263,7 +263,8 @@ void ida_destroy(struct ida *ida);
  *
  * Allocate an ID between 0 and %INT_MAX, inclusive.
  *
- * Context: Any context.
+ * Context: Any context. It is safe to call this function without
+ * locking in your code.
  * Return: The allocated ID, or %-ENOMEM if memory could not be allocated,
  * or %-ENOSPC if there are no free IDs.
  */
@@ -280,7 +281,8 @@ static inline int ida_alloc(struct ida *ida, gfp_t gfp)
  *
  * Allocate an ID between @min and %INT_MAX, inclusive.
  *
- * Context: Any context.
+ * Context: Any context. It is safe to call this function without
+ * locking in your code.
  * Return: The allocated ID, or %-ENOMEM if memory could not be allocated,
  * or %-ENOSPC if there are no free IDs.
  */
@@ -297,7 +299,8 @@ static inline int ida_alloc_min(struct ida *ida, unsigned int min, gfp_t gfp)
  *
  * Allocate an ID between 0 and @max, inclusive.
  *
- * Context: Any context.
+ * Context: Any context. It is safe to call this function without
+ * locking in your code.
  * Return: The allocated ID, or %-ENOMEM if memory could not be allocated,
  * or %-ENOSPC if there are no free IDs.
  */
diff --git a/lib/idr.c b/lib/idr.c
index 66a374892482..dbd25696162e 100644
--- a/lib/idr.c
+++ b/lib/idr.c
@@ -381,7 +381,8 @@ EXPORT_SYMBOL(idr_replace);
  * Allocate an ID between @min and @max, inclusive.  The allocated ID will
  * not exceed %INT_MAX, even if @max is larger.
  *
- * Context: Any context.
+ * Context: Any context. It is safe to call this function without
+ * locking in your code.
  * Return: The allocated ID, or %-ENOMEM if memory could not be allocated,
  * or %-ENOSPC if there are no free IDs.
  */
@@ -488,7 +489,8 @@ EXPORT_SYMBOL(ida_alloc_range);
  * @ida: IDA handle.
  * @id: Previously allocated ID.
  *
- * Context: Any context.
+ * Context: Any context. It is safe to call this function without
+ * locking in your code.
  */
 void ida_free(struct ida *ida, unsigned int id)
 {
@@ -540,7 +542,8 @@ EXPORT_SYMBOL(ida_free);
  * or freed.  If the IDA is already empty, there is no need to call this
  * function.
  *
- * Context: Any context.
+ * Context: Any context. It is safe to call this function without
+ * locking in your code.
  */
 void ida_destroy(struct ida *ida)
 {
-- 
Sent by a computer through tubes

