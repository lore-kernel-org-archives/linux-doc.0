Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C23280CC3
	for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 05:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349924; cv=none; b=Ymeh9WfX9gVpRL2deMwRTJu5CnKjE2z6VadhLEAXgicEJRjgd1T3y7KWj2Fkk8wqSEZvTq5n8Xio72mxTmx8xGZrZgMasqsawKhg8i8Xd8a7ToKy2cTjWR5wEMb3++BJZQ9DZOsgT7y4DY8T/egQMZcIC7xFQMDXcUlDDX6Pm+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349924; c=relaxed/simple;
	bh=RVtMCMJAM6uGfjWS5bBGzF6kImCKyWD0tknfs/Iqawc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AbWcb9/Rg8F9PyuyAJbggZtOrwS1FK3/PmWTnFRH2v42u4JmbuUO/xG1glZx/PvFjOzk6up+65Bmb3r1tFw+407PZVTT+oIpV67eQ1b25BYV62Bg0MyKn37av7IGIesDGDLF4ygRKw/SNBD5DdIRYobjC4834FGFcUohEyJxp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9jGpPgm; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9jGpPgm"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2240a96112fso23110215ad.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 22:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349922; x=1744954722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kA+rlZCcqa8ZBpJsZPffMW5upf9/jLnF7y6wsXcCijE=;
        b=s9jGpPgmC3IXCl0sG8NB66f0MZLztC0Bm7qC+Q9fYERmzsocqLaYj71+66uRIAHKve
         4gfEKChn86o06r1L0KoV99oeVlZcUSDTt66DORXxCUPl/xAwfGSsfYkzuB+OhQaxXP7w
         +Rzf8yp1xGM6Pej3Tlw2tSsK9RpQ/wbWsDRr1SB0tTUp4Kv3YHU8qRzDHspnLeCqK1a1
         q2QurWWw1UvLS+dq6ZM1cTRj1KQxW0ZyqGFOLfRBv6iaoLvA6e/CwHwE2kpiOsnD9jpe
         1XzwVADuBQcgyNzBuEXQ9spQoSjY5h5zHWCF2D6N0Mwtn5Ykno07xA0O3zTBeb7Ky1pO
         hhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349922; x=1744954722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kA+rlZCcqa8ZBpJsZPffMW5upf9/jLnF7y6wsXcCijE=;
        b=w7oA027GXo8ShYAUYqgGlsz57ETIjOwbwpMOcFGXpzqMwJQU0Zw80dgukVddm20tRY
         dxIb++k1UpDbvtKaM202vHDlkkdTcyHiQ5F7kheP7+HR3g/1UuuOWJnJ9dy8ogGS5E+Q
         ne5Rh6VjqlSVgwjgLZpBoMbrhgy/TlUvBa45dnQG76IjWqHKxH5K9ZUD6rOoboojyvDA
         zMyB2+m30megPM9++65T3NT03shQXUwVonhO995jsUpYl5TuXRlvoL6ejnn/GiXlheOw
         nRSrUoC1Ri1cVUyIbMrXmUl70QBCLuR9CAJsye5z36Um7nGeuMvFt6RuT5XJE83KNU7K
         WLyg==
X-Forwarded-Encrypted: i=1; AJvYcCWkKdEEpawpWi1uLxX3OoGqmdUldEwGBYvWMtL9e/adVdB6PKaX8+xsZ16jbMmfl/W0lQ9x2DghjhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZyqLPyiJQEnQxnxTUBZhkvTASFpOWHroCaNlRAHgmFs2d/Ag6
	iq9TxMUPiW6C6NMzzxfjQwtyjpHhViTqOMpnZf2Wq2a3VxmxdAXnpIemLshaMk4NsT72c9lw301
	S3i9mgGOiHAouim9cjw==
X-Google-Smtp-Source: AGHT+IFMNgH3FeNkL43VcSwOV5hq+5tHGG0G6gtWFb6aZTBEqWyHMIBbsA40BOUPJoyVSd2JH8itZpILADhQmm2q
X-Received: from plbjg10.prod.google.com ([2002:a17:903:26ca:b0:223:f321:1a96])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:fc4d:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-22bea4a1e8bmr23409575ad.1.1744349922412;
 Thu, 10 Apr 2025 22:38:42 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:43 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-13-changyuanl@google.com>
