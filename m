Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A6302047
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 23:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893539; cv=none; b=T/6BMlEHmtW8BkM1rGKM8UTvK8i+ERZezEIOLa9WaLT3hHyRVEHtRukUMt6GDGNkvjUGslaUTy7pVgHSqYzovZjrLjyEKZqxSbTvXTSez5FDGzPf2ov9PPwHbFfm6oiWhAaHAlMkEkYifzmLtLkJcyrgQskrZI96JzwXiCdRdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893539; c=relaxed/simple;
	bh=QtmBwOe5Py6ndIWGzbeMkxazGPHNwvaG1USoZ4ofzzY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKo5S8js/GWI0IGKwAp/yh3M+GPde+j8k3BWII8LQqfgdAgqS66mQleVqXLq2V69qf+wwViCwAtW+bPC7HNQVqVDj6bLIfLu1n8zH8aAtBHOzuxdwZUm9kM382K5/2Re9qYBjDXN2OGI93fajwuEvtewU84lMsH6A0NKQ4pOgDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=pEeEZ3EQ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="pEeEZ3EQ"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8276224c65so382678276.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893537; x=1751498337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiOsnbmXgKqRz5wWOYZUUHO12tKj0FKseA6eFuor5tk=;
        b=pEeEZ3EQ+f6PqmtRLOCl3EhegfTA9Pfm3mt/LaUcL66MENvJ2ogWORqm2A5nILmeHT
         YtYTgGwZJRkiOf+1QAb+LFAHFbX/P0Z2EiwHwkPtuVftY1ko40XK0aPphpQsS6xWFONd
         tOtu3QUhNp7MYqaBBq89vvQOjsx3hzp1VZJzldCBj/8NVNrg2b7/sN3XE9jlrUn7uA98
         Wyuf/7+FAMfn/mb9gb+kY0m3GXd0qcRLFliLGGKxvNvgS/41xeFWy5KW8pSmUyyo808+
         byqowGTaYfRdYfeXwloX4qo6ckCbWBldRdyiaOfQd12ws3LYm5fLrfxzW8Ad68KN6kiC
         QpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893537; x=1751498337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiOsnbmXgKqRz5wWOYZUUHO12tKj0FKseA6eFuor5tk=;
        b=CsOark2rcCvfcGhjXGlUap2cIXSOx3o5GsDmdEu5WxFPQrxqg0YDTsz7CaRuV0qZyc
         Erh1Etmmgb4+34w5s32EzFVgTmstYYp7KCcB+HG3af/6zM3/iJgWBOWnX6Vt3tO3Q8fw
         IF3pPc5j4zT2ikFY2F2e/A3qSS9Rif5ygh8nOk4fN/zCJkVFL3bzLiG2Adq/VpeYIHz8
         4Mulp7uSk6SrSN/BZj71hGWeNRGVNh1Cw9aLmW2VMy2eIshIL0Fmy7gBo7CkjPh2gUWM
         RYlJRc5nrqZ8cW95iHBZgX1Q1qCVbIkc0hwXoIWBbcCQaPcQJz31BJXWbXd4Vx8TghRr
         I0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVCw6YWodhPrmVKtKQXOsWZ6+5MsUVa+ZjQyzzdmi+hqJZymoGXxUxE7+CWImdHSLz1KbFOOL5FtOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YySf7Q2pNDwn9OoQ9jCt2K2GA59fjZ++j0AdHiik7kegUILKSN7
	tvlf9PY0aRXhtUBGxGLSA9u3Q7HcLndGhbWhH22GCpstsAe0ov5n3VAb5L0oG3Bl4Mg=
X-Gm-Gg: ASbGnct7IxDimr2QRXDzRruxF67MkA8rtuEi6DG4nQXSFIlvOp+oCvcpMSXJcfFhXIV
	mWjc28uP1KCQiaHoaaPGs4/688IBGVFnNRDdVnXyKM1HOpQvDl8ehmzQyepKRUYVIt+ZFr2P2o2
	/WGrgw+EtIS6nevKQTR8zP9kOPfYGFRKf2JUKtApjmT7aBpFe4065SaoDl3c6fS1Ts7dPARzxhA
	AUWPa8fvD1i43yZ1hxiLTbgohZsdaGHJ9WoA9rnnyBqvk2mz45z8ap1S7ix6Xupo9wlnpomx6zn
	9fZO9rEHwS+6xffscXilSKDxK2sCjn0GPKA5duTmLOtpWZkPaeUjqRl9ILaoevyaT3iKUT/AR2U
	W2yMfnw67y162uBaghZ8MW7UxRKlmHMawJjbf/cjMOXH1GBXfgCQv555LGL2V+qM=
X-Google-Smtp-Source: AGHT+IHpMMB7jazz0bY3ev82KOYzlZveTNga66zjJgcMQk/SF9LbDk+lxuWqWkLu9eZxFgZd+C91eQ==
X-Received: by 2002:a05:6902:1246:b0:e81:cab6:6db5 with SMTP id 3f1490d57ef6-e86016cfbebmr6753343276.8.1750893537044;
        Wed, 25 Jun 2025 16:18:57 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:18:56 -0700 (PDT)
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
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 08/32] kho: don't unpreserve memory during abort
Date: Wed, 25 Jun 2025 23:17:55 +0000
Message-ID: <20250625231838.1897085-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KHO allows clients to preserve memory regions at any point before the
KHO state is finalized. The finalization process itself involves KHO
performing its own actions, such as serializing the overall
preserved memory map.

If this finalization process is aborted, the current implementation
destroys KHO's internal memory tracking structures
(`kho_out.ser.track.orders`). This behavior effectively unpreserves
all memory from KHO's perspective, regardless of whether those
preservations were made by clients before the finalization attempt
or by KHO itself during finalization.

This premature unpreservation is incorrect. An abort of the
finalization process should only undo actions taken by KHO as part of
that specific finalization attempt. Individual memory regions
preserved by clients prior to finalization should remain preserved,
as their lifecycle is managed by the clients themselves. These
clients might still need to call kho_unpreserve_folio() or
kho_unpreserve_phys() based on their own logic, even after a KHO
finalization attempt is aborted.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec_handover.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index d9e947eac041..7ec9b0826a6e 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -778,31 +778,12 @@ EXPORT_SYMBOL_GPL(kho_unpreserve_phys);
 
 static int __kho_abort(void)
 {
-	int err = 0;
-	unsigned long order;
-	struct kho_mem_phys *physxa;
-
-	xa_for_each(&kho_out.track.orders, order, physxa) {
-		struct kho_mem_phys_bits *bits;
-		unsigned long phys;
-
-		xa_for_each(&physxa->phys_bits, phys, bits)
-			kfree(bits);
-
-		xa_destroy(&physxa->phys_bits);
-		kfree(physxa);
-	}
-	xa_destroy(&kho_out.track.orders);
-
 	if (kho_out.preserved_mem_map) {
 		kho_mem_ser_free(kho_out.preserved_mem_map);
 		kho_out.preserved_mem_map = NULL;
 	}
 
-	if (err)
-		pr_err("Failed to abort KHO finalization: %d\n", err);
-
-	return err;
+	return 0;
 }
 
 int kho_abort(void)
-- 
2.50.0.727.gbf7dc18ff4-goog

