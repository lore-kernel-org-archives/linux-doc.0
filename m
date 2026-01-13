Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7CD2F0C6B;
	Tue, 13 Jan 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318306; cv=none; b=ecFX+DbpcDGllozNAndQDP8WNGfel+LA8mDEXy+PZ+0uEBMjXIoExK+OqYqrt+vwXH6nd5uAP+b4n5s1nR6pQHEt9mwKS7cSRwc7cXoJVu07CIZ09jy9DQJXXEmgPpaZfEylRwM8tMru3jgqRpPF80SZS6Nnb4m8Ti/GqY9RQrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318306; c=relaxed/simple;
	bh=ht/ytw9QM7Zzlti1XtMuDFnnT8andTzW9TBqyyAHk3M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S29HTPnmhGhDrj50UISdLeagwabyeF858O27fZKcX7gcs7edpdMOclQCejhKIu3QBSA1w62pjvm1o+cgTajX4JFSozEaFf25VeOtDrPYgXVTeJfId3doWpQaBowmtsXzxTf3fxRUlHQE5G6kTQT3Ll+y6s0R5g3hpQ5OcKssRZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QwtOFF/E; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QwtOFF/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768318301; x=1768577501;
	bh=uEP1NgR6HhXin2bbfObweda7q+8+DdU3HNOIdXWHQS8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QwtOFF/EZDPyEUFWP0X02KHZ5lFmyR1DmRoCU5zuaU8JvcqtgnqA+Vt9Hr69S4zDJ
	 FC6i3XraokepFnq/T1cmAIE12h+38EWUO7EuMAouJCpA/VIbmLKWgAMzdraw2UtFbx
	 Hj4zBhpEV9tjNezX8+3lECtXHKkpzJY9qI7HGZeCKgf/RICuDNR0c1yRaVLRR2U5Ba
	 eWekrP5EJORMGuTp4ljbKYBzLCEz/Nh5XGq0KaaDjW50FvQK1ADyYNsoMeSJyLq3QX
	 B5TC5Dvp4b5zf0Y50GMM9NfUw7CNiQ8kfICZGhlXbgaW7V52HpCPVz9VbFdb73Ky2e
	 wZ4VubR31OIvQ==
Date: Tue, 13 Jan 2026 15:31:38 +0000
To: Andrey Konovalov <andreyknvl@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v8 14/14] x86/kasan: Make software tag-based kasan available
Message-ID: <aWZh-4FlO5VVvkpQ@wieczorr-mobl1.localdomain>
In-Reply-To: <CA+fCnZeVEDwojqUfT1CC10sLZiY8MVN-7S7R6FP_OHkU3TH+0g@mail.gmail.com>
References: <cover.1768233085.git.m.wieczorretman@pm.me> <5b46822936bf9bf7e5cf5d1b57f936345c45a140.1768233085.git.m.wieczorretman@pm.me> <CA+fCnZeVEDwojqUfT1CC10sLZiY8MVN-7S7R6FP_OHkU3TH+0g@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 21a14cfcc6d9b67126769e450095932cdd296122
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-01-13 at 02:21:47 +0100, Andrey Konovalov wrote:
>On Mon, Jan 12, 2026 at 6:28=E2=80=AFPM Maciej Wieczor-Retman
><m.wieczorretman@pm.me> wrote:
>>
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
...
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 80527299f859..21c71d9e0698 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -67,6 +67,7 @@ config X86
>>         select ARCH_CLOCKSOURCE_INIT
>>         select ARCH_CONFIGURES_CPU_MITIGATIONS
>>         select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>> +       select ARCH_DISABLE_KASAN_INLINE        if X86_64 && KASAN_SW_TA=
GS
>>         select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE =
&& MIGRATION
>>         select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
>>         select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
>> @@ -196,6 +197,8 @@ config X86
>>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>>         select HAVE_ARCH_KASAN                  if X86_64
>>         select HAVE_ARCH_KASAN_VMALLOC          if X86_64
>> +       select HAVE_ARCH_KASAN_SW_TAGS          if ADDRESS_MASKING
>> +       select ARCH_NEEDS_DEFER_KASAN           if ADDRESS_MASKING
>
>Do we need this?

