Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC82376FA
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 20:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032154; cv=none; b=QeMpbCs2/1M5op4w5D3At6xh0PmooI48swyjxVPpwlWqhYwkeDFapO0zmcosD8O2PbXrlJTJB2XmRTehTF9yhkb2YWifqw+e/68GhykGiNpRqbsYI8jbxpRwAG3epRFiq8wjWd30nKpzzigMStaXCq0huAzV3myNaHDF1XcM1U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032154; c=relaxed/simple;
	bh=VFQeuhQrmXgZOY+JfXBPbjeF37rWPb4GdeTObDb2Rf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlN9hc+iMsChXO7tgyZzy2xJr3V6IuQfXMSlTq2Y/DnWVoX4Iv0Mwo0/KaH0/D51VHRCPTnn5FJcWU7E+ks8O6hVrYSz/sutpXoUTuGXsMeqcqtImXCx8800Wg+d8GZVozok6csmcKyTdgRcULimMSOg8lZOrSGTn3Brdb8b0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RRFK5+IW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RRFK5+IW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2238d965199so35667595ad.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 12:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741032152; x=1741636952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bqs6enPVx21oxb5GivnZU1DWbwEExp/3gOjrVfmP78c=;
        b=RRFK5+IWJQs3c2TMeNytKYerVfuXWNDsh/vWTzYJFLyt5xnIaTtm9JinCt1oMOMKpY
         LdvKYI+FXd2jgoq9fGh0x06Jgre6UYIS2yUiep0+mMa1+V3bkeq9CNo4qEghokE2hK2D
         N7r4Ctpe2UhwMS/kNzfVlJcqsKs1X8aOa13uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032152; x=1741636952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bqs6enPVx21oxb5GivnZU1DWbwEExp/3gOjrVfmP78c=;
        b=Gh6/ldtBdIhGlIOZpOS/1z7QrQRZTdiGbKI2p0F79QDnTtb1cD3Ow3hHnIv+jY2lpL
         0UNLGJ69qD4ZZSSSFqgtaJXrlOYxvFLdLYuSn0Hf9TxK5v6LYHhRA2iYafAZP1kTqPbM
         Nt+P5IllbX/nqO0C06+uo32Nq9MJJ5o10m7od4lAZ9l9+KeDyh7R4dwYKxMPUqDhGScQ
         vwYqzf001bc4IIEWnwBBxyYboO1wEOpFHemlQ+KffZJ3AH5MdergFItRfqiQE9wz3Ung
         Lf71vQoUO+bA9Tn24lbxfQjCjuYtVgWfk7q5NCKuTcZVs7XzhSH7loJlb9jg62RwvG2j
         N8nw==
X-Forwarded-Encrypted: i=1; AJvYcCX1q+sfrCktLHwzcioI7PWLS95vBrdiuzM4+1bEJofJY8/sDQ8mJXTK6IM040cvlMayF05z9un2p78=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRr6gRmUTf+K2X8Tpm8ReRNbUnkK4ZYug8rZGNr44tGNOuTWP
	HML+Lki3cXb2/udHFWZelrWQnk48QApGqF4aUlE8rkW9ZhGKkcRe+stQT1Od6Q==
X-Gm-Gg: ASbGnct0dCroDwrcwkPivZ/z+D14emp284iL5egbTj064VmTCp/UBNpZLbxVWskDoMV
	+urMTWFcCQHnksOXWly+U8iLymr6M8JJ2xwC/fTAurWEFKgSiMqSv4P3vwq9U81lIq7Qdeny2Sm
	hI94YaXnf5aQRRUptDWc9QSnihPsJxbI7BuDDUiMrjqZll07cJfaRnc4B3M/bq3NP1enelUiPTK
	b5V3110TPt7JXndLM9jdjqa/CMALePhF7nyd2QDuRuUzoo40rAXrkYCKZr9s9DIboQm7QbljEQd
	iHlKLcxuhQuqeIjsZrVEryv5j5nVYweFTIA062gI0WNjd6747F/xVv5Rtsjuj15rvK4Pl8J3nWd
	uThS+C/mALerGZhwlnq65JM+4x2PKvY4=
X-Google-Smtp-Source: AGHT+IHEpC0wzYC9qpTOKYzyBCFKX1RplbM8mEpi5mu7LaJ5QXKsMTUayHNtXumG2Q6HyHXT6kFqmQ==
X-Received: by 2002:a17:903:198e:b0:21f:988d:5758 with SMTP id d9443c01a7336-2236924e748mr224147945ad.35.1741032152431;
        Mon, 03 Mar 2025 12:02:32 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc4b4sm81233875ad.171.2025.03.03.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:02:31 -0800 (PST)
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
	omosnace@redhat.com,
	shuah@kernel.org,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	tweek@google.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	selinux@vger.kernel.org,
	hridya@google.com
Cc: smoreland@google.com,
	ynaffit@google.com,
	kernel-team@android.com
Subject: [PATCH v16 3/3] binder: generic netlink binder_features flag
Date: Mon,  3 Mar 2025 12:02:12 -0800
Message-ID: <20250303200212.3294679-4-dualli@chromium.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
In-Reply-To: <20250303200212.3294679-1-dualli@chromium.org>
References: <20250303200212.3294679-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

Add a flag to binder_features to indicate that the generic netlink
feature is available.

Signed-off-by: Li Li <dualli@google.com>
---
 drivers/android/binderfs.c                                | 8 ++++++++
 .../selftests/filesystems/binderfs/binderfs_test.c        | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 94c6446604fc..b3d21ccd81f2 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -59,6 +59,7 @@ struct binder_features {
 	bool oneway_spam_detection;
 	bool extended_error;
 	bool freeze_notification;
+	bool generic_netlink;
 };
 
 static const struct constant_table binderfs_param_stats[] = {
@@ -76,6 +77,7 @@ static struct binder_features binder_features = {
 	.oneway_spam_detection = true,
 	.extended_error = true,
 	.freeze_notification = true,
+	.generic_netlink = true,
 };
 
 static inline struct binderfs_info *BINDERFS_SB(const struct super_block *sb)
@@ -619,6 +621,12 @@ static int init_binder_features(struct super_block *sb)
 	if (IS_ERR(dentry))
 		return PTR_ERR(dentry);
 
+	dentry = binderfs_create_file(dir, "generic_netlink",
+				      &binder_features_fops,
+				      &binder_features.generic_netlink);
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
+
 	return 0;
 }
 
diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
index 81db85a5cc16..96e64ebf910f 100644
--- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
+++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
@@ -65,6 +65,7 @@ static int __do_binderfs_test(struct __test_metadata *_metadata)
 		"oneway_spam_detection",
 		"extended_error",
 		"freeze_notification",
+		"generic_netlink",
 	};
 
 	change_mountns(_metadata);
-- 
2.48.1.711.g2feabab25a-goog

