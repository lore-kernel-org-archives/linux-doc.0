Return-Path: <SRS0=doD2=4Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312AFC10F00
	for <linux-doc@archiver.kernel.org>; Sat,  7 Mar 2020 02:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 020742072D
	for <linux-doc@archiver.kernel.org>; Sat,  7 Mar 2020 02:37:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="maDP+sv7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgCGCgm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Mar 2020 21:36:42 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:50737 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgCGCgl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Mar 2020 21:36:41 -0500
Received: by mail-pf1-f201.google.com with SMTP id r13so2787547pfr.17
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2020 18:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=eY0o7zJ9ID5RkUnCQ8ZBfY0aWmEieO+fgK45vUzTAmI=;
        b=maDP+sv7S5sg7dJ+wIj5K1mw8zKYw8OcIiPukgjB9zxHUGo+On7L3GC+ARA2qoCFrt
         vIBGoqJloHTM/uAbxgHebuEJeJ19PSqBv2MSP1dpjQIjklO815/0Gc247hDyju9YBpEr
         ICpkbEMJkPCMECSkW1EC4lwQYrxUSD65UPtAsURE+TGRjcHtmTS9w4izqCAdZkWq+KXs
         2b9n/hik8XxhEwZBd35FbCld2A53Ae5EfQrqHQA0hgDr4cgkYeOoh3qWyeQQIpdgM2qz
         vRJgeDpbg2t71sHRRvbdbYRKLd9mFgXgnKPCPz82+oicZ9gBSIzzICZQvRvDb88n2sRS
         dGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=eY0o7zJ9ID5RkUnCQ8ZBfY0aWmEieO+fgK45vUzTAmI=;
        b=YH80VB5O+X+6mwNNHQ+scyu2DRHxtfu8JbNiPXzm3dZkyQ978i6n5f9jegk29hgH9a
         ApDyxxjD1uXkm6tbD83G+xO4lKOMMoshzCUPdhcXaW3s1lJCAvLMZW/7f65fG7FHzX6Y
         zeqXKq5JSO8GJNB7/+txQLsafh5jNuPg8S/PbnR0j0njUYk4wOHT4YzkUW7//9P/OVU2
         GVSfpIkTZNMWqmNb8njr41RhXbnhEPTNZB5/XlM6uMa9fDauBRzWWBKbnPuI7E0kaqCX
         pbmkxg5YJkZNpA9wfpGeqEy72iu6+hzl9jx9YSJxVSNp6yHqdNUby09u+FRiNPWLX6em
         dyqA==
X-Gm-Message-State: ANhLgQ3RXgmwHRueTBgkrTJ5k27EC9t5bj+RQrRCTeYnpoEDRwwNMvAl
        YJCCR+8bC1drcqkZt+zHmOdpmpQwdXE=
X-Google-Smtp-Source: ADFU+vvzA+1kQfLrYOGb8BKXwXlqs4orE2r9h0PUkhfDALGzmbnT0SpAK8/epSd/0whSxfO37yVzAKXtsmE=
X-Received: by 2002:a17:90a:2466:: with SMTP id h93mr6538944pje.177.1583548598158;
 Fri, 06 Mar 2020 18:36:38 -0800 (PST)
Date:   Fri,  6 Mar 2020 18:36:05 -0800
In-Reply-To: <20200307023611.204708-1-drosen@google.com>
Message-Id: <20200307023611.204708-3-drosen@google.com>
Mime-Version: 1.0
References: <20200307023611.204708-1-drosen@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v8 2/8] fs: Add standard casefolding support
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

This adds general supporting functions for filesystems that use
utf8 casefolding. It provides standard dentry_operations and adds the
necessary structures in struct super_block to allow this standardization.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 114 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  22 +++++++++
 2 files changed, 136 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index c686bd9caac67..0eaa63a9ae037 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -20,6 +20,8 @@
 #include <linux/fs_context.h>
 #include <linux/pseudo_fs.h>
 #include <linux/fsnotify.h>
+#include <linux/unicode.h>
+#include <linux/fscrypt.h>
 
 #include <linux/uaccess.h>
 
@@ -1361,3 +1363,115 @@ bool is_empty_dir_inode(struct inode *inode)
 	return (inode->i_fop == &empty_dir_operations) &&
 		(inode->i_op == &empty_dir_inode_operations);
 }
