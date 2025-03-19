Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE71B0F1E
	for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411532; cv=none; b=qLQ2t6ILN+ASQuGUJoZs7nDt8raFTaCDxdt07qt79Ew7jCgETGNnbHvYaA1wc4doGkOOr3lVwrRuyYrGGJqwEpWCSIqZ6NRSwoIJgxSQvG6oZRbnnmew3KqlnLUcpDm1i2q1dMNJd+lu9SYqWSEmUgNSFYzXs3shrN8VjXKMdyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411532; c=relaxed/simple;
	bh=fJcZajVqobRxy8yBof2ZKWi44kYwRgYT7DV3GizUSss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DAFyFMGaHL9MtAuN7im3FfPhLM9kufybGX5lqoU2fuSi+7ZVsM62EDk2EN9kEiYGJ+s3v/malqU/J+b2jAMV4C2kDuaRDUwT+M5kUTyXE5T0Ilpdw7XeemFxv3dfRt0IqeQfsanbjDapLzjvuYl6vAgEfXUdY1kNBMcqx+6jmJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AHLc3/Z0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AHLc3/Z0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 173914106B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1742411524; bh=6hcB11fzzo18I3gw9wOivmUm4B5o0d8MJFP3nYNCurE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AHLc3/Z02v4A4cNun4phzSsG19alJD95UuETGYH3oeGuZWoJKF2d7N8R2MEVzkoET
	 DblNHDs3DoIzzuBsC9K3gqbrhl2oulLWpGoXT9n9cioefqNoBZWhzCuKBn2lbdb6Sw
	 6DXbfDH7G1Fennffqn/4qsiawNp0TX2fvDOL12UoFnDKIeKzK6i2UFdzKp2WsMTo50
	 7zW9pCCvh8A6cNcRgaH0Bp82eTTlaN8KxY1Ab9lfCdYqqff5xUopRIYNdS0SK7T/HE
	 jZYpPVWuogZzmQriQ4v7v2/R0tmtVQY1hlzGVwIYiw2nFTbeHyxHrBzGBxrMF5KlzA
	 yeLnZQcIm8Whg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 173914106B;
	Wed, 19 Mar 2025 19:12:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Chinese-docs changes for v6.15-rc1
In-Reply-To: <CAJy-Amk+M2OVgrRp8CUXssX2XFc6ciKFMS1iHLcyLNZ5Gm4fEw@mail.gmail.com>
References: <20250318062957.2120-1-alexs@kernel.org>
 <875xk6crzd.fsf@trenco.lwn.net>
 <CAJy-Amk+M2OVgrRp8CUXssX2XFc6ciKFMS1iHLcyLNZ5Gm4fEw@mail.gmail.com>
Date: Wed, 19 Mar 2025 13:12:03 -0600
Message-ID: <875xk4al8c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alex Shi <seakeel@gmail.com> writes:

>> It's a bit close to the merge window for this.  I could consider that,
>> but I really need you to put a signed tag on there and have me pull
>> that.
>
> Sorry, it's my fault. I thought gpg guarded gitolite.org may help us.
> Here is the new pull request with my signed tag: chinese-doc-6.15-rc1

OK ... I had to update my keys, then harangue gpg to actually trust your
key ... but it's done.  Congratulations on your first pull (and to me
for accepting my first one :)

At this point, that definitely closes docs-next for 6.15; between LSFMM
and the merge window, expect me to be pretty quiet for a bit.

Thanks,

jon
