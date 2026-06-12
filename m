Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6671731DD97
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293249; cv=none; b=Ob/mDV/F0/lQ2YCCTBsaREgOSDjp1wJ9WGlMz4WG5NKWIjfuGo+/ZA3L9T1fEd4uKqJb0MLflT8nXrvohsVwZM4CpHAqFuMnQaOP6jQgTkSs5orhT9F2um95zujBHl87GRZitM25RPino8/79PKtWcSOcm47kM80+WnLzTklgzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293249; c=relaxed/simple;
	bh=0u5g3j+HkmvFyueECLrr1iMhH6hWrZ/x3FsvsT4/C7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pq3iSnHWLwS1iPhUusfYHHHOB3jxQrsN/xSGITq1UeLAJP4aGQmwMf9ni7jWrEOhMyScoq7lNIVW1DD/DhH+mVGN8WtHqjK8GkY1WKPVZrbjD0NiaE1kq6O2UULxdyJ1NJ2/TgKJhhxTYHdLc3ME61nikiZ+EAKzUsP0UXhwFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pfQIrC9E; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pfQIrC9E"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B957B40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781293247; bh=80i5qExKaxmXDxpYh30y3UPKF8vHdibCNPDd8QnPdwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pfQIrC9EQzvfGZz7iLJ35w44X4UFzqCT4+XzDxho3bEYgFclayWk6hMDMoFOlyt16
	 8AYjtIAVk31RmkaXcyz4uJgn6sIj75tcM5nGF6FMs1LwG8QDRRWuviyY2PgvzrcPgF
	 T/MPJKJkRxHGaHLBOGOOHc8ybim6MNSUnWAiUG4jvPSCoB73ol1llLo1/bImrmmCXL
	 nbQYRO0Cp3Bm+aHUKrmtLMBzlFbj5C3pABhdHI3/m7UDgIpLCXNHZ0gvW0AebPNcMl
	 6312ajXvRn9z4OjVNvr7yuArxo56Y77tgQLUW94Aigx0fPq56C3oa5ATm5FBcHUJ4e
	 6PuAkaOdjHr0w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B957B40430;
	Fri, 12 Jun 2026 19:40:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Translate 3.Early-stage.rst into Portuguese
In-Reply-To: <20260601192346.192752-1-danielmaraboo@gmail.com>
References: <20260601192346.192752-1-danielmaraboo@gmail.com>
Date: Fri, 12 Jun 2026 13:40:46 -0600
Message-ID: <87cxxv5yyp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the documentation file '3.Early-stage.rst' into Portuguese.
>
> This section addresses corporate kernel development constraints,
> the balance between company secrecy and the open-loop approach,
> and the use of NDAs or Linux Foundation programs to avoid
> integration issues.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  .../pt_BR/process/3.Early-stage.rst           | 233 ++++++++++++++++++
>  .../pt_BR/process/development-process.rst     |   1 +
>  2 files changed, 234 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/3.Early-stage.rst
>
Applied, thanks.

jon
