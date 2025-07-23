Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6962F6F91
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282025; cv=none; b=p3yIZMSJyv8R8Uobanmexds1+Hjxlb7lNfD0fW/LTK8Og68jUZV1KTkxgAp1vcoDF1+6EXsC2Jns+qXplXXLTifNgw7Rg9LTnyJunNXg+5Q1TrqAHiT4rwBxHvUl2MAXqgc3UK9CNpFgDHDm4s6aQ1VMVeOIRstcDn/y7NS1emg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282025; c=relaxed/simple;
	bh=hEYGgJwEES9dRnVz2N9sTt0Ks0Wwq55TXM1cQALvjO4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEP9WTu7QQf+Yow1Vi/GgsuldlcAYSCJiYU352A2iEYW50mkLS5gm8ZqjqGyFZFAyKU0Vz8gx17iJ7ul3Ih0d+x/zpXKM5/GXX23h5NbQ0MBK+V0Vx2kIB5pAVb3AYYlx/C1Ng3OlYRsQfxtfOP+Aucl+UdpJSpElnOIOq06Vq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=0e0Sz2TA; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="0e0Sz2TA"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7180bb37846so54185257b3.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282022; x=1753886822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XYi+jDPzWu41ED2O5U4L0RfTKyUhB75+lmsBNGCN0Q=;
        b=0e0Sz2TA42Ej2BiOtVHwZX9CtJhxBGK1FTBpRlsuVY9WTAJeo50zM/Anxkw+iOUOce
         exncFkOaeFlC4UVYO1lXxTkOxe4PshM5MJsNfwYZ8eD78M1iiz651ByqRLVzuMhjSeWd
         acRAtjAH6YAtxPFbQFLrhKKagehgM86PcDu6nuueDeTTBtM+SOexl3UK8KI0xvf8grea
         KASQqvERVBuqhybq9YzWTPYNR8W9rzCTi9kR8SFlSI3o0/7m6TwI1jsktOv2qe0+CBAr
         8VLxKxlNlQKxKZn+4v8RAeP723Stbx1W9UlbsVdEUryzyIfXC2TajOMm1KNT13tRatxJ
         2oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282022; x=1753886822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XYi+jDPzWu41ED2O5U4L0RfTKyUhB75+lmsBNGCN0Q=;
        b=edlmDkJb48wcB4hXTSe/lpOWoLYCKDnfeePmwG5To8PJj7hh6IKZl9kSxJNDh4yHKL
         0X7E6fyB6YROnBeZzP4IIOhsDyztOUSzdhy110xd2pY/EurEYZjvBwZkcAHgzqLEecCr
         jEFoTYjwDwZNQR0y8+PI3W8dlZQFAhr1krfSBCpMMoGK5M7Dx9noCx5se/DLfaJohAuO
         97sH6f8IraLA9yJDgopGJNzP85RdngtwogKp4h8RjwUlVRNAtAg39ZS9tqlqWNbroWUV
         1sUzb5E/QtYfgM1XyJU/xrJDj/o8yjIo+WHUhEOPztS+fI3GyNnG7I/4a/YKqXVCptSr
         6dRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDN8CMP/ansJPUbr13dDwBMFhO4/Xc3g4P1r+ca7o9Oy0R3vLY5qAvZ4T5gHMt7kUQkCdHgete704=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCdIzgxIN6AEGf1Oi7bp9RvSQF6HwtohhP4GANsn38W5zUUM4
	Ws/7Docg7mZ2nKGTy/J5rn7Pe5Ol0hICd18MVJ3fG1NrUmD8AuXzMM7dTZLORqPj0Ds=
