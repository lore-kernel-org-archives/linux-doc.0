Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC923FC5A
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531122; cv=none; b=CjtubOhOdGdJI4WRlJ2XOMPf82dizEHdv8KSz6v1lwKNmO24wqX4L0n1qbWFIolUKvfcuLTtLDb0rCHKNME/1uTebdk46L0zL3gRQLT0BsGgnK8ksVNJkUUbUrRpWmbeyYaf/rORK0RH5+f+ZQ8IgoipP2SHdtEKi8KiE7Jp/uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531122; c=relaxed/simple;
	bh=wD6I1RCn0+c99seXGKswy1P0OxmegImcJk+Lb6MyVL4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prVWDfo01aj58OAC+pqkcqhfDWHLFVfjFCxOcwQQ5hXrK7r2QWBH+xlP3XVb5txiNKQnmy3mBwlNnLyng2bUO8M6Dgk1TCPg5ffnJSz0ny2rmy2fsBP9IZVmpUA8ZNmJhpXQthQg9Kp25roLVdIeBWi5SVfGhfzPOP5Y+Nj/Y0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MFNdTEfK; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MFNdTEfK"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7075ccb168bso5538906d6.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531118; x=1755135918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7wVeHC0BKF0BnkzpBtVk7MqDMjUeUEopTUe1tEjQ6M=;
        b=MFNdTEfKSm2hUchTLiu6Ij1W/TBQNRDaQN+pCacJgQOflejZHgqP9ol3PV3efPQajz
         iv5P8wvV6TWKMk12ES2+Em/t5GONl4QEAjwJkvWWwXS6u9OhEF3FmBHghh3g+9VwZtOS
         82TqhrIyRw7ODJrtv/D0eWYpr8XQVdN6n6Lu02vFyMRO9Ymo83UfHLp53WgBA+OVfDtc
         rjIw7AHcgq9hwHxLPGrS+X0fK/q4bCTt3HzNO4x/eVIpJ42qGZX6820eQP57nIQF6xc2
         9VRADA3IVm3wO0oDA7ZwKaoG+ld51sQHOQv5SK+/NL/DQuWVG+oMBqwUiXuFsAp/xgCN
         GvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531118; x=1755135918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7wVeHC0BKF0BnkzpBtVk7MqDMjUeUEopTUe1tEjQ6M=;
        b=oo24IiMtejy53LJKVH7cp5mNe5oxfU07LdQ2W8Ogqi82L5yqSo/yjU3NJqDaI850FO
         254rKKeTVh8D39k7SdTBBuW4LRF3M2BHo0YiL9ncVhLKrFoR85BtOjY97GgcvsJMocaY
         s8Ah0deqyY0txf7QTK+UrL7DuhF7FFSMv1pTSRfK3Q/q312mTkcuNLiiL+TvFkpwjxMw
         7VwseqKP0GPHBBdSeG6MMQbxNL/ROmf2t0l8X3kE6bCONJQXWey+sZlcdPOrBoBcwG4z
         WeVk1c/dgZWUbngfNHr1H/15WzNlqCvNXbKJeK3oY0/SRPKL8mZBNycappYqlB7uyNKv
         zbVA==
X-Forwarded-Encrypted: i=1; AJvYcCVnQj5aFnbfDXKaPi3AMtKFYg6iumzwuRJ7MNqt3zSW6MMbskcdM8l3svUuFrDzat0PGn0QrrzpkDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI//kTmuccQ6cMSHNVkk/4SI724UCPYBXYHSEKSFbLwWlqvkx4
	1gwQtpr1gV+qLCnVmnBT+57THtAKwn6mCjLwk2hyfbyDrhA0Qu75mL5JZ5qI2pMhsXY=
