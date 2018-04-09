Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D13D7E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 12:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751688AbeDIMeY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 08:34:24 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35150 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751507AbeDIMeQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 08:34:16 -0400
Received: by mail-pf0-f194.google.com with SMTP id u86so5715526pfd.2;
        Mon, 09 Apr 2018 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to;
        bh=O6PZxVpv9+XXpSqKxyN0Nkuo3NCnwAALXow3xPSCZ0o=;
        b=JQDmApiOI+cbxtvGDe5/hAlao2ckA9PMe1ntrfdx+T7vtmRV1zh51sTfbqUkDKBhQe
         rITR2dnxWZ+9sOBba0XFxMf8KyH1NViMcmItKU7uqrr55+8oMmdwdFxh5seO/KEfXPHf
         YEe9H2UKI8amG34IprYrvsXVYoo0RHj955etUEv91FJgHF8MAw+dAI8qLPs05FngEOKI
         CCD2iQMo5bnmdaUwnxstLpvRgRBova22CEwyORzbf7UsHy8ZYGSJe9b3BlQzPegkrW7J
         TqTrwgrhiyYDZP7sYtWYwcSqGP/eoDdS+uuhiqY846e+YSOGLr2O0ZesB+PMmPKg1gWC
         uKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to;
        bh=O6PZxVpv9+XXpSqKxyN0Nkuo3NCnwAALXow3xPSCZ0o=;
        b=gEcCp40+MBrQTkw1p6LxdthaetZWwYgwbaLA/dyY2w0mqxHWTLa25h5eeBi341RGb7
         cwY1/VX5Bw/wTEawaNlpnnWTibF1nTAU5ymqxlXaHxuPL6SqJRdJNYZlqB9YTufxrDPP
         FDVqMXWNOkptRsflzPxQOHGPCDoS06xjkbUh7Xcl5v5xoMJvf6HJOSanR/XXjDCmWOqP
         2a//8voBB1KTvGQaWRg02yxb2JJOzLbTueaQoa2E0xj2FIkFP+6+/ADD/wUraeMs/zvC
         MYmgq/3qIrX/Hx5WIdu+n/8QgWXYt0UElus9QXqGW/VQuML5AZC8UqM7yTgi0XHSs/Hz
         xT3w==
X-Gm-Message-State: ALQs6tCl1fd3dJI9gVDIk7yuSVxGgBR1Lb73EFgov94W92gTg/clWdgJ
        vH233hThFSxFhMbZKEQMwKs=
X-Google-Smtp-Source: AIpwx4+vLEtP+UWhVBBj2lQ1b38bgIxU6xcf9HV0bXaPpRZsR+OzyDyfcJr38NTMkBXir/se9h8cFQ==
X-Received: by 10.98.74.17 with SMTP id x17mr17357671pfa.91.1523277256114;
        Mon, 09 Apr 2018 05:34:16 -0700 (PDT)
Received: from localhost (outboundhk.mxmail.xiaomi.com. [207.226.244.125])
        by smtp.gmail.com with ESMTPSA id x27sm712232pfa.134.2018.04.09.05.34.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Apr 2018 05:34:15 -0700 (PDT)
From:   Geliang Tang <geliangtang@gmail.com>
To:     Phillip Lougher <phillip@squashfs.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Geliang Tang <geliangtang@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] squashfs-tools: Add posix acl support
Date:   Mon,  9 Apr 2018 20:34:04 +0800
Message-Id: <711ddb81a0b0e58ca6ee1dd515d85e69b0294234.1523277042.git.geliangtang@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <af77c1f80e2725c4cf1bf106d6add820b3b0eed5.1523276963.git.geliangtang@gmail.com>
References: <af77c1f80e2725c4cf1bf106d6add820b3b0eed5.1523276963.git.geliangtang@gmail.com>
In-Reply-To: <af77c1f80e2725c4cf1bf106d6add820b3b0eed5.1523276963.git.geliangtang@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add posix acl (Access Control Lists) support for mksquashfs and
unsquashfs tools.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 squashfs-tools/read_xattrs.c      |  2 ++
 squashfs-tools/squashfs_fs.h      | 12 +++++++-----
 squashfs-tools/unsquashfs_xattr.c |  4 +++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/squashfs-tools/read_xattrs.c b/squashfs-tools/read_xattrs.c
index 42106f5..8ef8291 100644
--- a/squashfs-tools/read_xattrs.c
+++ b/squashfs-tools/read_xattrs.c
@@ -64,6 +64,8 @@ static long long xattr_table_start;
  */
 struct prefix prefix_table[] = {
 	{ "user.", SQUASHFS_XATTR_USER },
+	{ "system.", SQUASHFS_XATTR_POSIX_ACL_ACCESS },
+	{ "system.", SQUASHFS_XATTR_POSIX_ACL_DEFAULT },
 	{ "trusted.", SQUASHFS_XATTR_TRUSTED },
 	{ "security.", SQUASHFS_XATTR_SECURITY },
 	{ "", -1 }
diff --git a/squashfs-tools/squashfs_fs.h b/squashfs-tools/squashfs_fs.h
index afca918..040035c 100644
--- a/squashfs-tools/squashfs_fs.h
+++ b/squashfs-tools/squashfs_fs.h
@@ -122,11 +122,13 @@
 #define SQUASHFS_LSOCKET_TYPE		14
 
 /* Xattr types */
-#define SQUASHFS_XATTR_USER		0
-#define SQUASHFS_XATTR_TRUSTED		1
-#define SQUASHFS_XATTR_SECURITY		2
-#define SQUASHFS_XATTR_VALUE_OOL	256
-#define SQUASHFS_XATTR_PREFIX_MASK	0xff
+#define SQUASHFS_XATTR_USER			0
+#define SQUASHFS_XATTR_POSIX_ACL_ACCESS		1
+#define SQUASHFS_XATTR_POSIX_ACL_DEFAULT	2
+#define SQUASHFS_XATTR_TRUSTED			3
+#define SQUASHFS_XATTR_SECURITY			4
+#define SQUASHFS_XATTR_VALUE_OOL		256
+#define SQUASHFS_XATTR_PREFIX_MASK		0xff
 
 /* Flag whether block is compressed or uncompressed, bit is set if block is
  * uncompressed */
diff --git a/squashfs-tools/unsquashfs_xattr.c b/squashfs-tools/unsquashfs_xattr.c
index 59f4aae..34aae84 100644
--- a/squashfs-tools/unsquashfs_xattr.c
+++ b/squashfs-tools/unsquashfs_xattr.c
@@ -57,7 +57,9 @@ void write_xattr(char *pathname, unsigned int xattr)
 		if(user_xattrs && prefix != SQUASHFS_XATTR_USER)
 			continue;
 
-		if(root_process || prefix == SQUASHFS_XATTR_USER) {
+		if(root_process || prefix == SQUASHFS_XATTR_USER
+				|| prefix == SQUASHFS_XATTR_POSIX_ACL_ACCESS
+				|| prefix == SQUASHFS_XATTR_POSIX_ACL_DEFAULT) {
 			int res = lsetxattr(pathname, xattr_list[i].full_name,
 				xattr_list[i].value, xattr_list[i].vsize, 0);
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
