Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281DD1DE2BF
	for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 22:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734043285; cv=none; b=eGoGUquf9WYwayHnlypWPovgW7jQH55CBwt7qae72dPyYOQuTptiu4+umtz8NxlJazQfi2ljnhg/v9syTyDRbaT1rMqGCFhuqmBeH+xuwUJHb1ksCpv220ykHMmIZKyIcfKGQBkmMUvrAN2xe/woJKr18acmpLZglK6/j1Yucsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734043285; c=relaxed/simple;
	bh=QnID2Nngias2laFlMVHINRNQrpY+Vv1z4BU4mytckzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=matSNKjDyaJxSAXVZva04J4XYasPi4sF80vD63hIBGWJYZwQmSg6opp96SuKxzQz/1YYFTFeRmsBmSaaqDTTSdOH5+6jqUe8b+eAJ06f8pOlFh9RZWDSU284o1/AVBYm/CiMneb9yIuqaaRJ4kXJF7Eoakq0/sSXYbA1VQMQbrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mc5sO8/3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mc5sO8/3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2162c0f6a39so21775555ad.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 14:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734043283; x=1734648083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTbCEHQ6hia/KRivi/ryuMVv6+i9eA+M0miy6FoyLNI=;
        b=mc5sO8/3S6Wp08VWV37d0JDfLVG2ESqb4yYByKOyUXCchu6TnKx3FYCHDJNYxn8JMo
         ztUeVaUcnL+gcS/QxnW0mJYhzRJA9OcWJmmZTi9AqV2pSGjLa3fIm5H/4wzJyvKSF+9m
         hyin09IheCPJ4YhK+dcD5AOor90w/DVh1WKcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734043283; x=1734648083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTbCEHQ6hia/KRivi/ryuMVv6+i9eA+M0miy6FoyLNI=;
        b=OJxTmWVo5zw7c6duggFtX6KkmfZ/E8ULbhU+olfNkYWYprpL3bUDW6k4zX0rncjw2g
         8Ov+Rd0Y1sXpax7jU8rxUhRGYSrgwKdvVwHhec+xlHwBOEskpdwv79ezoIjqxVAD7f47
         sgl89S4NIaFQ2F3ypiri6F7wVA1XZFWB4BwNLie/YF+lTkHrditHzovlVfeR4PHy6zli
         ZSvUTqbabf5sH2vRJj83rr3a8ftdx5xzF9tPsj8/QRWksr7CY4usUHhLTvXAJSytqysM
         piGX9EGVX7mld7rePLls+Zwh2UDzbLB+A7AN9HamVY9kKLupa9MpjrUTdBXTn+7K4GP7
         ELPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfqRRBar45WeBkqHq9RSeLaZsJMDNUh6XdaZWORfXndrURttK/R6GhTx+GV1BUbT3+py7eOIXTwO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hmrd/dkL7n5eVIW32r5t7kvpETAGPHZHMoF+X3980W+bJgUL
	UuJdcjZJ19PKCcjGqD9ZXoLZOQjXHKBWYI5UMi7KgF1U4NaxiVl97w6Y8Grosg==
X-Gm-Gg: ASbGncvAM88JcZ0C6A1YId1YG/Drk83F9vI2fLmONMa+mc8odaeOP30wx6T6SbLk24e
	hHeY+sJ8zCKSGIFKL+nLihOVHf1QmRxvUW9Nv3BkZ9MpdbKmpoaH3oQIQ614IAzGTLJgVTne0Yg
	3ckmkojVq0qfoFcezBIlfEg0Vh0gZulEa+5KB48qJKif5E8o+h78/+4W3YYLkLJQgZTkd0cCqRR
	mkigtI/KEonaHpo2jrSi2UiK7wEv3ABoD/0G2oK8H7Z/HD8UC3xfwiPDhEMC529FbUA9ZfAa+0p
	Mx/gf/B0wdDZtG5N7/67AoIZRolvajmhqsCTr597qhZ8nA==
X-Google-Smtp-Source: AGHT+IE7mpoXxnTF8cVAExncDjTsgRkgtqF/AwV3t/7KpNuP4yvLpiYHGewaXEWkm9gaAI1GF97u+Q==
X-Received: by 2002:a17:902:f546:b0:216:4fad:35d0 with SMTP id d9443c01a7336-2178c7d5224mr66505915ad.9.1734043283528;
        Thu, 12 Dec 2024 14:41:23 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (200.23.125.34.bc.googleusercontent.com. [34.125.23.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216281f45a2sm98579785ad.250.2024.12.12.14.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 14:41:23 -0800 (PST)
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
Subject: [PATCH net-next v10 1/2] binderfs: add new binder devices to binder_devices
Date: Thu, 12 Dec 2024 14:41:13 -0800
Message-ID: <20241212224114.888373-2-dualli@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241212224114.888373-1-dualli@chromium.org>
References: <20241212224114.888373-1-dualli@chromium.org>
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
---
 drivers/android/binder.c          | 5 +++++
 drivers/android/binder_internal.h | 8 ++++++++
 drivers/android/binderfs.c        | 2 ++
 3 files changed, 15 insertions(+)

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
index f8d6be682f23..1f21ad3963b1 100644
--- a/drivers/android/binder_internal.h
+++ b/drivers/android/binder_internal.h
@@ -582,4 +582,12 @@ struct binder_object {
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

