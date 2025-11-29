Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D61A9FAC
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764430760; cv=none; b=NZ/9Hae3slwgWidnXJIUX6bkLaWRFGgI11NBZhCI5im1LXLvmWI3PMfWXDsnWeomTblQ6SmMptnJv4bQLB7mgSs3K68rH1egY1uqvJ/QA/hGBmntTMyTrDQgBsy7zDD4mKXt4jgqZML0bhtgzfY6WKd4YfoXE+ULOJi5nXQl2OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764430760; c=relaxed/simple;
	bh=3klHfZMuIuHGRPqJkZwtqB7oGnxZBoSz0VkztFOD4o0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IeNIft9iycZl+O6bljRytS9vuNhQZgdrhEtXzJJDi1BmndYfks6HCTSicKcFPH+Z9i0v2WxsxKvKAWjlOUZf2tySw+xt9Y9dTVBsKOnNt4dlFkUlHP8DzMrGmp7guzrOylPasM5TWz02caGGr2MOiG3LXQBlaDkzhyRhAyl6vcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mJhRMFBr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mJhRMFBr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6B13E406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764430758; bh=3klHfZMuIuHGRPqJkZwtqB7oGnxZBoSz0VkztFOD4o0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mJhRMFBrU7dMGIPqYzscCcqbON9zs8xhBWL+CyfU1avdnwECr0GQ8zG5YmoKQ3u5a
	 VHDZFVFiQ4NfnM6rfsn6Bv+uAFG54yz7aGPfopCmilYppf5QJTdA3FLCFoznRQbWzk
	 3uQORbcWrTPT3boo7UWm46pYUlM3mvZa7tqlFe2c5M+afACihTjri+1jKEcmeYZPKG
	 3h1ULry+OwEV+HpPHzcXXEKw0C88zekr/CeiE3+7X8Oy8Cu8WUUZWCQQ8FbFCgD/cy
	 vAH5vECLcLygNPjdrVToregIXzml4Qg/JMdZ/AKWEvHrSgM4EMSZgVQi3CWSjsFXRk
	 +6n+6W5he3tUA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6B13E406FB;
	Sat, 29 Nov 2025 15:39:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [PATCH v2] docs: kdoc: various fixes for grammar, spelling,
 punctuation
In-Reply-To: <20251124041011.3030571-1-rdunlap@infradead.org>
References: <20251124041011.3030571-1-rdunlap@infradead.org>
Date: Sat, 29 Nov 2025 08:39:17 -0700
Message-ID: <87y0noq256.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Correct grammar, spelling, and punctuation in comments, strings,
> print messages, logs.
>
> Change two instances of two spaces between words to just one space.
>
> codespell was used to find misspelled words.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> v2: rebased/updated from 2025-07-06 to v6.18-rc7-linux-next-20251121 kernel
>
> @Jon, when is a good time for me to resend this patch so that you can
> apply it?

Applied now, no need to resend.

Thanks,

jon
