Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ED6C433E7
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 23:17:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F73B20797
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 23:17:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jOLIN5HG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732874AbgJOXRo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Oct 2020 19:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgJOXRo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Oct 2020 19:17:44 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54C0C061755
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2020 16:17:43 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a200so338523pfa.10
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2020 16:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+rVXmKyIACVLQAEQsLnR+KYW2Ry+sP13KrcdyTUrOvo=;
        b=jOLIN5HGAQ/Dd0VHJBgok/wBN9gzJu/zsm5iFFXvoHhb226GshILExBojlROnv8b0y
         r5Qxpf0c+WAaRHK4U7EJhKMsyczMGj2kGVGPSeEE7AnlvtVFXhfGcqxTHNhWMTJNC8pe
         fWAz94cM13lQfVDHr9w87rM5WYM+J8Y3lu64A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+rVXmKyIACVLQAEQsLnR+KYW2Ry+sP13KrcdyTUrOvo=;
        b=AIecOvODaEh1WXwIAuVM86yVNhQyZxTMi/CV/LFD+Ngihc/AHsfX1J2rc23Vt3kjsA
         c9ce96DAlKNTGpjEJcsn2sKuA7ybcsRwkoHQOwAx6U27npd0igJ+vUSqHhTRnpFzhsZT
         2ADF3pciT4++DeKQu4OEcEUz/vazUTFeQ0KlGcB4YQzBUMix1MetXKnqgUmLJkmGAHYc
         u/iLSI6iuBsfunRGmidO7/r/W8i7GyLRos1GW+Vr7AUilWA+FzJeK7f8fqKiJ9kw9hX4
         tdMXQ6Vj9qQYxKzSPzBbz82xQOLc8fWsc8XdiR9rmrCCpWr/86uDYN9i053WBQoJ+yj5
         fpjA==
X-Gm-Message-State: AOAM530YUM9qsPkAigUc3Vw3CgS4N6Nvv7eNVznLVkzXzs886l6c5O85
        PJ6p2el2aLcfM5oK8UBi3uBinA==
X-Google-Smtp-Source: ABdhPJwCXQmFNeXvfkclvNsvCCKyWIk69bItJtNIvSg3kfTgGBEqhu8/85bcvuFKCQkzMK69DfYVDA==
X-Received: by 2002:a62:cfc2:0:b029:151:d47e:119b with SMTP id b185-20020a62cfc20000b0290151d47e119bmr889055pfg.46.1602803863416;
        Thu, 15 Oct 2020 16:17:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a185sm405323pgc.46.2020.10.15.16.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 16:17:42 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [PATCH] docs: deprecated.rst: Expand str*cpy() replacement notes
Date:   Thu, 15 Oct 2020 16:17:31 -0700
Message-Id: <20201015231730.2138505-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The notes on replacing the deprecated str*cpy() functions didn't call
enough attention to the change in return type. Add these details and
clean up the language a bit more.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/process/deprecated.rst | 44 ++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index ff71d802b53d..9d83b8db8874 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -106,23 +106,29 @@ NUL or newline terminated.
 
 strcpy()
 --------
-strcpy() performs no bounds checking on the destination
-buffer. This could result in linear overflows beyond the
-end of the buffer, leading to all kinds of misbehaviors. While
-`CONFIG_FORTIFY_SOURCE=y` and various compiler flags help reduce the
-risk of using this function, there is no good reason to add new uses of
-this function. The safe replacement is strscpy().
+strcpy() performs no bounds checking on the destination buffer. This
+could result in linear overflows beyond the end of the buffer, leading to
+all kinds of misbehaviors. While `CONFIG_FORTIFY_SOURCE=y` and various
+compiler flags help reduce the risk of using this function, there is
+no good reason to add new uses of this function. The safe replacement
+is strscpy(), though care must be given to any cases where the return
+value of strcpy() was used, since strscpy() does not return a pointer to
+the destination, but rather a count of non-NUL bytes copied (or negative
+errno when it truncates).
 
 strncpy() on NUL-terminated strings
 -----------------------------------
-Use of strncpy() does not guarantee that the destination buffer
-will be NUL terminated. This can lead to various linear read overflows
-and other misbehavior due to the missing termination. It also NUL-pads the
-destination buffer if the source contents are shorter than the destination
-buffer size, which may be a needless performance penalty for callers using
-only NUL-terminated strings. The safe replacement is strscpy().
-(Users of strscpy() still needing NUL-padding should instead
-use strscpy_pad().)
+Use of strncpy() does not guarantee that the destination buffer will
+be NUL terminated. This can lead to various linear read overflows and
+other misbehavior due to the missing termination. It also NUL-pads
+the destination buffer if the source contents are shorter than the
+destination buffer size, which may be a needless performance penalty
+for callers using only NUL-terminated strings. The safe replacement is
+strscpy(), though care must be given to any cases where the return value
+of strncpy() was used, since strscpy() does not return a pointer to the
+destination, but rather a count of non-NUL bytes copied (or negative
+errno when it truncates). Any cases still needing NUL-padding should
+instead use strscpy_pad().
 
 If a caller is using non-NUL-terminated strings, strncpy() can
 still be used, but destinations should be marked with the `__nonstring
@@ -131,10 +137,12 @@ attribute to avoid future compiler warnings.
 
 strlcpy()
 ---------
-strlcpy() reads the entire source buffer first, possibly exceeding
-the given limit of bytes to copy. This is inefficient and can lead to
-linear read overflows if a source string is not NUL-terminated. The
-safe replacement is strscpy().
+strlcpy() reads the entire source buffer first (since the return value
+is meant to match that of strlen()). This read may exceed the destination
+size limit. This is both inefficient and can lead to linear read overflows
+if a source string is not NUL-terminated. The safe replacement is strscpy(),
+though care must be given to any cases where the return value of strlcpy()
+is used, since strscpy() will return negative errno values when it truncates.
 
 %p format specifier
 -------------------
-- 
2.25.1

