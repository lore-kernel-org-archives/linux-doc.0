Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1144118FC80
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448517; cv=none; b=gm2NHsr2lfG4Ce68inSEfYYhg6IkWTzyNRIVni1UlrWdXnirGFiz/XipEFN11dZT0W3/x8CbIcXux0gpz6+xb01Vo8ur39PTltAqhK3fcV3qlQPHoArdxCQ2mgxTT/RvkJc1EtO8rRQpb1XkrjmIlK8ugqYuSjhwRPZd+L8fRvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448517; c=relaxed/simple;
	bh=eRwW6fzW2F9mWjAPjGFlurIzdW0ct3CesN5ZunqtM9s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=alk6zsJOK1KTqfCLvR+izTJGgtE0mYgXKtwX7HAPWdnBALpVtt39xfgcoSs/xzHSn6lkczjVdBdZ0MnGnpkkhuEVmHskGxZ6WbBVnt3MATmsbZAU/gEDAxxZJNW+G0Ut8ziJ4kECSBpeJUxF4TLY4E5Wyyp3XBD9gQUMu2ZBY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PZjMv9TC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PZjMv9TC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 24EDA404F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736448514; bh=gaG+jJcMT/8gHl+Zyg0mBpojfLfvMlDOLE/cn8sQccc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PZjMv9TC9sd3PiWx60P5Tr7DlQGlBSjFcMcb4DUd6NoT/DDpxzQj8/c+vbTmovpMo
	 3p8GrqDragKnJ0apZuwfDnemyFR39fLVLK1LQlQXCGoNDIUMqU4D/Fnl8y1s52mQ5Q
	 /587hODU2e6nWnrUUWDsQk9byNKjDcGKjc0fd0GIoMoTC1p7ruczxDi+FJXo0d8PkI
	 ZwklVfxaVLWnU+qQhkP4PaaVfqfzim7zCJ8LnRUKiT3Sl+L/Wu0m4ZjpZxMwjpPmCe
	 8Qi/GpDZO18mPyvunmMeujuIGbOVz2UYeak+TOBEL+eJJcUjA970bueTxy6Umsf7om
	 B5JO/mO3A8RbA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 24EDA404F5;
	Thu,  9 Jan 2025 18:48:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 linux-doc@vger.kernel.org, zhangwei <zhangwei@cqsoftware.com.cn>
Subject: Re: [PATCH v3] docs/zh_CN: Add siphash index Chinese translation
In-Reply-To: <0af3d9b8be0e5166f74bd36fd6b040767f767fce.1736315479.git.zhangwei@cqsoftware.com.cn>
References: <0af3d9b8be0e5166f74bd36fd6b040767f767fce.1736315479.git.zhangwei@cqsoftware.com.cn>
Date: Thu, 09 Jan 2025 11:48:33 -0700
Message-ID: <8734hrn7r2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

zhangwei <zhangwei@cqsoftware.com.cn> writes:

> Translate lwn/Documentation/security/siphash.rst into Chinese
>
> Update the translation through commit 12fe434314c8
> ("Documentation: siphash: Fix typo in the name of offsetofend macro")
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
> ---
>
> v3:
>
> Change the email address of Yanteng Si
>
> v2:
>
> Change the "=E7=94=9F=E6=88=90=E9=92=A5=E5=8C=99" to the "=E7=94=9F=E6=88=
=90=E5=AF=86=E9=92=A5"
> Complete the commit tag
>=20=20
>  .../translations/zh_CN/security/index.rst     |   2 +-
>  .../translations/zh_CN/security/siphash.rst   | 195 ++++++++++++++++++
>  2 files changed, 196 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/siphash.rst

Applied, thanks.

jon
