Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297409;
	b=N8/fDE4rH57ld0rtP5PIvXXyo78vZ1ir6WNft5B1JsGsy6q3BQQCVomowgkB3sga+JMM
	 NM2a+dXwOXstGJZ9wG+0K/De/RHvtyUEIQ+ZhRKo1sWcrZsD1ahdqyAwyK+spFrUUBh2a
	 B+z0Ld3oXYAQeKSHiKqvqsrfepmse7FN1N/9deeLU3v6a2Z7G6p2rV+fqpP8rLnAKetcm
	 GwTBdEcGbdzWlY9vLOgmWLFjJzHRg7M3sXYmtMquTt6y7SrF/ohMs6pKPUISOUQTAzLTf
	 qoHgrSMniS6ytoS1PGu+8vbfEdj0xZn32rvOxa5aEHL6xG2Tqvy0Ye8O3R/xSlKRz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rH9CbGqODly4QJymlyl4BG0aA7nsrIIcMmK3tybqsts=;
	b=EQ2ZRLaIBWvEZ8IEZoOc692Y7ATODZRim9+jCxKm5kY3NtIUSMqG3cM8LvEQ+FBRq3NS
	 9tpoj9y9OTSMGyKCCRgWE7+HbDy3tgxMZxrLKNTRW7sM+GSBfoxye0TfLouFMdJmWVo9D
	 dIw94btXrjw9f5h17hPbC0xOFRzL6T7NHqPYGs8K+tlMpJPdmq7DPE7ogYl50VQbD1Jct
	 MYm83uYAxAL9CyPb5aU06q571ky7YJtt2wQAsy7Yn+ivbfUWpRdxZfVZ8BuyG9EbHYjhC
	 0XARBvchNoQjsB7UEa7p8MNqJr7fJB8dJvA1jih6SzGdEKb02Nm37dKzS0jjCOpnNeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=jiIoUki4;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F1360A2628
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 18:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F1360A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=jiIoUki4
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4f66bb2ab57so992263b6e.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297408; x=1793902208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rH9CbGqODly4QJymlyl4BG0aA7nsrIIcMmK3tybqsts=;
        b=jiIoUki4j4MwfBdQRja9mQm5YbKyR2UfdgEDEpBelWc7CL+KZVxs8YGe3V4thSYnTf
         4Q+6PlYwf8H0dxXpIZVkw0gqDbX1JjegbhGQsrf0o123qkP9aVQ+RgM9z+sgWLRegzAy
         mXzOKWzYxxn3T25pHgaOYoGMT14v36G/tEp03Ighzjd8v+4bIIhikIk6gOb+8BzUxOip
         IeVfFmYJIsZi4z1gBG6/k7WKvjJtJAehF2bUmKLJyCjPLaBWNFrYAiaSo9l0uVlFKgw0
         Pm1MqLT15sII2XEXTBrAYgBpCOqBlXifLBnUsRmeBl6T25KGkyrt9j3xpkOIqf7olmiN
         p8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297408; x=1793902208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rH9CbGqODly4QJymlyl4BG0aA7nsrIIcMmK3tybqsts=;
        b=X2EjbO+gIAx0Zl5WkU9a0sn3JbEEnpIoYLQy7Wczy4vbvR6aEucybVHI75fqIgoU+0
         5Sr7kOJxFHlIXFWNFa54pWYnlOn0jg/wKK1uZ9bKXYqAGEBCcyT0We8qV43nV+2KylOv
         ofvyWyORSNRUem75qIw5akFTpNOL+JH347vf904GtkJq78UE1jFAnAtlrbwosa73I2Mv
         5Difg3kPRwkIzuE5urrbBAw+0jK5RNjngzTQDVUfoOIItCQtemwDDjV6yGDZqGdiNmE0
         hbZvi9mrM7E5QXCtz1TrC32sUufexEkPODp1xpZxvyuBjbL5EeROYgc93uyj7cscEuRZ
         wy7A==
X-Forwarded-Encrypted: i=1; AKwUvBwFAOwmLd40xpmWWucW1HFCdimXRM7FuqCAUpuaRw+KbXLHrbhxwM8kB+kryhQNAxP+1wtsvX8txns=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqpNmF1jOjWZRurrUFCgZmRsca0HwY7v7fszyf4ugOXuK+Xw2K
	EiGb4mc+yDe+GPQJ0fBhuyRm5DN/pstD/YsW/0kdpB7FbZj2UMizs9U7Kqrz97NwRDA=
