Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DBCB665
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535928; cv=none; b=IjdQHRFjpOKBbC+e2uSxSZUm26pFzpHTSMa0/Pe84cu6zoyMwJ1BqSN3orpsjJCL27xFUg+6UfHoRvMF8XAWDkjLSN9qppBt5Hayuypa26HZHyefqeKJfFTYDn0G6+6mZIgHLWecBJebI5iMwA1SlptH7DPn5I5pq9DrnCX9slI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535928; c=relaxed/simple;
	bh=LTmL5l1/O/8SNcIW+Ggf1eHlEo3C0g8QGNiXUA9s8Xs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hnFXfAB3k0123cYpIzFWh3eMhDrD6M5vC6XzALFenV5V0vU9e5bH69uWDGDuTqHTqe/3Yz/an9RtG0DwA+AoXLoiASAkg0dMIQoGZs9wGJKfNciEQCPsghHN2sUpZZ/ymN19EjWIcYRSCrbesvIlrgBuD7ZnSOeT1Q4KvqSXES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IuM8Ogbf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IuM8Ogbf"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 92B57403A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746535920; bh=WbuvgCrt95UklJ8yYZyIro9wtfbWBve4JKZ5dUw4Lkg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IuM8OgbftiGfgKwWAf8i69XwSQwd+ZCxS1BzmU0fw7I+XhXIjJoNJZsjGxSeKrith
	 tjq8DQlU1+4KS3b8dc62w7+Sre25f8nUaDmbAGDaU7HxJmgvrmES0/rEAsoNdacig/
	 chQCKgavU20HnKHbUwi3M3naAgsb/eMPaZAIbbwdqVGf4BpU6ENl2wXhTqI1ifAixR
	 f06s1ErsBydLLSMCg+cj6ebrIRykJCkufhyvjytTXc6vfo+J8taQHVzIi0Jp7BrW1u
	 KLXDfiGtMuPK/u9E804MgTJS67rs91BX7XU/H9rCgupOJPostLkWfNVq1uDz7hnvfo
	 Gd7KyCecY6Kfg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 92B57403A7;
	Tue,  6 May 2025 12:51:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Thushara.M.S" <thusharms@gmail.com>, sj@kernel.org
Cc: "Thushara.M.S" <thusharms@gmail.com>, linux-doc@vger.kernel.org,
 damon@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] docs/mm/damon/design: Fix spelling mistake
In-Reply-To: <20250505185350.10171-1-thusharms@gmail.com>
References: <20250505185350.10171-1-thusharms@gmail.com>
Date: Tue, 06 May 2025 06:51:56 -0600
Message-ID: <87zffpx5oz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Thushara.M.S" <thusharms@gmail.com> writes:

> The word accuracy was misspelled as "accruracy".
>
> Signed-off-by: Thushara.M.S <thusharms@gmail.com>
> ---
>  Documentation/mm/damon/design.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
> index f12d33749329..700847a7ac9e 100644
> --- a/Documentation/mm/damon/design.rst
> +++ b/Documentation/mm/damon/design.rst
> @@ -54,7 +54,7 @@ monitoring are address-space dependent.
>  DAMON consolidates these implementations in a layer called DAMON Operations
>  Set, and defines the interface between it and the upper layer.  The upper layer
>  is dedicated for DAMON's core logics including the mechanism for control of the
> -monitoring accruracy and the overhead.
> +monitoring accuracy and the overhead.
>  

Applied, thanks.

jon
