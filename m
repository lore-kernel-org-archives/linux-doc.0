Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0AF36CDFB
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567159; cv=none; b=Rdc76pmNO6hXXhX15P/ojTNKGiN15mXUBUSMQETo5ShnJUn+IeoZV3wghiaWnyelcNolGACbkMvEqWL/lZSV3jbYivgjWML9CbR6/pluMP2X2IN2f0Cur11/d4MLnhvlCNBOWrcnK1Z6R1oHj6dxXcg7nq4n/CIpksvQAwWWqA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567159; c=relaxed/simple;
	bh=P2BpXmRz69DL/Mo9gvHTNRnm0uC420IorTT0EImakDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKmHSscWZSuBqaz80TBOCRYVKijxXcrZnElVONFYnHDIhtafWM1a0+1FR2V+5C9gDs54xbPBaNojeS8BQl6P1tjlcs7WoFYPrAWLX4gfFN2tM/CDwWbv0VLEqYrCHbdxu2G14t0orwzlWait6KA0tNp7o2/5sqh0C0AYAUBvtGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvo8Ljd/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvo8Ljd/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso5589481f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567148; x=1764171948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/EyDboeiBDU/UfklOwVUegNW3M8PrbX9Ov8/f+MrlA=;
        b=gvo8Ljd//s70Ad6SW76idmhN0fRup0Xow21Ym1r2UBYinVsb5JC3n8VBpMue/pLWkU
         htLFLuUG9II22JuzokqrUBl0FIowDCJB+lvn2qVtL1YvmFo7+wDaTYDGikVNNEn1YcH8
         Iuhzb3XiCrFIuROQ3mOZhNdTianSbsO+8pjZSfDIvE4fFYqNI8gtbghZ+usPXOFIq8iq
         i7U4tprdGjDoAg5SYQnep+sFOZ250TUOuoTa24+ZPpIoZVtyds47wZSiGn/keBZApxa7
         Pam02IHJfIOB0F9q/5d2km4Th7hREloIwrLIh/HTlXC2IOIcZEQ7v0o90NFN6ydDKPp6
         rVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567148; x=1764171948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l/EyDboeiBDU/UfklOwVUegNW3M8PrbX9Ov8/f+MrlA=;
        b=X9/mewSm/887dUDjlI2lV1dvTamFKL7Sr0C/Op4ske6GsM/+ciZ/4qRfZgqIigPZeP
         4nt/0aLJ+mr9HZjOuWQIPqTg1oPFCdD0d4iaPh2uN+aNYGVxKP3Vz6wrgKLJOZxPUCcS
         oDwsRUJGlDM241BllOv5hzQyyDz/ud6HKTYi79566YeOWKwiK9S9duAWEEds/+PfXu0R
         rAuotfvuANJGsVlbYOKa+j1aGa9IY4oZaeo1/xih+4IQ4VTngLXEQhOxRvsDeyM5d4RM
         izohsahG/R1QBFKD+n5+Tfr4IS6jXd1sxsSI/1HensVULapyy8xu6HgeLJr3nwEo7/aZ
         ZGDA==
X-Forwarded-Encrypted: i=1; AJvYcCXtIBYPXUR0xnu8pTiEUNPm1HRlyP9IV+C9XnT3fZnhlEUIPIWG0CqhhY07TuIJ2a0r1crOp8CtRSA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr0rxMAmzVyALCNsaF7wWx9CbPLuxawIpQW+xMEGDs2+Qca30f
	5o/nO2KcIvMoihiCLGvm7XYg7j2NE5qmaI+H00a/pB6FUq0t4Uaj0pkDfE1BjG1K85I=
