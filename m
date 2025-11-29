Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7BD1F4262
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764430293; cv=none; b=ZBjOvKAJkolK/S63tm3xb3I077A8P/WMr/HQ3LoIAlBfxsa5yFdFNIYsQj+qZ1+2F17P7Dm78MtAHNO55mQMX/DRFn8aEtyvdNGNsaYPCiweOFmpfREDiBpaCvms65gINQXA40/cJdVGwAMlb9DUB6RPLVb72UxiA4TH6QRU5dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764430293; c=relaxed/simple;
	bh=VJ6G5R4ESw1qfNI1/wQPFzQ3hfi109aEkmpjLBohxnA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WY7EFdYQUDxpHfZgp+pv0C7LPRcG+qpDyiNQExE3/tYPV5/6oOKfztxxJzzMH3/N1+Ug1ML8YPlAGHVbs4UV75a988Sl761rVdZXCR2l6c9PyTLiMmmmnQyjehEwS/HJ32vBbZ/EVTW1HXxXLhTfFUFApaHyEFVtFwj8+aw+6S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eBCHIggJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eBCHIggJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 212B0406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764430291; bh=tACE5evYsEV8ZkLaQe4AbrOuLQPlie1cyA5kpIvnEnk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eBCHIggJiQrdJSGXTCvcCEjeD9MMDbWZfZmTjoz6/W4ZtL1Dd5Mypi86yZ4YBnUuP
	 ic2+6rURFrAEUf60nG3873audQzSlL7TeO4lt+eXEPfg76Qu2G3sRz+IwRkaYAucSt
	 mg7qcxf34ed534S3KnTS1CT8rPgV/E7N+K+zY6eZ5QHV/FZafpva6w2iF4WJlJj/tY
	 LqP4MKu+XRcCflTsq4D0yI7xiz4qC9yxHIZQLHMBNHP+uY9Wvd6x3D7qcc6bliJbmj
	 S99lgtINiHEVoFwt0OnOyfGWLTGw8gFqfWbP0Wf/J8wBPROjDZzi+zxb+4ePSfYh20
	 8/2X9RWHTVU1w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 212B0406FB;
	Sat, 29 Nov 2025 15:31:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [PATCH] docs: kdoc_parser: use '@' for Excess enum value
In-Reply-To: <20251126061752.3497106-1-rdunlap@infradead.org>
References: <20251126061752.3497106-1-rdunlap@infradead.org>
Date: Sat, 29 Nov 2025 08:31:30 -0700
Message-ID: <871plgrh2l.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> kdoc is looking for "@value" here, so use that kind of string in the
> warning message. The "%value" can be confusing.
>
> This changes:
> Warning: drivers/net/wireless/mediatek/mt76/testmode.h:92 Excess enum value '%MT76_TM_ATTR_TX_PENDING' description in 'mt76_testmode_attr'
>
> to this:
> Warning: drivers/net/wireless/mediatek/mt76/testmode.h:92 Excess enum value '@MT76_TM_ATTR_TX_PENDING' description in 'mt76_testmode_attr'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20251126.orig/tools/lib/python/kdoc/kdoc_parser.py
> +++ linux-next-20251126/tools/lib/python/kdoc/kdoc_parser.py
> @@ -919,7 +919,7 @@ class KernelDoc:
>          for k in self.entry.parameterdescs:
>              if k not in member_set:
>                  self.emit_msg(ln,
> -                              f"Excess enum value '%{k}' description in '{declaration_name}'")
> +                              f"Excess enum value '@{k}' description in '{declaration_name}'")
>  

Applied, thanks.

jon
