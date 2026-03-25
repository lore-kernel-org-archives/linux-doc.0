Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E08D3242BA;
	Wed, 25 Mar 2026 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464145; cv=none; b=RAbImsiTb9CzxE+YH3+Ph4zW5j7AYWrZdVtY0jLvJRBfrYoumBUvzap+DnGnm+mXt7BhUaKehfGpRTOmPcZnal0r0GCRJpvgORAFC0BLEPpuK2n160STCRR672xxDl//AOu/bC0r+KnWK+EzAFAmrlgHhYPw6VHQRvRlriZ6k0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464145; c=relaxed/simple;
	bh=3yOvbTUZPdhMANcRSuGZozR73RkbjOg7cxJCWSYXS4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eAmGP5mO6nDnARiOFbEL96mpTOX0S6iaAixhke3JXSF01/VHmWSHn10WjRykIypnTzZd0pUKL2Vbr0pP33jFnqz06Fls2IaaCU8l0aA9pWKaASTuCyV627IoPOSxtuLB0HXWj0cL0erWrIM8EVYBjc7CulCeMh5W+jPUXUZU/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NnTORrN6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NnTORrN6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1080440C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774463772; bh=HW5/gSvc6qkA7mSKJDyPN5d4gL8wnUU4sPhP6SOLjS4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NnTORrN6UtYqy0cdbZNVdomIaTT8O/bWTPr/nXoaRLAyAdU3S+yGYyxV8Hpmh3ej+
	 214C9mwZLf+DPsbSHb265FYbSh2MdnUF9pbpDMMS9yrWolvYCb/+mdyogdaomHBl8N
	 c9dtFHsnAwGCXkEyMe+0621066rXum7KdXEVFDbRcE9ikKxzDHvBgxF7tCSyBGyC7Q
	 y3yKHiGA6CPzQUWGYDQc9RjSmFsb+Iwd1YhVEpfV8XgJtpQvb3O43U7J7Dn+ZB1FEZ
	 Bo5FBY9xJ0pVq1h9tXmmH22uTRKQCrIXBYD8vmAazTkMEoEuUnSgb2zP+CPN64b6TX
	 8Q1lA5tpwBtLw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1080440C79;
	Wed, 25 Mar 2026 18:36:12 +0000 (UTC)
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
Date: Wed, 25 Mar 2026 12:36:11 -0600
Message-ID: <87pl4rg3j8.fsf@trenco.lwn.net>
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
>
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

Applied, thanks.

jon