I added this to solve the problem "what should happen when there is no hard=
ware
support (discovered at runtime) but someone requested/compiled the kernel w=
ith
LAM and KASAN sw_tags?". I think Samuel suggested the static keys approach
during v6 to solve this issue.

As I recall without it the kernel would just freeze since it would try doin=
g a
bunch of LAM+KASAN related things without LAM working. So that'd end with
various faults and violations.

Technically kasan_init_sw_tags() is locked behind:
=09if (boot_cpu_has(X86_FEATURE_LAM))
but not running kasan_init_sw_tags() normally doesn't actually disable soft=
ware
KASAN if we don't have LAM available. Without ARCH_NEEDS_DEFER_KASAN it jus=
t
checks whether CONFIG_KASAN is enabled which it would in this scenario.

>
>>         select HAVE_ARCH_KFENCE
>>         select HAVE_ARCH_KMSAN                  if X86_64
>>         select HAVE_ARCH_KGDB
>> @@ -410,6 +413,7 @@ config AUDIT_ARCH
>>  config KASAN_SHADOW_OFFSET
>>         hex
>>         depends on KASAN
>> +       default 0xeffffc0000000000 if KASAN_SW_TAGS
>>         default 0xdffffc0000000000
>>
>>  config HAVE_INTEL_TXT
>> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/=
misc.h
>> index fd855e32c9b9..ba70036c2abd 100644
>> --- a/arch/x86/boot/compressed/misc.h
>> +++ b/arch/x86/boot/compressed/misc.h
>> @@ -13,6 +13,7 @@
>>  #undef CONFIG_PARAVIRT_SPINLOCKS
>>  #undef CONFIG_KASAN
>>  #undef CONFIG_KASAN_GENERIC
>> +#undef CONFIG_KASAN_SW_TAGS
>>
>>  #define __NO_FORTIFY
>>
>> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
>> index 9b7951a79753..b38a1a83af96 100644
>> --- a/arch/x86/include/asm/kasan.h
>> +++ b/arch/x86/include/asm/kasan.h
>> @@ -6,7 +6,12 @@
>>  #include <linux/kasan-tags.h>
>>  #include <linux/types.h>
>>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>> +
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +#define KASAN_SHADOW_SCALE_SHIFT 4
>> +#else
>>  #define KASAN_SHADOW_SCALE_SHIFT 3
>> +#endif
>>
>>  /*
>>   * Compiler uses shadow offset assuming that addresses start
>> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
>> index 7f5c11328ec1..3a5577341805 100644
>> --- a/arch/x86/mm/kasan_init_64.c
>> +++ b/arch/x86/mm/kasan_init_64.c
>> @@ -465,4 +465,10 @@ void __init kasan_init(void)
>>
>>         init_task.kasan_depth =3D 0;
>>         kasan_init_generic();
>> +       pr_info("KernelAddressSanitizer initialized\n");
>
>This pr_info is not needed, kasan_init_generic already prints the message.

Thanks! I'll get rid of it.

>
>> +
>> +       if (boot_cpu_has(X86_FEATURE_LAM))
>> +               kasan_init_sw_tags();
>> +       else
>> +               pr_info("KernelAddressSanitizer not initialized (sw-tags=
): hardware doesn't support LAM\n");
>>  }
>> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
>> index a4bb610a7a6f..d13ea8da7bfd 100644
>> --- a/lib/Kconfig.kasan
>> +++ b/lib/Kconfig.kasan
>> @@ -112,7 +112,8 @@ config KASAN_SW_TAGS
>>
>>           Requires GCC 11+ or Clang.
>>
>> -         Supported only on arm64 CPUs and relies on Top Byte Ignore.
>> +         Supported on arm64 CPUs that support Top Byte Ignore and on x8=
6 CPUs
>> +         that support Linear Address Masking.
>>
>>           Consumes about 1/16th of available memory at kernel start and
>>           add an overhead of ~20% for dynamic allocations.
>> --
>> 2.52.0
>>
>>

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

