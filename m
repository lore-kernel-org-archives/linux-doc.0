Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5237C115
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768238922; cv=none; b=MUp5XiVHt00m6ne1sfoTgvW3r/4uRF/lxuTfzhGpPaR3xmmLcfNTxxWgk+ApA5w/UpHdosO+f+jg+5YI//DnNvMvVF4Wrvbvsp2T6diV6z8eitqwaovDdW3J6Z1eTzVGLFfWjJXFp556zr69PGfb81Ip2NXS9uM4cevKsYCu+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768238922; c=relaxed/simple;
	bh=TqoqDWh1Xv/snyqJ7tgj5VnvpvnAsaidNe08mTewDDw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sIovBihmPe4B7mLwP1qW14sWXY3PEl4l0UhBni4o+MR4eQV389qjMR2DfK5+ueryu+6GPz2C31xOjEOeBXonWLciAcQ96RqZ1zF9nUBTiS0zHSAqaVRHrk24ILDlZ9uJyyvWGRlsYlRixxLnk/cH8tcsiOruVvlYHJvu7feNpao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=YVS1R785; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YVS1R785"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768238917; x=1768498117;
	bh=smEYUjE4TiZwGsUIUGvN4uRam6KETrr7zjszlbfCqLA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YVS1R785rxnN/IS8mi4l8XQCGj6g5l5DzG6ohgtyWfpjIByzqp4gVMXLp0t3y884x
	 fLX9bO3h4Z9aAdZVDTOotoEjPvv2bnUuDCM8Vng9Gpr83EDl7i4SCfu3FnrAxKnu34
	 bSNDah2R3Bwgr2X6UJnPMh5XjzKAsiFYc+vpqdPSanYb8M/TqT29zf1ui1vfP6OSRZ
	 FcCZjR8Scb0pDe98nB9zBpHCG0434xvMaXrYM4sF7l6NdOylMLL5GQwjtECg4YOSqV
	 ClwudsMgMcArBIRODBbIxtKKtENjQp3cnkpM1q/g2O9kJ45I0zZA9VqK/3YGY/m9zH
	 y3JKlIr4h8e6Q==
Date: Mon, 12 Jan 2026 17:28:35 +0000
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kasan-dev@googlegroups.com
Subject: [PATCH v8 14/14] x86/kasan: Make software tag-based kasan available
Message-ID: <5b46822936bf9bf7e5cf5d1b57f936345c45a140.1768233085.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1768233085.git.m.wieczorretman@pm.me>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 7114c3fdb473fc3c6e894749edc0df69710932f4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignore
(TBI) that allows the software tag-based mode on arm64 platform.

The value for sw_tags KASAN_SHADOW_OFFSET was calculated by rearranging
the formulas for KASAN_SHADOW_START and KASAN_SHADOW_END from
arch/x86/include/asm/kasan.h - the only prerequisites being
KASAN_SHADOW_SCALE_SHIFT of 4, and KASAN_SHADOW_END equal to the
one from KASAN generic mode.

Set scale macro based on KASAN mode: in software tag-based mode 16 bytes
of memory map to one shadow byte and 8 in generic mode.

Disable CONFIG_KASAN_INLINE and CONFIG_KASAN_STACK when
CONFIG_KASAN_SW_TAGS is enabled on x86 until the appropriate compiler
support is available.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v7:
- Add a paragraph to the patch message explaining how the various
  addresses and the KASAN_SHADOW_OFFSET were calculated.

Changelog v6:
- Don't enable KASAN if LAM is not supported.
- Move kasan_init_tags() to kasan_init_64.c to not clutter the setup.c
  file.
- Move the #ifdef for the KASAN scale shift here.
- Move the gdb code to patch "Use arithmetic shift for shadow
  computation".
- Return "depends on KASAN" line to Kconfig.
- Add the defer kasan config option so KASAN can be disabled on hardware
  that doesn't have LAM.

Changelog v4:
- Add x86 specific kasan_mem_to_shadow().
- Revert x86 to the older unsigned KASAN_SHADOW_OFFSET. Do the same to
  KASAN_SHADOW_START/END.
- Modify scripts/gdb/linux/kasan.py to keep x86 using unsigned offset.
- Disable inline and stack support when software tags are enabled on
  x86.

Changelog v3:
- Remove runtime_const from previous patch and merge the rest here.
- Move scale shift definition back to header file.
- Add new kasan offset for software tag based mode.
- Fix patch message typo 32 -> 16, and 16 -> 8.
- Update lib/Kconfig.kasan with x86 now having software tag-based
  support.