X-Gm-Gg: ASbGnctz3CXekx+IQ4F6jA4FrrX1oQ14zdNGO/4R5RSJXNgnMC4djVIgtCub00HpYQo
	Pov2YcOzjyeB3I/wDqatinfQB8O7qX+jASRoLwm8ZXChkZ95wpXdqGyPzQC7z6vQdpX2OxkO+2s
	QXEwGFzNFO68Rf7TYRc75CX/cgeyL4FqDGrjwH6yaRYW4uZM3Cg0FraExQXMRv0QozboewyimYm
	evZhOgXKmKCJKt2E7J6KwINnkaeGCkxRTsOyuZmgoqLmuA2weQu1B8bg0e9N6/AinGccq/iPxCL
	ZANXBllDHmG3J9XyfqJqFERrXUcBJ96iJJ+5hTM3mI+dIURN1XyDYesofNhPxEztFZETvJh4RzA
	ZjRgBt1CBzdczQdqEwxImjYaKBvG112x8DYqDsHBytN4p6i4vaRDp3/ycECcjWZGFBuggV7KcRf
	3u96lDZBpEi+KF
X-Google-Smtp-Source: AGHT+IGUMFTnXz7aA5TeYDEGpdy4VXQ/e6kO5So5tD5I7KBD7rTcRc491fmczfxSCGd/3u9GjXp5RA==
X-Received: by 2002:a05:6214:2587:b0:709:65cf:be98 with SMTP id 6a1803df08f44-7097ae1016dmr57649496d6.8.1754531118246;
        Wed, 06 Aug 2025 18:45:18 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:45:17 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v3 21/30] kho: move kho debugfs directory to liveupdate
Date: Thu,  7 Aug 2025 01:44:27 +0000
Message-ID: <20250807014442.3829950-22-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, that LUO and KHO both live under kernel/liveupdate, it makes
sense to also move the kho debugfs files to liveupdate/

The old names:
/sys/kernel/debug/kho/out/
/sys/kernel/debug/kho/in/

The new names:
/sys/kernel/debug/liveupdate/kho_out/
/sys/kernel/debug/liveupdate/kho_in/

Also, export the liveupdate_debufs_root, so LUO selftests could use
it as well.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kexec_handover_debug.c | 11 ++++++-----
 kernel/liveupdate/luo_internal.h         |  4 ++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover_debug.c b/kernel/liveupdate/kexec_handover_debug.c
index af4bad225630..f06d6cdfeab3 100644
--- a/kernel/liveupdate/kexec_handover_debug.c
+++ b/kernel/liveupdate/kexec_handover_debug.c
@@ -14,8 +14,9 @@
 #include <linux/libfdt.h>
 #include <linux/mm.h>
 #include "kexec_handover_internal.h"
+#include "luo_internal.h"
 
-static struct dentry *debugfs_root;
+struct dentry *liveupdate_debugfs_root;
 
 struct fdt_debugfs {
 	struct list_head list;
@@ -120,7 +121,7 @@ __init void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt)
 
 	INIT_LIST_HEAD(&dbg->fdt_list);
 
-	dir = debugfs_create_dir("in", debugfs_root);
+	dir = debugfs_create_dir("in", liveupdate_debugfs_root);
 	if (IS_ERR(dir)) {
 		err = PTR_ERR(dir);
 		goto err_out;
@@ -180,7 +181,7 @@ __init int kho_out_debugfs_init(struct kho_debugfs *dbg)
 
 	INIT_LIST_HEAD(&dbg->fdt_list);
 
-	dir = debugfs_create_dir("out", debugfs_root);
+	dir = debugfs_create_dir("out", liveupdate_debugfs_root);
 	if (IS_ERR(dir))
 		return -ENOMEM;
 
@@ -214,8 +215,8 @@ __init int kho_out_debugfs_init(struct kho_debugfs *dbg)
 
 __init int kho_debugfs_init(void)
 {
-	debugfs_root = debugfs_create_dir("kho", NULL);
-	if (IS_ERR(debugfs_root))
+	liveupdate_debugfs_root = debugfs_create_dir("liveupdate", NULL);
+	if (IS_ERR(liveupdate_debugfs_root))
 		return -ENOENT;
 	return 0;
 }
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 9091ed04c606..78bea012c383 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -53,4 +53,8 @@ void luo_sysfs_notify(void);
 static inline void luo_sysfs_notify(void) {}
 #endif
 
+#ifdef CONFIG_KEXEC_HANDOVER_DEBUG
+extern struct dentry *liveupdate_debugfs_root;
+#endif
+
 #endif /* _LINUX_LUO_INTERNAL_H */
-- 
2.50.1.565.gc32cd1483b-goog