X-Gm-Gg: ASbGncux13bjIpYsp/ykMrLkkk37nv7dZKYZ0U+LeC9fBy3pQF9q/PtBoT2wtLh0sNP
	tZcKRdujCwm7ZLNNoYBPT6NX1hk5pQ2Jmy2gQhdENouP+EPWV83N33nLY3oTOUPOc7hXWsoTZLg
	eht/4Ot4JOP22G0gQVZlgHVq8Ph53uNeHxfKlm5vh5GlPmoWqQIifNFWb8K8oo4AOEt3DVKj3Kj
	hZApeF8UQRwjIo5I2YfhqJPyWuBdKX4HPTwzqJDC1z3uq5LkfPU3/gAxNWsvPXZhfrntveMfE/Z
	u/r+W5LUE4QcuAjyzm0n2ocxhlmb7Pxid1QPax8ER7isciAOnoc6HQZv5lza2ryhGdzfDp8SG2P
	zmuGc5R5CU2EKS87TNqNxgMX0WXVTvvBJIpr0RhKbD2xRqLxtAB1Dsc/BSA6Ars6LGhKByRM3qL
	BdvvhVs+Sov15V5Q==
X-Google-Smtp-Source: AGHT+IGIyqUWtaPvswuBOlmOuoZ6Oiu0TyqZMj4g6mxjo7nkGd2imCQgeqT6/0gbrHlbiudRcFkz0w==
X-Received: by 2002:a05:690c:4911:b0:718:38bd:5433 with SMTP id 00721157ae682-719b427d2cemr38041947b3.42.1753282022224;
        Wed, 23 Jul 2025 07:47:02 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:47:01 -0700 (PDT)
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
Subject: [PATCH v2 04/32] kho: allow to drive kho from within kernel
Date: Wed, 23 Jul 2025 14:46:17 +0000
Message-ID: <20250723144649.1696299-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow to do finalize and abort from kernel modules, so LUO could
drive the KHO sequence via its own state machine.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kexec_handover.h | 15 +++++++++
 kernel/kexec_handover.c        | 58 ++++++++++++++++++++++++++++++++--
 2 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index 348844cffb13..f98565def593 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -54,6 +54,10 @@ void kho_memory_init(void);
 
 void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t scratch_phys,
 		  u64 scratch_len);
+
+int kho_finalize(void);
+int kho_abort(void);
+
 #else
 static inline bool kho_is_enabled(void)
 {
@@ -104,6 +108,17 @@ static inline void kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 				phys_addr_t scratch_phys, u64 scratch_len)
 {
 }
+
+static inline int kho_finalize(void)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_abort(void)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_KEXEC_HANDOVER */
 
 #endif /* LINUX_KEXEC_HANDOVER_H */
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 368e23db0a17..c6ccc8e0705d 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -757,7 +757,7 @@ static int kho_out_update_debugfs_fdt(void)
 	return err;
 }
 
-static int kho_abort(void)
+static int __kho_abort(void)
 {
 	int err;
 	unsigned long order;
@@ -790,7 +790,34 @@ static int kho_abort(void)
 	return err;
 }
 
-static int kho_finalize(void)
+int kho_abort(void)
+{
+	int ret = 0;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&kho_out.lock);
+
+	if (!kho_out.finalized) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	ret = __kho_abort();
+	if (ret)
+		goto unlock;
+
+	kho_out.finalized = false;
+	ret = kho_out_update_debugfs_fdt();
+
+unlock:
+	mutex_unlock(&kho_out.lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kho_abort);
+
+static int __kho_finalize(void)
 {
 	int err = 0;
 	u64 *preserved_mem_map;
@@ -839,6 +866,33 @@ static int kho_finalize(void)
 	return err;
 }
 
+int kho_finalize(void)
+{
+	int ret = 0;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&kho_out.lock);
+
+	if (kho_out.finalized) {
+		ret = -EEXIST;
+		goto unlock;
+	}
+
+	ret = __kho_finalize();
+	if (ret)
+		goto unlock;
+
+	kho_out.finalized = true;
+	ret = kho_out_update_debugfs_fdt();
+
+unlock:
+	mutex_unlock(&kho_out.lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kho_finalize);
+
 static int kho_out_finalize_get(void *data, u64 *val)
 {
 	mutex_lock(&kho_out.lock);
-- 
2.50.0.727.gbf7dc18ff4-goog

