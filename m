Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87751408229;
	Tue, 24 Mar 2026 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370648; cv=none; b=f6Ljp8ls6tUV/Be4UBfK4gAWkGNA0J5+omC+DfjxSYSUMmkDDR2m2k3z0jmbiX7R0UOSVZgRKlV4ZTDWn4WpxMeYvZI4gje0pLJBW7wX/x7J0NNdf3POA9qhZIQj3r7lXiBuKBvtrvi0T6Aza3dB95hUJLGkw3IBT4SpxwLXCQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370648; c=relaxed/simple;
	bh=gjeiP0qY/fQZyc7dsbNRJiOyQoVij6TOollff+4I53U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E+a/fJxNFrPUOsSYzJpwk5mfxwBUneltbjrHgWzVkajzftEP3SVc3Dbkr3YQbGrj/BbpK8x1WM6JVLH+aKZyd1jJC8b7r4abldorVC4Srp+BqG2oVGwYSU6SEhJCrX6x+zAqOX/jXU9kjps5YaEcVFg/X9vffX2WSaY6UE/QLTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iNR24Vbv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iNR24Vbv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6CCD411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774370647; bh=D6sScTuhT1TOyY6hIqQKgufli2POq+UsRaTHBipTA1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iNR24VbvAocurM6zzn1cK3NM4iyhpXSu0e9NFBmUH6k4m0+hJF9xRmTninB/lIGGa
	 jU0xSwYUI5aw//mY7p9k49tNHlQgeI+clXbn+q4gdBsSggxMIGnubbmknjEezDpjGw
	 9FjN5EPUukqk2EWvr0u43pvspdjOC/DY5AjmovRZPcSwtrEQNQgILT3KyOvSJ5uUZK
	 inA/0XP61CkGQ2k6BzcQMUFTBbDGe4FoSkaul4wdKV4oJkDHhu0moEesr+q9eSUrfD
	 +8cirj0xqB2sR69iHY85n8AoDwiDlVjJNWIjJePaRj3ALRnGVlk7E8nxv8eENF3pF0
	 QaFAbEcElrrow==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D6CCD411C2;
	Tue, 24 Mar 2026 16:44:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?Tom=C3=A1s?= Pando <tovictakamine@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?utf-8?Q?Tom=C3=A1s?= Pando
 <tovictakamine@gmail.com>, Randy
 Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] docs: driver-api: fix 6 spelling typos in
 Documentation/driver-api
In-Reply-To: <20260324163604.5710-1-tovictakamine@gmail.com>
References: <20260324163604.5710-1-tovictakamine@gmail.com>
Date: Tue, 24 Mar 2026 10:44:06 -0600
Message-ID: <87pl4t6uuh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tom=C3=A1s Pando <tovictakamine@gmail.com> writes:

> Fix minor spelling mistakes in the driver-api documentation. These
> changes improve readability in ACPI, CXL, DMA and PCI docs.
> v3: Added reviewed-by from Randy Dunlap.
> v2: Added full name as requested by Jon Corbet.

For future reference, the version-change lines should go below the "---"
line so that the maintainer doesn't have to strip them out.

(No need to resubmit for that this time).

> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Tom=C3=A1s Pando <tovictakamine@gmail.com>
> ---
>  Documentation/driver-api/acpi/acpi-drivers.rst         | 2 +-
>  Documentation/driver-api/cxl/platform/acpi/cedt.rst    | 2 +-
>  Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
>  Documentation/driver-api/dmaengine/pxa_dma.rst         | 2 +-
>  Documentation/driver-api/libata.rst                    | 2 +-
>  Documentation/driver-api/pci/p2pdma.rst                | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Thanks,

jon
