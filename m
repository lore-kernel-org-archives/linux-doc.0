Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72585280CE5;
	Tue,  6 Jan 2026 21:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735772; cv=none; b=njUy5W3aLMuEf3N4oPEGYC6fzFWPRlvMj0bd+6Leb+b6CoZawWqNrwQluNdQNJk6xwrbEDtNutASaeqm4A9ZMBZLKb9N2O3lU1/Agt+2aTY0Lkyyto36YQOuZw4zTjcbAbp4hRdW508sEIvPm0yh8TKZosUQd7vm8jtjsA7jAtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735772; c=relaxed/simple;
	bh=K6qdGHJL9/Wy4KUvTKEJE6hDS2tapFjm13KwM/86K2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g3qTooTyi4MVYBsEA6RdezsPR+c4GOIdu9vOtDOdaHbkhKYVCgs/W0PunKBy3FKvQLYHf5EDOP0E8V3IkTNYs/j2JS0mxckZa7LXiAMldxKVZhkPrWu0mF6f2K6LKyEZrKhE+5L6qbYxbCI5KEuFQbfnu/GCzLooxU4+jkLQSqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=P8p5uppa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="P8p5uppa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9566F40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767735770; bh=DrPCKoOrSqUmEB5oga8ks/N+cfiO1X40uhjIAnzSA5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P8p5uppaHImAg+gmHByFcDgrL4BhXNDFAVT8x1qHBb+BzwW78r35TQIheNyBKXHtb
	 EhwMnL0Ba4sALtSREmHhGjJJ7r6cDynFSHdWFvFB1N3TwRVY4pzlAOSJAqhVrtHfa0
	 /w/hyvxGSZEr4Jhiv73RWh7wyND6syB17/ZLZixaKTVnBRiNdOWdtl9czsZ6wJ2GUb
	 tnSZgkNfBz41p9vn4ddf6ULLT9hWZG5OikxJcfCiljZNXT2BsAFSVd41t8+Hk8vfDJ
	 I4QozLmHQtNVgY/3+ZTZdUQUTJ22Jf08oI07Ke1tq49ScuLqsrE3XYESXNCQpNL6/T
	 MufB7il3bD4Kw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9566F40C7D;
	Tue,  6 Jan 2026 21:42:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vincent Mailhol <mailhol@kernel.org>, Mike Rapoport
 <rppt@linux.vnet.ibm.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Mailhol
 <mailhol@kernel.org>
Subject: Re: [PATCH] doc-guide: kernel-doc: specify that W=n does not check
 header files
In-Reply-To: <20251225-doc-format-check-v1-1-dff637a4d275@kernel.org>
References: <20251225-doc-format-check-v1-1-dff637a4d275@kernel.org>
Date: Tue, 06 Jan 2026 14:42:49 -0700
Message-ID: <874ioye7ty.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vincent Mailhol <mailhol@kernel.org> writes:

> The documentation states that:
>
>   make W=n
>
> can be used to verify the documentation format. This is true for .c
> files but not for headers [1].
>
> Modify the documentation to specify that headers files are not covered
> by make W=n and that these need to be checked separately with
> scripts/kernel-doc.
>
> [1] commit 3a025e1d1c2e ("Add optional check for bad kernel-doc comments")
> Link: https://git.kernel.org/torvalds/c/3a025e1d1c2e
>
> Fixes: 8fcce5803afd ("doc-guide: kernel-doc: add comment about formatting verification")
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> This is a resend of a patch which I sent more than two years ago, on
> which I got no answers and which I then forgot about.
>
> Link: https://lore.kernel.org/all/20230531093951.358769-1-mailhol.vincent@wanadoo.fr/
> ---
>  Documentation/doc-guide/kernel-doc.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

jon
