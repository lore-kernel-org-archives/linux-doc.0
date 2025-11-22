Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F62DF3D1
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 22:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763850266; cv=none; b=si6UDaa+Izj9UtKMryrypifrvFO3JuK9jy5CisQvyhN3XHQPSx/AxFvjSAwoPmDI35Nk7IU0e2cmMGBFitr+0uCkDTfCMFgagg1pyjh+e2XadZutyEmNIMYmmOzo6iI4OfpNOd9JhBVWgxirhT2GZeMpn60aXbFGZ3cSlpa426s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763850266; c=relaxed/simple;
	bh=0xJF18qOKcU5eAzQ6HxIuG25uSo6cc+l5rprPtdnC7I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCfYkfmjo7GfVQclIEi4GZUpTUGOPNFiqZHrl6ARK4aeeM2iyW2usY7cXFqVLGchovvceQXsJuMH/Z4QLB+PvSC4AZFxAbky74/QXFbE2SFUqYhs5m/aLLiScHItykDew7tdRbNC0vFidTlLJtjygLb/Tm3xoIxEBflu+XMxxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=V39WykpW; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="V39WykpW"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78a6c7ac3caso32357617b3.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 14:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763850263; x=1764455063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ff4h/Y+aeCaryuraEaQmIoWWBfglnwQ79bUWNkRIqMI=;
        b=V39WykpWUjGUgm+ihW2Lf6k42X2ugYC5LmhkjulLjEOtWOR/Q+xaLPN+L3OKHyYNef
         GK22D12dfWSwNm05DVqmbdlOYE8z9y1SCTsJTd/mpp4I/v1Yr33e1uh/VCw9Ci+j5ym9
         ZE3kh9FkMNA3ptK8GsDCh9TneMNzQ/AS+nb+FGvTLZ6sUC8WnsWZjemhW98dypXFeuci
         Gw+xREXybTuIkhJhfs32e62gbzYiCTubfGKGU+2TN+NkM+y20lPwxVInI1k8klT610B3
         WTsQzOD0J39F678w5Q/6wPWbi9wzHZ8FvmhVlHcgA24gccdaY/lr+QbRFElZWgLX8pp4
         boQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763850263; x=1764455063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ff4h/Y+aeCaryuraEaQmIoWWBfglnwQ79bUWNkRIqMI=;
        b=HUIpBotaKJCv1ZvPLQ65em9bYm5ukI2t7J/x8HEEO57VK6r1c+0aH94uHJF2dnB5AG
         wQsvrGY9psfhnDrnSKPHBypiNSmjWi3KCzGA1vpTM/cWIFMs4ply4scvubaod1VEI/Qv
         n+RUTdSFo7s25SqcRJLm4dVDVrDHE0UbU74hQSUQgfD3Q1ObOlQH5kotsH+8Yfy0p34c
         7v/N+HPDaoeSasOSUS6iiVX/pdfXpP8M+S9v6ahQ7KF0H0DmAksby83KaBeMGulm8GBz
         q791n0QAirOZQK3pgSNDhy2vNrVk4F99armbDkimZ1UNX3eFg24uLfL09L64yLagGB4Z
         C8RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIKPMRkzU8pBOEZxn8ti/P53E+c1prz3OVizg6ogTMb/yHAlUIx793vUwgXvQVTlvejpz36A/n8UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFqwKZe/KFR90OBBqVoRIecAU3LRxEftxjOk0HvT0pb1lggyVq
	MSvml7BjTq9R6zqzS+z2B6OlDPbAC+FO9FIvuj0RAoYfCG2CDoqqIHZeNin3Lk1RzE4=
X-Gm-Gg: ASbGncs7m1CuMqPwGVYGz1yUVv8hID67RrFRCPXfwn0bLcvnzko6FZxUQZjRZ9u9rgk
	ACXKIY5F8WVRJtMYha/GVa3W3aZiD7+QX8YfJoeBM/wIgUnIWXe+V1iEPuVCDnBBaIfqPEB9Yvk
	9eITN5gihza/T9P8M3ir7o097aI4aPTQ6pLdXra1fcKF7KDSM+P+EaykIr5zWB1t1p87q8Xspw1
	+s7wnkh77r54vZ5EfwuOkWOPZ1ptU8mCrGSwnPO/PWYeVqv7/9WuSlIwxy6kC09TjfpR6q4dGLs
	WNvlGO61RJC4d6s5qsPxRSDpBu5uEE0dVGHskJaHz3UabGXTKrdPnuQY819Z4yaplGcWjIVeZxb
	eeAA6W0rkj1D8Zv9ISp1aqL3lbIj18kkg7M10ndBJcMIMzAT6DUgsZkDIRJFARrfHnbKfeAPZnq
	9QYNn/ylMxs6ldrS0ZBHVQycGBRvegwg2SY4EFAAI0h5VKIOcZy1TOrSZBqfhp6yBBV5Qw+BxMV
	49zsCE=
