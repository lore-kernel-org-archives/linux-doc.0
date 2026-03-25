Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2E61C84CB;
	Wed, 25 Mar 2026 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466120; cv=none; b=ZkJXOe4KKVgw5MPHrz7XOl0Uhcttn973RBrFz/uxgyKXNb8mGhCctv8zi/NqNw3WSDgoopkfrKBNjSY7dva4tY2M7vU3gJ7H1nq6IE+vF5RuD7s4HCFXhPaC+SBeuLSSxprFCD8m/gZsd71m1OdgF1WK3KdD032agCpr10tC5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466120; c=relaxed/simple;
	bh=EHbK8OvgZ2KJ7KvHv4PTqrHIPyAODL5IhpXnKgrhwHg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jNA86URTaUv8ycg+1A0OGqdbJ8f0djyxSVAcL5+40iZV14KcBu4aa63FS2o89dauxTnxDBoNaNSA5ZpPD4RcMxdaVx+/4v5yF0tn5R+sTBfw6jDsm4UNG2DLPNkX627oUK047Qbhwt8u68spT8oBJEguGd7GRQhzlHd9PTq3mAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mafeC2fM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mafeC2fM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C67FC40C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774466117; bh=tWO/L/VSQgctxGaXWVMF6D3m9AbqrDnj1IGUMUBQS50=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mafeC2fMyJYXvrEq1FITghUci5RXW0oSXRJfvwPDWLVnCIkpzpsd746N5sFkW/O7t
	 TUJFdP7dBHskFn5Pxi5w1TBzvL1D2A1u3tdzW83iT3WGcjDNxUWGDdPTgtZkL6IEOE
	 xz3cH4EjU9cHPx2w8BNlXL2wvM/+2sx9mIvmiZH/S0WOrgMlkcdP2EgXp2pfZMsXDJ
	 xFeyxI2xqU06S9e0BCqiIqSY4bPNXeE36W5jd+6P9U8r5T9aKzDg0Tyt6RjYD2wsel
	 xMHKBtRspUUGMHFAKE/fXcJNl0E3BfV7pnkGL0/EAKcZoJwqcSvuLZ4d5gCVot8bO3
	 D3rrNmZkaxDgw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C67FC40C6F;
	Wed, 25 Mar 2026 19:15:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v3 1/2] docs: allow long links to wrap per character to
 prevent page overflow
In-Reply-To: <20260323152428.30483-1-rito@ritovision.com>
References: <20260321180841.10166-1-rito@ritovision.com>
 <20260323152428.30483-1-rito@ritovision.com>
Date: Wed, 25 Mar 2026 13:15:16 -0600
Message-ID: <87ecl7g1q3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rito Rhymes <rito@ritovision.com> writes:

> Some documentation pages contain long link text without natural
> break points, which can force page-wide horizontal scroll overflow
> on small screens.
>
> Use overflow-wrap: anywhere for anchor text in the docs stylesheet so
> links can wrap per character as a fallback when normal word boundaries
> are unavailable.
>
> Examples:
>   https://docs.kernel.org/6.15/firmware-guide/acpi/non-d0-probe.html
>   https://docs.kernel.org/6.15/arch/x86/earlyprintk.html
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4
> ---
> v3: add latest public versioned URL examples to the patchlog
>
>  Documentation/sphinx-static/custom.css | 5 +++++
>  1 file changed, 5 insertions(+)

With these two I at least see the problem - on Chrome, at least; Firefox
does a better job of it.  Again I'm not convinced this is optimal, but
I've applied them as being better than what we have.

Thanks,

jon
