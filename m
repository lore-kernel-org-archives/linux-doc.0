Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A903C83F07
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 23:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjHYXL6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 19:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjHYXLz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 19:11:55 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFA02118
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 16:11:52 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68c3ec0578bso59538b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 16:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693005111; x=1693609911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ggPOOHH589hYjv6gdFVOq0aacdbX5IKUkHaLzkHlaY=;
        b=QOZtL/y5zENYSSlmUxwLeSqpz5kI8kEAvVttdxBiqhATFMZi1X5kzSngCI+kn/X/6u
         LfvF39rfgIQ5MLNHv9pYrUGDAHJxMTNSZTXagt8wRFV1egOngicf5Lhny0TrM40wL7Fh
         sXK9aoyhMhrLHSeC5g2E7WB/mRBFuLoRLoq+fAsBDEpl1eWCbZ+ib9KHy+fbJqcbq3/X
         5XMHGh/7KXdiSRnl+ZfldFts5QzYaW4ViMDGEKOhdAfiGB87m/VbtPcfMa7Z+q3L9YWN
         ElzMdwiSX5ujwsnPG6OkrwZD2KDN2WqvoUZrnj7K7OxFJnlu6xWTwvzDl9QQf9BNz+JD
         HZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693005111; x=1693609911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ggPOOHH589hYjv6gdFVOq0aacdbX5IKUkHaLzkHlaY=;
        b=jTuGTg+OOsli4/rJfMVUncbj5KdGQX/I7tmGweJejw+UWKB6WFrGhMrs+maBqCX/Ev
         4VfztZCmFMpb6aJrg7LWSKvpRALyyjT3wlhrLNPfpC/poxelAwX6lCI3G5JqOOu8k+wc
         hDxEal6tbceiVG9/o12euapNApzFCe727mOlA+4Vpje0bXK+mXI+Gnyy2oLAXbQFoS44
         btaCbRmyqHIVOHscF1LqXs8sJe82S9Ec6RtNkIkvUg5E5Q5mON3dWl3SWDfRP7Vq7RY2
         SaAQQzK4f33Z3K2RMqecF8uhqn5grNycS3sBJEyJySbO9IUXKIR/xxgl+bzdP+e7da2V
         +jDw==
X-Gm-Message-State: AOJu0Yzqd/755NKNOh0obTU+/dSHRAm4hr+8z+wjL+XoKNN8f2cZhJbk
        pnegefzkzrW1CsDFWiHc9st1Sg==
X-Google-Smtp-Source: AGHT+IGaR7FGnDMNDLYgHhWG0XAuBfJDoKxj8hXBc/H8Me1KQj0GH7Oh42Tzr3U8HePmfacS6h2lYw==
X-Received: by 2002:a05:6a21:3393:b0:140:fab7:4d14 with SMTP id yy19-20020a056a21339300b00140fab74d14mr21944630pzb.15.1693005111578;
        Fri, 25 Aug 2023 16:11:51 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090301cd00b001a98f844e60sm456534plh.263.2023.08.25.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 16:11:51 -0700 (PDT)
From:   Evan Green <evan@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Evan Green <evan@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <apatel@ventanamicro.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v5] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Date:   Fri, 25 Aug 2023 16:11:38 -0700
Message-Id: <20230825231139.1145522-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In /proc/cpuinfo, most of the information we show for each processor is
specific to that hart: marchid, mvendorid, mimpid, processor, hart,
compatible, and the mmu size. But the ISA string gets filtered through a
lowest common denominator mask, so that if one CPU is missing an ISA
extension, no CPUs will show it.

Now that we track the ISA extensions for each hart, let's report ISA
extension info accurately per-hart in /proc/cpuinfo. We cannot change
the "isa:" line, as usermode may be relying on that line to show only
the common set of extensions supported across all harts. Add a new "hart
isa" line instead, which reports the true set of extensions for that
hart.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v5:
 - Documentation changes (only) (Conor)

Changes in v4:
 - Documentation: Made the underline match the text line (Conor)
 - Documentation: hanged "in question" to "being described" (Andrew)

Changes in v3:
 - Add some documentation (Conor)

Changes in v2:
 - Added new "hart isa" line rather than altering behavior of existing
   "isa" line (Conor, Palmer)

 Documentation/riscv/uabi.rst | 12 ++++++++++++
 arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 8960fac42c40..a46017f57db2 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -42,6 +42,18 @@ An example string following the order is::
 
    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
 
+"isa" vs "hart isa" lines in /proc/cpuinfo
+------------------------------------------
+
+The "isa" line in /proc/cpuinfo describes the lowest common denominator of
+RISC-V ISA extensions recognized by the kernel and implemented on all harts. The
+"hart isa" line, in contrast, describes the set of extensions recognized by the
+kernel on the particular hart being described, even if those extensions may not
+be present on all harts in the system. In both cases, the presence of a feature
+in these lines guarantees only that the hardware has the described capability.
+Additional kernel support or policy control changes may be required before a
+feature is fully usable by userspace programs.
+
 Misaligned accesses
 -------------------
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 7b793c4321bb..100fb382b450 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -197,9 +197,8 @@ arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
 
-static void print_isa(struct seq_file *f)
+static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
 {
-	seq_puts(f, "isa\t\t: ");
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		seq_write(f, "rv32", 4);
@@ -207,7 +206,7 @@ static void print_isa(struct seq_file *f)
 		seq_write(f, "rv64", 4);
 
 	for (int i = 0; i < riscv_isa_ext_count; i++) {
-		if (!__riscv_isa_extension_available(NULL, riscv_isa_ext[i].id))
+		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
 			continue;
 
 		/* Only multi-letter extensions are split by underscores */
@@ -271,7 +270,15 @@ static int c_show(struct seq_file *m, void *v)
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
-	print_isa(m);
+
+	/*
+	 * For historical raisins, the isa: line is limited to the lowest common
+	 * denominator of extensions supported across all harts. A true list of
+	 * extensions supported on this hart is printed later in the hart_isa:
+	 * line.
+	 */
+	seq_puts(m, "isa\t\t: ");
+	print_isa(m, NULL);
 	print_mmu(m);
 
 	if (acpi_disabled) {
@@ -287,6 +294,13 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
+
+	/*
+	 * Print the ISA extensions specific to this hart, which may show
+	 * additional extensions not present across all harts.
+	 */
+	seq_puts(m, "hart isa\t: ");
+	print_isa(m, hart_isa[cpu_id].isa);
 	seq_puts(m, "\n");
 
 	return 0;
-- 
2.34.1

