Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B026CE39
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 01:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267321; cv=none; b=Lc2rLBE1q8JQ01YYZOcHh+2H5eoYovqgSX2VVOLZOhWBlFMXzyG1abO/Bq8CmoMjArdj0RvtIgFgVGYl1O6MZxvouzI4rGg96J1+uZUo8LHgp4nW+ZMyasEOJLzlQ4NKKuR5nol3zCSWGxo7U2poyi9gLBgVfvd10svawZ8V0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267321; c=relaxed/simple;
	bh=v/UT6HDT+7vlL3p425i3RakRTg7lpwMZN+O5x0sx87k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sR+yhHrQfrLi4A6OX0/3TY3beUwv4Ue9ZQkGOp79MezhCsE+ABNIAMFzRAdTlpTViaU2CiYNalhMSj3ihoVg7+yzLAjbFTLtKF6zh+z9jj7kxwqMQRK2lDM9ch2ptalVGErrcqiQ7eVQ2BkGxujKOEart/SdAUTbZ/h6fl1yCqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVRuLMDS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVRuLMDS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ed987d51aso1651205e9.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 17:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768267318; x=1768872118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V98bbCaXhvCSK3ORMF0ddg8nJ4GMw1PJ4T3czKQPpIM=;
        b=nVRuLMDSe5MwvTq9Fp/lOITCNhwAnSU0vZ15DZQl3jFJobJq8EeFJirmddSzOjntkv
         AQzq++6/WN1//d6w0ybqs80J83zMr3CFnwZe/OasgA3lB+I8CuRVS8r0SaHBFR91wOGT
         9kdOUWNcdHUgMfODtvedMOo0g6rJ0+vmbDtLtYrQmcn5ZYMR8DyA16kUfBSNhuu9d2qb
         mRCqBMNwP1yM2fzrgHwZblN6xsOTQ6iyMLG02D7bC3VpA8Bb5NIawhZd5OA0R/a/ehLq
         wYcJCJNp4Zyj1rkG6d8rtXac/5U6PxJ4iJwtXoHQL2S34OGFGHrJmoNi5BzSlPkiNVwB
         T2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267318; x=1768872118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V98bbCaXhvCSK3ORMF0ddg8nJ4GMw1PJ4T3czKQPpIM=;
        b=Xy1Lu3/8ySOiH2Db3g2sgZBd7IREJuPRAX25i98TEnEMDsesA8FUqFFjSlmrgjmrGi
         BNDqfbUF7Kbzq+U8EuOBewxUstWIki0eEelRwGXOHl2lMygmif1/6WqcG2QCg53urmwK
         Mk6xzZgBXTDXOyhGktMDVl1KpqQScJ7cTcS7GA2yPz65jyIhQwHX0R1hk19SXsX2xweo
         MQue57ZIOyGmCvxFTjHjswZah/MJs/fJ1N42AF16TNDBaGHxnI4oN67zR4TEJFDsDeRW
         QPQrz1Jc4RkBbQxZHxnQ6i2kumGXRutUL4g+OHTqA2hyx+SWPUxY4cGtNNHwnMsYwwBb
         CuQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJJnmvbDsroRRM54WYEKMMGt78IRRE1QdY3uihcq0Ylu3B1S/CWK0lx1rZSJhcm6xXHmO1m8m8oEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ToGKU3biBXgfOIclqIZD/eaqu8qR4tS/uAcw4D0doc1cQrMM
	q5cCQu4TxKAF2IMxBvmLSHh4+fWsFxbpUFk/38nL95/q53nwWjvxdKZhjjJN/Zk9VNPow2vwA+I
	+KJWn8yyNdb+S93kMMVyGmJiV9vuH+s0=
X-Gm-Gg: AY/fxX4i+d9rvQLkkrtMv+UPOb1XNJw2ubRe9Cl9lxv1gSrMFsCq/6U7SktIWdTA36V
	YN+ZiKCQdPAnY4fLbQVrZdvSSxckUfgEW7OEKt5Qi4A5EWfOYgRBorYx4pq4xA4S+YmfLReQT9n
	ru2rmrYIjuXi9ZlNQhnPpPB0IYz0CYkRx0UEIsp1hc1SsEDYQ3MPqItUDeTH6acfOhFZltua7kG
	g1BvaWeevN8DCAqMKOqaWLCB0sPvRj52ypWnBhHn6I/RWUvsaCgjiRofjGe7zCXpjWThSJfUc0X
	IfzsXAyPI1Y3ZZAxhGgkDzoQpTajPhITa8pVXf8O
