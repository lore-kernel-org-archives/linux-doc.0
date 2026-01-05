Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8F314B77;
	Mon,  5 Jan 2026 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626434; cv=none; b=Hx1CA5dC/7IX+ueE21AmdUyOEVEahtQTB4icQvwfHUFyCTRMGSwDmPLPlx93YgIkNGPVEHF1uULwhLWyKp23drXrfCNLJnmHhl92pps7VEAh71PCZSQh3MtIn5xgT3QM2h9xJSpeC0ea/AyMiH4YQ7NzFW49fxDFjJ5lfRPNhwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626434; c=relaxed/simple;
	bh=7xGOVEFsII92WjP75c9eBTMSmnLBKwCKO0VvAGBY7SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfb4lXw0kpaWeTzTGB17TPS6LuTmqD88V7yZesmI37rPcyTAPI3uX5GJBG4HPSXJykFg4umtTCwACcdwGCm0gNtvGtuREzfDg9VXNX6n6puytFt4fLjQIBVZDiD8ri7c1c1KN2PDdghkbqqv1UPYku5qcLhxqu/BNvrpriZkspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PYuSvIS9; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PYuSvIS9"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B7E5340E0280;
	Mon,  5 Jan 2026 15:20:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id t2UCJe3iVdSs; Mon,  5 Jan 2026 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767626415; bh=X2JNmJFKher6HaTUFBDHcbdza4tNy3gI6bLZaEnB7+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYuSvIS98n67uqKksX8hy7C07J5HJP/eXlijQsIPMOVRVZ+P/ifgu2qLHLT914AoP
	 RxGfRyE5gnHjWnduyDiN+6/mGZtgYpTtQdsk3uHELz1uuiReIf38Yx4ZXtHNipSXt1
	 93H5Mbz/k2rUTL8sNj3U+VYbei8N8znZWdB5cdfNCtjqXS0q3Cgp7rXMxgmbAP5kW8
	 1tkqtWu/CJADRqZ+ei1umSv3Y5u+gzwZH5f9CrhSisy6ch8c0jkb3juP3FQFw3Rf5a
	 7jKA6/q61Nzmqzs2kI419X8tgmhq3Dqyhl4fGtSsQL19NwyA8TZdbtJC0lCMN+FXwx
	 gaRVqhPHlxfI9ZaxA2+JXg5xfIEEfJJ1wPhgTuElODFzC9Zyb9TZI/DjFmFUFRGPVD
	 +/yHe56BO1uId4QqJ6ou5Tje1qV4pR0lgt0UrgxSF9VrxlSaxLu34Z2ZPTZnu+znU2
	 1V+lptNXYTc1B3MRAUY2g2psXGmXosS4Qaa8pIQ5R1W0zMnRGYzoSBLTaMeeO5e0Vi
	 9xD9pBOvb/Zki5gPyFYCBsldX33R1PcAb7E/7ApfhTdyoZDSgXT0ArGJ9JVgjZzfN6
	 JVE9YAe5gpsjGnClElMOwzvr1JfbJRpa2hU66aA/iydlEvL0dQDAc/0U+ynStFAkpt
	 d8WAETIVpHm4qMlrWOfVfGc8=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 1F9EE40E01B0;
	Mon,  5 Jan 2026 15:20:06 +0000 (UTC)
Date: Mon, 5 Jan 2026 16:19:59 +0100
From: Borislav Petkov <bp@alien8.de>
To: Richard Lyu <richard.lyu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/x86: Update AMD IOMMU specification locationi
Message-ID: <20260105151959.GAaVvWnyEonFSjilB_@fat_crate.local>
References: <20260105150548.73422-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105150548.73422-1-richard.lyu@suse.com>

On Mon, Jan 05, 2026 at 11:05:54PM +0800, Richard Lyu wrote:
> The current link to the AMD I/O Virtualization Technology IOMMU
> specification (document 48882) in Documentation/arch/x86/iommu.rst
> is outdated and points to a defunct URL on the AMD website.
> 
> Update the link in Documentation/arch/x86/iommu.rst to the current stable
> location for the specification. This ensures users can easily access the
> required architectural details.
> 
> Signed-off-by: Richard Lyu <richard.lyu@suse.com>
> ---
>  Documentation/arch/x86/iommu.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/x86/iommu.rst b/Documentation/arch/x86/iommu.rst
> index 41fbadfe2221..cd1843812b4b 100644
> --- a/Documentation/arch/x86/iommu.rst
> +++ b/Documentation/arch/x86/iommu.rst
> @@ -5,7 +5,7 @@ x86 IOMMU Support
>  The architecture specs can be obtained from the below locations.
>  
>  - Intel: http://www.intel.com/content/dam/www/public/us/en/documents/product-specifications/vt-directed-io-spec.pdf
> -- AMD: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/specifications/48882_3_07_PUB.pdf
> +- AMD: https://docs.amd.com/v/u/en-US/48882_IOMMU
>  
>  This guide gives a quick cheat sheet for some basic understanding.

What I'd do instead is leave enough breadcrumbs here in the text - doc ID, doc
title etc, so that people can actually find the document by using a search
engine which has managed to index it.

Instead of updating links mindlessly because those do change constantly. No
matter the vendor - as long as it is a corporate website, links get changed on
a regular basis.

I'd say.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
