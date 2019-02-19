Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B8757D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Feb 2019 03:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfBSDXP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Feb 2019 22:23:15 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41747 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfBSDXP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Feb 2019 22:23:15 -0500
Received: by mail-qt1-f193.google.com with SMTP id v10so21607085qtp.8
        for <linux-doc@vger.kernel.org>; Mon, 18 Feb 2019 19:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to:organization;
        bh=WgTYaVCAPMdQ72F4tdQTFJIHduZXpi/qhCwoMKsngCM=;
        b=fVuAYpXUeh2sQkL/XkMeS1T4n3c4wmMXq358O/E62b6vRHxesgeKu74reEze1ZL4g+
         WMulBkzO2JVFxaqpdN3frAX4ZrR9IoAQks7HnXEQr8rDnMngHDj7U4hEGUJJoQB3kSSX
         8JUeg7PhTU3upAO9FwzaaaJtheMe6r5B5OOuvbzwpr0wfvqeIf04QkhiIf0oT+n2Kv6l
         hOTOx+LQnSvs8xVuTyCLudE8pB8A+rxBuTrS/vr74Nj6Fr+4wfa9RhLzJtUcrq9eg5qk
         Qx2xfqUfIXBylzixxWBCMG7gVoshntbL4apLebray+NlT1aPXBULTeGsbGdtgkumf3Pw
         GoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to:organization;
        bh=WgTYaVCAPMdQ72F4tdQTFJIHduZXpi/qhCwoMKsngCM=;
        b=GfLrkksKf4tkgDJRaKdpztoxaU/ZCXKp1KTBBkpbQ3Xx4WQQXqi+qaXXpXqJ9a3tto
         OePCU78uzvPGlGmtLqy6R3KBseF+szPn0l911yZbz/3sH7OgqfgEI8urzX1wZtBpFZUh
         h0hu8pNNoS2xsfXUVpeT1/WtOQZjeLsW72aokWYM5XFdFuqXUttCNh8EwzhLptZeqsNK
         tlrmwdQpA+Q870TNOk+WPqlOA/B3dUcS6t77xtYXNQTg99NM6xdy/cWefOT0+W8pmNzi
         cbNOLWH4C4dIRHCKhWUQVHuF5yD+LzGJh+yCB6AKsDvK2ST0i1vOPplNQOX3UMaZjpES
         tINg==
X-Gm-Message-State: AHQUAuaUK5yeziDCLe+N2JJnJR90s2YOUUOVJ+MD4D02qp9vKdYJBifd
        SNdTFzxX+8nFUrG9A2bfHrWsAulc
X-Google-Smtp-Source: AHgI3IaGClzzO1xzGAFB74H7wc1tudbeUVbkSzSvDTQ1vbzO7W32+LV+Hu6KxbXrY9KqVfmn18zqvg==
X-Received: by 2002:a0c:91bb:: with SMTP id n56mr20338714qvn.77.1550546594328;
        Mon, 18 Feb 2019 19:23:14 -0800 (PST)
Received: from kbl.fios-router.home (pool-96-233-42-17.bstnma.fios.verizon.net. [96.233.42.17])
        by smtp.gmail.com with ESMTPSA id l31sm205282qtb.20.2019.02.18.19.23.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 19:23:13 -0800 (PST)
From:   Len Brown <lenb@kernel.org>
X-Google-Original-From: Len Brown <len.brown@intel.com>
To:     linux-drivers-review@linux.intel.com
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH 03/11] x86 topology: Add CPUID.1F multi-die/package support
Date:   Mon, 18 Feb 2019 22:22:51 -0500
Message-Id: <07d2908dc72bf964b27380999e1c826587d69136.1550545163.git.len.brown@intel.com>
X-Mailer: git-send-email 2.18.0-rc0
In-Reply-To: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
References: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
Reply-To: Len Brown <lenb@kernel.org>
Organization: Intel Open Source Technology Center
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some new systems have multiple software-visible die within each package.
The new CPUID.1F leaf can enumerate this multi-die/package topology.

CPUID.1F a super-set of the CPUID.B "Extended Toplogy Leaf",
and a common updated routine can parse either leaf.

Legacy systems without CPUID.1F, and systems without multi-die/package
hardware, will see no functional change from this patch series.

Multi-die/package systems will use CPUID.B before this patch,
and CPUID.1F after this patch.  In the CPUID.B case, all die appear
(incorrectly) to software as individual packages.  In the CPUID.1F case,
the package id's reflect reality, and die_id's become meaningful.

Subsequent patches in this series update the kernel to be multi-die aware.
In particular, some software needs to know the difference between
a die-scope MSR and a package-scope MSR.

