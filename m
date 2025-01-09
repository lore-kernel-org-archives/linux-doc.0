Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0399D1885AA
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448624; cv=none; b=JUOIjFL1+ZaDmQOQb4+YzIyGk0mYeGChqKcufNZOncgy7/iZz0dTCytvfATMmpkm5wAzPBNOKi6+SoaCkrDqYA4sdo5t78zpzdRwd85YryVOb7Y9pLXl3BNqC5Yj7JMkacE1y46ud0jdhfXiOEPmpRH5iTuVe3stHzbK/3vSUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448624; c=relaxed/simple;
	bh=CJahDrP6ki8Yep50DsdDCEWAxDi6tluF0UBPktQzoRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kmTaBxcUvSnXZ1LRacIvR3zF/KW36fGkk8J2gT8yp/qMcuLyPeo5F6gIdgTDec/o7thYRhUuKSnN+yWGIu424lKMA6V26XIZFUf0jp5N0NRjDob3eYjukvzrTvPC4hGvpVDfBEetlhe9eiZbeCJonTfwYHacizmuv80Hb2bs8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cMXetuSy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cMXetuSy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 399F1404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736448622; bh=0n7822AX+ntbTkUvdXBH8eXQOVGTiw27atWjxhtCznY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cMXetuSyFhgDRKa97YwdujO/5Je22eG5fwJXR0Rj1AlPmrHJj+EGBa6kc06BTZFHr
	 BrUbPRSLBJGuA0V4/N4VXk1JF3wZPrYYDd0V6jWTbSf4x6E46sG+p7cu3V/IrNs8r4
	 7tHv4xdMc+QT3TL9mpdF6yYePkg/zlen6POy2LKQSVI3PH2LKZlJCszeAlGKHGZ7qu
	 uWiRT8xcXnPv2oWZCbRhZOTWWSlDOYt9XRJegywKUPzy2xNud5vDUq9WIWmtyILki+
	 iu3SVf/hThQUMINkf8JcTWcLWqzTu0u69f2sjBcLWHAxtHge2UqQXEHBhikRUyIqOt
	 n0QiRdU6uoksQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 399F1404F0;
	Thu,  9 Jan 2025 18:50:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 linux-doc@vger.kernel.org, zhangwei <zhangwei@cqsoftware.com.cn>
Subject: Re: [PATCH v2] docs/zh_CN: Add sak index Chinese translation
In-Reply-To: <60e603fb548d1e173a7e3915ff0186f32580f5ea.1736316790.git.zhangwei@cqsoftware.com.cn>
References: <60e603fb548d1e173a7e3915ff0186f32580f5ea.1736316790.git.zhangwei@cqsoftware.com.cn>
Date: Thu, 09 Jan 2025 11:50:21 -0700
Message-ID: <87y0zjlt3m.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

zhangwei <zhangwei@cqsoftware.com.cn> writes:

> Translate lwn/Documentation/security/sak.rst into Chinese
>
> Update the translation through commit 4d3beaa06d35
> ("docs: security: move some books to it and update")
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
> ---
>
> v2:
>
> Change the email address of Yanteng Si
> Complete the commit tag
>
>  .../translations/zh_CN/security/index.rst     |  2 +-
>  .../translations/zh_CN/security/sak.rst       | 86 +++++++++++++++++++
>  2 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/sak.rst

This is yet another patch that does not apply.

It seems that what is happening is that some of these patches expect
others to have been applied first?  When you have dependencies between
patches, you really need to make that explicit - the maintainer is
unlikely to know that.  The best way to make things explicit is to send
all of the patches as a series, ensuring that they will be applied in
the correct order.

Thanks,

jon
