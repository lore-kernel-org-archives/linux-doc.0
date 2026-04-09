Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58C3DA5BE;
	Thu,  9 Apr 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744361; cv=none; b=nsp3Mfn9WyudB2YelAi7s7LtmWeyexYliyaNipSfBCUWTuZT2sLgh5eiCWr67A9Stv2Gt4zJYu8IyxkZO4W4DAoFCHsPUEh+vy2VSsONCmfmqGh7+o6/LN4atq7VVxrzg7IIwQgnQbRfAj7BQU4iLZLfhjLRDLM0YBpGa0dVzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744361; c=relaxed/simple;
	bh=W/T5aAc/tDjhvJdTucrVwL5CUT4pU8ZAM2buA8ZVWTQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HgBBbiuNc8CWEg/vwcID0hKZYV+fP1U/MlFIVdox5//+HZlGE48sdRRdYkO+V/9eXevtk70Lx0b4UPJCrHCDrKux9iMNyrprFIf+Q5iFRYX62YrOiEXsDsYIfu+KA+hwklpU7X1l8fgkkUREFztjB5uMOFivwJJW8C/qh5+7fvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=USFKHEXv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="USFKHEXv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4F34140B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775744358; bh=0uzDVzKBVSC5Sw6BG2UXLQjxcPoNUedzzZvid45Bu/g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=USFKHEXv3kkpZpFR5eEfAylWL0ak/muGmF7T3HfZqKt1ntV/VKBsu2qV9POXAm26L
	 xP5ODE8HeKftvznenFdkDrfxTsPpzeP7gjz5tQV8y67128r2wbOafYbp8sBRMxf/vz
	 pyE023k+F/ISpX3i3bl7l6lC1640YZ43QKjA08nj7PX1nKo/gWRVC0FCpYuDr2W8K+
	 jfIdN/J9sGRBQy7VRFGYeGDO+OO5TCxF6glW4Xj1Xnh8LkQi5WKFz/H1FudZpBpNLj
	 rylg6wN09nHNZwYOzA6aZ9Xbv8Hfi7jkjn6yNXNRfYH48ZlWF+qrCVJMRKvFsuQ7p9
	 eHqNhjHu26x7A==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4F34140B2D;
	Thu,  9 Apr 2026 14:19:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: Re: [PATCH] Documentation: sysctl: document net core sysctls
In-Reply-To: <20260407083213.27045-1-chakrabortyshubham66@gmail.com>
References: <20260407083213.27045-1-chakrabortyshubham66@gmail.com>
Date: Thu, 09 Apr 2026 08:19:17 -0600
Message-ID: <87fr54cj2y.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

Thanks for working to make our documentation better.  A few notes,
though...

This is a networking-related patch, so it really needs to go to the
networking maintainers.

> Document missing net.core and net.unix sysctl entries in admin-guide/sysctl/net.rst, and correct wording for defaults that are derived from PAGE_SIZE, HZ, or CONFIG_MAX_SKB_FRAGS.
>
> Also clarify that the RFS and flow-limit controls are only present when CONFIG_RPS or CONFIG_NET_FLOW_LIMIT is enabled, and describe rps_sock_flow_entries the way the handler implements it: non-zero values are rounded up to the nearest power of two.

Please word-wrap your changelog text.

> Validation: git diff --check -- Documentation/admin-guide/sysctl/net.rst
> Validation: make -j1 O=/tmp/linux-docs-check SPHINXDIRS=admin-guide/sysctl htmldocs

This isn't a recognized tag, so shouldn't be expressed this way.  If you
want, you can describe your testing setup after the "---" line.

> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/net.rst | 66 +++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 2 deletions(-)

The actual changes are best reviewed by the networking developers.

Thanks,

jon
