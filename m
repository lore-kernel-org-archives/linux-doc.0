Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB03279795
	for <linux-doc@vger.kernel.org>; Thu,  1 May 2025 22:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140132; cv=none; b=TdWsY9sXhPN8gux+ra9RQowG21MmfV+LMnKK8kSQnL/JMJatiacoH4LfCZm3BS8F38qLEgOkwrpnQ76dZfFvLoZNkSAYMZSLJako62waSqDu/nmBnMPLku5XRqXnZEPM8vznqUtq5mulLuoFwUG+BoDvshdDsPnrU2/FBZ0XLUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140132; c=relaxed/simple;
	bh=OwvVYXTIZVJC+b556kBzIpalNu0lYv35673F6ozUDnc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dZyGLqqx0nPSAlxXhrtui4/DlNg22IoSoYLvlSm0sfEi8cvOECSjhSwW7g0Ed1DXDwTy9zZAhDv7yYIS++psu3P8hI+nE3S9eo5EJoDH33/nop9N78+G3kEipH56sKxfKM8tpyx7Do5MJ4WDWuCOxLYSchEIWPllXAttB+d9f1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L3VRC0H/; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L3VRC0H/"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b00e4358a34so826809a12.0
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 15:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140131; x=1746744931; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9pq7cOlD4UMnBbr7MdoylLenI3n1hFTN7/xVF2jk4Gs=;
        b=L3VRC0H/nXnoh06ddQWTXC6qvXG3TJ5hVdc3j5gQHLk8sQ568e8RgXrd0w7meFWBUg
         crrw5NONNlQlJ1v3MmtTNvkXqYu8+OU+0SUX4NuI7aS7KQEmSdRA9+HgPYm3848tM7p8
         St7QwJX7gFW8SBEVYs+d4+pVl84MOAJyzbxrXUY83a1RL1VcvP/bZ9d2UG0Rj31Y0+Nk
         RH4d+bWzSb9T4UE9bWB7ZMWDZ2NMMhTXB7yzkTa637s3R1qVU61DqQjfc/F4RsaEb7Nm
         JfP11NkAZGDQ8gW5SpHt/WOcIJryuOxaodaA24OlVc45T/3LajajVf1ZQRnswFyy/GGl
         TSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140131; x=1746744931;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pq7cOlD4UMnBbr7MdoylLenI3n1hFTN7/xVF2jk4Gs=;
        b=jqDiBdZRwmGmQngGBRzBp4n7+0WSIEGvE+5B7tGDsLxgKwSJrqYsLElcGNwFhoSrBl
         Ixb/XzMtrK9b/rvDACeGl+HfGCnERXssNlaWpY2mLgYmvlyzHnUYYVxxlRNc2wBrEOsE
         iWtanwB6YCVsK5FJiY1EIpW6aBeeof9YxyPvd2D9A1zPFpZFqwS+BeRacC2EPqN+ewNg
         yALo2m4kqvyehcVY/pkQlepH0N49u+IZItSqPWx1ickE9T9uQYGAMbJlYXS42yeYP+tB
         vARe1N1YezIoHcYYKmutq9vqUgHV17y7Y/SdYSCRvRtCcQpvaPacl12sOz96gfiaAVx/
         baOA==
X-Forwarded-Encrypted: i=1; AJvYcCWDGOku5wA8IDQ2islFQHk8WJ6tQgJTlZEUR3P+WQcWd5Vaa6qJVWT+agj+UYwkgW+1+byOXjvjQUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYwZzRwSDf29SoVPyuGzrnGF90zFbhUqm3SQeMxcFrqwqFAYW
	C+cJr1oMydzISRbikAPtux/nIkefm2MIEsLm4PqDokZHoXu/u60uANDfRd2ngVN+QRVxYmFjF1a
	AvBVWAaU3DW0oU6EFyg==
X-Google-Smtp-Source: AGHT+IFQu5I4jmdQMtq8hCC1f3Z0zQU0SpvNDrnLFxyAAjKycN5vHSclb6UlAZsA+ljFPMEbEBhOmIJO9x7kjnX2
X-Received: from pfbgo18.prod.google.com ([2002:a05:6a00:3b12:b0:73d:65cb:b18b])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1805:b0:1f5:81bc:c72e with SMTP id adf61e73a8af0-20cdfdf4736mr892168637.33.1746140130873;
 Thu, 01 May 2025 15:55:30 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:18 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-12-changyuanl@google.com>
Subject: [PATCH v7 11/18] x86/setup: use memblock_reserve_kern for memory used
 by kernel
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
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
2.49.0.906.g1f30a19c02-goog

