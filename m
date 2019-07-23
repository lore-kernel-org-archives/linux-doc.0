Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0080E7D917
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Jul 2019 23:07:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfGWXG4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Jul 2019 19:06:56 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:43479 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfGWXGz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Jul 2019 19:06:55 -0400
Received: by mail-pf1-f201.google.com with SMTP id 6so27202057pfz.10
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2019 16:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yhEVR+lyaQktfxSLQ/EB+rshNGy8yD7d36OlQswd69s=;
        b=MpvWJogDMmHQ2qrE16nKlM51a8S8juN4VRqWI7Y7hxGArHYnoMo171MSqnp0UMAbiY
         M4ZsiHyFZy+tNob1BA48IiEW2FawnZr/tAXd6fH1yDW/ZoZIPdrX9l6ar2QptSWdyI2V
         qcDLq3uh/BjJUYlgGyyuZlq7GfmtcSL3jXsz7W1gc6vo0xB1iBOY6ibHPOOl2DnhJ7yT
         +nlx8f/YSL4dLcVNxGGhh2uN6Ahy+VlBKv3B1YJDLXSuS+zi3htFgNC4QyUi0OaVNKjb
         jfpP5V44L+Q65wwreiOiNTae0K3lqfR62T9zMCxFQbkDqkY2fQx6b1MBPVChbBDHy51s
         HkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yhEVR+lyaQktfxSLQ/EB+rshNGy8yD7d36OlQswd69s=;
        b=lOqRRmLokx8DK+JlagsvTy6vbLdm56ij5kZD2O+wlZHicsNFYgBR5InTvgAq6NP4rr
         LVssYV1NXRhHCgB3z/sA+jFyqbsuSYl1P+FlPzPeSx2KUeIPqfIJqxWvj6ArPLBnYuNA
         U/BHULgJv+AIQZ3F9wQ0K/BLplHPdVMqWXlKplD8UArjMzUZdw56o3jI2gC9vThQttaT
         zZFPHyvtvjd3qhHQbwqr5q3JNkeZk6dt9WRDpgja/W1cONwOS7/tAZ3UVg+I941oBDx9
         0Sk5si0ANoY14eq8nCann6QOt1HA+UkCDpwf8BSyH80acoW5K6hDxGdt98UrNoSFa4+8
         ocPA==
X-Gm-Message-State: APjAAAV34qczoBX5UcDhnryZqhL7eMkrZFnCqesCNNhE31rWYz1W/caN
        e92WSE4LHaxms/NQt4NrkQ+OUK2+fsg=
X-Google-Smtp-Source: APXvYqxw57uNDKnlnh6qfncy9p6M/AL26AsgzE3ddNVSUXTIoicDTMYvXmTOpYQ5xpgukSD1KAWW9WK21Qs=
X-Received: by 2002:a63:7a06:: with SMTP id v6mr79320562pgc.115.1563923214813;
 Tue, 23 Jul 2019 16:06:54 -0700 (PDT)
Date:   Tue, 23 Jul 2019 16:05:27 -0700
In-Reply-To: <20190723230529.251659-1-drosen@google.com>
Message-Id: <20190723230529.251659-2-drosen@google.com>
Mime-Version: 1.0
References: <20190723230529.251659-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
Subject: [PATCH v4 1/3] fs: Reserve flag for casefolding
From:   Daniel Rosenberg <drosen@google.com>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-f2fs-devel@lists.sourceforge.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        kernel-team@android.com, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation for including the casefold feature within f2fs, elevate
the EXT4_CASEFOLD_FL flag to FS_CASEFOLD_FL.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 include/uapi/linux/fs.h       | 1 +
 tools/include/uapi/linux/fs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 59c71fa8c553a..2a616aa3f6862 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -311,6 +311,7 @@ struct fscrypt_key {
 #define FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #define FS_INLINE_DATA_FL		0x10000000 /* Reserved for ext4 */
 #define FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
+#define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
 #define FS_RESERVED_FL			0x80000000 /* reserved for ext2 lib */
 
 #define FS_FL_USER_VISIBLE		0x0003DFFF /* User visible flags */
diff --git a/tools/include/uapi/linux/fs.h b/tools/include/uapi/linux/fs.h
index 59c71fa8c553a..2a616aa3f6862 100644
--- a/tools/include/uapi/linux/fs.h
+++ b/tools/include/uapi/linux/fs.h
@@ -311,6 +311,7 @@ struct fscrypt_key {
 #define FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #define FS_INLINE_DATA_FL		0x10000000 /* Reserved for ext4 */
 #define FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
+#define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
 #define FS_RESERVED_FL			0x80000000 /* reserved for ext2 lib */
 
 #define FS_FL_USER_VISIBLE		0x0003DFFF /* User visible flags */
-- 
2.22.0.657.g960e92d24f-goog

