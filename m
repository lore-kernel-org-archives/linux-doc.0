Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B052C0273
	for <linux-doc@vger.kernel.org>; Tue,  9 Sep 2025 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757446925; cv=none; b=cT6zPR3iuDPC5c0SAzynQ40hpJMfBo6/yUaKZ+VEBl52FJwx6FKEa+zgFktB8iuFUUxYvuJOTRVemHcSmYz3B5ZXZpSwETWcjoE7yUJnJSYK8CCDvOrw1TO5DBAAVy3PbxBY3XTyjxDhuXmHTbBFQM4/LmR106ElaDS+ic8tAsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757446925; c=relaxed/simple;
	bh=A47QbMDrrNHc9Qg76q2koSAc/pSxPbgHZuA7iSPHAZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hLMPxiqeuRigGCkSkjgcPP3zedYzu4tQ1afUhyELgE1wzw1/lKf/2jVtYRMhX6ylxCTeczNw4RnIe6AUR+Eq2nbaX7cCbNAHYI4QnHC9Fi0rCFYnuIfdAZ9zG62UNUGYvsFHv5IHcF0xcy1aaO7u9MNI0Sormd73b8855ZrYq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mJl2aJhK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mJl2aJhK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47ED240AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1757446918; bh=RSlJvD2fDij9SPAxq27P6mdQpBh2zNz5YCEYQTQJmds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mJl2aJhKhNh56XNKsK0SQLwjEu6k4/XVpbp+UTaz4aYZBttAOarJSMnb3rptIRhLc
	 eDuzc2eujWxkKmHz/Fd5JBucDRYwmYfRUY95ywnD29j79MDXvjYvWcCMhfSL8Q8Th0
	 /dxb6kx8Z+okNflvyBghrwztnIEYnNbeBCKLPUUnmmtB0tzBfiXJGzZejjYo578L81
	 A6p7rZMfFfcdPqEh5WY6w0itB79Vev1QD6Qg9wxhVvSPqYGe2oAcG+s3a+vsMbdbZ0
	 GrbbFoCAfJkntxqnXgxaAWtVy2rUwVyt40kKtw8d/xLmxMolRtjR4xyQYIwoskGp89
	 x6/qxH/zZs6XA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47ED240AF9;
	Tue,  9 Sep 2025 19:41:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Vegard Nossum
 <vegard.nossum@oracle.com>
Subject: Re: [PATCH v2 0/3] docs: new scripts to generate HTML redirects
In-Reply-To: <20250905144608.577449-1-vegard.nossum@oracle.com>
References: <20250905144608.577449-1-vegard.nossum@oracle.com>
Date: Tue, 09 Sep 2025 13:41:57 -0600
Message-ID: <87h5xbv2ey.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Hi,
>
> When we rename an .rst file, that also changes the URL for the document
> at https://docs.kernel.org/ and results in a 404, which can be anonying
> for people who bookmark URLs and/or follow links from search engines
> and old changelogs and emails.
>
> In order to be able to fearlessly rename individual documentation files
> and reorganize Documentation/, add two scripts:
>
> - tools/docs/gen-renames.py : use git to figure out which .rst files
>   have been renamed
>
> - tools/docs/gen-redirects.py : actually generate .html stubs for the
>   locations, redirecting to the new locations
>
> The reason for splitting this into two is that trawling git history is
> slightly slow (on the order of 20-30 seconds on my laptop) whereas just
> generating the HTML files is very fast. This also allows us to cache
> the historical renames in Documentation/.renames.txt or add manual
> fixups as needed.
>
> Changes since v1:
>
> - cover letter
> - move files from scripts/ -> tools/docs/
> - add SPDX lines
> - program doc strings + improved --help
>
>
> Vegard
>
> ---
>
> Vegard Nossum (3):
>   docs: add tools/docs/gen-renames.py
>   docs: add Documentation/.renames.txt
>   docs: add tools/docs/gen-redirects.py
>
>  Documentation/.renames.txt  | 1191 +++++++++++++++++++++++++++++++++++
>  Documentation/Makefile      |    4 +
>  Makefile                    |    5 +-
>  tools/docs/gen-redirects.py |   54 ++
>  tools/docs/gen-renames.py   |  130 ++++
>  5 files changed, 1382 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/.renames.txt
>  create mode 100755 tools/docs/gen-redirects.py
>  create mode 100755 tools/docs/gen-renames.py

Hearing no complaints and finding no problems, I've applied this,
thanks.

jon
