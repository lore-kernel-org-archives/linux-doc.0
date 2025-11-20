Received: from smtp-out1.aaront.org (smtp-out1.aaront.org [52.0.59.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B110293B75;
	Thu, 20 Nov 2025 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.0.59.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634432; cv=none; b=ZGtcyuueJBBnBoGMNULMGU7/2YJSq9JESQRKYdnyQ5J2xa1liPrlAz+m223BfORU9UyHN2GEQyw/+Nyy4lWqUquYndxiZHnwQzTsOj/A0nxgfJX+RZbQ8UfsGkKg4vlG+cWkZnaxbS6GsN+JtfPmCfBmLOmVIJJFgXa6WT29qsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634432; c=relaxed/simple;
	bh=nRmJstFHUIEPKe3KR1FMQO3VgQZJLwbre1WpRkK1mNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fflQiCr3yQDmzEIKv51qAXgjcPMPgC47NSpJh+yAFXosm1u+5ujh20Rl/YsU4KKG5+SagaJgezmg+B8+wZea1ZPdDtAtCtGzr317oIBaGhWfVNDDtJqHmpsMRvrqALoV9Wzy06ozALncqEG2xndSViAnCkRu3jELvhdsTJJ9iMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aaront.org; spf=pass smtp.mailfrom=aaront.org; dkim=permerror (0-bit key) header.d=aaront.org header.i=@aaront.org header.b=3O3VZVvO; dkim=pass (2048-bit key) header.d=aaront.org header.i=@aaront.org header.b=YGlO35hX; arc=none smtp.client-ip=52.0.59.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aaront.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aaront.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=aaront.org header.i=@aaront.org header.b="3O3VZVvO";
	dkim=pass (2048-bit key) header.d=aaront.org header.i=@aaront.org header.b="YGlO35hX"
Received: from smtp-send1.aaront.org (localhost [IPv6:::1])
	by smtp-out1.aaront.org (Postfix) with ESMTP id 4dBvff1Xm1zGq;
	Thu, 20 Nov 2025 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; d=aaront.org;
    h=from:to:cc:subject:date:message-id:in-reply-to:references
    :mime-version:content-transfer-encoding; s=ckha5xz4; bh=nRmJstFH
    UIEPKe3KR1FMQO3VgQZJLwbre1WpRkK1mNM=; b=3O3VZVvOKDaAZHbujvSYYxW5
    /zoMqUegcqmp/qlHKo6z319TcBO6s6bDX1qQozA38vWXwL2D1lRX7LEpETbXBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aaront.org; h=
    from:to:cc:subject:date:message-id:in-reply-to:references
    :mime-version:content-transfer-encoding; s=qvfkgsmx; bh=nRmJstFH
    UIEPKe3KR1FMQO3VgQZJLwbre1WpRkK1mNM=; b=YGlO35hXjHc+6NImBiriSFIg
    7kHQyYMK10okeJRx4YJoEHNfDE+yWHSoONJxZt7sRUJbwyni1KTNoDTi0eIW83zP
    +9TbyfaUj9WiuAQO7T9p4vVDHW+x13RRhxkrxV+0CPlAAUf7vASDox+0H/zDMBG0
    92FqDH0L9ESPtmiy2gUnuln1xsu04eXhXEcDPh4M0shyPn/nIFaFYZAPXsmxxZzV
    ZoyPbat8vmypSTMhMskZk3a3XqXCepQo/khf9U1gwjluTvcaUSPazpAUavAXz4F1
    UPd+MjnBx9ODUhOGI3VkWXVwthQFErVOHqts8lN+f9jkgr9xd7rtyfDduwww1w==
Received: by smtp-send1.aaront.org (Postfix) id 4dBvfd2vb2zGp;
	Thu, 20 Nov 2025 10:27:05 +0000 (UTC)
From: Aaron Thompson <dev@aaront.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aaron Thompson <dev@aaront.org>
Subject: [PATCH 1/2] debugfs: Remove redundant access mode checks
Date: Thu, 20 Nov 2025 10:26:32 +0000
Message-ID: <20251120102222.18371-2-dev@null.aaront.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120102222.18371-1-dev@null.aaront.org>
References: <20251120102222.18371-1-dev@null.aaront.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_get_tree() can only be called if debugfs itself calls
simple_pin_fs() or register_filesystem(), and those call paths also
check the access mode.

debugfs_start_creating() checks the access mode so the checks in the
debugfs_create_* functions are unnecessary.

An upcoming change will affect debugfs_allow, so doing this cleanup
first will make that change simpler.

Signed-off-by: Aaron Thompson <dev@aaront.org>
---
 fs/debugfs/inode.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 661a99a7dfbe..b6e401c46b6b 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -287,9 +287,6 @@ static int debugfs_get_tree(struct fs_context *fc)
 {
 	int err;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API))
-		return -EPERM;
-
 	err = get_tree_single(fc, debugfs_fill_super);
 	if (err)
 		return err;
@@ -434,11 +431,6 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create file '%s'\n",
@@ -584,11 +576,6 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create directory '%s'\n",
@@ -631,11 +618,6 @@ struct dentry *debugfs_create_automount(const char *name,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create automount '%s'\n",
-- 
2.47.3

