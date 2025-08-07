Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02881A2547
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531091; cv=none; b=ZeZaVj9vI/yVD8Jasc3JAMw2kYlNFxNrflsiOiUvZLI9XBR1X19werm1w1xRMNmhjc0twHZA6UpZ5h/NFZ0aUx8JXIaq5HINNAj/NnT+19hdSVCA8pvHcJt72dvkUj4eSoiIeJbdC7GsMZt4kfP9uErpJ84fk0a8YmHDO+8Tnzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531091; c=relaxed/simple;
	bh=j8U9dBX25POg3ylmKduTkjn9/PsdBpAzRpSmG4BnN0U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUoX5/MZDyU+l7ABINCn6q2FXSChOaaTEVcXuKNbL+QV6AxH+pJQFVPg/7ItzppwViG4WGJ7C06dGwN2tjsHV8yzrkOiET2b+bsZdWWk+TWhZEnuMvqY/bgFpx+ceq/DsZPuVdaL+GiWNdCD9efy02uL6+eXPXzjvJzvU9BMoMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=hcD3kctN; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="hcD3kctN"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fa980d05a8so5823136d6.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531089; x=1755135889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QL9c1v+BMlgTEn5uRe69e/JcEH0iWS47GlDWai1cxXk=;
        b=hcD3kctNjZc3kFV5k9f3vcT7REP/8ZW8l/0asf6FdEBVRdWccpGky9M4nf1Rl0hCfA
         +A/WqueVjZ6askxg8Gx6/6Gg51h0n20X7KILDPQulb2hc3VpRA8grBnutwJn3RDyYNkE
         hN/3h/KOliYnihzqrZCh1Acfi+opPSbl/ecGjRWYTOCVC2RJCrhvNxKIyb88RPQ81/gD
         RXPn0nh8DUuh/71T5urQR3wmmN3ci00EBK9FCABq31oSfCdlb4j2Rfo6S45kdTw4wCuu
         mBQ2klevl1FvzMiZDW1NXdL6i9OkAtjIPhk/w+bwXqevH0bjKPtr6XspSEDbPoKwd/dC
         T6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531089; x=1755135889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QL9c1v+BMlgTEn5uRe69e/JcEH0iWS47GlDWai1cxXk=;
        b=gPgYs4QN6PN/8pdmCIG/CY/tUiyVSqbfS0sV5gyUVOi++iTAlBT/jfBiBQ2YPbMd6e
         +BIrKXs0LvP6UV7TUeKSJtnjhqJ6NqJXpO4Ny0413/W4VbtAbSDrg2wGwVBbQ4zz0Rxb
         lap3LAbmYqQI7Ho/2FVIZv2HfSQxtVN9pRXOTh9jhr2MECAVt84Bi/U60x6CS6ia5fnf
         AcxfrCuR/GIWLCIPcdy4BfViAIHpRsMD8rB4jWhreCZ5chYXqJiBwqMRQpTTmB858V2d
         BqSaupbS0WW4eSxu+lz9tPPtUB1No2Ma3/jkk/++m1O/wCtmSPgzs93VaOVb4gv8PKqC
         iT8g==
X-Forwarded-Encrypted: i=1; AJvYcCW5pabWBOPiS0YB/8OvAis/6pWrVgcvj02qKjrb8vNVAoemSjXFsjumNvFAtxWmLazo6nnDLuKle5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7kpZMG5VmC0raCbso0IkS+HZDdvY+EbAoZbXMFTcAo1JjjSx0
	BGWxgONqCubRc2isQWefq+x9mxUr7Tv1srk1sTHG2UFmyW5Tx/7pSCcswcvbxT9N45w=
X-Gm-Gg: ASbGnctv8fRVK88nIKZhhqNCEV41/FU9rQA2zcxkUWm/vaApuq+AFd1q04l7n5PB2Xv
	sWxfHo1J7C3oNgYfKgCMIP837LEHhmjAr2sAkVgWvMdvIHLyF1lVpyI6HcsQEusCaAGey17KcNI
	Dr3Gksi45E3wFQp3P/BtrXK/1Y/zAK/G4BPe9Ak7Co9flJ1ILQnkaPWxgUT/LdaDFqO76YLUU2G
	AxNv+Ky5gBAJxgwu/VqsWznNid4BjZ+RrfUOpmwPQiW3BwJrmEINJYZoTBIky5suWNvaezg9lSI
	ggJDrz3hUJdVtTKocSkwokmZIwNLkp9TaoA0erzoH+APIPfmyfODAVikD9puL3eD9H7nfecuims
	W7/YzscH62JaKaa2rWuJnwWJz0AleUULbST56Tdz6sLJmq8CShezUyU/b0TIpt8oGZCHvEUVCYj
	CKpiRhJc5XLPO8Qn+vER2f3Mw=
