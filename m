Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA578275B06
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755799110; cv=none; b=kWDmsJR/Jk0AsNsZEUit1PTlJpmCXgKd5FgRANqIqarmdyKLG9i1JezwdnUIzZrqjGAIm8YR2s8hM5dmRiPAzuW7jai3pVMi5b/oU1dqrO1QGe1JtCtBsGskjDDNBdhbR/4/eKJmhQ4ABf1zUDLHUzqsKRwgN49MQjFzE83WgYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755799110; c=relaxed/simple;
	bh=lKC0gGuRg1LBt3KgL4gxVmPHH38dQCSSXFCh1l/n7tI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OCVKIDGn6FMMBLDOnYCDuODw9NNCPz1CSjJ4jqjlRITYVr0zO1yA0FnYRMiDIwje0Ip/SkLVyjYXnZs/JmOkBs8oow3aOPP6eCrDOkG/VVHijvpWzH2sCpj8PiF4ZPUYTkkk0nd8w1e6gPovn74wrMPzWONCDEfPcN/An05P9dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lpob/KNh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lpob/KNh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8180A40AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755799107; bh=sJ463h7DeyyviDVQo3psqYEE6VLuptjH0+fjF1nwv7E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lpob/KNhqhvg8i/L4sO2QkXheoqc2WaFHfbbSvUxdFWD+5827+rzAMj3LKmcEfEYo
	 qADn7vlj+o54lritT7nEYPnE+CzvwuYk/3wVCVYQmusMsw/q253MGVr/AHKKZc+HMw
	 oA9TwvgR1pmXDrho84EcNZv4ZZukt9+J86mB1z/ZHX491xr04k2/7Unyrf4FdQXNPP
	 rFhzZo45ZLuE3DkQqDqkYBcH9YeiCnCA/hiuf/wwkFh7szXiWliN17VLqcDKIScslN
	 epK/UO9bc8Klt72xvaB43JYuwsm4nmi9LsHtxItIFuITvAw5wpwztWrC3phvYU2rrp
	 0XfNo6gBkPiGQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8180A40AB4;
	Thu, 21 Aug 2025 17:58:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, rdunlap@infradead.org,
 Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: Re: [PATCH v3] docs: replace a duplicated word and add missing
 SPDX-License tag
In-Reply-To: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
References: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
Date: Thu, 21 Aug 2025 11:58:26 -0600
Message-ID: <87ect47e0t.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bartlomiej Kubik <kubik.bartlomiej@gmail.com> writes:

> Fix documentation issues by removing a duplicated word and adding the
> missing SPDX-License identifier.
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>
> Changelog:
>
> Changes since v2:
> - Replace =E2=80=9Cthat=E2=80=9D with =E2=80=9Cthe.=E2=80=9D
>
> Changes since v1:=09=09
> - Add missing SPDX-License tag
> - Remove duplicated word "that"
>
>  Documentation/admin-guide/kernel-parameters.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

A couple of minor notes:

- It is good to indicate *which* file you are modifying; I've rewritten
  the subject line to that end.

- Adding SPDX headers is a bit fraught unless you are truly sure of the
  license under which the file was contributed.  Given the nature of
  this file and all of the people who have touched it, though, GPLv2 is
  the only option that makes any sense.

Applied, thanks.

jon