X-Gm-Gg: ASbGncto5XWgE97iP3RKT/eawQIpFOQom85kA2R7SZ5iWCxlAxoRYstmRZ9XudRpnYB
	bauxW6uMF0jhplnelsp1k4rsj2jyFEyyLk/AMx4ACzXvq0QjNkDhpeFo3gbGekTFaH8PPS+siOW
	iCYDU7djCZCW35+mXqnLJ3qYZuP26cLRZ4bPucj9mwz7TYt7W5qrFUJzlT9OBzhs9pR23Hla0/l
	xc5VtptFOt7qFB4W3u0nQ+DJ4OJDeMD96KZgyzfrMRwI5zyRp77wKO2mWL6Jqsn5HIBHKWjPfRt
	0CpRwJe4lah/t8YiR63tyLID6cNM9wamnX9EFJbC60JL++ff28nFiZXEPY8k3msl6Zq/1ONTo2V
	ALfMVWjabWKDdZyysCclFO4WeiU9jtUdkH3oEP7vG8AEzV88RW6F47jcSCXFzdLAEMTWRP86XlS
	RpsHKwwLWLSH5lOqT7Z+o=
X-Google-Smtp-Source: AGHT+IG3jCLeDmXIRQk0s6Z/im1uj+pkHlGcqCZtyflKDhFiJA87zd6Y92IL7f4uFHeiMPUMai5jbg==
X-Received: by 2002:a05:6000:64a:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42b59378468mr19534486f8f.40.1763567148170;
        Wed, 19 Nov 2025 07:45:48 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:47 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
Date: Wed, 19 Nov 2025 17:44:19 +0200
Message-ID: <20251119154427.1033475-19-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This memblock flag indicates that a specific block is registered
into an inspection table.
The block can be marked for inspection using memblock_mark_inspect()
and cleared with memblock_clear_inspect()

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/memblock.h |  7 +++++++
 mm/memblock.c            | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 221118b5a16e..c3e55a4475cf 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -51,6 +51,10 @@ extern unsigned long long max_possible_pfn;
  * memory reservations yet, so we get scratch memory from the previous
  * kernel that we know is good to use. It is the only memory that
  * allocations may happen from in this phase.
+ * @MEMBLOCK_INSPECT: memory region is annotated in kernel memory inspection
+ * table. This means a dedicated entry will be created for this region which
+ * will contain the memory's address and size. This allows kernel inspectors
+ * to retrieve the memory.
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -61,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_NOINIT	= 0x10,	/* don't initialize struct pages */
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
+	MEMBLOCK_INSPECT	= 0x80,	/* memory selected for kernel inspection */
 };
 
 /**
@@ -149,6 +154,8 @@ unsigned long memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
 bool memblock_overlaps_region(struct memblock_type *type,
 			      phys_addr_t base, phys_addr_t size);
 bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
+int memblock_mark_inspect(phys_addr_t base, phys_addr_t size);
+int memblock_clear_inspect(phys_addr_t base, phys_addr_t size);
 int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index e23e16618e9b..a5df5ab286e5 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -17,6 +17,7 @@
 #include <linux/seq_file.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_KEXEC_HANDOVER
 #include <linux/libfdt.h>
@@ -1016,6 +1017,40 @@ static int __init_memblock memblock_setclr_flag(struct memblock_type *type,
 	return 0;
 }
 
+/**
+ * memblock_mark_inspect - Mark inspectable memory with flag MEMBLOCK_INSPECT.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_inspect(phys_addr_t base, phys_addr_t size)
+{
+	int ret;
+
+	ret = memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_INSPECT);
+	if (ret)
+		return ret;
+
+	meminspect_lock_register_pa(base, size);
+
+	return 0;
+}
+
+/**
+ * memblock_clear_inspect - Clear flag MEMBLOCK_INSPECT for a specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_inspect(phys_addr_t base, phys_addr_t size)
+{
+	meminspect_lock_unregister_pa(base, size);
+
+	return memblock_setclr_flag(&memblock.memory, base, size, 0, MEMBLOCK_INSPECT);
+}
+
 /**
  * memblock_mark_hotplug - Mark hotpluggable memory with flag MEMBLOCK_HOTPLUG.
  * @base: the base phys addr of the region
@@ -2704,6 +2739,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_INSPECT)] = "INSPECT",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

