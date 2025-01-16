Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66BD139CFF;
	Thu, 16 Jan 2025 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051742; cv=none; b=BgomvSdCsdSXr+xz0co9iK3mBTRf5GBWxjqEOxL7aB55cpjNK73VkP91gR/rvspi0aPmoDMV0fiafM/zI0PnaElaJEXPEYp3IiXm40Ts3ueoNenM1fNQUEV8p8A+pbL6LWdnO/mie+UFXiatXi0HMPylpDSL/3LoSKJ/H4qYjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051742; c=relaxed/simple;
	bh=b+D2nbdjWvvLJAh6nhWkgNuDbLEwL0xZ7Bn8tkQlvWA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cgx3Ag64oHL/RFaVQLR4hQlgSdINDscwvqoryuZHKEh5jeQydd5lho/T+oV8yxGrqLgeMCqzfWrA1bjBX9l53oMONgfau13PJ5kJE8oudn9rQz8OApBOj79qcxPJXnV8rN/wqgy/LuTcvdIw09ZfuD6Wn+kiOKq6PdcBy4A/2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QPSVsEV2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QPSVsEV2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AC29D404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737051739; bh=b7py2npeIYZ5+hSFDBhwtSd2czHwdWpRXTYWQAhhFIs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QPSVsEV28E3iH8JGaRuJnVZ2zQeZSVqFL1PYxPpK2CByFtW7Nslr5dbEMfhSC/6X4
	 rbaW6nwVrCUC8vLc4/TKANFfsVIEIwm6DubmxXDv6yWAgHI/lAlqmJumxsyeeczD+0
	 EwEQ+A6Wsy/vdELnfw+r4i3+JrVmwVRis0OeXOFB5fxX5Ca+Qb2LZWPbhOehCwHMmG
	 7bRb6oB7TRZiJeQE3EVp6YDR5NWlOVfLzL22A8q8LQl0IeJ1R9IZjBnJZx0ppvXODp
	 koiZPw/qtR+VSqDgNG/lYYMwGw6ZPPFWYTiUkGljb0Nf/i1w3d/UkjLHEHTanxx2YZ
	 18CqSIke9Ji7Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AC29D404F0;
	Thu, 16 Jan 2025 18:22:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nir Lichtman <nir@lichtman.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com
Cc: bagasdotme@gmail.com
Subject: Re: [PATCH v2] Documentation: Fix x86_64 UEFI outdated references
 to elilo
In-Reply-To: <20250108113522.GA897677@lichtman.org>
References: <20250108113522.GA897677@lichtman.org>
Date: Thu, 16 Jan 2025 11:22:18 -0700
Message-ID: <87ikqezkit.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nir Lichtman <nir@lichtman.org> writes:

> Problem: The x86_64 UEFI doc references Elilo which is an
> unmaintained/orphaned bootloader project. Also, on x86_64 a bootloader
> is technically not actually required since there is support for the
> Linux EFI stub.
>
> Solution: Remove the references to Elilo from the doc and refer to the
> EFI stub doc page, update steps accordingly, and add more details about
> creation of the EFI partition to improve clarity.
>
> Signed-off-by: Nir Lichtman <nir@lichtman.org>
> ---

I've applied this, but ...

> v2: Fix list not rendered properly and minor wording fixes (thanks for the CR Bagas)
> Also fix to use shorter lines
>
>  Documentation/arch/x86/x86_64/uefi.rst | 36 +++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/arch/x86/x86_64/uefi.rst b/Documentation/arch/x86/x86_64/uefi.rst
> index fbc30c9a071d..3949d83a9915 100644
> --- a/Documentation/arch/x86/x86_64/uefi.rst
> +++ b/Documentation/arch/x86/x86_64/uefi.rst
> @@ -12,14 +12,19 @@ with EFI firmware and specifications are listed below.
>  
>  1. UEFI specification:  http://www.uefi.org
>  
> -2. Booting Linux kernel on UEFI x86_64 platform requires bootloader
> -   support. Elilo with x86_64 support can be used.
> +2. Booting Linux kernel on UEFI x86_64 platform can either be
> +   done using the <Documentation/admin-guide/efi-stub.rst> or using a separate bootloader.
>  

...I did take the liberty of wrapping the above line to fit within 80
columns.

Thanks,

jon