X-Google-Smtp-Source: AGHT+IGhu58R4caMkoymA06t6jucP+IC26haiqxVEeUFvBVDwHkSe/jfxzCa51B+j6E5vpkVAqkvsagRpoBj/VBJ7BU=
X-Received: by 2002:a05:600c:1392:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-47d84b3b724mr253049155e9.30.1768267318036; Mon, 12 Jan 2026
 17:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768233085.git.m.wieczorretman@pm.me> <5b46822936bf9bf7e5cf5d1b57f936345c45a140.1768233085.git.m.wieczorretman@pm.me>
In-Reply-To: <5b46822936bf9bf7e5cf5d1b57f936345c45a140.1768233085.git.m.wieczorretman@pm.me>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 13 Jan 2026 02:21:47 +0100
X-Gm-Features: AZwV_Qi5qDo_RW3GUl03sUQLy4_9JT9vPGqPKV7l-vPxKwl8DzaLwsGyVKGsEyg
Message-ID: <CA+fCnZeVEDwojqUfT1CC10sLZiY8MVN-7S7R6FP_OHkU3TH+0g@mail.gmail.com>
Subject: Re: [PATCH v8 14/14] x86/kasan: Make software tag-based kasan available
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 6:28=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
> ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignore
> (TBI) that allows the software tag-based mode on arm64 platform.
>
> The value for sw_tags KASAN_SHADOW_OFFSET was calculated by rearranging
> the formulas for KASAN_SHADOW_START and KASAN_SHADOW_END from
> arch/x86/include/asm/kasan.h - the only prerequisites being
> KASAN_SHADOW_SCALE_SHIFT of 4, and KASAN_SHADOW_END equal to the
> one from KASAN generic mode.
>
> Set scale macro based on KASAN mode: in software tag-based mode 16 bytes
> of memory map to one shadow byte and 8 in generic mode.
>
> Disable CONFIG_KASAN_INLINE and CONFIG_KASAN_STACK when
> CONFIG_KASAN_SW_TAGS is enabled on x86 until the appropriate compiler
> support is available.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v7:
> - Add a paragraph to the patch message explaining how the various
>   addresses and the KASAN_SHADOW_OFFSET were calculated.
>
> Changelog v6:
> - Don't enable KASAN if LAM is not supported.
> - Move kasan_init_tags() to kasan_init_64.c to not clutter the setup.c
>   file.
> - Move the #ifdef for the KASAN scale shift here.
> - Move the gdb code to patch "Use arithmetic shift for shadow
>   computation".
> - Return "depends on KASAN" line to Kconfig.
> - Add the defer kasan config option so KASAN can be disabled on hardware
>   that doesn't have LAM.
>
> Changelog v4:
> - Add x86 specific kasan_mem_to_shadow().
> - Revert x86 to the older unsigned KASAN_SHADOW_OFFSET. Do the same to
>   KASAN_SHADOW_START/END.
> - Modify scripts/gdb/linux/kasan.py to keep x86 using unsigned offset.
> - Disable inline and stack support when software tags are enabled on
>   x86.
>
> Changelog v3:
> - Remove runtime_const from previous patch and merge the rest here.
> - Move scale shift definition back to header file.
> - Add new kasan offset for software tag based mode.
> - Fix patch message typo 32 -> 16, and 16 -> 8.
> - Update lib/Kconfig.kasan with x86 now having software tag-based
>   support.
>
> Changelog v2:
> - Remove KASAN dense code.
>
>  Documentation/arch/x86/x86_64/mm.rst | 6 ++++--
>  arch/x86/Kconfig                     | 4 ++++
>  arch/x86/boot/compressed/misc.h      | 1 +
>  arch/x86/include/asm/kasan.h         | 5 +++++
>  arch/x86/mm/kasan_init_64.c          | 6 ++++++
>  lib/Kconfig.kasan                    | 3 ++-
>  6 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x8=
6/x86_64/mm.rst
> index a6cf05d51bd8..ccbdbb4cda36 100644
> --- a/Documentation/arch/x86/x86_64/mm.rst
> +++ b/Documentation/arch/x86/x86_64/mm.rst
> @@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
>     ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unus=
ed hole
>     ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual =
memory map (vmemmap_base)
>     ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unus=
ed hole
> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory
> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory (generic mode)
> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________
>                                                                |
>                                                                | Identica=
l layout to the 56-bit one from here on:
> @@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
>     ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unus=
ed hole
>     ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual =
memory map (vmemmap_base)
>     ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unus=
ed hole
> -   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory
> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory (generic mode)
> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________
>                                                                |
>                                                                | Identica=
l layout to the 47-bit one from here on:
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 80527299f859..21c71d9e0698 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -67,6 +67,7 @@ config X86
>         select ARCH_CLOCKSOURCE_INIT
>         select ARCH_CONFIGURES_CPU_MITIGATIONS
>         select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
> +       select ARCH_DISABLE_KASAN_INLINE        if X86_64 && KASAN_SW_TAG=
S
>         select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE &=
& MIGRATION
>         select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
>         select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
> @@ -196,6 +197,8 @@ config X86
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>         select HAVE_ARCH_KASAN                  if X86_64
>         select HAVE_ARCH_KASAN_VMALLOC          if X86_64
> +       select HAVE_ARCH_KASAN_SW_TAGS          if ADDRESS_MASKING
> +       select ARCH_NEEDS_DEFER_KASAN           if ADDRESS_MASKING

