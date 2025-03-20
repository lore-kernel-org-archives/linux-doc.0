Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65951EE01F
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742435783; cv=none; b=QMAsiZLnkx+EkGF99hIRc1gXCEhJgrHtlFUbe/PzfwEFRwSAKGt0hY4ZtQ76fQM/+hBleKHCiFaXjlBM8M6vThrhT0UUZg0PJ8WM9t7b8IxwRw2QfNp42Q/Ldbq8fi9dIaJVK01UDuC2IqxDYs/WgqEpgBkR5Nfq+CspNAt1NjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742435783; c=relaxed/simple;
	bh=r9/SrwfoCrKr3QU0pZq22rncXuc1JlS8dJ2sh8vOIYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GpMiej5vqr6SaQWq/GpZbRQAnzyRSDQ1d7qezresx+S2Iahn0T7XXJSCgl3RZD3JDjmO+bvUa9IsLeMZHk+g9tJMfv43GmE0w8/rjdUVJpsgNjCKWGO6pLT9HECfai9UeKZOwc1NMhQjzt+/9sEAwNhe+/CPSsibcViCM3OHmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h1tb6Pwk; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h1tb6Pwk"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2240c997059so4593585ad.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435781; x=1743040581; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4HakJ1xIrca+h2lsnqHQuPoA99HtUJXt7bntXeIsss=;
        b=h1tb6PwkLgspC8mq+LJoALv3MWVpJ+dqlBB/n+Ftmo5htTYMdlRWqTBTUOjbgK3NZV
         REqdIuNNzaTyHKQFeoSi2eXurONwsGo0Tq/GIqHguXoU6jLjBcW2HFvJKyt9UEmFQ7fo
         axCbHd1msR8v+ysGlTdBYrwETYCbRhFqFjK/oqpdVDyS29qAIxX9D2v+oJdLi5e5G+5d
         eE8rXldAt8bBN4fkJKg6tk/c49IsFrrs0oIddNwLEgn7HyPd4jSvuMYHT9dyUEWqLl8I
         W/LyoedmzDA6BH0W2H0W9Iok9YOsNL54rqZbcS8n0p0wGCSTuE/H9Ild0j4nTUNIb3gm
         5Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435781; x=1743040581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4HakJ1xIrca+h2lsnqHQuPoA99HtUJXt7bntXeIsss=;
        b=s5vxIzRJjRYcis+Md8qntR+ahV9n8zDKJvx4c5P7eCR5LfKT76gLyb4d6bzPtaZgTV
         N9S833ypVLuV0mOETPvXWdwBlKQelwzlwN425+YVej2Fveq5pIpRyiZnHfe45f4lrhVy
         rz+jGEWnuAkja0Du79bjiUV45Vo9X2H+Jvi0neEXBgJGHnba+WRThIYzVQrhyYHnOixQ
         f42ryaLcbVwnwUbMBYtwTvIBNl06kLRhN1PsYkyEgvUa8sRVurCkccYeRnCdzBZ3sheP
         Ueu11eqRoHNwBMxb9EQj0s6hhM5VbOzD5ZLHZeg7cA/75TINyaI5jzGivR2fXSLjRPM/
         yeDw==
X-Forwarded-Encrypted: i=1; AJvYcCWZvw6N3r5KylRrdR95io4SDPOCuXBukBN/bXI7+prZrvSLu+0sRI0bhBl/SovtghO1dkpLO8Fyo2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZ64a/W8t2beVyiWxKSjZsK30x9UbI9PPxjranwO/2I9dyUG3
	e9sbOWMPVhgeqDFMVFxmK4+1eHC5tMbr4XuhfCnGk4bjvHbxoO4DN1OJr9BHNopGj3msERSy6o2
	bVgcUuqpCIIYM+Zm4Ew==
X-Google-Smtp-Source: AGHT+IGeUFjJTWpK4QjhVVj4506qhZmgM6+vP3bTkcGXoNreK6tGzf61M1Gbm1yeqL/C/F63sl0IwvGvOY21BMKy
X-Received: from plof5.prod.google.com ([2002:a17:902:8605:b0:21f:56e1:c515])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f548:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-2264993273bmr61032515ad.20.1742435781232;
 Wed, 19 Mar 2025 18:56:21 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:48 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-14-changyuanl@google.com>
Subject: [PATCH v5 13/16] x86/setup: use memblock_reserve_kern for memory used
 by kernel
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
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
---
 arch/x86/kernel/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cebee310e200..ead370570eb2 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -220,8 +220,8 @@ static void __init cleanup_highmap(void)
 static void __init reserve_brk(void)
 {
 	if (_brk_end > _brk_start)
-		memblock_reserve(__pa_symbol(_brk_start),
-				 _brk_end - _brk_start);
+		memblock_reserve_kern(__pa_symbol(_brk_start),
+				      _brk_end - _brk_start);
 
 	/* Mark brk area as locked down and no longer taking any
 	   new allocations */
@@ -294,7 +294,7 @@ static void __init early_reserve_initrd(void)
 	    !ramdisk_image || !ramdisk_size)
 		return;		/* No initrd provided by bootloader */
 
-	memblock_reserve(ramdisk_image, ramdisk_end - ramdisk_image);
+	memblock_reserve_kern(ramdisk_image, ramdisk_end - ramdisk_image);
 }
 
 static void __init reserve_initrd(void)
@@ -347,7 +347,7 @@ static void __init add_early_ima_buffer(u64 phys_addr)
 	}
 
 	if (data->size) {
-		memblock_reserve(data->addr, data->size);
+		memblock_reserve_kern(data->addr, data->size);
 		ima_kexec_buffer_phys = data->addr;
 		ima_kexec_buffer_size = data->size;
 	}
@@ -447,7 +447,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 		len = sizeof(*data);
 		pa_next = data->next;
 
-		memblock_reserve(pa_data, sizeof(*data) + data->len);
+		memblock_reserve_kern(pa_data, sizeof(*data) + data->len);
 
 		if (data->type == SETUP_INDIRECT) {
 			len += data->len;
@@ -461,7 +461,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 			indirect = (struct setup_indirect *)data->data;
 
 			if (indirect->type != SETUP_INDIRECT)
-				memblock_reserve(indirect->addr, indirect->len);
+				memblock_reserve_kern(indirect->addr, indirect->len);
 		}
 
 		pa_data = pa_next;
@@ -649,8 +649,8 @@ static void __init early_reserve_memory(void)
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
2.48.1.711.g2feabab25a-goog

