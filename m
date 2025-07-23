Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A72EA720
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282020; cv=none; b=VUdTy6E/E0yNL449UVnQveSs+gTRfHUwpI6TBpsHG+0Glv5mv4TuLOI7zVUDtcqu/B2jWh928WSYL6fvZwUDOysBD4K3KLe5C2fepWMBEydqiQB72WTmNsfe75X+Byojab0o5aAgMHTmRR/jc3rEW9XR2B5rKWgm2zmBwRTPFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282020; c=relaxed/simple;
	bh=f+GDZMWDZJ+VR9AGii24ODCbYkbiXkpxGsAaLIJVFdg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnEkFoDU0ViVJNa1dymIIRF4EDybqBi6YayStG5nhz6n4joYenhGPTPt/6aoIn0Be+93zDGdFjFaVUOwFNnwpBrCG/bvNFLjIMAKXEi9T6CmtIPFzeUFN2Z8gmwLHeS4ihMgD9p8x/cUJFDOR6kNi2QCk4KEpztml95yR9+JBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=IHZNcmFa; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="IHZNcmFa"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7183dae670dso62710437b3.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282016; x=1753886816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inB1PU3JWa0vbtTol7UPnIAGavYFixpKMP3Mnwcd84A=;
        b=IHZNcmFatXGtvf/rYbXauEIWrfIzb1QEczTtP46KsO1VxWQL2GSvPvqA7welG7yDMy
         kPny59P7Fb9o1mxJIh/8DwUndsozrNI2GQkaqD89nndQo05Y5Ll2w0HY4bpBpYswlm68
         HSrSc42XyqKGkMyCFWx10JADe3vN+d1ukSd7awPUFWYFJTQfhRaa0UDKPxl4WQZXntfQ
         FJdLcFy9dDthXh02+pKLHtY84O32mR+m3z9G7ldDcGFnUbqghx6LzcCy3E1i3QtrqGpF
         OycRt3LzEW/o0+10B6FyrtbH6/VE3j4AoC25P0IQVyc9z8WgShZhbY/H4FxwZ0OITJEb
         Mq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282016; x=1753886816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inB1PU3JWa0vbtTol7UPnIAGavYFixpKMP3Mnwcd84A=;
        b=oY+PnVEQVtdZE+ZoiB/gtSdloAwtVsHxGruxOQr3m3VjhDTf6Mrs+9kwAQVHGoidsF
         ibHLes6oirh1fVCL6RZ8ffDVlHi/sCV34PtxJiGj2qL5wxTiopxnAEWIl8Q/1hNiPmS6
         pWyRnWIOgS5kf4HtWYPWPr2WLAqxzLKghmUquesryH1YC0/vIhkNyEUw4QXJ8uxBG45R
         qLP6HbA0jsSi8UyX2kRJrxZLoeh9oVIHpb769Do5n02pgAyOhmLtCR5KkiGcRApF7yE8
         EmYKT6DrPQDTjh7+iEwoD8btZnC65RTNP1hcWGrsu+M4tvJ1Gqvtit/CfiEdVpzEGUfn
         ZYtA==
X-Forwarded-Encrypted: i=1; AJvYcCU/5Z4/agVcgNdxrMGCGJtN1eTCytbVqWL5CbzLHZql0jjAZUtooF0zb/WgArqmUpbZdaCyc3pDY80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxehLLB2hIDSzwfgnpZDDnYJd9+3g9bwODJHY/0IDI3rYcMMrBp
	a3+4dSgsqh5poBUMaS+773yJu0cRZsmai1HoWd5HpQQxj+7FHYIjSq3PVdPlYQMqwwk=
X-Gm-Gg: ASbGnctk2eviz+xKAOWznqXYGOebvRla8V6xOOaiNPRKIktBfwImDKmElbAptpHM9tN
	juMVEhJ3EMLQJQr5YWBIIcsLXTAreE/JKs6EkxIAEsIm1/PBmNVkMj80Scx6cIkLXLHhrFbgoHd
	wOXcmSAxLuRZe6hG97WLCCZaC8iXU2bpzbnfaxkk1QtK3Po0G7yQMEUZmnGeoq++nKKZspwbXi6
	JfwbcwVzfLM/DOHHLsQOx58X4YHm+vtPuM1OCfO3BdijrTVDLJvORWm2xOqV5xWybW6iZKn5/DE
	zqmkzFhLgtTymFo28WDEE0yDzOmBdG70zbd/zI6ClzG42pl5pSVnNZZwDvmmu1yYis2QFYxskNG
	Vfk2/X9KmWt1n7hyFs2n0onY+gItoR978mOdq1s73xnWmkFZw5lVpcTEXoaYhJW+48f8PFy+/pa
	t1Io6GSyb5U2DlaA==
X-Google-Smtp-Source: AGHT+IHbn/J5Pj5jthdHC0UvAscyWuGSIeItHc3xuSaAqAb6w+jHqSJyHG/OBKZLtTuVuVxeIgZROw==
X-Received: by 2002:a05:690c:3693:b0:70d:f3f9:1898 with SMTP id 00721157ae682-719b4258e07mr46642237b3.35.1753282016453;
        Wed, 23 Jul 2025 07:46:56 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:46:55 -0700 (PDT)
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
Subject: [PATCH v2 01/32] kho: init new_physxa->phys_bits to fix lockdep
Date: Wed, 23 Jul 2025 14:46:14 +0000
Message-ID: <20250723144649.1696299-2-pasha.tatashin@soleen.com>
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
---
 kernel/kexec_handover.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 5a21dbe17950..1ff6b242f98c 100644
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
+			int err_ret = xa_err(physxa);
+
+			xa_destroy(&new_physxa->phys_bits);
+			kfree(new_physxa);
+
+			return err_ret;
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
2.50.0.727.gbf7dc18ff4-goog

