Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0335BDC7;
	Mon, 25 May 2026 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741715; cv=none; b=LgTEf9Wi7B+n+x+eDyUgLc4lpy6eC8YQkSUl7YiZFmr4qGrtyvRI7YGKaCHqnqOQQ8zgdRnkHo5uqYerxARkDYXSqQrgUQ8c4dInuZoNG5MyKUxUosd/bPJxfQ9Cb7Ac6vFS1PLAAjvgp4UIV+evjQrouWffOxTKNt9YXaBqBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741715; c=relaxed/simple;
	bh=yruNZXYG3jgtTfIKpCYMrySxmiMPOp3YYPn6NKhEwxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H4IYa+HTbg+AvXF6HeIr2jkyY4P4i5Qk7cMG/RdEoQIrU5Xh6oLxIFapyESpuvk6x/R49MYOLW3jVHeRQZMeQaLqCrSEDDkXvsa59mC4/SHVeGu5mIOFaKOrasQorK7HGaoDZW4Z6G6Fturxpi8pUSjwfvDrccWsTUFztDWEubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WRKf8Pvl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WRKf8Pvl"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 18D4140E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779741714; bh=yruNZXYG3jgtTfIKpCYMrySxmiMPOp3YYPn6NKhEwxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WRKf8PvlATgOE1GfsP0fhlvsoYYYHJPDAMfLMcU/NMhO8KntGF9bGw8Nn1jRi0NPL
	 /mI37sAZ+YZAukK2FrQ9pgg4XapGLmORBxSpkUdhXlW+el4VWzKiz6NZiWDek3Do9n
	 yG0VPpLvWuUkw4539U3msI0NiRd0jVPZP9v8QEIkeZJJ/u7pHIuZCtJJgNxVIKKQ0c
	 lCNQbW6NMgQoSZvoSvu+ZPUcLElrG6n1+wj8vZXb+tX/OagmPiXZ2LwbbaP6AShjAX
	 RZjqasnlVBDuCMKBjM9m/+da774Y3x3A8Q/YjoRwpocRaYnvowAvAuEzG0iGRiZuOj
	 uPRllw9ffdKfw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 18D4140E29;
	Mon, 25 May 2026 20:41:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Miguel =?utf-8?Q?Mart=C3=ADn?= Gil <miguel.martin.gil.uni@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: md: fix grammar in speed_limit description
In-Reply-To: <CAJjvy-ZKGhQEZkuy0nD6PMZBXF75m25iGOJHHvBsUfaiLHXFgQ@mail.gmail.com>
References: <20260519095622.9541-1-miguel.martin.gil.uni@gmail.com>
 <87cxyj1by0.fsf@trenco.lwn.net>
 <CAJjvy-ZKGhQEZkuy0nD6PMZBXF75m25iGOJHHvBsUfaiLHXFgQ@mail.gmail.com>
Date: Mon, 25 May 2026 14:41:53 -0600
Message-ID: <875x4bz0fi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Mart=C3=ADn Gil <miguel.martin.gil.uni@gmail.com> writes:

> Hi Jon,
>
> =E2=80=8BThanks for the review. My apologies, I will use my full name.
>
> =E2=80=8BYou can change the signoff to:
> Signed-off-by: Miguel Mart=C3=ADn Gil miguel.martin.gil.uni@gmail.com

Please just send a new patch with the fixed signoff.

...and no HTML mail, please, that won't get through to the mailing
lists.

Thanks,

jon
