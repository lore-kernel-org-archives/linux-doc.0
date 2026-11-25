Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623637;
	b=0i08X+ChnGTlX3ONEfDWAPcu2DKeXoKgTIxYqmMlSTgr0WtGNyr+iiPt0APnZdwaCem/
	 1B1T67jhKorybjOhsjuC7WHV6QHOSNwnET1lWiXR0xhMbJNCXzsvE3RLLovAI6I6ioobE
	 r6abPBJhh2qD0mP+OrYgrvVF3WjdnhVZPCFCFf3xOcqRWx8YsSHdgPOKDhKXKMgVctLEd
	 VhLH7rrEYjlSWFzHmyLm0kyG5YU/KNcnYAl5Noq5CLOKc501kTq15f2+q6mAbmjod7Ezs
	 ulNJyIXwTpIiPUrSS2Yuw2S6+UN1SZgA/ZLV2dZOnqRCcDycVFn4HSn/TuVQDrdiA/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623637;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=jt9BFmXqeNgy6PjvzWf+b3f/Dru1vJr4VLLLyXUhTEM=;
	b=Kb0e79JFK8BdHeD9qFtuPRVvEs7bkbo+Q+kakBe+v8VXGk/EL/cTLnnCCPnIe8DSxzIX
	 g2oU49YauN0bKL5JShCTpZVzQkeBmSqbkmzY637v+tlwiE5wuF6Lf5/gcmDewCAyrihB2
	 7lKeM042rN4nkWxxIzQ8y39GF2oWegUSqMyEF4RKwf2lGmrpzhOAB5/IoWIORheygNAto
	 wxBOtkAO2g6mwaK4qU5QJOclwifa/4QZNvsl5h90IvFl9mVeNczO2b/0nUN4/hC2AIste
	 c+VnWeJldZaOfuVMD16yEWKXHUMgnCelicKGwUL+K4FG2aHFZ7pkrJkFX9dGbEN84dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Qz6goeJ1;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F4606A336;
	Wed, 25 Nov 2026 16:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1F4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Qz6goeJ1
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 145EC410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795623636; bh=jt9BFmXqeNgy6PjvzWf+b3f/Dru1vJr4VLLLyXUhTEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qz6goeJ1DP88JvDLrm9xxGXKWfMxOYUTlkPWhLA6XKj2dIlqeorKJ0Vgw3r7fPbtt
	 QzSTAPeVzfQFgd/ItiCoGNjBx0UIANq/IGYsShGYc0vRnFr9tr6BfBXUqXagztbId/
	 BdoMWuBKEiu5cMA0fTQ50d0+eVzL8fMhqd/sCdKzGLRanD99b7a3j32KTAJsgmwqRd
	 uc8bU5Yuh2nmQjmrNjCZ/AVN/SeTxgQ5l9CoP9L8l6+Pzy+Wh8xghv4C1cgYfhQ7RC
	 9mjuomX9lJQIaaaLVan4F5qtpkhseWotxkvhYkJelwa3Hv+zzqygK2bXCVrrUa9xJq
	 zhOV9c19+gkDQ==
Received: from localhost (unknown [205.220.129.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 145EC410D3;
	Wed, 25 Nov 2026 16:20:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Prateekshit Jaiswal via B4 Relay
 <devnull+prateekshitjaiswal73.gmail.com@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Prateekshit
 Jaiswal <prateekshitjaiswal73@gmail.com>
Subject: Re: [PATCH 0/2] docs: kdoc: print each warning once, and only for
 selected symbols
In-Reply-To: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
References: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
Date: Wed, 25 Nov 2026 09:20:27 -0700
Message-ID: <874id4yjas.fsf@trenco.lwn.net>
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

Prateekshit Jaiswal via B4 Relay
<devnull+prateekshitjaiswal73.gmail.com@kernel.org> writes:

> kernel-doc currently prints every documented symbol's warnings twice.
> With -function or -export it also warns about symbols that were not
> asked for. Both come from the parser flushing warnings of entries it
> mistakenly treats as discarded; patch 2 stops that.
>
> Doing only that would uncover an older bug: the output step never
> prints warnings for symbols selected with -function or -export.
> Patch 1 restores those first, so nothing is lost at any point in the
> series.
>
> Testing:
> - tools/unittests/run.py passes after each patch. Without patch 1,
>   the new OutputFilterWarnings tests for selected and exported symbols
>   fail; without patch 2, test_stored_entry fails.
> - Warnings printed for intel_dkl_phy.c, before and after the series:
>   -Wall: 2 and 1; -function intel_dkl_phy_read: 1 and 1;
>   -function intel_dkl_phy_write: 1 and 0;
>   -nosymbol intel_dkl_phy_read: 1 and 0.
> - kernel-doc -none -Wall over the 10320 .c and .h files with kernel-doc
>   comments: 87900 and 49625 output lines, with the same 48026 distinct
>   lines.
> - The two "Excess struct member" warnings for page_pool_params, which
>   Documentation/networking/page_pool.rst pulls in with :identifiers:,
>   are still printed, once each.
>
> Notes:
> - The new tests patch config.warning directly. MockKdocConfig.warning()
>   is never called, because KdocConfig.__init__() sets self.warning as
>   an instance attribute that shadows it, so the MockLogging handler
>   does not see config.warning() messages. I can send a separate fix for
>   that.
> - Plain --yaml output never printed warnings itself, so with patch 2
>   it no longer shows the warnings of stored entries. With -rst or -man
>   they are still printed, once, by the embedded output formats.
>
> ---
> Prateekshit Jaiswal (2):
>       docs: kdoc: emit warnings for symbols selected with -function/-export
>       docs: kdoc: don't print warnings of stored entries twice
>
>  tools/lib/python/kdoc/kdoc_output.py |   1 +
>  tools/lib/python/kdoc/kdoc_parser.py |   4 +-
>  tools/unittests/test_kdoc_parser.py  | 126 +++++++++++++++++++++++++++++++++++
>  3 files changed, 130 insertions(+), 1 deletion(-)

Applied, thanks.

jon
