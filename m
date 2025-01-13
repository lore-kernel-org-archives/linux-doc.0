Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241DE18E764
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 17:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790224; cv=none; b=fgrAWendNLN7gSQyKdFY96SofKjwsj0Bikf0b7pEvdlA4WsLs0tkWnDbdIrGrTPxQ97paJtJ3uyum7+rmZLp73s5pYYe4TWFFehMd33PJat8T8a8VydiPnH5TJjKGk29Ae7Xxp4PDL+D+XPkt+QPuIlPRiWiSoRrTC8gp+Tm82A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790224; c=relaxed/simple;
	bh=flzpMOtQsQjU78Xjp+PG+YKP1RfOXDRrANVeQhDtqcU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IcdWmceKH2Qk3HJEBNQY5F+Kx8ogaDwMpkPaGN/rOJjZIkdPry9UrD3JYdUKZ7h0jV/07+fkR3INBuxzaGpnVTofDQ80f5Vp/tgwAdqF7NXWLlFgkJm11KWVKGTjZk73vEHOHI3TmIBWFpNzrQShTY2rIzdTAj50KYJoVjpzIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XSKYRDs1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XSKYRDs1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 35B8940409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736790221; bh=zTaYtp8lj2E3WLXsIm/5ypDtd3Y+ue1YV8DNUH63U9w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XSKYRDs1JCumXbEF7diMC/WGslh6CqqSHb+5+Jqi25Gf9GKOx2lRVbl8/Y9a3NsQ3
	 8zm+K+vW5MuHaC04vmA4KYZjgLfZbSOZdUPkIHlby+ZH3AyoeNkR5Ill9nvs22aEcl
	 9byZw2M4PzE2zHqnYHoMJ1Hen4mUxltUbfkvb9O/eMAxxo6EC16T4VCslndvwUuOtQ
	 NZYP6+su0kcnx/LzqS31oMxM1QLgABdw0mA3owQM0zOlf1cSCzTdygE6T/Hj/ZuQJu
	 VX7L+rC8cSBcT0k9FYP15Jfa4LRkev8LhIA0uqx9kc/COG5Qjx+jLf/gqBm9RGdDZx
	 Iyqz90cCZRlxw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 35B8940409;
	Mon, 13 Jan 2025 17:43:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org, zhangwei
 <zhangwei@cqsoftware.com.cn>
Subject: Re: [PATCH v3] docs/zh_CN: Add sak index Chinese translation
In-Reply-To: <20250110100405.2225-1-zhangwei@cqsoftware.com.cn>
References: <20250110100405.2225-1-zhangwei@cqsoftware.com.cn>
Date: Mon, 13 Jan 2025 10:43:40 -0700
Message-ID: <87ed16bodv.fsf@trenco.lwn.net>
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
> v2: 
>
> Change the email address of Yanteng Si
> Complete the commit tag
>
> v3:
>
> fix security index 
>
>  .../translations/zh_CN/security/index.rst     |  2 +-
>  .../translations/zh_CN/security/sak.rst       | 86 +++++++++++++++++++
>  2 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/sak.rst

Applied, thanks.

jon
