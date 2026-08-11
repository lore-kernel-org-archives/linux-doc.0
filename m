Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D785C2F8E93;
	Tue, 11 Aug 2026 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465796; cv=none; b=BlQKSJwOZRrNydbXRpwJuGdmgPctgL7alR+32v9ZmdHGj3JTFJwpd/5wY4GXEJh4eSfaib8x9kzLhu4Jg31SSGO0jxH4K/qIEnLoeN9uhW9kA/YKOtwWe6t11fPc0pYuTBJiANnRzYTH2HsEnYCnZdKYBcfryN2r1/QB6PGP//0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465796; c=relaxed/simple;
	bh=/zZHNGdONNph6rFcvJRqj5NwLv1HEkZ9nW57yz4pdUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OAjFS1t7rbXPC/HIIl2ImwaQdpwsPUM47jSVvdJzljbcdTt593t0cRf0bGVnHAV6ZaO95ZlIgiHk446Vagy27gaBOMP3DvTKjmzXlB3QVGx9JAUjWQWIpJfZFllwHEkfj4WCormLFJc2gHzuplMZq+oJZDmAFdsIcw8Oa7PySxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M/s1hjRz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M/s1hjRz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D40F5408E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786465788; bh=wvQJLaKhyz3cuUTbViA2X/tSwYeFGgjl6j+hJQwf+dM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M/s1hjRz+45gzeMtlzXpf+qY4u1VuOnPev4oWmWGUunlz9vlAxuOFQlsq1+pwMtew
	 3VbF46JYkOcInM7Dq5C/3KuOKrb7e6TB88Mim8MUHYETFcASjG9BcX8bhA8xJWBV0i
	 4wD9+J7oxC269EygQVWtf1da+BAsxRfYILzrmckqBYT9pbIPc6usYR25NEcDZV55QB
	 IwI4zkGj8Qxwwx2xjckz4x/2jXN3fteJ5t3DefY6Xc/Y2JIlD0tG5FOOoNkK7725tx
	 wk0rsfB5KrP7+yhI8g7wF3LMeHHIe6UsTpb1D1jPZG68ZcKD0HqzxL7Asry5Be6sb7
	 Y+C5x3F88jr5w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D40F5408E5;
	Tue, 11 Aug 2026 16:29:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx-build-wrapper: include localversion in
 kernel version string
In-Reply-To: <20260808045331.326769-1-rdunlap@infradead.org>
References: <20260808045331.326769-1-rdunlap@infradead.org>
Date: Tue, 11 Aug 2026 10:29:47 -0600
Message-ID: <87qzk4lix0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Add any localversion* text to the kernel version string
> so that the docs index (home) page accurately indicates what
> the docs build version is.
>
> E.g.:
>   7.2.0-rc6-next-20260807
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
>
>  tools/docs/sphinx-build-wrapper |    9 +++++++++
>  1 file changed, 9 insertions(+)

Applied, thanks.

jon
