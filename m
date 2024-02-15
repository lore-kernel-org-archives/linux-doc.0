Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83C513248D
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708014179; cv=none; b=nYKOAnQy4HC0WY2AGFLuNN7EU+I3mQuvppLPnfQhSS9oKx813AhxMc+aSJJMbhiu047DpZaL3O4zfF8OGoOZjOj+Tgd0SNMlOnbpNWx/L6QIMTppvKpcZwwZf57d7VEoD6Dsqn800dctr4OFcCNjCrE4yPkDfeXeUHkPeWVOAx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708014179; c=relaxed/simple;
	bh=SNJl9NRTlMg/YirzxjmttH/w+BpHo4cWRkf4+mo9SO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j35B4L9mZsVkJ6PHkAtBX6P1vsjASL1k5HP6SvBkH2/k7SC2lSetDMweAk2KsM/oeSbIOCmRndqquX3msmL9CuA4LKFReFSlm+9NAGHL5totZL88Ovn2rL6H2cYDXpLhii6L0K/tflzSqig7fJCScQsjIpHCdTcwBMB5wb7pi44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gbUdc+RW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gbUdc+RW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AC88D5A270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708014174; bh=w18zdtXofNmyjEAkIzb4q/ZOay8awS5w6zCSNm6v/Lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gbUdc+RWvJvXtjOLuVbdVyOtZuBC1pnQ4sM0rpCsFo9HIrsR6s8XAZTWWbzzpO+r1
	 p4lCCJUjgYQCgUlS0PX3QA51J32MTxRI9pv6H8+h7WCQVpMhovZKXgjtZ7n4woOw1B
	 u2LoSUn7A8xfZY3S3ILxXdyrFtDOEjSWqAcrE+AmtBrzO453Bj2BBG668jtPodqdHk
	 bULM27zPjS9jTfG+Tmy9cVWR1x3AGjm73t+c0YK+y8Dff9oKSWjxbjBN+Nt/S5yGZr
	 82i+3a1Xk18qWHDrG+YcxAtMkgXa9LIwpCtuj9BVTkjmEKNB+0erfGZWQNwCry3x/y
	 n8P3bJRqGTiYA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AC88D5A270;
	Thu, 15 Feb 2024 16:22:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Only load the translations extension for HTML output
In-Reply-To: <aa42e525-3dd5-4cd9-a8c5-6e9d92c3ad15@gmail.com>
References: <87sf1uy6f5.fsf@meer.lwn.net>
 <aa42e525-3dd5-4cd9-a8c5-6e9d92c3ad15@gmail.com>
Date: Thu, 15 Feb 2024 09:22:53 -0700
Message-ID: <8734tty9wi.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> I tested incremental build of latexdocs against Sphinx 7.2.6 as follows:
>
>     make cleandocs
>     make htmldocs
>     make latexdocs
>
> Without this change, "make latexdocs" completes 2 or 3 minutes
> quicker than full builds.

> With this change applied and against Sphinx 7.2.6, "make latexdocs"
> slows down significantly (the same as the slowdown of incremental
> builds reported elsewhere), and it ends up in an exception, whose
> message reads:

That, I must confess, mystifies me completely, the slowdown especially.

Oh well, I'll drop this and look at Vegard's patch.

Thanks,

jon