X-Google-Smtp-Source: AGHT+IEh/qsJ9xlDDV/YCr14e57USKSEfNEr00YTzpdoNrXFY7RlW6SCMXKos9LFs3pSvdRKqhUulg==
X-Received: by 2002:a05:690c:6282:b0:789:24a4:59dc with SMTP id 00721157ae682-78a8b54896emr60698047b3.70.1763850262632;
        Sat, 22 Nov 2025 14:24:22 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79779a4esm28858937b3.0.2025.11.22.14.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:24:22 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
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
	chrisl@kernel.org
Subject: [PATCH v7 13/22] liveupdate: luo_file: add private argument to store runtime state
Date: Sat, 22 Nov 2025 17:23:40 -0500
Message-ID: <20251122222351.1059049-14-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

Currently file handlers only get the serialized_data field to store
their state. This field has a pointer to the serialized state of the
file, and it becomes a part of LUO file's serialized state.

File handlers can also need some runtime state to track information that
shouldn't make it in the serialized data.

One such example is a vmalloc pointer. While kho_preserve_vmalloc()
preserves the memory backing a vmalloc allocation, it does not store the
original vmap pointer, since that has no use being passed to the next
kernel. The pointer is needed to free the memory in case the file is
unpreserved.

Provide a private field in struct luo_file and pass it to all the
callbacks. The field's can be set by preserve, and must be freed by
unpreserve.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/liveupdate.h   | 5 +++++
 kernel/liveupdate/luo_file.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 122ad8f16ff9..a7f6ee5b6771 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -27,6 +27,10 @@ struct file;
  *                    this to the file being operated on.
  * @serialized_data:  The opaque u64 handle, preserve/prepare/freeze may update
  *                    this field.
+ * @private_data:     Private data for the file used to hold runtime state that
+ *                    is not preserved. Set by the handler's .preserve()
+ *                    callback, and must be freed in the handler's
+ *                    .unpreserve() callback.
  *
  * This structure bundles all parameters for the file operation callbacks.
  * The 'data' and 'file' fields are used for both input and output.
@@ -36,6 +40,7 @@ struct liveupdate_file_op_args {
 	bool retrieved;
 	struct file *file;
 	u64 serialized_data;
+	void *private_data;
 };
 
 /**
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index f10d6c37328c..b235d1b562ad 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -129,6 +129,10 @@ static LIST_HEAD(luo_file_handler_list);
  *                 This handle is passed back to the handler's .freeze(),
  *                 .retrieve(), and .finish() callbacks, allowing it to track
  *                 and update its serialized state across phases.
+ * @private_data:  Pointer to the private data for the file used to hold runtime
+ *                 state that is not preserved. Set by the handler's .preserve()
+ *                 callback, and must be freed in the handler's .unpreserve()
+ *                 callback.
  * @retrieved:     A flag indicating whether a user/kernel in the new kernel has
  *                 successfully called retrieve() on this file. This prevents
  *                 multiple retrieval attempts.
@@ -155,6 +159,7 @@ struct luo_file {
 	struct liveupdate_file_handler *fh;
 	struct file *file;
 	u64 serialized_data;
+	void *private_data;
 	bool retrieved;
 	struct mutex mutex;
 	struct list_head list;
@@ -300,6 +305,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 		goto err_kfree;
 
 	luo_file->serialized_data = args.serialized_data;
+	luo_file->private_data = args.private_data;
 	list_add_tail(&luo_file->list, &file_set->files_list);
 	file_set->count++;
 
@@ -346,6 +352,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		args.handler = luo_file->fh;
 		args.file = luo_file->file;
 		args.serialized_data = luo_file->serialized_data;
+		args.private_data = luo_file->private_data;
 		luo_file->fh->ops->unpreserve(&args);
 
 		list_del(&luo_file->list);
@@ -372,6 +379,7 @@ static int luo_file_freeze_one(struct luo_file_set *file_set,
 		args.handler = luo_file->fh;
 		args.file = luo_file->file;
 		args.serialized_data = luo_file->serialized_data;
+		args.private_data = luo_file->private_data;
 
 		err = luo_file->fh->ops->freeze(&args);
 		if (!err)
@@ -392,6 +400,7 @@ static void luo_file_unfreeze_one(struct luo_file_set *file_set,
 		args.handler = luo_file->fh;
 		args.file = luo_file->file;
 		args.serialized_data = luo_file->serialized_data;
+		args.private_data = luo_file->private_data;
 
 		luo_file->fh->ops->unfreeze(&args);
 	}
-- 
2.52.0.rc2.455.g230fcf2819-goog

