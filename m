Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9773E4C64;
	Thu, 25 Jun 2026 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782392284; cv=none; b=OZeJ1oVfbnoo0odz099Bmv4FQiQeMP8VZ+YErNpowdevEouChEkJefYiu/NJZbN3NA7c/SKr+bq4ln/GF3hffaAAAy0P/+O+37U1p3u3TYqk/w5a/gwkzjLj6yfLkI0u3fUR1blaVLVqFYQVYUYMbUSZHKCvZyRfKIGdO7EkHas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782392284; c=relaxed/simple;
	bh=+8FIpGUTRG5OxnjOajsiu+VcuzrukFsRotvcOfA3bTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kpB7p9jFdvWMEd2tiVDoYpmg2xyqZkhMItWou4AIgvmsGtuK7re8gFxeStHW/1uwvhiVAFWuawMH2keo3AVQ6tbdtTiDMfN2SY/VS/T8tmFHL1DMIr4UnphABd/Uyluo11Dp2eknre01S9fzsfcjNqzEgNgxue+WxUS0fP2Nxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TXqLDLim; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TXqLDLim"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47B7B40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782392282; bh=KuP/RyNpafFwjGlGDLei8+szPs8KNU6ibJR8fDQ9/rw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TXqLDLimZbEpfM7mQC1zJjCwPXzg0lBb6+AP16rXlrK1IYuRIEIaxlWKF0Xlg3mcz
	 we+gSbSktBfjQ+PTJ69oZMGDCJdq1HcYoSw199KrRb0etIVBrPaDsyqMr/svaCUCXU
	 6EfBKu/S4/py0g6U1Fm+9dcvvZqCN85QEpmsS9I0gidDfkx+QILL30ixEO5aTWn+4X
	 La1+dwI416Un5bW1qlQo+ExkxxZ/7Ziqdy5Dl08535sqKp+2tBuRJKf3ohQ/G1nKEc
	 45/w5jTNtv4fzUBKepbpL6izgW8MG/8cKsAPehDX7MD08aPHQem+DRT9WT4I3/As8F
	 ajy1uAy3bBKiA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47B7B40430;
	Thu, 25 Jun 2026 12:58:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>
Subject: Re: [GIT PULL] Documentation fixes for 7.2
In-Reply-To: <874iiq6aps.fsf@trenco.lwn.net>
References: <874iiq6aps.fsf@trenco.lwn.net>
Date: Thu, 25 Jun 2026 06:58:01 -0600
Message-ID: <87wlvm4w12.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Due to insufficient coffee absorption, I failed to copy this beyond
Linus, so, for the record...

Jonathan Corbet <corbet@lwn.net> writes:

> The following changes since commit fa34b01aa0f59355206b0807f862cced06c2b7a1:
>
>   docs: pt_BR: Translate 3.Early-stage.rst into Portuguese (2026-06-12 13:34:26 -0600)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.2-2
>
> for you to fetch changes up to b13f724df35c4f1a69e20c965a2fc74fd2921e59:
>
>   docs: tools: Fix typo 'ackward' to 'awkward' in unittest.rst (2026-06-23 14:48:01 -0600)
>
> ----------------------------------------------------------------
> A handful of late-arriving docs fixes, along with one document update
> that fell through the cracks before.
>
> ----------------------------------------------------------------
> David Hildenbrand (Arm) (1):
>       docs/mm: clarify that we are not looking for LLM generated content
>
> Declan Wale (1):
>       docs: tools: Fix typo 'ackward' to 'awkward' in unittest.rst
>
> Doehyun Baek (1):
>       Docs/driver-api/uio-howto: document mmap_prepare callback
>
> Matthew Wilcox (Oracle) (1):
>       MAINTAINERS: Fix regex for kdoc
>
> Randy Dunlap (3):
>       kernel-doc: xforms: support __SYSFS_FUNCTION_ALTERNATIVE()
>       kdoc: xforms_lists: handle DECLARE_PER_CPU() in kernel-doc
>       kdoc: xforms: ignore special static/inline macros
>
> Yudistira Putra (1):
>       Documentation: tracing: fix typo in events documentation
>
> Zenghui Yu (1):
>       docs: kgdb: Fix path of driver options
>
>  Documentation/driver-api/uio-howto.rst   |  4 ++--
>  Documentation/mm/index.rst               | 13 +++++++++++++
>  Documentation/process/debugging/kgdb.rst |  2 +-
>  Documentation/tools/unittest.rst         |  2 +-
>  Documentation/trace/events.rst           |  2 +-
>  MAINTAINERS                              |  2 +-
>  tools/lib/python/kdoc/xforms_lists.py    |  4 ++++
>  7 files changed, 23 insertions(+), 6 deletions(-)
