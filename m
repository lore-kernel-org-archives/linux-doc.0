Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076891E8826;
	Tue, 13 Jan 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304768; cv=none; b=ueOqJ9Xjf2K8DDCjDIAVm09JTjAmYLsMY2OWwJbhWRZNKLE0U8ZM2jik9VU8qr2P+PXS/G15Ubvb92JKXZv25pi5lS/E0JfCNjRoQHlPKdTJTPOYQEzbX0o2xv7Ydbb7nSUf6TviMYItTMxJ9LY8Vc4C1gfQCOfo9E02s02qYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304768; c=relaxed/simple;
	bh=WkRSrK6xR9hGW4S3LaAvthr1Jr31lQaBKUcJrawlZag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQSljMNXCSb7jyHwvjYsxhJRLghAOsVNVNMgndlithyA1E6kleXANDt/HmSMoH/IIVERNleM5NOUn+NCS0j4oR1M7AlfHmi4Qigk5/q5TOMqcmwaAyhKWll7DFpw7J1iBgBkTg5mOL5Qzw1boWagzzxhH/GRQ2LBPNA25IzYYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RkjHT1Gs; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RkjHT1Gs"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E41DC40E00DA;
	Tue, 13 Jan 2026 11:46:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id F_eJBAeyuWOC; Tue, 13 Jan 2026 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768304759; bh=pz0WnAch0eItdE8vpx3eUHqQth068Vy2LdHGkHAEuPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkjHT1GsIAJWp13HhdWM77Jp0DyszIDdPg8DFNz/mFAXZjogKIAsLqM81wP//ONqA
	 KF/PIk9PB3DHVQVSePx+CE8LK7AtBDG5PL6dwYohrE4CZM9+GcBHMRMZlK3Tij4GtX
	 y1rw6ihxJd6M2GPRSBxw3MJcM/ARhtEHxg7zxF4XV27W3LxUUB48JAcSJAaj4J2Ysr
	 ZdMaox55COzY70sEmQtsHZLJELYL+jvdGk4ExSdBOAAew0N3ULmE2/5yLbAo4zcbAL
	 bGsug69rXiSNdYEQ2QZvCESLekVDJENgLhJkKJ8MqZKEqRUcm1xsmSJB0SSz1f67+S
	 gdBvHAGG/HTOuIC7mvfwgOToW/aPMeNag47RWXsTp4XXSLTPOs1sR+lLcO3hOOckoa
	 68EmdupDhHBG9N/jrEHCWurteYTdNeIvERO1C94xdPlfGR3azxxYybAcU9J8EBhB2g
	 LvhGXcks8EHqNp93gd9tzNtoUB16/m5k0WvNpGOB2CWbBCp7xesvXsjY8xrX3HTJyg
	 EzFas0MgmaVO2QH4UV2TOISvFshicQL074z8lq8bElKHlpZ72IMbB/dUXF1suYxpSt
	 MJscdjP0mvoWWhybZsbsxpTqQLfz0EiS6PFGKomN2lyvzttxTzseLSxahXmSoGf6bb
	 JYWVJuFMu/SAYJx3tDfQGyBw=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 52D5340E0194;
	Tue, 13 Jan 2026 11:45:40 +0000 (UTC)
Date: Tue, 13 Jan 2026 12:45:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v8 14/14] x86/kasan: Make software tag-based kasan
 available
Message-ID: <20260113114539.GIaWYwY9q4QuC-J66e@fat_crate.local>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <5b46822936bf9bf7e5cf5d1b57f936345c45a140.1768233085.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b46822936bf9bf7e5cf5d1b57f936345c45a140.1768233085.git.m.wieczorretman@pm.me>

For all your $Subjects: make sure they have a verb in the name.

For that consult:

https://kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

and the following "Changelog" section.

On Mon, Jan 12, 2026 at 05:28:35PM +0000, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

...

>  Documentation/arch/x86/x86_64/mm.rst | 6 ++++--
>  arch/x86/Kconfig                     | 4 ++++
>  arch/x86/boot/compressed/misc.h      | 1 +
>  arch/x86/include/asm/kasan.h         | 5 +++++
>  arch/x86/mm/kasan_init_64.c          | 6 ++++++
>  lib/Kconfig.kasan                    | 3 ++-
>  6 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x86/x86_64/mm.rst
> index a6cf05d51bd8..ccbdbb4cda36 100644
> --- a/Documentation/arch/x86/x86_64/mm.rst
> +++ b/Documentation/arch/x86/x86_64/mm.rst
> @@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
>     ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unused hole
>     ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual memory map (vmemmap_base)
>     ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unused hole
> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shadow memory
> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shadow memory (generic mode)
> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN shadow memory (software tag-based mode)

These here are non-overlapping ranges. Yours are overlapping. Why?

>    __________________|____________|__________________|_________|____________________________________________________________
>                                                                |
>                                                                | Identical layout to the 56-bit one from here on:
> @@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
>     ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unused hole
>     ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual memory map (vmemmap_base)
>     ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unused hole
> -   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shadow memory
> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shadow memory (generic mode)
> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN shadow memory (software tag-based mode)
>    __________________|____________|__________________|_________|____________________________________________________________
>                                                                |

...

> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
> index 7f5c11328ec1..3a5577341805 100644
> --- a/arch/x86/mm/kasan_init_64.c
> +++ b/arch/x86/mm/kasan_init_64.c
> @@ -465,4 +465,10 @@ void __init kasan_init(void)
>  
>  	init_task.kasan_depth = 0;
>  	kasan_init_generic();
> +	pr_info("KernelAddressSanitizer initialized\n");

Why?

> +
> +	if (boot_cpu_has(X86_FEATURE_LAM))

cpu_feature_enabled()

> +		kasan_init_sw_tags();
> +	else
> +		pr_info("KernelAddressSanitizer not initialized (sw-tags): hardware doesn't support LAM\n");

You just said "initialized". Now it is not? How about we make up our minds
first and then issue one single true statement?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
