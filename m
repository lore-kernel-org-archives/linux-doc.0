Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BE61FC7DF
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 21:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557386; cv=none; b=mkAZIAO0J1IH0TPAaWotZaqpRtrE0NVoBDlWRThKIbznnRO+HA5p57ABtz3BoKOyhS9jBigdJtoBSuU6+KCUIB6RSHTFivm4Uxg6zZPDTFiCQpOB/PI++rq+753qPTUZ5BJ/MMwPGGbsHl4t5gasX8oPMSCBFkcqedeU4jTYbi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557386; c=relaxed/simple;
	bh=8tcZxhWcZygS7/RIPssR7Fug0TVf2r/WdlbveaQ9jm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHvzTpE6y9zVAUFp0lOMpx2BUAM2hHM2CqVBz1dGaGC3LNOXPOEGKDKbsCR7zCtd8rQQZaATq2Sy2WfJcYW707H8MkjVMjx7t9qAb66wP1PpX2QyjVQfVHUfKdSCMJ6XUuVXR4JHd8g/iv2bw5UmORvEQ7iDzl+tW5SsA1zkkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Napi8/Zp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Napi8/Zp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215770613dbso972505ad.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 13:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734557384; x=1735162184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xt/KivLNHAmnWSoTGp/wlEAy9HXZLD1WAOHB1I7E5r8=;
        b=Napi8/ZpSEFWsNHoQdXPIqMH2DGnTiwDSqlGi+2SF+/QT3bRDQJqr2zRTjSkgQGJWd
         WvsLZAD7RwEynRZ3//+zht50RMro6japUzb9ByzQYeMkC7GM6xCSO3DZPUyp02aPyx7C
         Aw8TTJkDcTKNPkVCo9BImVq0wl7ee597Cnz8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734557384; x=1735162184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xt/KivLNHAmnWSoTGp/wlEAy9HXZLD1WAOHB1I7E5r8=;
        b=X1kMmJ3K9wY/yBFNKcRKe7fZBSzhNgWv2Nuon87+IPFRHxq8bZ7gwdKf+Ks+l2yiwv
         XzjLGn9wIH6nXASHAIRDCnB4BG827utz+hoF1Gql5enBTpqd2wV+fmhfvrImxapNALgP
         FT3MBQd6Ui4QDnTbpGECJShaPwLcYOSWJPF+VlxbWrnhdR6ncjBfNwLndlTbKpR+ZAMI
         iK9lUantn7PQoR7Zi81MGhNpIT8CQQDYygWs79SddOgZxkaKWeOJyoLFOcCRVNrLrNAl
         uhDGbrckGdQMiYRtlwI78KbhB3ispA9/pG5hdFmbcfovUsB2KYKI+/2izV4fafvPq8lP
         0Tbw==
X-Forwarded-Encrypted: i=1; AJvYcCVDaSEbHzenUWgt3B9rae8JtjtB9EYSR4tYOcbNYlF74fsSMQ5KfaRx8IZ3vVc1MRc1xMR2Xs9LqqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbUel5h24CqARrHQAFt/L5SFSw3eyV/Bf6mQeJr3RH4g2QsX8R
	o0FbmCBAv7iYRrBTp3dQ4uB2pcSHM+gycUvaImHzJNU/DEtpDEbeLHE/mUcjLA==
X-Gm-Gg: ASbGncsBjWNmzXBP5DnMw75+gUNBLYdrrcJhLadAYXtTHayue5weKtxTscnYwpdzLUe
	5VkV8uaVlfYEJcUtj2XIfvCgMvE3EK57gIrIdxTodLwBYduA+oZNSuNAWUc72W/zoIOUURnEfP6
	qI3u2wabGK7kLqKMxfXh9sPz6nN2enTQ2vVNsoZB1ffT4QHN+pQTANi2Fh23sVz8ij03GOhK6dk
	RgMf3WdMSWFKy098iRP6/E0MAFtyOkxwuQ//u4gfODdfJzZuuoEFwYEp7/sv7/5Rgi4hau6614a
	TYa855MRszoxfDE+i1byvOBorsMGAufzgEWirMTVnsbK+Q==
X-Google-Smtp-Source: AGHT+IH6vrFAj3IOk0b9NS9oSsCUv7IWVvGa6vyL9CDd/qOIIcWgVO6fANyY0NBZxuvfiOjsRm4YAg==
X-Received: by 2002:a17:903:283:b0:215:83e1:99ff with SMTP id d9443c01a7336-219d9649cdamr12749075ad.27.1734557384391;
        Wed, 18 Dec 2024 13:29:44 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (200.23.125.34.bc.googleusercontent.com. [34.125.23.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e50455sm80506145ad.159.2024.12.18.13.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:29:44 -0800 (PST)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	hridya@google.com,
	smoreland@google.com
Cc: kernel-team@android.com
Subject: [PATCH v12 1/2] binderfs: add new binder devices to binder_devices
Date: Wed, 18 Dec 2024 13:29:34 -0800
Message-ID: <20241218212935.4162907-2-dualli@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241218212935.4162907-1-dualli@chromium.org>
References: <20241218212935.4162907-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

When binderfs is not enabled, the binder driver parses the kernel
config to create all binder devices. All of the new binder devices
are stored in the list binder_devices.

When binderfs is enabled, the binder driver creates new binder devices
dynamically when userspace applications call BINDER_CTL_ADD ioctl. But
the devices created in this way are not stored in the same list.

This patch fixes that.

Signed-off-by: Li Li <dualli@google.com>
Acked-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c          |  5 +++++
 drivers/android/binder_internal.h | 11 +++++++++--
 drivers/android/binderfs.c        |  2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index ef353ca13c35..0a16acd29653 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6928,6 +6928,11 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
 	{} /* terminator */
 };
 
+void binder_add_device(struct binder_device *device)
+{
+	hlist_add_head(&device->hlist, &binder_devices);
+}
+
 static int __init init_binder_device(const char *name)
 {
 	int ret;
diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
index f8d6be682f23..e4eb8357989c 100644
--- a/drivers/android/binder_internal.h
+++ b/drivers/android/binder_internal.h
@@ -25,8 +25,7 @@ struct binder_context {
 
 /**
  * struct binder_device - information about a binder device node
- * @hlist:          list of binder devices (only used for devices requested via
- *                  CONFIG_ANDROID_BINDER_DEVICES)
+ * @hlist:          list of binder devices
  * @miscdev:        information about a binder character device node
  * @context:        binder context information
  * @binderfs_inode: This is the inode of the root dentry of the super block
@@ -582,4 +581,12 @@ struct binder_object {
 	};
 };
 
+/**
+ * Add a binder device to binder_devices
+ * @device: the new binder device to add to the global list
+ *
+ * Not reentrant as the list is not protected by any locks
+ */
+void binder_add_device(struct binder_device *device);
+
 #endif /* _LINUX_BINDER_INTERNAL_H */
diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index ad1fa7abc323..bc6bae76ccaf 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -207,6 +207,8 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
 	fsnotify_create(root->d_inode, dentry);
 	inode_unlock(d_inode(root));
 
+	binder_add_device(device);
+
 	return 0;
 
 err:
-- 
2.47.1.613.gc27f4b7a9f-goog

