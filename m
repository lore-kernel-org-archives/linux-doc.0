Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F661E832A;
	Mon,  8 Dec 2025 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765159867; cv=none; b=i3lyIrrvHTc9Qv8qRA3SDFWH4zJXv33lU0DOy8IJAwoXywMvNlNNKUZG5pmALqGneUf9xbTFFcY18SS46p1dEZbrZO9WxT0lm94GHjTEI6zp91yv6fmh4UEU6WS0hjQF79/y9hSnRtLGybtgpUCpEUpOhYa03gu+w4eAeZJIbj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765159867; c=relaxed/simple;
	bh=ekaaiOG6xuDxmEMO3V5vZp/1clGD7LZMdiT4uwZZv/I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BQ147wc0twa5L0FZ2FLxBoQc/jUk9CgSS2qpOrH4q4+bYJkpq5F3Fzx9lyjwxuClMEv9cQBElMvKJAEW6yEAj9d3H3eKIKpnDKtnkSNpF8rcDpS/UIZbVG98USyEmwdzYLb/y8fWmy69jrzw3wr2PnwPtZqFG+u86DdhCoppTvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LtbZCSfw; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LtbZCSfw"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C60364040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1765159863; bh=7tVH5ZByfUwaZl+Xg4zCuWC2VNKxocxzc1E+/EFhza4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LtbZCSfwxGeEsIeEtQcv9npiJzrcqm+SG7gW++EIpmDxLBrNKvT8dX83k+YhcO8gB
	 Iquc0rMqDvfmF9sDCF4+/6HxeSJZ9Z8o7PX8rosoeUexNEMmysOQeJTXAYl9oVN4rg
	 /VyRoVuxs0UUxml6V0td6E4krqMKIydmagjm8Yw+D6Cw6eCsbxQ/wZD9eaTS3UR5Rv
	 MvoVfYR1/vhC8Y9EOySDZfV0NCUnDuLWbNbVzI8Gj7zda1UplVGUsBaW3H9MrddlBj
	 uwzb1bnnBnKmUuJR6JgTV78rJM4uhZBcLpUCDbGfzJFGsfAkSCVuh5yYbb1saALOi0
	 gw0Xnf+vMYlAA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C60364040B;
	Mon,  8 Dec 2025 02:11:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?=
 <kartikpro9599@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] docs: improve introduction wording in howto.rst
In-Reply-To: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>
References: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>
Date: Sun, 07 Dec 2025 19:11:00 -0700
Message-ID: <87v7ihg1u3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=E1=B4=8B=E1=B4=80=CA=80=E1=B4=9B=C9=AA=E1=B4=8B s=CA=9C=E1=B4=80=CA=9C <ka=
rtikpro9599@gmail.com> writes:

> From 56985c72f365c7f0e9ba8ae66ba99c198c15128c Mon Sep 17 00:00:00 2001
> From: kartikpro9599-hash <kartikpro9599@gmail.com>
> Date: Sun, 7 Dec 2025 13:53:02 +0530
> Subject: [PATCH v4] docs: improve introduction wording in howto.rst
>
> Signed-off-by: kartikpro9599-hash <kartikpro9599@gmail.com>
> ---
>  Documentation/process/howto.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Please copy the documentation maintainer (me) on patches like this.

So what is the purpose of this change - how does it make the kernel
better?

> diff --git a/Documentation/process/howto.rst b/Documentation/process/howt=
o.rst
> index 9438e03d6..dd840115f 100644
> --- a/Documentation/process/howto.rst
> +++ b/Documentation/process/howto.rst
> @@ -3,11 +3,11 @@
>  HOWTO do Linux kernel development
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -This is the be-all, end-all document on this topic.  It contains
> -instructions on how to become a Linux kernel developer and how to learn
> -to work with the Linux kernel development community.  It tries to not
> -contain anything related to the technical aspects of kernel programming,
> -but will help point you in the right direction for that.
> +This is a complete introductory document on this topic. It

Is it really complete?  I would argue that none of our documentation is
truly complete...  the original text is not great, but this is not
necessarily better.

> +contains instructions on how to become a Linux kernel developer
> +and how to work with the Linux kernel development community. It
> +does not cover the technical aspects of kernel programming, but
> +will help point you in the right direction for that.

Thanks,

jon
