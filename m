Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE1D3B1A8
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708359015; cv=none; b=gD4bqeXxqfv10OFMnOh9oK0ucE3rGHtIQYrxbg0mLbbSKaDRqRFH4/YmkIAPV5zo56+Kc2IO1wKb2mn5mwet4GeDmrXWqblLjcvDFrWbWfzy3pSuFyqUpQRd/QhXq+LRwoFzSjJNI9FlkH7pC8O2C4nduNJHj8yVc8qivKdzjNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708359015; c=relaxed/simple;
	bh=QsOQjp2KX+gAxQIUWax1oJeXQqYMvbV1/mtH6Xc/6dE=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TpvMYt0NoRk9nxkuw41f1Zr3ZorMjCJvmo/pklJJ/L4Y8nT4FTNf4otIKrfn3RauSlZq4U34MoQKuyEioTEr/Gml4VvmwMtZlASN3UoS/MMEaJz4iJbRC2kbAZTtG34AM5aqugHbMgsAq4jHzHNayL4HWDcvkyj/iUEwNgD9lMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=D1nJNTPE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="D1nJNTPE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CEA8547AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708359013; bh=u/5jKqMILqaaLOuttGb7WL2wgBWjYbsjvQp90otr7ho=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=D1nJNTPEcmfVe1Xk3xmKgWlU+qpBkTSepuBCrb1CqDUXjlvcnGVDUv4yv5zfpb90s
	 K8NZGkLHJZ0zEWc7/yz4HhNG4/jM2N4FL4f1cCG0G+6aa43OIUUFzVicFIbDd3YITs
	 rtwykRELQmtZ3+xPzSxMcLCT4y6zDMFza0hEtlJUJ6s9tXrelUTwHNdk6fCKRLWXCA
	 0Bggc4L70gUSbAzTi8UmhY97gIV/Wv2UVSFIs2Nkw63nRNk0nxgbEZIE8NcTRFM+3Q
	 XfvgW+OLo479Rr3OfBeBrU09Rvsi9IJBuJCdt3G8zqA7CCTBR163HqeQLg8caXhrNF
	 OkReX3HmtmbyA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CEA8547AAD;
	Mon, 19 Feb 2024 16:10:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0LjRhw==?= <relect@bk.ru>,
 linux-doc@vger.kernel.org
Subject: Re: make pdfdocs
In-Reply-To: <1708089301.134753373@f501.i.mail.ru>
References: <1708089301.134753373@f501.i.mail.ru>
Date: Mon, 19 Feb 2024 09:10:11 -0700
Message-ID: <87bk8cqvto.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=D0=98=D0=B2=D0=B0=D0=BD =D0=98=D0=B2=D0=B0=D0=BD=D0=BE=D0=B2=D0=B8=D1=87 <=
relect@bk.ru> writes:

> Good afternoon, the build of the kernel documentation "make pdfdocs"
> does not work.
>=20=20
> I read that there is a bug in the Sphinx version less than 7.2.x, so I
> updated my Fedora to version 40 where the Sphinx bug was fixed. Some
> documents are being built, but an error appears on the build of the
> filesystems file =E2=80=94 make_pdfdocs.log

It looks like you've run into the problem we were discussing at:

  https://lore.kernel.org/linux-doc/8734tqsrt7.fsf@meer.lwn.net/

I've just posted a patch that addresses it:

  https://lore.kernel.org/linux-doc/87jzn0qw19.fsf@meer.lwn.net/T/#u

Can you give it a try and see if it makes things work better for you?

Thanks,

jon