X-Google-Smtp-Source: AGHT+IHEETHVqmTbuWgs08Fwqn+h92i7koaC3q6+hGqOy8xHcPTrkyrnZKvlXSo9rTCs6WBaAbd2Hw==
X-Received: by 2002:ad4:4ee4:0:b0:709:76b4:5936 with SMTP id 6a1803df08f44-7098a898d5bmr22807336d6.55.1754531088556;
        Wed, 06 Aug 2025 18:44:48 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:44:47 -0700 (PDT)
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
Subject: [PATCH v3 01/30] kho: init new_physxa->phys_bits to fix lockdep
Date: Thu,  7 Aug 2025 01:44:07 +0000
Message-ID: <20250807014442.3829950-2-pasha.tatashin@soleen.com>
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

Lockdep shows the following warning:

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.

[<ffffffff810133a6>] dump_stack_lvl+0x66/0xa0
[<ffffffff8136012c>] assign_lock_key+0x10c/0x120
[<ffffffff81358bb4>] register_lock_class+0xf4/0x2f0
[<ffffffff813597ff>] __lock_acquire+0x7f/0x2c40
[<ffffffff81360cb0>] ? __pfx_hlock_conflict+0x10/0x10
[<ffffffff811707be>] ? native_flush_tlb_global+0x8e/0xa0
[<ffffffff8117096e>] ? __flush_tlb_all+0x4e/0xa0
[<ffffffff81172fc2>] ? __kernel_map_pages+0x112/0x140
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff81359556>] lock_acquire+0xe6/0x280
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff8100b9e0>] _raw_spin_lock+0x30/0x40
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff813ec327>] xa_load_or_alloc+0x67/0xe0
[<ffffffff813eb4c0>] kho_preserve_folio+0x90/0x100
[<ffffffff813ebb7f>] __kho_finalize+0xcf/0x400
[<ffffffff813ebef4>] kho_finalize+0x34/0x70

This is becase xa has its own lock, that is not initialized in
xa_load_or_alloc.

Modifiy __kho_preserve_order(), to properly call
xa_init(&new_physxa->phys_bits);

Fixes: fc33e4b44b27 ("kexec: enable KHO support for memory preservation")
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/kexec_handover.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index e49743ae52c5..6240bc38305b 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -144,14 +144,35 @@ static int __kho_preserve_order(struct kho_mem_track *track, unsigned long pfn,
 				unsigned int order)
 {
 	struct kho_mem_phys_bits *bits;
-	struct kho_mem_phys *physxa;
+	struct kho_mem_phys *physxa, *new_physxa;
 	const unsigned long pfn_high = pfn >> order;
 
 	might_sleep();
 
-	physxa = xa_load_or_alloc(&track->orders, order, sizeof(*physxa));
-	if (IS_ERR(physxa))
-		return PTR_ERR(physxa);
+	physxa = xa_load(&track->orders, order);
+	if (!physxa) {
+		new_physxa = kzalloc(sizeof(*physxa), GFP_KERNEL);
+		if (!new_physxa)
+			return -ENOMEM;
+
+		xa_init(&new_physxa->phys_bits);
+		physxa = xa_cmpxchg(&track->orders, order, NULL, new_physxa,
+				    GFP_KERNEL);
+		if (xa_is_err(physxa)) {
+			int err = xa_err(physxa);
+
+			xa_destroy(&new_physxa->phys_bits);
+			kfree(new_physxa);
+
+			return err;
+		}
+		if (physxa) {
+			xa_destroy(&new_physxa->phys_bits);
+			kfree(new_physxa);
+		} else {
+			physxa = new_physxa;
+		}
+	}
 
 	bits = xa_load_or_alloc(&physxa->phys_bits, pfn_high / PRESERVE_BITS,
 				sizeof(*bits));
-- 
2.50.1.565.gc32cd1483b-goog