Changelog v2:
- Remove KASAN dense code.

 Documentation/arch/x86/x86_64/mm.rst | 6 ++++--
 arch/x86/Kconfig                     | 4 ++++
 arch/x86/boot/compressed/misc.h      | 1 +
 arch/x86/include/asm/kasan.h         | 5 +++++
 arch/x86/mm/kasan_init_64.c          | 6 ++++++
 lib/Kconfig.kasan                    | 3 ++-
 6 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x86/=
x86_64/mm.rst
index a6cf05d51bd8..ccbdbb4cda36 100644
--- a/Documentation/arch/x86/x86_64/mm.rst
+++ b/Documentation/arch/x86/x86_64/mm.rst
@@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
    ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unused=
 hole
    ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual me=
mory map (vmemmap_base)
    ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unused=
 hole
-   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shad=
ow memory
+   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shad=
ow memory (generic mode)
+   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN shad=
ow memory (software tag-based mode)
   __________________|____________|__________________|_________|___________=
_________________________________________________
                                                               |
                                                               | Identical =
layout to the 56-bit one from here on:
@@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
    ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unused=
 hole
    ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual me=
mory map (vmemmap_base)
    ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unused=
 hole
-   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shad=
ow memory
+   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shad=
ow memory (generic mode)
+   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN shad=
ow memory (software tag-based mode)
   __________________|____________|__________________|_________|___________=
_________________________________________________
                                                               |
                                                               | Identical =
layout to the 47-bit one from here on:
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..21c71d9e0698 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -67,6 +67,7 @@ config X86
 =09select ARCH_CLOCKSOURCE_INIT
 =09select ARCH_CONFIGURES_CPU_MITIGATIONS
 =09select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
+=09select ARCH_DISABLE_KASAN_INLINE=09if X86_64 && KASAN_SW_TAGS
 =09select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE && MIGR=
ATION
 =09select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
 =09select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
@@ -196,6 +197,8 @@ config X86
 =09select HAVE_ARCH_JUMP_LABEL_RELATIVE
 =09select HAVE_ARCH_KASAN=09=09=09if X86_64
 =09select HAVE_ARCH_KASAN_VMALLOC=09=09if X86_64
+=09select HAVE_ARCH_KASAN_SW_TAGS=09=09if ADDRESS_MASKING
+=09select ARCH_NEEDS_DEFER_KASAN=09=09if ADDRESS_MASKING
 =09select HAVE_ARCH_KFENCE
 =09select HAVE_ARCH_KMSAN=09=09=09if X86_64
 =09select HAVE_ARCH_KGDB
@@ -410,6 +413,7 @@ config AUDIT_ARCH
 config KASAN_SHADOW_OFFSET
 =09hex
 =09depends on KASAN
+=09default 0xeffffc0000000000 if KASAN_SW_TAGS
 =09default 0xdffffc0000000000
=20
 config HAVE_INTEL_TXT
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/mis=
c.h
index fd855e32c9b9..ba70036c2abd 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -13,6 +13,7 @@
 #undef CONFIG_PARAVIRT_SPINLOCKS
 #undef CONFIG_KASAN
 #undef CONFIG_KASAN_GENERIC
+#undef CONFIG_KASAN_SW_TAGS
=20
 #define __NO_FORTIFY
=20
diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 9b7951a79753..b38a1a83af96 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -6,7 +6,12 @@
 #include <linux/kasan-tags.h>
 #include <linux/types.h>
 #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
+
+#ifdef CONFIG_KASAN_SW_TAGS
+#define KASAN_SHADOW_SCALE_SHIFT 4
+#else
 #define KASAN_SHADOW_SCALE_SHIFT 3
+#endif
=20
 /*
  * Compiler uses shadow offset assuming that addresses start
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 7f5c11328ec1..3a5577341805 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -465,4 +465,10 @@ void __init kasan_init(void)
=20
 =09init_task.kasan_depth =3D 0;
 =09kasan_init_generic();
+=09pr_info("KernelAddressSanitizer initialized\n");
+
+=09if (boot_cpu_has(X86_FEATURE_LAM))
+=09=09kasan_init_sw_tags();
+=09else
+=09=09pr_info("KernelAddressSanitizer not initialized (sw-tags): hardware =
doesn't support LAM\n");
 }
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index a4bb610a7a6f..d13ea8da7bfd 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -112,7 +112,8 @@ config KASAN_SW_TAGS
=20
 =09  Requires GCC 11+ or Clang.
=20
-=09  Supported only on arm64 CPUs and relies on Top Byte Ignore.
+=09  Supported on arm64 CPUs that support Top Byte Ignore and on x86 CPUs
+=09  that support Linear Address Masking.
=20
 =09  Consumes about 1/16th of available memory at kernel start and
 =09  add an overhead of ~20% for dynamic allocations.
--=20
2.52.0


