Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B72D8DD4;
	Mon, 12 Jan 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235335; cv=none; b=nsBoizpU8ZOBA9aSv2Gj2h4bp82W1MCoTiMCYX1yAQB5oLjCzmO/F0K/gDzOR/cQj0aK4SS9u1vok5JgUxEcqeJ33E4m2yGfCpUoQ3zM/tOps2/LHz+nUohwg/a9xWEQzwkuRlLRU57BdKKBfEwei0MyRKBn5J9qGbxGktDgTtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235335; c=relaxed/simple;
	bh=vKjSXsqmbS9Vx8rr4RLntJ7jwIF32qxVbTi7ZHGTi0k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bqQApnswz8YVfzoGD9R4A/p30G3L56dNp0LWewjX2Hcs+vjeB/7TlJpZhb9RnH+cv/MtYzwiI3ZlF9fdrObEac6wdPSOCASvqQ1N6i+d1qRhT4esw9IVdU3uv7IHmqOwkuE55QvrgleSj9X6gBTyFgvfvfnwthBRP9z6LOsx3AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UphjPsuN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UphjPsuN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B907240C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768235334; bh=ZgfIwmDefA7XA5gQXNmd4SiyuD9LOBaj8f6UnH+x/6c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UphjPsuNhJDQW8emuQTI6ZkJw+7dUH2em1XulasQYqN6vnuKi/FZ1co6VSN5yhgqz
	 mZfIO5u8dxQ6KuWFx2mo6BMWpM3kmlEnsuBtaZMFw22YdFDWt+pzCF3fORt/KsxM37
	 uRxpxd1ec1TssL8Aml1E2FoxTz8op+7LNV0fnqv9cV8eoUJtCJ9g9SdEEfF1sUPdhQ
	 4vhoI2NkxOCRtdIfxbrEkLvcgkE8z9T/edIwFOituak5IUlpXlTqHcPp8WISreJ8DJ
	 A/HvO1YlpS578h4i8kF5igA41jeBhy3bFXQGGx2f88Andffc94nXEIGzTpXnDfchvP
	 9dZL6dsLuneYw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B907240C42;
	Mon, 12 Jan 2026 16:28:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Diego Viola <diego.viola@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Diego Viola <diego.viola@gmail.com>
Subject: Re: [PATCH TRIVIAL] CREDITS: add whitespace before opening parentheses
In-Reply-To: <20260107080411.59483-1-diego.viola@gmail.com>
References: <20260107080411.59483-1-diego.viola@gmail.com>
Date: Mon, 12 Jan 2026 09:28:52 -0700
Message-ID: <87qzru23sr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Diego Viola <diego.viola@gmail.com> writes:

> in order to maintain consistent formatting across the file.
>
> Signed-off-by: Diego Viola <diego.viola@gmail.com>
> ---
>  CREDITS | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
