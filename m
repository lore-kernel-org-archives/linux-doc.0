Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170171C5D59
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773503227; cv=none; b=DEH96aOJTSPCMMchGfWHhPpnSmC9KIRUMg9ezHGlllkCkh+72ufN3IgvNLdRvyXokY4/kCvJCMJF/yBCTsfwUaMxOJImw1y/kyCkJf38z8lfyakYzNxzUZeZW9UKGY3hXHzIDEV8IleqBtWpWzC3zDW6pzy1ioUyeVTX+ohCBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773503227; c=relaxed/simple;
	bh=JRGX4h+1dcIq3Qo41/c8czEuOPaBXN1o6cBiG6Sna24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s695eDdajqPkGh1AQNp44qYLCRQ2GJye7l0shbN48gJyZf1qp2oOALs5f8GWGIJnLuuj+LlnyYgSIum4c2OAmObOxk3O/cjxEbw0v6BdPRENFWri6LDn4ndWsvFBPhH4tKyEiO8gbVdeHuJTBR6dE0TczJIMx6NpuN+/TL390MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SLE3gcWQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SLE3gcWQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CA90540C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773503219; bh=IcE3J2FqcFfyGlSpJqjrgTPcmLQfS23VafUSp6RS4SI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SLE3gcWQ+vlnWqX5Q+kIlKgT9eqkXbZ6JtxKSpP7PmPKW53EGYvQM8nZijpjnhI7Y
	 7Ij6cwpCTWaTsAKDFjExRJmJkvf2ncbCUZyi46vbCV/Sz6MoV/SxOBd/MlxVZaO1sc
	 gALKy3YVrttKoOncNeIQ2PC6BXWdQgwBuNPIOlFLjpQzi7hi1xgMraQYaeP74bhh3L
	 P5ngaxEEXW0dBesp2iQQKIQjuztFgNU9LUF7vMXRLh8rHT+Zz5T7+vZuHAqehHNO0S
	 ysh8713nc1hFhkOl0tOwd568RDQjdU8r5J4yAfK3pLgn3Q99GmC/sRgR64Ss+ZeJPX
	 6qkw6iTDyWZ1A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CA90540C63;
	Sat, 14 Mar 2026 15:46:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kit Dallege <xaum.io@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, Kit Dallege
 <xaum.io@gmail.com>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
In-Reply-To: <20260314152538.100593-1-xaum.io@gmail.com>
References: <20260314152538.100593-1-xaum.io@gmail.com>
Date: Sat, 14 Mar 2026 09:46:57 -0600
Message-ID: <87ms0ajtvy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kit Dallege <xaum.io@gmail.com> writes:

> Fill in the shmfs.rst stub created in commit 481cc97349d6
> ("mm,doc: Add new documentation structure") as part of
> the structured memory management documentation following
> Mel Gorman's book outline.
>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/mm/shmfs.rst | 114 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 114 insertions(+)

So we definitely appreciate an effort to improve our documentation, but
I have to ask...where did all of this material come from?  Did you write
it yourself?

(Haven't had a chance to read it in depth yet).

Thanks,

jon