+
+#ifdef CONFIG_UNICODE
+/**
+ * needs_casefold - determine if casefolding applies for a given directory
+ * @dir:	Folder to check
+ *
+ * This function returns true if dentries within this folder should be
+ * casefolded. If a folder is encrypted, but we don't have the key, it is not
+ * meaningful to casefold the no-key token name.
+ */
+bool needs_casefold(const struct inode *dir)
+{
+	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
+			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
+}
+EXPORT_SYMBOL(needs_casefold);
+
+/*
+ * Under RCU, small names may change, but utf8 expects a stable name
+ * This operates similarly to take_dentry_name_snapshot, except that there
+ * is no guarantee that it grabs a coherent string.
+ */
+static int make_name_stable(const struct unicode_map *um,
+			   const struct dentry *dentry, struct qstr *entry,
+			   char *buff)
+{
+	if (dentry->d_iname != (const unsigned char *)entry->name)
+		return 0;
+
+	memcpy(buff, entry->name, entry->len + 1);
+	entry->name = buff;
+	return utf8_validate(um, entry);
+}
+
+/**
+ * generic_ci_d_compare - generic implementation of d_compare for casefolding
+ * @dentry: Entry we are comparing against
+ * @len: length of str
+ * @str: name of the dentry, safely paired with len
+ * @name: qstr to test against
+ *
+ * This performs a case insensitive comparison between the given name and str.
+ * It can be used as d_compare for dentry_operations.
+ */
+int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+			  const char *str, const struct qstr *name)
+{
+	const struct dentry *parent = READ_ONCE(dentry->d_parent);
+	const struct inode *inode = READ_ONCE(parent->d_inode);
+	const struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	char small_name[DNAME_INLINE_LEN];
+	struct qstr entry = QSTR_INIT(str, len);
+	int ret;
+
+	if (!inode || !needs_casefold(inode))
+		goto fallback;
+
+	/* Under RCU, small names may change, but utf8 expects a stable name */
+	if (make_name_stable(um, dentry, &entry, small_name))
+		goto err;
+	ret = utf8_strncasecmp(um, name, &entry);
+	if (ret >= 0)
+		return ret;
+err:
+	if (sb_has_enc_strict_mode(sb))
+		return -EINVAL;
+fallback:
+	if (len != name->len)
+		return 1;
+	return !!memcmp(str, name->name, len);
+}
+EXPORT_SYMBOL(generic_ci_d_compare);
+
+/**
+ * generic_ci_d_hash - generic implementation of d_hash for casefolding
+ * @dentry: Entry whose name we are hashing
+ * @len: length of str
+ * @qstr: name of the dentry, safely paired with len
+ * @str: qstr to set hash of
+ *
+ * This performs a case insensitive hash of the given str.
+ * If casefolding is not required, it leaves the hash unchanged.
+ */
+int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+{
+	const struct inode *inode = READ_ONCE(dentry->d_inode);
+	struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	char small_name[DNAME_INLINE_LEN];
+	struct qstr entry = QSTR_INIT(str->name, str->len);
+	int ret = 0;
+
+	if (!inode || !needs_casefold(inode))
+		return 0;
+
+	if (make_name_stable(um, dentry, &entry, small_name))
+		goto err;
+	ret = utf8_casefold_hash(um, dentry, &entry);
+	if (ret < 0)
+		goto err;
+
+	return 0;
+err:
+	if (sb_has_enc_strict_mode(sb))
+		ret = -EINVAL;
+	else
+		ret = 0;
+	return ret;
+}
+EXPORT_SYMBOL(generic_ci_d_hash);
+#endif
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3cd4fe6b845e7..8d20a3daa49a0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_ACTIVE	(1<<30)
 #define SB_NOUSER	(1<<31)
 
+/* These flags relate to encoding and casefolding, and are stored on disk */
+#define SB_ENC_STRICT_MODE_FL	(1 << 0)
+
+#define sb_has_enc_strict_mode(sb) \
+	(sb->s_encoding_flags & SB_ENC_STRICT_MODE_FL)
+
 /*
  *	Umount options
  */
@@ -1449,6 +1455,10 @@ struct super_block {
 #endif
 #ifdef CONFIG_FS_VERITY
 	const struct fsverity_operations *s_vop;
+#endif
+#ifdef CONFIG_UNICODE
+	struct unicode_map *s_encoding;
+	u16 s_encoding_flags;
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
@@ -3368,6 +3378,18 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
+#ifdef CONFIG_UNICODE
+extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
+extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+				const char *str, const struct qstr *name);
+extern bool needs_casefold(const struct inode *dir);
+#else
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
 				struct page *, struct page *,
-- 
2.25.1.481.gfbce0eb801-goog

