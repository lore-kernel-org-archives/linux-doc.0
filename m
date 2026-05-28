Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33DC3F413A;
	Thu, 28 May 2026 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974905; cv=none; b=Tbeg7fnJYbWYuG+WPavFg156dJr8ZEn1XwwQESPdpW9elCJTYQBZXlQbmkjHHy4hA1g4DpVJa/ICRKv0AVZkeNjQSmBFR22uQTWbO8iq5ND4iyNkpSxyi8dt/ISsqycC3AeNqYrRNllO415EjTA+P1lSXm+rf6gct6T2c5zfIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974905; c=relaxed/simple;
	bh=Ojhu0ztao92R3/IYF9ilOWrgyQIp9+pD2ERqQIFmEoI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j4MrTRzLpLpStyb6jZOEhMKhYzPvV+6bmg1I2QEvGlrBzYpTEY7WiADnq/uCZ76Ho24DjFTMyKHHLF+wMIfdDRDcE1BJP2JWrTSSaJl2zs9qfWlOICKJRfjStlJYUEcqAet80jAXx/gGdnA4tpSJwkoVRHVVCQO+sKErRJhZc90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=paZiEMJi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="paZiEMJi"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0442640E31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779974385; bh=dstEKY1poRPM6BQk7l1XSZmJmKHG4Uk0Daez6j/kGWI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=paZiEMJi2DqNDY9c7gKyaVuwkDzkZl8h9rb/xnqqnJZ793IvuS3ibUN6Ri9gtGNNc
	 BcqkoMCyMF1JPnmWFNJtr0cBc0AZKBbODNaKWCLrEjqq1RA9K3pzwpkH0L0mvs4Wae
	 Xp52X4kv70Ar1kcqP7ralzQ46NWE7eThU/Dle/Uy1JUe1Oz1zL2bfn4iosxuXtZkDV
	 2BHXMFb4hXvLOEhdtcLx/VtNOyxxDzrOl5nyUHfeq7R+My/6AXosx0VyypHhCQFKb9
	 l5iQyA0KSXjabf3LOwWGkd9Y8VjEKPbrn+oxAcMvrZny5LR46yjmR1n8cYCcH2TB+A
	 5P6tsFAXWz8HA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0442640E31;
	Thu, 28 May 2026 13:19:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: CHEN-YOU-0331 <chenyou910331@gmail.com>, Hu Haowen
 <2023002089@link.tyut.edu.cn>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, CHEN-YOU-0331 <chenyou910331@gmail.com>,
 alexs@kernel.org
Subject: Re: [PATCH] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
In-Reply-To: <20260528041330.23247-1-chenyou910331@gmail.com>
References: <20260528041330.23247-1-chenyou910331@gmail.com>
Date: Thu, 28 May 2026 07:19:44 -0600
Message-ID: <87cxyfllhr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

CHEN-YOU-0331 <chenyou910331@gmail.com> writes:

> Translate PRC tech terms into Taiwanese tech terms (e.g.,
> =E5=85=A7=E6=A0=B8 -> =E6=A0=B8=E5=BF=83, =E4=BB=A3=E7=A2=BC -> =E7=A8=8B=
=E5=BC=8F=E7=A2=BC, =E8=BB=9F=E4=BB=B6 -> =E8=BB=9F=E9=AB=94) to improve
> readability for local developers. Also, rephrase several
> awkward sentences to make the document more fluent.
>
> Signed-off-by: CHEN-YOU-0331 <chenyou910331@gmail.com>
> ---
>  .../zh_TW/process/8.Conclusion.rst            | 45 +++++++++----------
>  1 file changed, 22 insertions(+), 23 deletions(-)

I, of course, am in no position to judge these changes, and I worry
about getting into some sort of turf war over differences in
terminology.  Alex, are you able to give me a recommendation on this
change?

Meanwhile, the signoff should have your proper name, please.

Thanks,

jon
