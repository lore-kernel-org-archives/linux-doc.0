Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635321;
	b=wKgB5Fqh43sf5fXUgQrqcUJ43uXz1TQq9SElXWOB40x+JeX6U6Y6AMPqVOfWuRV/wqY/
	 xWPf1olIe97F9+7ERmV+2OSlH9aKXguioTPxPAtwsqQq4QmKhTlSYruarcA5xSE73cljX
	 pNFL1eGBDrg88mdRtiLoq1XCjgHSdT1VFOC2Sv/TkFz9rNpNp5zrDbkggn6/DGD4H6LSW
	 EucIrGSth3p5yS7DYQgAu8HCf21t2ji8G1fp+hx7vwGDqneElr8TSpfCtDH+TdyG1Eu58
	 O7k/45Bs63KagaPMQ2Z7bg17U9DAY11pIuCRMnKL1x9c9NFKnhqpqjbUkkMrhpVfmAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635321;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=2b+G2fX+BessgPoQQ+6brdnjc/rDJY+jrcz90Fpds4k=;
	b=DvBayKQgTOxLvpMXINzOfATvl67cAmKv3WDcw+fnEEdt70zkZfJabUwFiXnO0TUQE2/v
	 yZEaNNPFjcAD/Yq9rHQOejiQF7YAohgvQTxFUaREm6VME3c/bvXoW5VyPUe4O9CbxcDcs
	 c0mSkPGc6kMNy+Kqoaeju1LyHUULQTFJuY3Uk1YIoedWweAorG92u46wqulLx7uGpIL+u
	 4cWfPeQeGOoxEJRemmCPtCKKCzglaFcVwC+mjlh7OL8UOIzqCJenawUVxoMkpkhk7+oAj
	 wpMeR7jCMkXFS/pvNeHGRdMZZMLfuAei57XyZWKarNuSk7dZ9rdRRtaC2PoPMRSM0Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=arkRINkA;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18C4606F207
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 16:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18C4606F207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=arkRINkA
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 18D0540430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793635319; bh=2b+G2fX+BessgPoQQ+6brdnjc/rDJY+jrcz90Fpds4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=arkRINkA/W5Cg/5C5hT5AQm8kPuobF4K5p1EmMC/bpYjynaILMcEq79uiFnA8+u5e
	 HR9lJp9QuiBPXxnVEo5M3fr0NkQ6u9tsLb0YSmar29/xMovZVMTAbAgJIp7E0j8uWT
	 zpS+UObUlFgcB6BRsPhCFr+MrITUC1bVM8/kUF/4EKLMRZOxSFNMFabVoN5WrHAWIX
	 LlqOXIFk9OowwsLQuWxogK15MtF/lDcavIbR3Eko7gIXoIp1wFjctvFEGYOkXCPfqe
	 Jat7i0sCn4Z7WtZbevcdGGRMZSqb8seSHPEdWJwTk/oU1LpuBdORSKiINnQWTQI7wk
	 o/qVgG3m2UEiQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 18D0540430;
	Mon,  2 Nov 2026 16:01:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: f1rul4yx <vargasgomezderequenadiego@gmail.com>
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, f1rul4yx <vargasgomezderequenadiego@gmail.com>
Subject: Re: [PATCH v2 1/1] Documentation: make admin guide version-neutral
In-Reply-To: <20261027222216.71715-2-vargasgomezderequenadiego@gmail.com>
References: <924f3b3c-a5e4-4686-abf8-0d4e23183a2e@infradead.org>
 <20261027222216.71715-1-vargasgomezderequenadiego@gmail.com>
 <20261027222216.71715-2-vargasgomezderequenadiego@gmail.com>
Date: Mon, 02 Nov 2026 09:01:58 -0700
Message-ID: <87bj87dxxl.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

f1rul4yx <vargasgomezderequenadiego@gmail.com> writes:

> Replace references to the 6.x series with version-neutral wording.
> Clarify that normal stable patches apply to the base release and that
> incremental stable patches are also available.
>
> This change was prepared with AI assistance (OpenCode), which helped
> identify the outdated references and draft replacement text. The htmldocs
> build completed successfully on a separate test machine; checkpatch.pl and
> git diff --check pass.

This paragraph does not belong in the changelog ... you can it ...

> Signed-off-by: f1rul4yx <vargasgomezderequenadiego@gmail.com>
> ---

...after this line here.

Meanwhile, I need a full name in your email and the signoff, please.

>  Documentation/admin-guide/README.rst | 41 ++++++++++++++--------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index 77fec1de6dc8..a4a149ff5726 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -1,9 +1,9 @@
>  .. _readme:
>  
> -Linux kernel release 6.x <http://kernel.org/>
> -=============================================
> +Linux kernel release notes <http://kernel.org/>
> +==================================================
>  
> -These are the release notes for Linux version 6.  Read them carefully,
> +These are the release notes for Linux.  Read them carefully,
>  as they tell you what this is all about, explain how to install the
>  kernel, and what to do if something goes wrong.
>  
> @@ -63,35 +63,34 @@ Installing the kernel source
>     directory where you have permissions (e.g. your home directory) and
>     unpack it::
>  
> -     xz -cd linux-6.x.tar.xz | tar xvf -
> +     xz -cd linux-X.Y.tar.xz | tar xvf -

Changes like this are OK, I guess...but I also guess that approximately
nobody does this.  This file needs some rather more significant work.

Thanks,

jon
