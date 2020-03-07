Return-Path: <SRS0=doD2=4Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE32FC10F28
	for <linux-doc@archiver.kernel.org>; Sat,  7 Mar 2020 02:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A64772070A
	for <linux-doc@archiver.kernel.org>; Sat,  7 Mar 2020 02:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G0s2YXUs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgCGChI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Mar 2020 21:37:08 -0500
Received: from mail-pl1-f201.google.com ([209.85.214.201]:45217 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgCGCgt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Mar 2020 21:36:49 -0500
Received: by mail-pl1-f201.google.com with SMTP id s6so1051800plp.12
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2020 18:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=W0NRqN4tKUIiubnsRHwnrkHz9xP0jc5bUIehefjfrK0=;
        b=G0s2YXUs60QGYd1azRm9N+DEtQUa9U2sfAd7n5dRhxO4cGELADBu0RCaWtuzEoewXq
         1VwOG8xo3CB9fbum61PZal2AG/c+LDNuGpC5Dn34tE/7BTiNV7muT/IgD/5qvclPBYsk
         NSksw1pSB68xMWgFtawTFTriTdVmMrqzLqA1fu4hLkqzoe2cf9WuUIC4XADWtB98O0ZP
         Is0GE72LBQG5PVK60mFNlIYkSAAEJG9mDWg9xSGIh35AOUDLTbDtW0UrjNt3C1uYMYei
         R+Ls5Xyc6wNjOVdx/6KOdhkjZoQQphnTOmOyurHwqzeKiBMk6KoHk01PPlq5KUHg417s
         P61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=W0NRqN4tKUIiubnsRHwnrkHz9xP0jc5bUIehefjfrK0=;
        b=ksYxAZEGYxX89dSXZEcNPgl3/Iulzz9gCULxOzXh1YmZ8FgU7l8XYVa4nywnrHqPg+
         hcGDY+lG35kA/WbQLVI9ESHhhjBRq3FNG8Y8OoW0A5/I9oX29Gn/X9PTcRtzPr22MtMw
         vfpnvYsma/+bAuTDsOw0JL/a9PlJ2y6EnKw47aHKEreTiX5CIPRW1HbdQf5zF3Cl3PZE
         DA9zCPMMc8H8CLE9rvCGLSKFM6CCJPhiT1k9p1Xah4wVqm1xUHGbcukZJCzIglx6Me/h
         1TtBwM5gnfCZxe1oc7oN6kyJu77dfuVRwNRPkk5qsAzY+ZxD4Y6sg8fBZnOX5qc312Yf
         H1BA==
X-Gm-Message-State: ANhLgQ0s923cx9F1NaVOl0Rb3nyXAOLahRg1CAseGdcuP42pCT1ZDlPc
        1GIooImnvFAm/+lHSe0V16whS8HuxIo=
X-Google-Smtp-Source: ADFU+vu+t300mRWdVo2OXw72+/s87iy5D1YclwxP2iiwivGLHC6RCrgND3FdQ3hsIGdTsdhsQ7keJGHqVng=
X-Received: by 2002:a65:6715:: with SMTP id u21mr5823467pgf.17.1583548608053;
 Fri, 06 Mar 2020 18:36:48 -0800 (PST)
Date:   Fri,  6 Mar 2020 18:36:09 -0800
In-Reply-To: <20200307023611.204708-1-drosen@google.com>
Message-Id: <20200307023611.204708-7-drosen@google.com>
Mime-Version: 1.0
References: <20200307023611.204708-1-drosen@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v8 6/8] libfs: Add generic function for setting dentry_ops
From:   Daniel Rosenberg <drosen@google.com>
To:     "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
        Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        Eric Biggers <ebiggers@kernel.org>,
        linux-fscrypt@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Richard Weinberger <richard@nod.at>
Cc:     linux-mtd@lists.infradead.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        kernel-team@android.com, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds a function to set dentry operations at lookup time that will
work for both encrypted files and casefolded filenames.

A filesystem that supports both features simultaneously can use this
function during lookup preperations to set up its dentry operations once
fscrypt no longer does that itself.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 0eaa63a9ae037..bdda03c8ece9e 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1474,4 +1474,54 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return ret;
 }
 EXPORT_SYMBOL(generic_ci_d_hash);
+
+static const struct dentry_operations generic_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+};
+#endif
+
+#ifdef CONFIG_FS_ENCRYPTION
+static const struct dentry_operations generic_encrypted_dentry_ops = {
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
+static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+/**
+ * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
+ * @dir:	parent of dentry whose ops to set
+ * @dentry:	dentry to set ops on
+ *
+ * This function sets the dentry ops for the given dentry to handle both
+ * casefolding and encryption of the dentry name.
+ */
+void generic_set_encrypted_ci_d_ops(struct inode *dir, struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
+#ifdef CONFIG_UNICODE
+		if (dir->i_sb->s_encoding) {
+			d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
+			return;
+		}
 #endif
+		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
+		return;
+	}
+#endif
+#ifdef CONFIG_UNICODE
+	if (dir->i_sb->s_encoding) {
+		d_set_d_op(dentry, &generic_ci_dentry_ops);
+		return;
+	}
+#endif
+}
+EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8d20a3daa49a0..dc433bc4f0602 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3389,6 +3389,8 @@ static inline bool needs_casefold(const struct inode *dir)
 	return false;
 }
 #endif
+extern void generic_set_encrypted_ci_d_ops(struct inode *dir,
+					   struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
-- 
2.25.1.481.gfbce0eb801-goog

