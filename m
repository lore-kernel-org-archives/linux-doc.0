Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCEE208961
	for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 01:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759107879; cv=none; b=copXa3ORbFqllxoqnbz/fxCYqATWKhraHv2QKrduQdYqpnNhKNDOAnXVNYkfmf8qOtNzhZOLcZ1wiJw5b0MZtDIh33Zq+FFQynFnKpxonSK+MLWBdFf4KeJtXgLf6Vf8+jsWHJbv5gfre3tBv6U5FNy+g4+djde6Mqel25dRrJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759107879; c=relaxed/simple;
	bh=DI5vibT0+29UIjhRz7D4vqAFmzDsP/l5eapzRzZNOQw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoY5YBeQIpLuegu5hoiEj2wThBcDeVskuy5r7gyPKTSY0Y//y5pozCDqivnz7z6mF1lxgdH4U4K2PfWSc8D62AHhjsL9LHB5ExDmBzZgt4FiNpkTgq1dXc2o39PFPlbm5L8EkQmAT3Vy5fP4z/dGUJcpZO12FxjuQt/rmFTDFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MKiGmsN2; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MKiGmsN2"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ddabf2ada5so35675191cf.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Sep 2025 18:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759107876; x=1759712676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQeH+ACDAvWfipNpkX5nREJXLCZp+2/jqJfKfCHTDvk=;
        b=MKiGmsN2WYYz/WAujnueowinTHOJeSDOIbt2w04aI5nxK/f7efwVsRW54abO0Irgsg
         AR9UMU9ASau5r40q2k5fNouDu7rwopqagFCKproUsyxGzkMjYwTthtUKhMq1EejtNzUR
         ctMHKRzBFhjGSKCEIKiyhHAQslJlMAOi3hkasAKTuT9MabwNSJv245Vo1pxwys4WCV/3
         ullqK8XjuEBDSz3n1l9/spt+D30sEVauf4BfqPwzSeSCffl0lY3wPeCd7YMQkikvzJCT
         fNY1ib8uqrIh50E1+/kqgu18rX+noHwHfy86BtqPPo0jSz7XlKawyZgTOV/YXd+gHIWq
         Dc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759107876; x=1759712676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQeH+ACDAvWfipNpkX5nREJXLCZp+2/jqJfKfCHTDvk=;
        b=wMJPw6tl47ogKEEjszxrbwFNQIlm4DxMR3IbkWctnbrCfKM+GPf2Y9sNNcfjK14zQW
         9O0TVRRolxNQ+LUMG7R3GJ8EHts6qGjVM3uuRvJVXy7pUJEsR6NtmdqIcZNPP9j6AjM3
         z7mtjl2uSz5XNWpQTcqB7Z7c8b2ZU2Wj6beWIMvEQIGYbCj2XLlx0nwLm3RhmgFwO1CV
         tOySKHMAwzxIG8vRQJaNHzIA2fBnbz9crd3GZahNfOsiHSuKP0mAfmfosZpDZsJ+o9aq
         u1mqQS13JWMLPsGJRG/ZZdIQpWSM+mRWYSTWX2yc1Hk8dVm7y0CVMAW88e7OJc6hfUIr
         ixxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW520Zl5baWbdlMVIGXS/pdI8M+tMULoPZ3pLAoalRLAa2YCB6TJH71tLOSxuzf98hhevxtEcXdss8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOGjbOE3YhGTau69eqQKuQz+5Pjm+4a2wHYKazgRaAjMlUNvfN
	sxVt/vPGq2yHENPJRVecwJ34JzBWhutKPAppsmu04J8cn3jN661TO2duFYorsNG/Awo=
X-Gm-Gg: ASbGncszC2bFjm4Z5rkE9KRhsfaVtuA1oxFB9ASDty0sT2un8FhstihtHknpwi/L2C2
	VlgSeY0bzmvTqVfeM0ClZEKwxCUFCKiIy1LTt5m5COe6L+1hl4cIZD470cVaAAp+YVDTqT7PAFe
	MBAqE2q7gRQ2ISxZpCNAeagREpi2qTiMtZyW6MpguQFdBgHvfjkHMats8NrdoCH9U+SET+8JV1d
	vpI6nVTgFSo/qthkSGvr1abEThI8MmsrQzKi67jACI8oFHVmzpgCYIAkTJimdls8kKoL4P4hQ7l
	UjwHVA5nHi9aTJWQEdIfYG1bhOyZTS1acB2A+/Q27S6gVXBwcMW+29ViATeVX0zuemOLMaXgwU0
	Rw+z4Wva4cueDe4FI+8EafHY2FfTi1x6Md0NJOvYKZ0+TuD5IdVLISLUgUxJ98/6L+B/h/WBGr2
	tKjDTHqgHIHA2JyXJoDg==
X-Google-Smtp-Source: AGHT+IEPxuS/7M1Es5d/LhiTv2FSJGMeUGCP9yWRMSwEvaODB3P25ESHbhk9CzfQ3IGx46q/YialgQ==
X-Received: by 2002:ac8:58c1:0:b0:4df:bab4:f710 with SMTP id d75a77b69052e-4dfbab4fa58mr62437871cf.25.1759107876179;
        Sun, 28 Sep 2025 18:04:36 -0700 (PDT)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0c0fbe63sm64561521cf.23.2025.09.28.18.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 18:04:35 -0700 (PDT)
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
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org,
	steven.sistare@oracle.com
Subject: [PATCH v4 16/30] kho: move kho debugfs directory to liveupdate
Date: Mon, 29 Sep 2025 01:03:07 +0000
Message-ID: <20250929010321.3462457-17-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
In-Reply-To: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
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
index c9bce82aac22..083b80754c9e 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -107,4 +107,8 @@ void luo_file_finish(struct luo_session *session);
 void luo_file_cancel(struct luo_session *session);
 void luo_file_deserialize(struct luo_session *session);
 
+#ifdef CONFIG_KEXEC_HANDOVER_DEBUG
+extern struct dentry *liveupdate_debugfs_root;
+#endif
+
 #endif /* _LINUX_LUO_INTERNAL_H */
-- 
2.51.0.536.g15c5d4f767-goog