Subject: [PATCH v6 12/14] memblock: add KHO support for reserve_mem
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

Linux has recently gained support for "reserve_mem": A mechanism to
allocate a region of memory early enough in boot that we can cross our
fingers and hope it stays at the same location during most boots, so we
can store for example ftrace buffers into it.

Thanks to KASLR, we can never be really sure that "reserve_mem"
allocations are static across kexec. Let's teach it KHO awareness so
that it serializes its reservations on kexec exit and deserializes them
again on boot, preserving the exact same mapping across kexec.

This is an example user for KHO in the KHO patch set to ensure we have
at least one (not very controversial) user in the tree before extending
KHO's use to more subsystems.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 mm/memblock.c | 205 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 456689cb73e20..3571a859f2fe1 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -18,6 +18,11 @@
 #include <linux/memblock.h>
 #include <linux/mutex.h>
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#include <linux/libfdt.h>
+#include <linux/kexec_handover.h>
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 #include <asm/sections.h>
 #include <linux/io.h>
 
@@ -2475,6 +2480,201 @@ int reserve_mem_release_by_name(const char *name)
 	return 1;
 }
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#define MEMBLOCK_KHO_FDT "memblock"
+#define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
+#define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
+static struct page *kho_fdt;
+
+static int reserve_mem_kho_finalize(struct kho_serialization *ser)
+{
+	int err = 0, i;
+
+	if (!reserved_mem_count)
+		return NOTIFY_DONE;
+
+	if (IS_ERR(kho_fdt)) {
+		err = PTR_ERR(kho_fdt);
+		pr_err("memblock FDT was not prepared successfully: %d\n", err);
+		return notifier_from_errno(err);
+	}
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		err |= kho_preserve_phys(ser, map->start, map->size);
+	}
+
+	err |= kho_preserve_folio(ser, page_folio(kho_fdt));
+	err |= kho_add_subtree(ser, MEMBLOCK_KHO_FDT, page_to_virt(kho_fdt));
+
+	return notifier_from_errno(err);
+}
+
+static int reserve_mem_kho_notifier(struct notifier_block *self,
+				    unsigned long cmd, void *v)
+{
+	switch (cmd) {
+	case KEXEC_KHO_FINALIZE:
+		return reserve_mem_kho_finalize((struct kho_serialization *)v);
+	case KEXEC_KHO_ABORT:
+		return NOTIFY_DONE;
+	default:
+		return NOTIFY_BAD;
+	}
+}
+
+static struct notifier_block reserve_mem_kho_nb = {
+	.notifier_call = reserve_mem_kho_notifier,
+};
+
+static void __init prepare_kho_fdt(void)
+{
+	int err = 0, i;
+	void *fdt;
+
+	if (!reserved_mem_count)
+		return;
+
+	kho_fdt = alloc_page(GFP_KERNEL);
+	if (!kho_fdt) {
+		kho_fdt = ERR_PTR(-ENOMEM);
+		return;
+	}
+
+	fdt = page_to_virt(kho_fdt);
+
+	err |= fdt_create(fdt, PAGE_SIZE);
+	err |= fdt_finish_reservemap(fdt);
+
+	err |= fdt_begin_node(fdt, "");
+	err |= fdt_property_string(fdt, "compatible", MEMBLOCK_KHO_NODE_COMPATIBLE);
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		err |= fdt_begin_node(fdt, map->name);
+		err |= fdt_property_string(fdt, "compatible", RESERVE_MEM_KHO_NODE_COMPATIBLE);
+		err |= fdt_property(fdt, "start", &map->start, sizeof(map->start));
+		err |= fdt_property(fdt, "size", &map->size, sizeof(map->size));
+		err |= fdt_end_node(fdt);
+	}
+	err |= fdt_end_node(fdt);
+
+	err |= fdt_finish(fdt);
+
+	if (err) {
+		pr_err("failed to prepare memblock FDT for KHO: %d\n", err);
+		put_page(kho_fdt);
+		kho_fdt = ERR_PTR(-EINVAL);
+	}
+}
+
+static int __init reserve_mem_init(void)
+{
+	if (!kho_is_enabled())
+		return 0;
+
+	prepare_kho_fdt();
+
+	return register_kho_notifier(&reserve_mem_kho_nb);
+}
+late_initcall(reserve_mem_init);
+
+static void *kho_fdt_in __initdata;
+
+static void *__init reserve_mem_kho_retrieve_fdt(void)
+{
+	phys_addr_t fdt_phys;
+	struct folio *fdt_folio;
+	void *fdt;
+	int err;
+
+	err = kho_retrieve_subtree(MEMBLOCK_KHO_FDT, &fdt_phys);
+	if (err) {
+		if (err != -ENOENT)
+			pr_warn("failed to retrieve FDT '%s' from KHO: %d\n",
+				MEMBLOCK_KHO_FDT, err);
+		return ERR_PTR(err);
+	}
+
+	fdt_folio = kho_restore_folio(fdt_phys);
+	if (!fdt_folio) {
+		pr_warn("failed to restore memblock KHO FDT (0x%llx)\n", fdt_phys);
+		return ERR_PTR(-EFAULT);
+	}
+
+	fdt = page_to_virt(folio_page(fdt_folio, 0));
+
+	err = fdt_node_check_compatible(fdt, 0, MEMBLOCK_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("FDT '%s' is incompatible with '%s': %d\n",
+			MEMBLOCK_KHO_FDT, MEMBLOCK_KHO_NODE_COMPATIBLE, err);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return fdt;
+}
+
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	int err, len_start, len_size, offset;
+	const phys_addr_t *p_start, *p_size;
+	const void *fdt;
+
+	if (!kho_fdt_in)
+		kho_fdt_in = reserve_mem_kho_retrieve_fdt();
+
+	if (IS_ERR(kho_fdt_in))
+		return false;
+
+	fdt = kho_fdt_in;
+
+	offset = fdt_subnode_offset(fdt, 0, name);
+	if (offset < 0) {
+		pr_warn("FDT '%s' has no child '%s': %d\n",
+			MEMBLOCK_KHO_FDT, name, offset);
+		return false;
+	}
+	err = fdt_node_check_compatible(fdt, offset, RESERVE_MEM_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("Node '%s' is incompatible with '%s': %d\n",
+			name, RESERVE_MEM_KHO_NODE_COMPATIBLE, err);
+		return false;
+	}
+
+	p_start = fdt_getprop(fdt, offset, "start", &len_start);
+	p_size = fdt_getprop(fdt, offset, "size", &len_size);
+	if (!p_start || len_start != sizeof(*p_start) || !p_size ||
+	    len_size != sizeof(*p_size)) {
+		return false;
+	}
+
+	if (*p_start & (align - 1)) {
+		pr_warn("KHO reserve-mem '%s' has wrong alignment (0x%lx, 0x%lx)\n",
+			name, (long)align, (long)*p_start);
+		return false;
+	}
+
+	if (*p_size != size) {
+		pr_warn("KHO reserve-mem '%s' has wrong size (0x%lx != 0x%lx)\n",
+			name, (long)*p_size, (long)size);
+		return false;
+	}
+
+	reserved_mem_add(*p_start, size, name);
+	pr_info("Revived memory reservation '%s' from KHO\n", name);
+
+	return true;
+}
+#else
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	return false;
+}
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 /*
  * Parse reserve_mem=nn:align:name
  */
@@ -2530,6 +2730,11 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_find_by_name(name, &start, &tmp))
 		return -EBUSY;
 
+	/* Pick previous allocations up from KHO if available */
+	if (reserve_mem_kho_revive(name, size, align))
+		return 1;
+
+	/* TODO: Allocation must be outside of scratch region */
 	start = memblock_phys_alloc(size, align);
 	if (!start)
 		return -ENOMEM;
-- 
2.49.0.604.gff1f9ca942-goog

