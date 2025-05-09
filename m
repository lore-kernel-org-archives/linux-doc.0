Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158FF2750E3
	for <linux-doc@vger.kernel.org>; Fri,  9 May 2025 07:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776836; cv=none; b=efV3zU+7GaWI5V4d7iIUOUihugRtvbfFjrNBnGAqHoUvnBKsg8PocQGK6uXRIo5r0SpRbnV0ZtHdsDAhNKfMPnBm/aGTjQlow7sTHRGBrRenIi1OiT1Ubk6rwxppOUkxQEJ3JiZmvr/ZrrpNCUZu+sH14NLqSuuC6OYnltY/Pxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776836; c=relaxed/simple;
	bh=M2fOmpSYPm0vGqsse4NCL8XM8cZDsX2s6YmyHwSFMNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u4VAH5GNiRa7JZUODr60GI5Ad0CbGhKrUYojTm7ZrgM1yhe04sf8V8WoUd3NO2F5l6088KrJoP8zCBJUmh+vjlV5C5e8xVUwYNkj1SC5lpmrRGzPhkWOj/tK0vcGIsxp6Y60SWm7GFlEaLbuvCulY3tM6KuiVZPqzv6TJewAJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XXjAJwKw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XXjAJwKw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e6c82716dso13925875ad.0
        for <linux-doc@vger.kernel.org>; Fri, 09 May 2025 00:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776833; x=1747381633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPB4CC6STDK5kdrBEcCYHTnvRNdt0f3J8K3gkRMCX5Y=;
        b=XXjAJwKwYGK9nyVIWNtFDRjEiIck0MOJuA4O/qH2qmdmGQ4RrL6K3NokJLfuIM+KTf
         LC562GsKLCcnVChE9GojyaRuylVE9EISvy3PX2bKt/88pYpmy/T+OrDmJyNGYZl8XWx/
         QVDOe8T4Bc8tsergX4v6H0QGDiObyrUh6Y2VRgX5QxQRLuiY2rLEhIbq+Az6j9q0G3Ys
         1qsOKxxXCXKLTMtI5kYpEi/hz/tB8u3ECEmvnqWjLHkc+BGiNJTUpLviasuqW235DyqG
         jet98iUrNsTB9TW7pWZ/9HEahXetkXGcs5Ajr+/ss4N+TS/GHyPTNxBTh0GxUMjJOicI
         inuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776833; x=1747381633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPB4CC6STDK5kdrBEcCYHTnvRNdt0f3J8K3gkRMCX5Y=;
        b=kw5/PIEt08+EHCWOLLGMbFPRxXtGlkMCRvTJSqnvHagkiRpyNYXFRorwfzUq5IGRTg
         fAHeWdzGQwMCnnxiZG5e+VZGyygnnd4pAQ7Ed4P9+mPjvrIvnZ/zM9ZmMCyGnbB8cUGl
         b30nvXUkUp45JKGn161aXQe8x79BXAbZHrIUhS3gtWxIeKVFv7vSNS2+K4pOD40eqEUy
         ivxDSWexAPPwVOISoSbz26NZJmMsYfHrnzyNLDYjdT5R4Lru8VOqNHfYF7IY0gAdKPtx
         DVCSlIHcvPb+3zhbtsrWFRBPdCeaJdXWhZep0JBzcsmcnoW51yjE9vGemtTfGtFeCZVL
         oziQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDYL96FBKDUKU/7OjoGJKmgCkP62/wF5YQhZAlDb6pixohDsJkRyLsjIS2LoKSyNJzH1FfhBuvmHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCq8Y6j34zJqQq4oNky/5ta9pUZcWpXCYXuWMRY/PXBpT+BlrL
	tctl9yFlO5T4n/CwUk8O9B16w8yiwOo/3M04ZMMn48RiCTVX3PMEIyfdwU+w3s3CF/oXyc8+P6B
	asSjA6DF8IlpQSthIlQ==
X-Google-Smtp-Source: AGHT+IFCD03lD8lWtCnQk0Y+4Q0M0617vfZrCF/OF6DrxVEuOIUh/cKjmOGrlsTtuIki4lqztgFf3ollX+1yRnV1
X-Received: from plbp12.prod.google.com ([2002:a17:903:174c:b0:227:e538:4d17])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2311:b0:21a:7e04:7021 with SMTP id d9443c01a7336-22fc93ef210mr32126535ad.24.1746776833152;
 Fri, 09 May 2025 00:47:13 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:28 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-11-changyuanl@google.com>
Subject: [PATCH v8 10/17] x86/setup: use memblock_reserve_kern for memory used
 by kernel
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

memblock_reserve() does not distinguish memory used by firmware from memory
used by kernel.

The distinction is nice to have for accounting of early memory allocations
and reservations, but it is essential for kexec handover (kho) to know how
much memory kernel consumes during boot.

Use memblock_reserve_kern() to reserve kernel memory, such as kernel image,
initrd and setup data.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/kernel/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833c..766176c4f5ee8 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -286,8 +286,8 @@ static void __init cleanup_highmap(void)
 static void __init reserve_brk(void)
 {
 	if (_brk_end > _brk_start)
-		memblock_reserve(__pa_symbol(_brk_start),
-				 _brk_end - _brk_start);
+		memblock_reserve_kern(__pa_symbol(_brk_start),
+				      _brk_end - _brk_start);
 
 	/* Mark brk area as locked down and no longer taking any
 	   new allocations */
@@ -360,7 +360,7 @@ static void __init early_reserve_initrd(void)
 	    !ramdisk_image || !ramdisk_size)
 		return;		/* No initrd provided by bootloader */
 
-	memblock_reserve(ramdisk_image, ramdisk_end - ramdisk_image);
+	memblock_reserve_kern(ramdisk_image, ramdisk_end - ramdisk_image);
 }
 
 static void __init reserve_initrd(void)
@@ -413,7 +413,7 @@ static void __init add_early_ima_buffer(u64 phys_addr)
 	}
 
 	if (data->size) {
-		memblock_reserve(data->addr, data->size);
+		memblock_reserve_kern(data->addr, data->size);
 		ima_kexec_buffer_phys = data->addr;
 		ima_kexec_buffer_size = data->size;
 	}
@@ -553,7 +553,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 		len = sizeof(*data);
 		pa_next = data->next;
 
-		memblock_reserve(pa_data, sizeof(*data) + data->len);
+		memblock_reserve_kern(pa_data, sizeof(*data) + data->len);
 
 		if (data->type == SETUP_INDIRECT) {
 			len += data->len;
@@ -567,7 +567,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 			indirect = (struct setup_indirect *)data->data;
 
 			if (indirect->type != SETUP_INDIRECT)
-				memblock_reserve(indirect->addr, indirect->len);
+				memblock_reserve_kern(indirect->addr, indirect->len);
 		}
 
 		pa_data = pa_next;
@@ -770,8 +770,8 @@ static void __init early_reserve_memory(void)
 	 * __end_of_kernel_reserve symbol must be explicitly reserved with a
 	 * separate memblock_reserve() or they will be discarded.
 	 */
-	memblock_reserve(__pa_symbol(_text),
-			 (unsigned long)__end_of_kernel_reserve - (unsigned long)_text);
+	memblock_reserve_kern(__pa_symbol(_text),
+			      (unsigned long)__end_of_kernel_reserve - (unsigned long)_text);
 
 	/*
 	 * The first 4Kb of memory is a BIOS owned area, but generally it is
-- 
2.49.0.1015.ga840276032-goog

