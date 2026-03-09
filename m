Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A61231AAAA;
	Mon,  9 Mar 2026 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071728; cv=none; b=X4VVA4yn7xW/P2gsdbtpr4lrnI8F7r9N+vlaQJ3jOg+U3hAM2wzt4XBxI9InAOO0JyFa3CXFVsZxfDL+d3isi7VMzTu2NbWolvh2SwSzwhj3GmnnsBwiEQeam9sC+TfTDtQ4SP7kuxugxHeQBzyVS9tuxpSaEAnmc47xrmDhFJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071728; c=relaxed/simple;
	bh=czXoWYZa6t50pUolf6J5oA9z8zygTaTBgR0wc1Xpqqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QVStzcdGnaPcAmtUY1ixaAdhqpYB19QdvXGks4diiXIuNFb0bBsWBsRIVonLnb7nGVVY4fja6n2/CUTkjppaJG6eB/OBPWdAkGQI8O67GVlZxBzx+zJO7J8Od0DhjJLLO9CPiMWUUNKj6awkll/jx3ZTx2NgBNzTUeWrXGgNHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l8BjgCRE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l8BjgCRE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EFFDA40429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773071727; bh=0wmT1iC7i5oZ1pqJ9LzrkHUCWgHn7pmh8Kj+6zOsKwU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l8BjgCREpJTK2ZbZ3By60RLsVlOTv10LS4+wwu7FE90CLAbDemc96czCmpa6SxCeH
	 EvwsQgzr1pNtr7u6IAPYEcNe5LXVmTfcMdX5haExSR6UhuyjKApNhJAjVt4mDRgu9b
	 V4ZPYTuhZCLd5POEPvF7+fR3N5lbs0Vj3Z/+MWb9rgHHXP8neHGpkwyWPZzj71tgd6
	 TqFKnTEzCOE4Lc9bNvaW72skPV+Yj/UbLZd1YBUfIGedykAjjuSgMCVGMSwbN7Wv/+
	 V1pZ0CaJPJHdEZlEKrIQcvSht4no2AGuBDQqc3IqjG1N4kTiHtJjXf31SZwdJUjsm0
	 GN9MXPumG8FMQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EFFDA40429;
	Mon,  9 Mar 2026 15:55:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ryan Cheevers <cheeversr0@gmail.com>, linux-doc@vger.kernel.org
Cc: skhan@linuxfoundation.org, longman@redhat.com, frederic@kernel.org,
 cheeversr0@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typo in housekeeping
In-Reply-To: <20260309060015.2349939-1-cheeversr0@gmail.com>
References: <20260309060015.2349939-1-cheeversr0@gmail.com>
Date: Mon, 09 Mar 2026 09:55:26 -0600
Message-ID: <878qc1xaj5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ryan Cheevers <cheeversr0@gmail.com> writes:

> Signed-off-by: Ryan Cheevers <cheeversr0@gmail.com>
> ---
>  Documentation/core-api/housekeeping.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
> index e5417302774c..92c6e53cea75 100644
> --- a/Documentation/core-api/housekeeping.rst
> +++ b/Documentation/core-api/housekeeping.rst
> @@ -15,7 +15,7 @@ various deferrals etc...
>  Sometimes housekeeping is just some unbound work (unbound workqueues,
>  unbound timers, ...) that gets easily assigned to non-isolated CPUs.
>  But sometimes housekeeping is tied to a specific CPU and requires
> -elaborated tricks to be offloaded to non-isolated CPUs (RCU_NOCB, remote
> +elaborate tricks to be offloaded to non-isolated CPUs (RCU_NOCB, remote
>  scheduler tick, etc...).

Applied, thanks.

jon
