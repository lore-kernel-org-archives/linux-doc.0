Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F42C25A321;
	Mon,  9 Feb 2026 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770653870; cv=none; b=cvYXUpG227WrScnlXXNqJBXi0zcL2DgUc1vFDrEO4KiPmt+cXOQN3oFkz5+N8jDRpnqyddgXEyea7ILjRbDUD0j/AWMlIGmNCVYkM+ooW7PkLod2SXQLxneHI8LbIzG9eZYz2F2hwm07j3P+iOp2P8twhgJxcw0d1p6ryNKL7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770653870; c=relaxed/simple;
	bh=3BtATHGd9mhNj+Ajo91kZoM8yDkRqaM7mDr9Jik+v3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ar9n5Xw4/WyhVskkjYEzHl9JSzreNowN7+tvgO3Bd2cKY+lQP7YABIeBa4fwUhkmdmYG8JEzOvgMb2O92cNxeNoDDCkx9QFzV0bATRMfrw/j/WxC2TBeNStwNdm1oNBayUNlNEQ0syaw8CSKS44/+o8TfxZySyxNfcjImTiIAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Wlv+zLmI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Wlv+zLmI"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B977040B32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770653869; bh=Pfd3fGm/vAqfsIchHA2EWNezDEXJf4wFF2gszkKumO0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Wlv+zLmIpcF6JHoPlusQsqWcKvNx6BtL3E60/N1ZtKBSx2hwQ44E7JWyCl/A6hLP3
	 2zgdaVfdTyK8TrTjG80xJbLJN+YS86wECoSke8fHGCrMMwktrGKWFr/HiqxAFobAqv
	 fYmYqiBtmO9dzLbaPy23i774XnZTJ7sHZJnjtrt1SHuQo2PdYeVAUP7VWkkwnuPn6s
	 La5AnPFEWn08S70v7myNmZvLXQwK8I1G+ML1FupYOL8Evs9YcB9sWOs/LKOSBLUkHg
	 wUGVI6YlEqzXhYAjnPagAY6aSA/Hp1VZWz8mbd6BSKaR0nTXIdy84AcIqpZQ6teeoh
	 ph1VWpy59YG3Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B977040B32;
	Mon,  9 Feb 2026 16:17:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matthew Wilcox <willy@infradead.org>, Min-Hsun Chang <chmh0624@gmail.com>
Cc: akpm@linux-foundation.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Linus Walleij
 <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] Docs/mm: fix typos and grammar in page_tables.rst
In-Reply-To: <aYoB5JatO60ouaMD@casper.infradead.org>
References: <20260209145603.96664-1-chmh0624@gmail.com>
 <aYoB5JatO60ouaMD@casper.infradead.org>
Date: Mon, 09 Feb 2026 09:17:48 -0700
Message-ID: <875x85ao2b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Wilcox <willy@infradead.org> writes:

>> -the fact that Torvald's first computer had 4MB of physical memory. Entries in
>> -this single table were referred to as *PTE*:s - page table entries.
>> +the fact that Torvalds's first computer had 4MB of physical memory. Entries in
>> +this single table were referred to as *PTEs* - page table entries.
>
> I'm unsure about this change of "*PTE*:s" to "*PTEs*".  Is that special
> rst syntax to keep PTE highlighted without highlighting the 's'?

No, it was just a typo - look how the current version is rendered on
https://docs.kernel.org/mm/page_tables.html.

Thanks,

jon
