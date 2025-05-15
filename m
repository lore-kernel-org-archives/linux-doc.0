Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD40225D529
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333413; cv=none; b=sG4ZaUaZMtp4rqpcNOsV9qrer8I2u5IKBzW0siMbBHejPQJVHd/jY0feISFPxK2wx3SSBmVJAMMVzIyJsuPKh/j/Pn7lfzdYwzBelX3FKn5YzlSa1+8YzLecl7e6O+S4P4rAyvkdLRPkohlZ/C0QnjnjRQmxrvYahizIY97XGg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333413; c=relaxed/simple;
	bh=1rYzlB4jt+NgzrmG5MLloEzusBe5IEirmGPBVFDNYcI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbEuoZblm/vbrgm4BKGeyRR65bHnpLCjOnvwl9d1SVw+vWV7dTIIlqvmJnbhP0Szpe6JNhodqJMy4NHvWCHnqSUiTKthtavYTpO6i4YaQrZ8uZourEfVuQNvgBO9+Hjq7jI5N1M/Zym2DTHTm1/EV8TsC6rWVxI6Bysl2wR/9go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=u9AQ1qIa; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="u9AQ1qIa"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4769f3e19a9so9566231cf.0
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333409; x=1747938209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1cQld6s+fHhsQGRDIn5qKXAP1aMOMnCGujzp2H2Sb8=;
        b=u9AQ1qIapwgr8HRYKUxb2EmTswFXhzvguFJGm3MZfOmRXRFWYIEU0KMHJcvMGj4S8j
         Ixj9TQjQfElegZuG1vbLDlA/T5cVuJzs8ajiibWPo/RDiLN+D6JD8s7l1azqXwKOyeGR
         29ZiCWHCGzLyUOh5V0+WmMWXTCE7A0PBcGibfHS2hN3pn1cFrMqNV11UmjDQMjRGZr1c
         Kp3d3JdAe038R3M9QsGqeMganAGGN5POuPGJNHmT66nxA3Tx5tMIPlK47T50M+IXdRWN
         iQZCamTKWedAyBVHcmR5+5a+uhuhkAsgQodpaJH5hPXigx+FoimPa4rTZ1l3GWiczZpU
         iNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333409; x=1747938209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1cQld6s+fHhsQGRDIn5qKXAP1aMOMnCGujzp2H2Sb8=;
        b=FTk2+vPseXj1kLxdTLrpegnr2cYzoyeyk7Uaa+KR5Hy80OLuw+FRawMhaHIMBTURze
         f1Yh9RqKTVwXlY4+CfXLZyvACJKyaZpGovf+By9OA4/zU4IkJwONqXFOJnMLf2oeWZy7
         2rhxa/dUxlQeisrzeeHk6Imi1AJ4F6qJ8LffutTsOlFFsOkH96govcHJawtX4bLALjZ9
         h7Gmto8KJwV6AGaeySgtKs8VQ5l1HTnafl1tgZ37r+s3tZZu4mkZRJurgp8nKmE4GmPk
         JklT+LfR0igFJkeb/cOv849ZXhLKJkVwpOXlNu3jeSPaclwOE6sWMCWeiGsQHLG4UTjs
         zbkg==
X-Forwarded-Encrypted: i=1; AJvYcCWR0KBUZ2H7teZQKAKe1dz/c3Ym90vth7EMawmJB0ipxo/WP73B351pXa0jy14T2DGcJ4NPsj7O7hI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4S0jYO4zuCZgGjgC0/hIgigFitv2WJsgPKF0uhZGsCvpRCLyT
	7zGVIbX9TqWkp9BKm8oSywoqC/CwdwrPMh26t5A+oeJrEgDfp50SUcCJ6A2aRxqulYs=
