Return-Path: <SRS0=s6Rs=ZN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B28C43141
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 00:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C90AF20878
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 00:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m9XUuPcC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfKUADO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Nov 2019 19:03:14 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36145 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfKUADN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Nov 2019 19:03:13 -0500
Received: by mail-pj1-f66.google.com with SMTP id cq11so579360pjb.3
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2019 16:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xi3KRlSdFLMcd3fOocBKXtSC+7KVxz8BH0njDxz/f8Q=;
        b=m9XUuPcCYx/m0d7JrFXRJrUqj8L/gJ4SWov2KoHVTan86El4s7b3jX8TSU8MVepl+r
         n7VwRQVX/KTuJZUdMZPr4mWEBFjr4kVjy0CQ2d20AGtlpvdDoJRV0dGxoA5nRbEW4g9b
         kH7R52zMn6svW+97e9kWbTez5yBYyjC4vIvBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xi3KRlSdFLMcd3fOocBKXtSC+7KVxz8BH0njDxz/f8Q=;
        b=GenmPBa2+YxjKuTjWD32TZuRdiG4Daw77O8suBpZre6bKyWEjYSV0e+QtPT5V9P1jn
         5vkTi7vTNnf41RHwWU31vXhGhir4MEahFrGA8m5l0hUUuX00cZzkal6p+Q/DnMmb0GSp
         NGkQNQTckxVQefSD0Zuzy1wlfoqLGgr8TZxqfYEb6Sq7HzxYvCEpbx/rTEapjIPPDm1l
         2r+fUP0NRVrwFtjzPZGqYiT2nIhxja7MuIY450PmIsFy3tlLU/SwjJA7+C66TL62C/72
         kC89ULWFxIHhZfnDv85ILKV2JmW2GvCCUwRd+R9govgNgdZpju2MNxgM2Rz7VV8tc71m
         +YzQ==
X-Gm-Message-State: APjAAAVz0oBCMew9mf6vPxsRiJVk19yvn//rBj5En46xhjufXAtC0atd
        GOktmS9dlQuNsU7BGZuGO/MPVQ==
X-Google-Smtp-Source: APXvYqzXage3fd0hSjL8ZKImr7HsDh14K4z1PkgezlYcLvIxzXeADl1KAtX5FExxhsXry7NmKBDaRw==
X-Received: by 2002:a17:90a:1089:: with SMTP id c9mr7603758pja.8.1574294591370;
        Wed, 20 Nov 2019 16:03:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a23sm371220pjv.26.2019.11.20.16.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:03:09 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] docs, parallelism: Do not leak blocking mode to writer
Date:   Wed, 20 Nov 2019 16:03:03 -0800
Message-Id: <20191121000304.48829-3-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191121000304.48829-1-keescook@chromium.org>
References: <20191121000304.48829-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Setting non-blocking via a local copy of the jobserver file descriptor
is safer than just assuming the writer on the original fd is prepared
for it to be non-blocking.

Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Link: https://lore.kernel.org/lkml/44c01043-ab24-b4de-6544-e8efd153e27a@rasmusvillemoes.dk
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 scripts/jobserver-count | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/jobserver-count b/scripts/jobserver-count
index 6e15b38df3d0..a68a04ad304f 100755
--- a/scripts/jobserver-count
+++ b/scripts/jobserver-count
@@ -12,12 +12,6 @@ default="1"
 if len(sys.argv) > 1:
 	default=sys.argv[1]
 
-# Set non-blocking for a given file descriptor.
-def nonblock(fd):
-	flags = fcntl.fcntl(fd, fcntl.F_GETFL)
-	fcntl.fcntl(fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)
-	return fd
-
 # Extract and prepare jobserver file descriptors from envirnoment.
 try:
 	# Fetch the make environment options.
@@ -31,8 +25,13 @@ try:
 	# Parse out R,W file descriptor numbers and set them nonblocking.
 	fds = opts[0].split("=", 1)[1]
 	reader, writer = [int(x) for x in fds.split(",", 1)]
-	reader = nonblock(reader)
-except (KeyError, IndexError, ValueError, IOError):
+	# Open a private copy of reader to avoid setting nonblocking
+	# on an unexpecting writer.
+	reader = os.open("/proc/self/fd/%d" % (reader), os.O_RDONLY)
+	flags = fcntl.fcntl(reader, fcntl.F_GETFL)
+	fcntl.fcntl(reader, fcntl.F_SETFL, flags | os.O_NONBLOCK)
+except (KeyError, IndexError, ValueError, IOError, OSError) as e:
+	print(e, file=sys.stderr)
 	# Any missing environment strings or bad fds should result in just
 	# using the default specified parallelism.
 	print(default)
-- 
2.17.1

