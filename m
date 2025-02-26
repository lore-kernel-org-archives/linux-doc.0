Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2A23A9A6
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 19:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740597666; cv=none; b=YCoDOIVxSaDFnMHoJWb4lwva8SFG80hyJ5ruCE7LbjuQesagUGG1LV9Rdi2g59nmUj4FLlValZuvHiuyP0X1O4pnV96sfHrUm1TDu7+jgyTO2de2Emh8dZKjAImETLmFvWqcdHBBanMfUt8eL2vbqZwbFCptcHYSVxdfuIDP07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740597666; c=relaxed/simple;
	bh=WpYr04p1UkLDWtl5dIg7zK3U1th+UqvFkMU1unWOfHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPb3WesIk8ZHuDqAFD+c2aFF3dX0riICDc+F4UHDEMsoIDeu6f8E5g3Z3+6hwsmAF5my0/3jAPRuM529/fpsRivoVavm9TpVU8r5RLM8pYSLr/5yvDkCBxtnTUd/+353D+CnCG0/pdb9626TAPq6i93EYC4XVpRC0PIEmbeEbKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jtrJ28NW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jtrJ28NW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22104c4de96so1699405ad.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 11:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740597663; x=1741202463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N3fCiVrbRYJnsDcemalRElfbpkz7bQc2o4sOKvhYDA=;
        b=jtrJ28NWEq3+3bKSZhT4zVDOqQFdnr9bXCfdSJRkLhNwFa9eZETgqOh8kUBo/wNyHe
         Dy6pUxlZDCzqQYU0Rw2/SUk09ufzCimHjUL5EsARgjW8D383fLd8bX/fuaFVifqNFrFs
         jPbpJwAXjloMzODIX48KfqnyLElw1ZJO08wwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740597663; x=1741202463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8N3fCiVrbRYJnsDcemalRElfbpkz7bQc2o4sOKvhYDA=;
        b=UAHt50fO+63RcuoTB1JQ9jR1jxy4t1DKIvFNEo9G0RIjGrEZpS6kkjkj6LB7ckKHG3
         ryXUxqAXcA5XeVdbJTzjEGVLfbhMqWKXKHE1h/j/r+SGZ+IC1xj3FCRz0M469FLVZV4Q
         9IPp4ESd8PNFv0Z8gfUgDrKI7qTunwaQVud8JISJoDHX+dgb7nQO+1UqWPFrktCPQboQ
         vIDA98FMH1rb8NLQUAVdQuwjmdwguTR+ZJa9uuPmo5LYv3SaMepHfYlEL5SNXe+B7Xzg
         Hu/33EqfbGBxSum7+oeWRAUBmDfrqfjJfF0OaUkl4fPa/K3XPf+tupgFdrCjDfu8Z43t
         vmFA==
X-Forwarded-Encrypted: i=1; AJvYcCWt44D0Yque8uM/97qDauDL0SfgKL4xtvKH1TyjdCdEcIWvMmkaSHjohDGHaTPmpoV4Os0NS2d39oo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/hPtiC/1fw/3zcPXdugK48ZgiVp86cYIS3FF8MqFrGClzfsp
	zG3cS2Cj2hu1tGjeIhoR6AXlo3TWoQRYCzBrIbqol9QmQZvUnH6iCQG8K0HlkA==
X-Gm-Gg: ASbGnctbFtH9Ao9M338yXQkZ7i6u8napBaG1ieFN87B6hewPrq+EDLOh/HtIjkD8qWK
	bcS3T6ftjicOj5Y3ocpHIY1ktIS+rTJBjpmL0atxb+o4R37+ekqX5BP/nmmE1+m7Q+dUTVg0IGR
	WVwR8Y5s5U50TmnHoXKgxycrd/BOL/VHzgUx75TLpltJ5kjcgBKueMKbw4/8DwvTbAYCIFHmtHB
	E029rYlEkN8QmpVLAhbJMscRflDIfJLWld//gRGkD0pnzpJwkVli0EKpdfE/w7Fg1yDqUAnxY6+
	E4H3HTZSlHGF71F7SK/w1yI23OW4acxbPXVwwvRIhLUg2oc7K7+F1G6m4bz5RAhJ4aD+ZEdOW2J
	kaAinJ+l3mvxp
X-Google-Smtp-Source: AGHT+IHloyY5llsRwZmYOAMtChiquooiL7oF22Jfz6xhil9TWQQpChOD8vyx6ebjqWqMfIQbsvyx2w==
X-Received: by 2002:a17:902:d48c:b0:216:7ee9:220b with SMTP id d9443c01a7336-22307b4cc17mr117990425ad.22.1740597663658;
        Wed, 26 Feb 2025 11:21:03 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22341c04d16sm8473865ad.190.2025.02.26.11.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 11:21:03 -0800 (PST)
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
Subject: [PATCH v15 3/3] binder: generic netlink binder_features flag
Date: Wed, 26 Feb 2025 11:20:47 -0800
Message-ID: <20250226192047.734627-4-dualli@chromium.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226192047.734627-1-dualli@chromium.org>
References: <20250226192047.734627-1-dualli@chromium.org>
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
2.48.1.658.g4767266eb4-goog