Do we need this?

>         select HAVE_ARCH_KFENCE
>         select HAVE_ARCH_KMSAN                  if X86_64
>         select HAVE_ARCH_KGDB
> @@ -410,6 +413,7 @@ config AUDIT_ARCH
>  config KASAN_SHADOW_OFFSET
>         hex
>         depends on KASAN
> +       default 0xeffffc0000000000 if KASAN_SW_TAGS
>         default 0xdffffc0000000000
>
>  config HAVE_INTEL_TXT
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/m=
isc.h
> index fd855e32c9b9..ba70036c2abd 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -13,6 +13,7 @@
>  #undef CONFIG_PARAVIRT_SPINLOCKS
>  #undef CONFIG_KASAN
>  #undef CONFIG_KASAN_GENERIC
> +#undef CONFIG_KASAN_SW_TAGS
>
>  #define __NO_FORTIFY
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index 9b7951a79753..b38a1a83af96 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -6,7 +6,12 @@
>  #include <linux/kasan-tags.h>
>  #include <linux/types.h>
>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define KASAN_SHADOW_SCALE_SHIFT 4
> +#else
>  #define KASAN_SHADOW_SCALE_SHIFT 3
> +#endif
>
>  /*
>   * Compiler uses shadow offset assuming that addresses start
> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
> index 7f5c11328ec1..3a5577341805 100644
> --- a/arch/x86/mm/kasan_init_64.c
> +++ b/arch/x86/mm/kasan_init_64.c
> @@ -465,4 +465,10 @@ void __init kasan_init(void)
>
>         init_task.kasan_depth =3D 0;
>         kasan_init_generic();
> +       pr_info("KernelAddressSanitizer initialized\n");

This pr_info is not needed, kasan_init_generic already prints the message.



> +
> +       if (boot_cpu_has(X86_FEATURE_LAM))
> +               kasan_init_sw_tags();
> +       else
> +               pr_info("KernelAddressSanitizer not initialized (sw-tags)=
: hardware doesn't support LAM\n");
>  }
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index a4bb610a7a6f..d13ea8da7bfd 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -112,7 +112,8 @@ config KASAN_SW_TAGS
>
>           Requires GCC 11+ or Clang.
>
> -         Supported only on arm64 CPUs and relies on Top Byte Ignore.
> +         Supported on arm64 CPUs that support Top Byte Ignore and on x86=
 CPUs
> +         that support Linear Address Masking.
>
>           Consumes about 1/16th of available memory at kernel start and
>           add an overhead of ~20% for dynamic allocations.
> --
> 2.52.0
>
>