X-Gm-Gg: ASbGncuQqYgUpboIzLxmTjlFzwswePj55uFF2UjtMN42O/eyNBezMsmu9lEdcnoeOQG
	lV3pdB5Bv9u39B11gYc1K2Rr5W1GbqXndUiGbHIr98JhlFC7DbBzzAHeHhYDZsYJaoEnhP8B+c1
	EoABGpLlkHs1WmrnZ8Hf8mpgbwLTPobgks6lMuqsBpYy1JTnAOKeewgYw6EVdXhpW2IUuueyVKn
	5+/I7yH7Tw28O/zwarFCoPzyBEANMooAi4evVIPQlewdqJR7LPNcFF1d5u0kBgq/Rbz//f5BS4a
	OA/xh0AeY8+by8kleGryZ6DVJNdvrvqK8c/uQZl1QAt9Crpee8nIfIBf/PTc7pdJF+caubCaaUM
	xH/XLMBC/qqc03TgIlC9+Vll082yen0xDnhpLZETckFjc
X-Google-Smtp-Source: AGHT+IHMdR7jltadwLx3md1mkyCXtwpjmFH9FzZ/ZTOjwdYm/5D6IYoCeXD8qKkrvwmgbOc0uZ2I7w==
X-Received: by 2002:a05:622a:4ccc:b0:491:18c2:2d1 with SMTP id d75a77b69052e-494ae34b351mr5878641cf.7.1747333409292;
        Thu, 15 May 2025 11:23:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:28 -0700 (PDT)
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
	ptyadav@amazon.de
Subject: [RFC v2 02/16] kho: allow to drive kho from within kernel
Date: Thu, 15 May 2025 18:23:06 +0000
Message-ID: <20250515182322.117840-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
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
 include/linux/kexec_handover.h   | 15 +++++++++
 kernel/kexec_handover.c          | 54 ++++++++++++++++++++++++++++++++
 kernel/kexec_handover_debug.c    |  2 +-
 kernel/kexec_handover_internal.h |  2 ++
 4 files changed, 72 insertions(+), 1 deletion(-)

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
index 5b65970e9746..8ff561e36a87 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -734,6 +734,60 @@ int __kho_finalize(void)
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
 struct kho_in kho_in = {
 	.fdt_list = LIST_HEAD_INIT(kho_in.fdt_list),
 };
diff --git a/kernel/kexec_handover_debug.c b/kernel/kexec_handover_debug.c
index 696131a3480f..a15c238ec98e 100644
--- a/kernel/kexec_handover_debug.c
+++ b/kernel/kexec_handover_debug.c
@@ -55,7 +55,7 @@ int kho_debugfs_fdt_add(struct kho_serialization *ser, const char *name,
 				     fdt);
 }
 
-static int kho_out_update_debugfs_fdt(void)
+int kho_out_update_debugfs_fdt(void)
 {
 	int err = 0;
 	struct fdt_debugfs *ff, *tmp;
diff --git a/kernel/kexec_handover_internal.h b/kernel/kexec_handover_internal.h
index 65ff0f651192..0b534758d39d 100644
--- a/kernel/kexec_handover_internal.h
+++ b/kernel/kexec_handover_internal.h
@@ -60,6 +60,7 @@ void kho_in_debugfs_init(const void *fdt);
 int kho_out_debugfs_init(void);
 int kho_debugfs_fdt_add(struct kho_serialization *ser, const char *name,
 			const void *fdt);
+int kho_out_update_debugfs_fdt(void);
 #else
 static inline int kho_debugfs_init(void) { return 0; }
 static inline void kho_in_debugfs_init(const void *fdt) { }
@@ -67,6 +68,7 @@ static inline int kho_out_debugfs_init(void) { return 0; }
 static inline int kho_debugfs_fdt_add(struct kho_serialization *ser,
 				      const char *name,
 				      const void *fdt) { return 0; }
+static inline int kho_out_update_debugfs_fdt(void) { return 0; }
 #endif /* CONFIG_KEXEC_HANDOVER_DEBUG */
 
 #endif /* LINUX_KEXEC_HANDOVER_INTERNAL_H */
-- 
2.49.0.1101.gccaa498523-goog

