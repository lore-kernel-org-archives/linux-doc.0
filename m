Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCB6355814;
	Thu,  6 Aug 2026 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980542; cv=none; b=CUPbmaHBPO3hok/5oAWfukmjtn1Q2NiaKK/61I+Y75jQBonLimEhSNAJvVkjWZxoab4eYn3zPlpkwEGjkMkv+uKtuenphKcaBihdo4FeAb1FZn65UJkSfEDXDnZYoyqvnBMjTBsfGTl6r0dbAiU7/VfmiY7I8DP4hm7Ed7I/NWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980542; c=relaxed/simple;
	bh=5/LU5wvKVIkdNBhqJyTfPBtbqco9w8NcEzi8hzfgq04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOhKEzUwiQA6SnO7JE/GLUwCzU985YU5N56W8o9jioc8ygMRAf7eXa46XDtQJKBGyznrn2azGYCssj3EIh4wS90XuSYtLYSDMb8AA0H4y8ir5P/BqGAm8obRfw/JS/JAqn8ac/m6P7mRDFR9R0lob7O70M5moKISNlHukX5Z5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ggynKilp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ggynKilp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9FCA340E00E6;
	Thu,  6 Aug 2026 01:42:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KrazWe41YWfS; Thu,  6 Aug 2026 01:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785980527; bh=GK7v8E/zB22vxPHj32YxnWfR0Z53NUGzfYiIEn5GQqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggynKilp+C4tXdruj8EJQkW5qsS52Cn0Pi/dI7/p6TW0UI4ygMG00pQBXTxbp/Huk
	 VNaC6ostWRg/PlhdSvTtgYDkWwIY9YGCJytL9IjQ7h8h7+Mb0+IBbUWQqUpemOnspf
	 HDRgRG72ucfCkqCV5dodYHi/TBHPYV1oOAw3XOfYx3ghpubNc2++HCD9o3azDvl44K
	 3UP88t7qIlBoK632fL5cTCfZDomV1lWX08dtKbTCO0uaL0s3lPU3d2j1PQl7TuquUm
	 iLUqxWvfBNfRrW5uHMejbu8WXDS1IrwWIcN9S/o2rvZSNF8Wc1fTqgT4qbOfngTYoX
	 HEipxVMNqHLae1ukt+00XYlCeuDmycKnr5lON/0/NUfoYxrC8HNPJSZunpvfF4SSPu
	 Xude4MAzoc6rE1OScJM2RRmaSKZqUKbQnObsDhPsPkti/1endbQwPL0Xjrt96xGG2a
	 gbGeowzGzf41m/q5jCsVMEucpLlG06q19D4xM1Z8+MSAruoIa2pih5C54gH0MbxTmU
	 fNC0DH3gWAJyOFjzMoGvKIRCI/b9EgE7JnJe3/l7MaZfiRnK+001y4ZyJNCZ9zuPD5
	 V0h9Hqe69Zwd24rd8ppF0WLFfsZKWmxnrMQqMjhs5KMPCTjC63rUMSKLFjEy5+dO2d
	 1Zn0ZxBaCupJ8VC3j/Euf5MA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0346240E00C3;
	Thu,  6 Aug 2026 01:41:54 +0000 (UTC)
Date: Wed, 5 Aug 2026 18:41:51 -0700
From: Borislav Petkov <bp@alien8.de>
To: Daniel Gibson <daniel@gibson.sh>
Cc: Mario Limonciello <superm1@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 2/2] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
Message-ID: <20260806014151.GFanPmX5VhBUG_6DLS@fat_crate.local>
References: <20260624124326.746525-1-daniel@gibson.sh>
 <20260624124326.746525-3-daniel@gibson.sh>
 <b784820c-a027-44fd-a47a-ba51e52de7ea@gibson.sh>
 <20260805224017.GCanO70QxPHpDxW2-c@fat_crate.local>
 <87aa8f40-2c99-4bbc-88f4-1ef6d54f3c60@gibson.sh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87aa8f40-2c99-4bbc-88f4-1ef6d54f3c60@gibson.sh>

On Thu, Aug 06, 2026 at 12:54:04AM +0200, Daniel Gibson wrote:
> That document mainly talks about s2idle issues and lists issues that have
> been quirked in the past, so IMHO it fits there?

Did you not read the first sentence of that document?

> Also, Mario Limonciello (of AMD) suggested documenting it there in:
> https://lore.kernel.org/platform-driver-x86/f86d9af4-6415-427a-9f4e-639b2ae6203e@kernel.org/

Maybe he needs to read the first sentence of that document too.

> However, if there's a specific Wiki you think would be appropriate to
> document this in, I should probably document it there as well.

You have a pretty good commit message in

  428b9fd2dce5 ("platform/x86/amd/pmc: Add delay_suspend module parameter")

You have a bugzilla entry, you have a mailing list thread, you have a module
param documentation.

How much more do you need to document this? People should be able to use
search engines or AI, right?

The problem with adding some hints as to how suspend can be fixed on some
laptops is that we'll open the floodgates. Do you know how many laptops need
quirks and fixes for suspend?

In any case, this doc is not for that.

Sorry.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
