Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F255042CAEB
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 14:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212650; cv=none; b=DYGSNbQ+rTl9p7GPqCsTvOyQ9o0T1rFzNu8uirfnrdCKOlO5zaXIrTNb+h3C8/1E4ekbORL8Oim4fR7RgRtuZetKAvLp2SrYKtERM+5WN9We3mrONvxZdNsECLN/7EcCRJgwjY2rhbqFP44Bxg8TbF2pX42wAkXGmrWMawbNH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212650; c=relaxed/simple;
	bh=D87hehqoJSBrX8FBJrkNkYD9hAcoFZfGA913jchndt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YUG9+zUeov4aLv9xzNQDlBOq46xsCsso+I2cbJcQvctzX5I9sD9naXoWlcTLetEQOVIpYUSXB4B/DgzuEQxPEBwKCtiEJyxcllnrhckcEY4958LU+lBHrjvU2oLCliWEZz+Jw2U7iv243aTR7qpGPx4YBcN1L5zg1TGzwzMe8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cs7xgTla; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cs7xgTla"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1744A40E56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784212648; bh=D87hehqoJSBrX8FBJrkNkYD9hAcoFZfGA913jchndt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cs7xgTlaYE54QPzOHow6HOYn5V70ljdFo07z4cqOSk+SpwXqMUPF0GL/GAahS7MdS
	 ca+F/8DrauUgUaNewnfbpkL7GJFmAdLpCdCNf22Bz2W0YB3TJKk0r9wxK0bnHL1CF7
	 6HIyzy7aY6iTN+LFffdBGHy77G7ZBhpb6ra2VO55nSeN/CRZXok+2sZ/PEsj+FPayk
	 7XreyFrLbvzp4DsMfJz5xQ9jfENo1EUK7TivA1zlyZ0Gc15a4o++rMZyOvC4O6hq/p
	 6iLMC6mxjfYjpAXbNUMOjYLFltv9Sh/vxN0Rn3I6JLRIyzxpaXNJt/exe04aNziaCQ
	 11JDtBgCcJphw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1744A40E56;
	Thu, 16 Jul 2026 14:37:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re:
In-Reply-To: <CAMAsx6dqyq=ayb9+mug81y_XzWO2_qD=TFxh1oUoXDOEfoycTw@mail.gmail.com>
References: <20260716021013.48025-1-danielmaraboo@gmail.com>
 <CAMAsx6dqyq=ayb9+mug81y_XzWO2_qD=TFxh1oUoXDOEfoycTw@mail.gmail.com>
Date: Thu, 16 Jul 2026 08:37:27 -0600
Message-ID: <87y0fb80go.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Em qua., 15 de jul. de 2026 =C3=A0s 23:10, Daniel Pereira
> <danielmaraboo@gmail.com> escreveu:
>>
>> Subject: [PATCH 0/4] doc: pt_BR: Add translations for process and guidel=
ines
>>
>
> Hello Corbet,
>
> I am writing to apologize for a formatting issue in my recent patch
> submission. I mistakenly included an extra space when generating the
> cover letter, which caused the title to be omitted.
>
> Please let me know if you would like me to send a v2 of the patch
> series with this corrected. I am happy to address this immediately if
> needed.

No need to do that.

Thanks,

jon
