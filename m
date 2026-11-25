Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621615;
	b=GVvk83DNlxNQeDrvTi15JXtKch9eODuwj/tOnwt6RYFDe4pqMNcd+ej9pKSYmnpZ1hNx
	 G9LAH8SQ/RfO6gX4md2BtYh4me2MIFXoOLtZ5Ycoq4uDbU5r+0rB19GGc2nmndRAQppHW
	 jMeGtlROqNmtz9bwocVXYWdrGv22NsVa2Ip3gZjMjmvD8x9GTYedJPuEQuetZ0zXbAVuY
	 qZRm1JyUhVYHJ6lNDDugYtWB4/FJxSz9354nGCXJAcclpHZV1oXw8EK//7vkoyKtxQI1e
	 Te44yNYfGK0FNI68uPcUO1SvQLEWJcrTZ/ro0AGmglrusqhQdxoARefKgD/cTyxppcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621615;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=znUMRKsFA+xXBKgKa7NXHdaVhmlJOjihqcjZ0FR6PZ0=;
	b=GAhUmewqweB1il2viVIPO9mYDJJSt0+ANGayixvz5SuqmBRSHJEwywGq6cZvdpKBXaFm
	 vNmxaCrwd5En76n1d8hD8d/Hr0Kg4TnIDvCHf8HCqh4FpCUZ+q7VQ7sXQtWdnIV+psglw
	 EPgDpWWmc2wS+OL05/5pIAdZNV5SFhsO3FL7tFqF458hagXg37Mncz6NJgj5WTQi8SUfU
	 aOwB92AAKGetvPCJE6Ulls83Pgj2hwLdPp6tkCCE49Ok2vo6t58IfNEKwhAnvZ63Rc2BN
	 nUgueiQzujoFQnVisoPXhUBs4+o17h5lD9UDY1ewV2j9U4LbJFVcVoSYbz3mFFGyzqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=RP+FJUL7;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A262606A330
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A262606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=RP+FJUL7
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2AD9E410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795621614; bh=znUMRKsFA+xXBKgKa7NXHdaVhmlJOjihqcjZ0FR6PZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RP+FJUL7RaapN9q05179LUqFIY2pcHs54TCyJQdUoGl7F1kl2mwXASkiXsDjXGVEa
	 QzCQgZ/sY15+ZPwK6bG7nI2GFULVJP2cXjXvvnbQxfXRSZTYFnZ8rf4OEVK3zYYVJb
	 AD4O/02yW2UABFfTCYvShofWi0HfTdhMdE0SLSebxYCpr/T5cXC4u4WUP0tM1U+/Uy
	 3YSN1Ge7Az01xf7aXZlwonGsymZm1cDqbtMo9g79iQJSzFzUZgumg6zYQHT0X96ZGP
	 DZaWrUMMGFMveuUjGFtMNy2467oNmJvp0GkQGJJJceBvU83rguYAeISo+/FTLuWNpI
	 1gm3sT6zrT/6Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2AD9E410D3;
	Wed, 25 Nov 2026 15:46:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Igor Giamoniano <igorgphotoarte@gmail.com>, danielmaraboo@gmail.com
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: Re: [PATCH v2 0/2] docs: pt_BR: translate driver development
 debugging guide
In-Reply-To: <20261118210623.111428-1-igorgphotoarte@gmail.com>
References: <20261118210623.111428-1-igorgphotoarte@gmail.com>
Date: Wed, 25 Nov 2026 08:46:43 -0700
Message-ID: <87pkvsykv0.fsf@trenco.lwn.net>
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

Igor Giamoniano <igorgphotoarte@gmail.com> writes:

> This series translates the driver development debugging guide into
> Brazilian Portuguese.
>
> Patch 1 adds the translation and links it from the pt_BR debugging
> index. The kernel-doc directives at the end of the original were
> replaced by a pointer to the English document, since including them in
> the translation causes duplicate C declaration warnings and the
> generated API text would remain in English anyway.
>
> Patch 2 updates the existing references in the pt_BR debugging index
> and in the userspace debugging guide so they point to the translated
> document instead of the English original.
>
> Changes in v2:
> - Add a cover letter. No changes to the patches themselves.

Series applied, thanks.

jon
