Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFA3221F0A
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 16:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320058; cv=none; b=HaKpkwLE22j8Usc1gZTuS7tcMCvKFeG9J9S+InRINjsJKtHCx3ksmZGmhdRrygFXHVtSi9TIYmeAVhvjvh11K3eQR3LCFA5NlYI6J4iFIwmKJVql9UYUVJJgcKqWWfRQ95EX4WagKy4f1AfZyWRAv+L2RReijY+F+1LGvCV00P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320058; c=relaxed/simple;
	bh=x4Cwq3F8znqD20kUwf2anH/5uMYZhIINgq7f29nWIKw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jb7EVpm6lY0FxmGA8n3cjeJf7LL/YolnjYUOhH2cXlIhkkCP9wtm8JS6reWdxzcwd4+mm4PZrrPhp1mLw4MU2rtm9JPyMC1ttkh33pL5W955sNCScFE7/eaQQ1Hvy2pvfAqPl1IUR9Vy7SZzadg+D7IjMdurGXMBi1FMGnrDy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=WIPKkONR; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="WIPKkONR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768320052; x=1768579252;
	bh=hFHCrVEHjXRF7hyUvHIW1j8LKpUAszN9uEePsrS4udM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WIPKkONRExd2sHp2c0Ufz1F5MEH+X1rygNmxORbwTePMMYuDtt5eZvgflhXHQmQ2F
	 0CucjV55DXQmiUyFQ6hjt4aGNp3k4IByZ7ZO1RQFWRLMo3iRRl6Z/17sSpOLXZBX0X
	 1VdPR4PEW0CVYxydBt4euMsgpYZbvp1VZkG58tLzfbdkyJvCxJqgTouYoJzfskG2ff
	 NPqQ6QzI2rUAQkZZKMlcrRSaYMd48YaEivYvhjmF8vZNOtr5xberFKRrK5/Ys5WuNY
	 bQfil1UyXcGSG1toU70lqAOLUq5zrRX0qMsLRaBkFtXl1mQxa2o4cr9dBKvqw9rGEU
	 ERNLnNyjY/5dA==
Date: Tue, 13 Jan 2026 16:00:47 +0000
To: Borislav Petkov <bp@alien8.de>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v8 14/14] x86/kasan: Make software tag-based kasan available
Message-ID: <aWZlpjwMXgdtZGMQ@wieczorr-mobl1.localdomain>
In-Reply-To: <20260113114539.GIaWYwY9q4QuC-J66e@fat_crate.local>
References: <cover.1768233085.git.m.wieczorretman@pm.me> <5b46822936bf9bf7e5cf5d1b57f936345c45a140.1768233085.git.m.wieczorretman@pm.me> <20260113114539.GIaWYwY9q4QuC-J66e@fat_crate.local>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 9480566bf693106aafa213f58581fafcda1e4f76
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-01-13 at 12:45:39 +0100, Borislav Petkov wrote:
>For all your $Subjects: make sure they have a verb in the name.
>
>For that consult:
>
>https://kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subje=
ct
>
>and the following "Changelog" section.

Sure, I'll revise these.

>
>On Mon, Jan 12, 2026 at 05:28:35PM +0000, Maciej Wieczor-Retman wrote:
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
>...
>
>>  Documentation/arch/x86/x86_64/mm.rst | 6 ++++--
>>  arch/x86/Kconfig                     | 4 ++++
>>  arch/x86/boot/compressed/misc.h      | 1 +
>>  arch/x86/include/asm/kasan.h         | 5 +++++
>>  arch/x86/mm/kasan_init_64.c          | 6 ++++++
>>  lib/Kconfig.kasan                    | 3 ++-
>>  6 files changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x=
86/x86_64/mm.rst
>> index a6cf05d51bd8..ccbdbb4cda36 100644
>> --- a/Documentation/arch/x86/x86_64/mm.rst
>> +++ b/Documentation/arch/x86/x86_64/mm.rst
>> @@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
>>     ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unu=
sed hole
>>     ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual=
 memory map (vmemmap_base)
>>     ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unu=
sed hole
>> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN s=
hadow memory
>> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN s=
hadow memory (generic mode)
>> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN s=
hadow memory (software tag-based mode)
>
>These here are non-overlapping ranges. Yours are overlapping. Why?

The two added lines are two alternative ranges based on which mode is chose=
n
during compile time. Is there some neater way to note this down here?

>> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN s=
hadow memory (generic mode)
>> +   or
>> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN s=
hadow memory (software tag-based mode)

Something like this maybe ^ ? Or is the first take okay?

>
>>    __________________|____________|__________________|_________|________=
____________________________________________________
>>                                                                |
>>                                                                | Identic=
al layout to the 56-bit one from here on:
>> @@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
>>     ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unu=
sed hole
>>     ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual=
 memory map (vmemmap_base)
>>     ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unu=
sed hole
>> -   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN s=
hadow memory
>> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN s=
hadow memory (generic mode)
>> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN s=
hadow memory (software tag-based mode)
>>    __________________|____________|__________________|_________|________=
____________________________________________________
>>                                                                |
>
>...
>
>> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
>> index 7f5c11328ec1..3a5577341805 100644
>> --- a/arch/x86/mm/kasan_init_64.c
>> +++ b/arch/x86/mm/kasan_init_64.c
>> @@ -465,4 +465,10 @@ void __init kasan_init(void)
>>
>>  =09init_task.kasan_depth =3D 0;
>>  =09kasan_init_generic();
>> +=09pr_info("KernelAddressSanitizer initialized\n");
>
>Why?

My mistake, that string is already printed by kasan_init_generic(), I'll re=
move
it.

>
>> +
>> +=09if (boot_cpu_has(X86_FEATURE_LAM))
>
>cpu_feature_enabled()

Sure, thanks!

>
>> +=09=09kasan_init_sw_tags();
>> +=09else
>> +=09=09pr_info("KernelAddressSanitizer not initialized (sw-tags): hardwa=
re doesn't support LAM\n");
>
>You just said "initialized". Now it is not? How about we make up our minds
>first and then issue one single true statement?

Yes, I'll keep this one since the "initialized" pr_info() are called from i=
nside
kasan_init_generic() and kasan_init_sw_tags().

>
>--
>Regards/Gruss,
>    Boris.
>
>https://people.kernel.org/tglx/notes-about-netiquette

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

