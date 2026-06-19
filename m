Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9A73955C6;
	Fri, 19 Jun 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878997; cv=none; b=ng9MwhTLRfUEAe+iOu/B+nUOgC2yme4BAvSNNDrAJc8vxp2/NBELBsYpHOgXxRcszJqnHGAcJMoYzFmP+5aGOL3xLXBDUBEHe0w36WYnrtWi14uP9360rkrrYW34Ydkur9Xscdl/hByZC/RRgrJc1kYNmzScD0hLL57GCfd6Gbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878997; c=relaxed/simple;
	bh=O8R56HJKgVgDwTpj8YjvdgSvThzsY+M/xdPlJy4qfd0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EaLzW99+CsVYteDQE5AAwg9/NOifUqY0Cd04DlwOzu1sJg0/lyqSApNmGhedXlfh/weD/XTQVK/Og+Biq7NR/TOzl6DMfNG13VUdK/KxXUrRq4I+6sX67A0EOq4tVow7wn2RiL2RWcUB82VeP516+VMBEdneqO1HFu3iiOr5RmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ruoaGtRn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ruoaGtRn"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 66296410AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781878989; bh=lMMOYqYhaO0/V+zROPILDAouMwVfDx8gFRiB4eG7+hw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ruoaGtRnl1QLjfQENYHOnArB7N9Qzi+66jVMflqxqEu/SGehn/svfHpkuaooR+0Vh
	 AsTU6E5iH0bBQljCMom5RHW9EAB6W+3CPc8scVrpooTEXucmeWEOfCB5G1H4v9Q7Un
	 AX5eLWPb6h2LchIM/bvn6vuHB+Ix0QKuul0svfFjA/yjEVPjo6q4P7LjqIDq8NHv8Q
	 +xw1KxNUCglk6uqpjnf8e58MUnRNicu55ZyURlc/86hz0D8stWdtJOQkMlXmUZ9off
	 DdkCyBozyQ4Chf9/ZZ1+8TZsRf/ryXIO25Ks1KE9r/NGwdd4IQBylU2hFdz2tPPPTy
	 uymlhCPgrb0Sw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 66296410AA;
	Fri, 19 Jun 2026 14:23:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jiandong Qiu <qiujiandong1998@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: [PATCH 1/3] docs/zh_CN: add llvm.rst translation anchor
In-Reply-To: <20260619140245.1982921-2-qiujiandong1998@gmail.com>
References: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
 <20260619140245.1982921-2-qiujiandong1998@gmail.com>
Date: Fri, 19 Jun 2026 08:23:08 -0600
Message-ID: <87tsqytxrn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jiandong Qiu <qiujiandong1998@gmail.com> writes:

> Add the kbuild_llvm_zh label for local cross-references.
>
> Signed-off-by: Jiandong Qiu <qiujiandong1998@gmail.com>
> ---
> process/changes.rst refers to this anchor.
>
>  Documentation/translations/zh_CN/kbuild/llvm.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/translations/zh_CN/kbuild/llvm.rst b/Documenta=
tion/translations/zh_CN/kbuild/llvm.rst
> index f87e0181d8e7..5fdf281a614a 100644
> --- a/Documentation/translations/zh_CN/kbuild/llvm.rst
> +++ b/Documentation/translations/zh_CN/kbuild/llvm.rst
> @@ -5,6 +5,8 @@
>  :Original: Documentation/kbuild/llvm.rst
>  :Translator: =E6=85=95=E5=86=AC=E4=BA=AE Dongliang Mu <dzm91@hust.edu.cn>
>=20=20
> +.. _kbuild_llvm_zh:
> +

Please, let's not add more of these top-of-file labels; I've been trying
to stomp those out for years.  If this file needs to be referenced, just
reference it by name and the automarkup code will do the right thing.

Thanks,

jon