X-Gm-Gg: AYBFou1pqHZ54pC4OgL7ejadAGpNPEvxoJbyqRpCEXVRNWnjrjsBJdmrpsrxSOKuljI
	dscbCvTJ9TyY2uUFGf+YRFNJ5cItk8eBJe8Pxbd6exxnFTeikOVNi2Zfqt7ye2DwXojntElsm9F
	6yQYZ3eZgOcK+YWyA10YmCwtDvNRLhad4DHZ7rdnMr0j7pLVOw5wgXhnVEnbZpfRNw0T8u2GbL/
	SAnps/6LFpMTDdWYIIbu/kvX16WHcDyKCIaJuWRxtdRIZJA6TI3EuO5V1Lf7Nxv58kP3o+c4p5u
	5Yd8sHSYaN6BrGzG3PjBwL6MstpQH+2qxUGngMhwm+8OHnXRggwdHSRGPiWYRin2YLWClB9lEEH
	c+0yRCAedmP/HmPaT463ds/hXMH/13CCXQd6Nz2cNI231Gg3TKOvpzIBYExlX6uidjGAbSe7+8T
	h20L5PL76Z4Smx5LNswqu8OSvgyk4n819K9YB6PnUmdUlTegtUqng5Pe2wfDXyJ5CIw3dhxpk4k
	B5QX/ZnS9jGT7IXYdOhAg6H7xdYhNQyOm6GFQ/ssmTVGyNHeR7aHqgarP+4+YBOcgiWUkhUJ7nC
	jaN99KAgmospZWnU8a6vGZVF2zoL/tPUKUca5oCHjDVQNNAlMeGm6+99ipQnXjlzhf+1t/r9
X-Received: by 2002:a05:6808:1904:b0:4e4:627a:e0a5 with SMTP id 5614622812f47-56383e91af6mr4444175b6e.40.1793297407750;
        Thu, 29 Oct 2026 11:10:07 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c654a22bsm4702434b6e.14.2026.10.29.11.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:06 -0700 (PDT)
From: Jonathan Flynn <jonathan.flynn@hammerspace.com>
To: NeilBrown <neil@brown.name>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 05/12] vfs: factor file removal into a helper, no functional change
Date: Thu, 29 Oct 2026 12:09:50 -0600
Message-ID: <20261029180957.387138-6-jonathan.flynn@hammerspace.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
References: <20261028041023.3738553-1-neilb@ownmail.net>
 <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the body of vfs_unlink() into a static helper, __vfs_unlink(),
that calls the method it is passed in place of ->unlink(), or
->unlink() when passed NULL.  vfs_unlink() becomes a wrapper that
passes NULL, so every caller behaves exactly as before; its kerneldoc,
including the requirement that the caller hold the parent directory's
lock exclusive, does not change.

This prepares for a second removal method, called with the parent
directory's lock held shared, which a following patch adds.

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/namei.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index ce10a408d3..1b3a605ded 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -5679,6 +5679,12 @@ SYSCALL_DEFINE1(rmdir, const char __user *, pathname)
 	return filename_rmdir(AT_FDCWD, name);
 }
 
+static int __vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
+			struct dentry *dentry,
+			struct delegated_inode *delegated_inode,
+			int (*method)(struct inode *dir,
+				      struct dentry *dentry));
+
 /**
  * vfs_unlink - unlink a filesystem object
  * @idmap:	idmap of the mount the inode was found from
@@ -5706,6 +5712,20 @@ SYSCALL_DEFINE1(rmdir, const char __user *, pathname)
  */
 int vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
 	       struct dentry *dentry, struct delegated_inode *delegated_inode)
+{
+	return __vfs_unlink(idmap, dir, dentry, delegated_inode, NULL);
+}
+EXPORT_SYMBOL(vfs_unlink);
+
+/*
+ * The body of vfs_unlink().  @method, if not NULL, is called in place of
+ * dir->i_op->unlink(); vfs_unlink() passes NULL.
+ */
+static int __vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
+			struct dentry *dentry,
+			struct delegated_inode *delegated_inode,
+			int (*method)(struct inode *dir,
+				      struct dentry *dentry))
 {
 	struct inode *target = dentry->d_inode;
 	int error = may_delete_dentry(idmap, dir, dentry, false);
@@ -5730,7 +5750,10 @@ int vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
 			error = try_break_deleg(target, 0, delegated_inode);
 			if (error)
 				goto out;
-			error = dir->i_op->unlink(dir, dentry);
+			if (method)
+				error = method(dir, dentry);
+			else
+				error = dir->i_op->unlink(dir, dentry);
 			if (!error) {
 				dont_mount(dentry);
 				detach_mounts(dentry);
@@ -5750,7 +5773,6 @@ int vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
 
 	return error;
 }
-EXPORT_SYMBOL(vfs_unlink);
 
 /*
  * Make sure that the actual truncation of the file will occur outside its
-- 
2.43.0