Signed-off-by: Len Brown <len.brown@intel.com>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Len Brown <len.brown@intel.com>
---
 Documentation/x86/topology.txt   |  4 ++
 arch/x86/include/asm/processor.h |  4 +-
 arch/x86/kernel/cpu/topology.c   | 82 ++++++++++++++++++++++++--------
 arch/x86/kernel/smpboot.c        |  4 +-
 4 files changed, 73 insertions(+), 21 deletions(-)

diff --git a/Documentation/x86/topology.txt b/Documentation/x86/topology.txt
index 06b3cdbc4048..8107b6cfc9ea 100644
--- a/Documentation/x86/topology.txt
+++ b/Documentation/x86/topology.txt
@@ -46,6 +46,10 @@ The topology of a system is described in the units of:
 
     The number of cores in a package. This information is retrieved via CPUID.
 
+  - cpuinfo_x86.x86_max_dies:
+
+    The number of dies in a package. This information is retrieved via CPUID.
+
   - cpuinfo_x86.phys_proc_id:
 
     The physical ID of the package. This information is retrieved via CPUID
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 33051436c864..f2856fe03715 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -105,7 +105,8 @@ struct cpuinfo_x86 {
 	int			x86_power;
 	unsigned long		loops_per_jiffy;
 	/* cpuid returned max cores value: */
-	u16			 x86_max_cores;
+	u16			x86_max_cores;
+	u16			x86_max_dies;
 	u16			apicid;
 	u16			initial_apicid;
 	u16			x86_clflush_size;
@@ -117,6 +118,7 @@ struct cpuinfo_x86 {
 	u16			logical_proc_id;
 	/* Core id: */
 	u16			cpu_core_id;
+	u16			cpu_die_id;
 	/* Index into per_cpu list: */
 	u16			cpu_index;
 	u32			microcode;
diff --git a/arch/x86/kernel/cpu/topology.c b/arch/x86/kernel/cpu/topology.c
index 8f6c784141d1..6dce6ee77849 100644
--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -15,33 +15,61 @@
 /* leaf 0xb SMT level */
 #define SMT_LEVEL	0
 
-/* leaf 0xb sub-leaf types */
+/* extended topology sub-leaf types */
 #define INVALID_TYPE	0
 #define SMT_TYPE	1
 #define CORE_TYPE	2
+#define DIE_TYPE	5
 
 #define LEAFB_SUBTYPE(ecx)		(((ecx) >> 8) & 0xff)
 #define BITS_SHIFT_NEXT_LEVEL(eax)	((eax) & 0x1f)
 #define LEVEL_MAX_SIBLINGS(ebx)		((ebx) & 0xffff)
 
-int detect_extended_topology_early(struct cpuinfo_x86 *c)
-{
 #ifdef CONFIG_SMP
+/*
+ * Check if given CPUID extended toplogy "leaf" is implemented
+ */
+static int check_extended_topology_leaf(int leaf)
+{
 	unsigned int eax, ebx, ecx, edx;
 
-	if (c->cpuid_level < 0xb)
+	cpuid_count(leaf, SMT_LEVEL, &eax, &ebx, &ecx, &edx);
+
+	if (ebx == 0 || (LEAFB_SUBTYPE(ecx) != SMT_TYPE))
 		return -1;
 
-	cpuid_count(0xb, SMT_LEVEL, &eax, &ebx, &ecx, &edx);
+	return 0;
+}
+/*
+ * Return best CPUID Extended Toplogy Leaf supported
+ */
+static int detect_extended_topology_leaf(struct cpuinfo_x86 *c)
+{
+	if (c->cpuid_level >= 0x1f)
+		if (check_extended_topology_leaf(0x1f) == 0)
+			return 0x1f;
 
-	/*
-	 * check if the cpuid leaf 0xb is actually implemented.
-	 */
-	if (ebx == 0 || (LEAFB_SUBTYPE(ecx) != SMT_TYPE))
+	if (c->cpuid_level >= 0xb)
+		if (check_extended_topology_leaf(0xb) == 0)
+			return 0xb;
+
+	return -1;
+}
+#endif
+
+int detect_extended_topology_early(struct cpuinfo_x86 *c)
+{
+#ifdef CONFIG_SMP
+	unsigned int eax, ebx, ecx, edx;
+	int leaf;
+
+	leaf = detect_extended_topology_leaf(c);
+	if (leaf < 0)
 		return -1;
 
 	set_cpu_cap(c, X86_FEATURE_XTOPOLOGY);
 
+	cpuid_count(leaf, SMT_LEVEL, &eax, &ebx, &ecx, &edx);
 	/*
 	 * initial apic id, which also represents 32-bit extended x2apic id.
 	 */
@@ -52,7 +80,7 @@ int detect_extended_topology_early(struct cpuinfo_x86 *c)
 }
 
 /*
- * Check for extended topology enumeration cpuid leaf 0xb and if it
+ * Check for extended topology enumeration cpuid leaf, and if it
  * exists, use it for populating initial_apicid and cpu topology
  * detection.
  */
@@ -60,46 +88,62 @@ int detect_extended_topology(struct cpuinfo_x86 *c)
 {
 #ifdef CONFIG_SMP
 	unsigned int eax, ebx, ecx, edx, sub_index;
-	unsigned int ht_mask_width, core_plus_mask_width;
+	unsigned int ht_mask_width, core_plus_mask_width, die_plus_mask_width;
 	unsigned int core_select_mask, core_level_siblings;
+	unsigned int die_select_mask, die_level_siblings;
+	int leaf;
 
-	if (detect_extended_topology_early(c) < 0)
+	leaf = detect_extended_topology_leaf(c);
+	if (leaf  < 0)
 		return -1;
 
 	/*
 	 * Populate HT related information from sub-leaf level 0.
 	 */
-	cpuid_count(0xb, SMT_LEVEL, &eax, &ebx, &ecx, &edx);
+	cpuid_count(leaf, SMT_LEVEL, &eax, &ebx, &ecx, &edx);
+	c->initial_apicid = edx;
 	core_level_siblings = smp_num_siblings = LEVEL_MAX_SIBLINGS(ebx);
 	core_plus_mask_width = ht_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
+	die_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
+	die_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
 
 	sub_index = 1;
 	do {
-		cpuid_count(0xb, sub_index, &eax, &ebx, &ecx, &edx);
+		cpuid_count(leaf, sub_index, &eax, &ebx, &ecx, &edx);
 
 		/*
 		 * Check for the Core type in the implemented sub leaves.
 		 */
 		if (LEAFB_SUBTYPE(ecx) == CORE_TYPE) {
 			core_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
+			die_level_siblings = core_level_siblings;
 			core_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
-			break;
+		}
+		if (LEAFB_SUBTYPE(ecx) == DIE_TYPE) {
+			die_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
+			die_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
 		}
 
 		sub_index++;
 	} while (LEAFB_SUBTYPE(ecx) != INVALID_TYPE);
 
 	core_select_mask = (~(-1 << core_plus_mask_width)) >> ht_mask_width;
-
-	c->cpu_core_id = apic->phys_pkg_id(c->initial_apicid, ht_mask_width)
-						 & core_select_mask;
-	c->phys_proc_id = apic->phys_pkg_id(c->initial_apicid, core_plus_mask_width);
+	die_select_mask = (~(-1 << die_plus_mask_width)) >>
+				core_plus_mask_width;
+
+	c->cpu_core_id = apic->phys_pkg_id(c->initial_apicid,
+				ht_mask_width) & core_select_mask;
+	c->cpu_die_id = apic->phys_pkg_id(c->initial_apicid,
+				core_plus_mask_width) & die_select_mask;
+	c->phys_proc_id = apic->phys_pkg_id(c->initial_apicid,
+				die_plus_mask_width);
 	/*
 	 * Reinit the apicid, now that we have extended initial_apicid.
 	 */
 	c->apicid = apic->phys_pkg_id(c->initial_apicid, 0);
 
 	c->x86_max_cores = (core_level_siblings / smp_num_siblings);
+	c->x86_max_dies = (die_level_siblings / core_level_siblings);
 #endif
 	return 0;
 }
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ccd1f2a8e557..4250a87f57db 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -393,6 +393,7 @@ static bool match_smt(struct cpuinfo_x86 *c, struct cpuinfo_x86 *o)
 		int cpu1 = c->cpu_index, cpu2 = o->cpu_index;
 
 		if (c->phys_proc_id == o->phys_proc_id &&
+		    c->cpu_die_id == o->cpu_die_id &&
 		    per_cpu(cpu_llc_id, cpu1) == per_cpu(cpu_llc_id, cpu2)) {
 			if (c->cpu_core_id == o->cpu_core_id)
 				return topology_sane(c, o, "smt");
@@ -404,6 +405,7 @@ static bool match_smt(struct cpuinfo_x86 *c, struct cpuinfo_x86 *o)
 		}
 
 	} else if (c->phys_proc_id == o->phys_proc_id &&
+		   c->cpu_die_id == o->cpu_die_id &&
 		   c->cpu_core_id == o->cpu_core_id) {
 		return topology_sane(c, o, "smt");
 	}
@@ -461,7 +463,7 @@ static bool match_llc(struct cpuinfo_x86 *c, struct cpuinfo_x86 *o)
  */
 static bool match_die(struct cpuinfo_x86 *c, struct cpuinfo_x86 *o)
 {
-	if (c->phys_proc_id == o->phys_proc_id)
+	if (c->cpu_die_id == o->cpu_die_id)
 		return true;
 	return false;
 }
-- 
2.18.0-rc0

