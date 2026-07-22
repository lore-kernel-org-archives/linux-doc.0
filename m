Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78D43B3CC;
	Wed, 22 Jul 2026 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756594; cv=none; b=UYpxoAxRRu7jOk+35bNuFCvNydDJDFD607wgk40cW0tn3Q+bN2LUzCJ4NenJWPKWNf+wb0eDorSjDD8P4pui4OnzQl+7fuZOaP9ASU0B7jfBUEilZr9PwUYqOIqSVPfRbmSm+6ElLMUBVw2mfwkrqTc1iWbf6A13t9n4uwlAFK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756594; c=relaxed/simple;
	bh=mL0hVOn3VfQik4AzLLYjckRIwmK1bQCvFOR8t0pfuV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoXSue31RarxJJonLUdf6zlB0uTLYm4AGtuBBHaGKclTiROOmvkWefc52DCvw4tYQz8vr6HkuJ0cUd7SHPGSz+tVxGY3zGsYq0XbRrWpwd6/u3Yc5LF/5Pf5tN2VgH/ZEOAT9ZXOc/9qbWI4mi1SpDFmxSdE6+esF8opUA8uXkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkxeiJNA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkxeiJNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C3F1F000E9;
	Wed, 22 Jul 2026 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756593;
	bh=Xz99la/oDRRkYoeUQubqzsSQdycdHc1WWJfFuxUQjNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkxeiJNAa3j2sMafo6jZLbRm6zFW656hfFJqR+GlR1nreROU8h74RP8Mu/dPsZI5D
	 LNR+eXELl4lSq5+Iw9KZlEvF/D9pEjHGoCQaONf1mcspup7erI+szvzhJMFzJSFUse
	 4Jj6IaVKcf2OP8HqPro9EXPSnLcMgtaxCW6ltqTl5ZBtljKN6bz7HJkHTGgWfijBU8
	 ou6aLQWpxTmJfIdEf1/Eps+jOQjBbfH3RIaIk0AL6N1T7GjUrQFg+2izwAx281Nl4Q
	 D2NUTs0WHr7an/O0c1cJO5Ai8PcsoBabISJXYvHY6glufdltLCg7aCBJnZRwRobQQs
	 RuL9+vXQTCOqQ==
Date: Wed, 22 Jul 2026 22:43:09 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <amE5bX0jey6WS0U1@willie-the-truck>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>

On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
> index e278e060e78a..2452990ed37a 100644
> --- a/arch/arm64/lib/delay.c
> +++ b/arch/arm64/lib/delay.c
> @@ -15,6 +15,8 @@
>  
>  #include <clocksource/arm_arch_timer.h>
>  
> +#include "../kernel/idle.h"
> +
>  #define USECS_TO_CYCLES(time_usecs)			\
>  	xloops_to_cycles((time_usecs) * 0x10C7UL)
>  
> @@ -49,7 +51,8 @@ void __delay(unsigned long cycles)
>  		 * Start with WFIT. If an interrupt makes us resume
>  		 * early, use a WFET loop to complete the delay.
>  		 */
> -		wfit(end);
> +		if (likely(idle == ARM64_IDLE_WFI))
> +			wfit(end);

Rather than scatter the idle implementation check across all users of
WFI*, why not move this into the macro itself? That way, the callers can
all stay like they are but the macro behaves as specified.

Will
