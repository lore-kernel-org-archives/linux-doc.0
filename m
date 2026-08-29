Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550A348C7B
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788012396; cv=none; b=iFlZezVLelP91Qlc6SHJPoi5DznllE/PEsx57NzGItBRSDYxumpuWaqUThGLAcw99h7loLBo5zGb3LZusBvMQ2TEl75VnhxuyfbCbufYff2Ds/YFR1KRbX7uevcbda4ZGqcLXh4vU3rtWUXhD4EHwE1eGw5tC+spv+QWi33OIkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788012396; c=relaxed/simple;
	bh=936rVFbBsyd2M8iux07UAepjhm1xkIjvM0c1dDIt28U=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ilt2tKZhIof0kYFNfcedHLSmtrFwt1OTP3FRbZQ90TILnATPJ6Gr7lXH9Ith7CZ76rfIw2in3tfkI7MvpmxXh3m/WMyYfjGiBWx8i1ajkL++QG5hsrBxwNJA3gVLJqzAy8VRIgxfASwaWWCduB2xeigpfoCscSZepdqe6evzihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=davbRL2B; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="davbRL2B"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F1B6040430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788012394; bh=9TDUVQBBMNsFu6+I15irVQxWEpb3ioTP5+V9mOUY8jE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=davbRL2BKQqFOX/N9OJR8B/8mmsIpHPUFbYH35x4BlCT5n0xizfEfTe/TeDtPGkmX
	 UDF6kX1YWHtvLVcHDLzAcdLvj/jZn60XBKX2yc0tPpOvFrTp6XOHXJfbQxzoAnPNrZ
	 GLzHIkcDrsG67qEEJyF1pJHLwl94KE1UdAid/FmdZciom4QQZ+CJlbLyzCu8pY0XMq
	 0nEbb2Cv2gDnKHhXGJ2stOvZ2dMwUY6H2pd20aRhXwrmQ+ijih16bLZY5iPWOG7rxN
	 1ZN1Ic3Xbz3P8X0INH+U7uuknaF0YBhHiODJD+QwK0nZnFovQgsdMFZ06AnJzyaxY3
	 Wxsjb7Pr0GrAg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F1B6040430;
	Sat, 29 Aug 2026 14:06:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Martin Kavasi <martin.kavasi3@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: hu_HU: add Hungarian translation of howto.rst
In-Reply-To: <20260828214002.46392-1-1ai1d7wbz@proton.me>
References: <87wltam90w.fsf@trenco.lwn.net>
 <20260828214002.46392-1-1ai1d7wbz@proton.me>
Date: Sat, 29 Aug 2026 08:06:33 -0600
Message-ID: <87wlt9koly.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Martin Kavasi <martin.kavasi3@gmail.com> writes:

> I believe that this is the write way to contact you
>
> I understand that the discussion should remain public
>
> I also wanted to ask about the MAINTAINERS entry for Hungarian
> documentation. Should I keep myself listed as the Hungarian
> documentation maintainer, or would you prefer that entry to be
> handled differently, or to remove it?

An entry in MAINTAINERS is something that is earned through demonstrated
effort.  Please start by addressing the problems that were pointed out
in your original posting; that is a detail that can be looked at later.

Thanks,

jon
