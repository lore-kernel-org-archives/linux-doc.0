Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C368171B2E
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706645819; cv=none; b=K5mVa0qbWY8AcbxQ5TWDhuuAws+eEALZVKy0Nw4hq/TwWm/PofrGYlMeMCWWbYb5XkOA87oGg9yh3JNfK4X2ZwpFbptmbtSCT+N8KG7a8BWATqSEbCcdGFO5346VVlmiIS5K7BhbzUUsvoeBriTlkjBekbKxu9Pf+swX0lMulBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706645819; c=relaxed/simple;
	bh=CjUeRfiqxL7Bo1XgkCRMpiWOZQllYFoAdWuf6wGwOJM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m0GQVLU20SU/3cNnDo9so9hy+CCjVGOz+DzTjJ8lD9dcHxxL5cws5pf70oArnxyXEjrjgg9CEPIJxfpfldcv2s5nbhSFAApR643iB50SYvVPqvEG1fjH4Ha/zwSLbNZKQ3SBEbTfDiUekiRP5b/smhhY1yzkBGTk1sqFqOtFUDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bviOoktO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bviOoktO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DDA5141A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706645817; bh=peA1lP3ohBAPpNQhiCa8qRjeL0kmU8pT9+F7mXWUbTE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bviOoktOsf0h4VpwGfh3tkmzPoAEggTBxjx2fl1DQ4iQ2wmkXLFfT0og1D042+C45
	 qwfo+hM/sPeoLyIFAUmkcHjRrDa4EIg2AOPmJxjhf2wyUtUqKrerFQcX8MJXib1LIn
	 ChMVBlI57TF5aw+BXvDc1zQdtWVmOiliTp+d4JfOl9S3nptW9okPDm7Cyi7xFvK1EY
	 jULQfl2uNgFwdzveAC8WvXL2CDZICdiGEFS2viwdgDErPTyn3ZINNNEP+C+Ph6CTkn
	 nwrLgYo9awvNNVhoo6TM53CrC9/ma0pjmnTn+904u3t35/l/YCOwrNCr90FCuPZDUt
	 6WHT5kyxXFEEg==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DDA5141A47;
	Tue, 30 Jan 2024 20:16:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [RFC PATCH] docs: add blurb about target audience to
 maintainer-profile
In-Reply-To: <20240111094838.3695697-1-vegard.nossum@oracle.com>
References: <20240111094838.3695697-1-vegard.nossum@oracle.com>
Date: Tue, 30 Jan 2024 13:16:56 -0700
Message-ID: <87mssmbmpz.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> It's good to be clear about who the intended target audience for any
> given piece of documentation is, as this will help us put new text in
> the correct place. Let's encourage submitters to state it explicitly
> rather than relying on where they placed it in the directory hierarchy
> as there isn't necessarily a one-to-one correspondence between them.
>
> Target audience: documentation contributors and reviewers.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/doc-guide/maintainer-profile.rst | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

jon
