Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3233E63A3;
	Wed,  5 Aug 2026 22:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969642; cv=none; b=FpFkwJC8yFib98j9tsIwZUtqbzi81biL7Ac00vS+4XnnXIwxSh39iAbnT7JASaxdF/fbhQFX1TrMt0Fpxk2/XObBG/FQpOQ8SaAVcuTJ1YH4SCsHDtEjNVMFA2yojhf2yLu+BkwQf9tvFyZLdDEzTfTcfbi94m+6cUU1VArds4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969642; c=relaxed/simple;
	bh=mYlsdrCZ5JhOc2PA5cARFzELmD7fp1eadZFeT4pw5ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGZjD0kslNsIrYpl4yFA32DwZ6Y/mQLHKwjDBaXrNI3KBxdLb5Vv/dHTcEQu2fOQP19sW7oYROUqTIBiu8gteuRd0SuM36GwnWt0roagtLrCpfTdZqK8RdXmQrHRS8+hemEv0jIWICootJ3l/B5rhV73sjj7zGmBuA7DXvOF2nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=AFdkt7xH; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="AFdkt7xH"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9B5FF40E0031;
	Wed,  5 Aug 2026 22:40:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dCjMZrZHrfdV; Wed,  5 Aug 2026 22:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785969631; bh=k8OmtcbtbN2sFS6jWld/0FogovIABzHdGPrv7xH8c4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFdkt7xHyZ5HprvEtGiA/ohC9tjgWEkwUuYFOS0nQ/FxShyYjfbwsMTB+9/X9fP7O
	 jDL9b0vqtvYs2xxVO/+n11aMDfmxMtq8IRgON+/GHBjf9UFHUwv70LWmBc671NzKGS
	 e0XqRtDejcvBiC+mZx2x+c8wzAQu0NHRbKBzHBY3uQT6XS2PvjqJ3fN5JUgKU5jAxG
	 nWNof3xlkd3mNzWJzGCAJ7nTk4H8ZUHtOX5f6PCYTE8F5Eowb2oShYkJdRyiq0IrHP
	 dv7bjzxNaMKZSoZM1hlUg3WiQ5CgQkfea5c3oc/gkB6OK3jl9nIdCk4QrF5uAqZ2od
	 52zuAR3psVYhy8/ZEs5eQy1RWJJiVJnU7KmPQcvZgEzm8l7R3WcolWIjaqi7K3Ntrk
	 U8TAZwiWIrvoTv+ycsH9F4Wql8CfzR7WYpjgta2t8tJvMVm9UMD8kjxFXf6zCGfrjY
	 l89duhGvyjgzm8lbVPPNjhHl2rAOu7jbEqqWDR+etI+f2YWHLyT4DMWp3XnDf17n73
	 UvkmB8E7D7t3iFdeqgwSWISpBv08gat+Wd+09/R/WTZsFrqQ6IWImAJTsBpZHMegYR
	 9azLeZtKglX+olSSCXSbdz44kp8OsRRcUKNLmLcgb35LyokITA/WQNoeMYIu5qjIHg
	 1li1DO+pn8PAltNs0mYvyxU4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0578040E016E;
	Wed,  5 Aug 2026 22:40:19 +0000 (UTC)
Date: Wed, 5 Aug 2026 15:40:17 -0700
From: Borislav Petkov <bp@alien8.de>
To: Daniel Gibson <daniel@gibson.sh>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 2/2] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
Message-ID: <20260805224017.GCanO70QxPHpDxW2-c@fat_crate.local>
References: <20260624124326.746525-1-daniel@gibson.sh>
 <20260624124326.746525-3-daniel@gibson.sh>
 <b784820c-a027-44fd-a47a-ba51e52de7ea@gibson.sh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b784820c-a027-44fd-a47a-ba51e52de7ea@gibson.sh>

On Thu, Aug 06, 2026 at 12:09:13AM +0200, Daniel Gibson wrote:
> any chance to get this merged?
> As the delay_suspend parameter for the amd_pmc module are in all the current
> stable kernels >= 6.6 now (6.6.147, 6.12.100 etc) it would be great if the
> documentation was also available.

I'm not sure this belongs here. More likely on some wiki page or so, but not
in a document which talks about techniques how to debug AMD machines.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
